library urlConst;

const PRODUCT_SERVICE_API_BASE_URL =
    "http://15.164.197.51:8090/product-service";
const ACCESS_TOKEN = "accessToken";

const KEY_CLOAK_AUTH_SERVER_CLIENT_ID = "flutter-app";
const KEY_CLOAK_AUTH_SERVER_IP = "http://localhost";//"http://13.209.121.101";
const KEY_CLOAK_AUTH_SERVER_PORT = "8080";
const KEY_CLOAK_AUTH_SERVER_URI = KEY_CLOAK_AUTH_SERVER_IP +
    // ":" +
    // KEY_CLOAK_AUTH_SERVER_PORT +
    "/auth/realms/" +
    KEY_CLOAK_AUTH_SERVER_REALM;
const KEY_CLOAK_AUTH_SERVER_REALM = "sunny"; // "ddangn-market";


// const OAUTH2_REDIRECT_URI = "http://localhost:3000/oauth2/redirect";

// const GOOGLE_AUTH_URL = API_BASE_URL +
//     "/oauth2/authorize/google?redirect_uri=" +
//     OAUTH2_REDIRECT_URI;
// const FACEBOOK_AUTH_URL = API_BASE_URL +
//     "/oauth2/authorize/facebook?redirect_uri=" +
//     OAUTH2_REDIRECT_URI;
// const GITHUB_AUTH_URL = API_BASE_URL +
//     "/oauth2/authorize/github?redirect_uri=" +
//     OAUTH2_REDIRECT_URI;
