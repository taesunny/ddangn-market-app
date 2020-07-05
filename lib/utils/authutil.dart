import 'package:openid_client/openid_client_io.dart';
import 'package:ddangn_alarm/urlconst.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthUtil {
  // Future<UserInfo> authenticate(Uri uri, String clientId, List<String> scopes) async {
  static Future<UserInfo> authenticate() async {
    var scopes = List<String>.of(['openid', 'profile', 'roles']);
    // create the client
    var issuer = await Issuer.discover(Uri.parse(KEY_CLOAK_AUTH_SERVER_URI));
    var client = new Client(issuer, KEY_CLOAK_AUTH_SERVER_CLIENT_ID);

    // create a function to open a browser with an url
    urlLauncher(String url) async {
      print("url!!!: " + url);

      if (await canLaunch(url)) {
        await launch(url, forceWebView: true);
      } else {
        throw 'Could not launch $url';
      }
    }

    // create an authenticator
    var authenticator = new Authenticator(client,
        scopes: scopes, port: 8080, urlLancher: urlLauncher, redirectUri: Uri.parse("http://localhost"));

    // starts the authentication
    var c = await authenticator.authorize();

    // close the webview when finished
    closeWebView();

    print(c);

    // return the user info
    return await c.getUserInfo();
  }
}
