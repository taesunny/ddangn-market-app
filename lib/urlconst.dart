library urlConst;

const API_BASE_URL = "http://ddangn.taesunny.com:8080";
const ACCESS_TOKEN = "accessToken";

const OAUTH2_REDIRECT_URI = "http://localhost:3000/oauth2/redirect";

const GOOGLE_AUTH_URL = API_BASE_URL +
    "/oauth2/authorize/google?redirect_uri=" +
    OAUTH2_REDIRECT_URI;
const FACEBOOK_AUTH_URL = API_BASE_URL +
    "/oauth2/authorize/facebook?redirect_uri=" +
    OAUTH2_REDIRECT_URI;
const GITHUB_AUTH_URL = API_BASE_URL +
    "/oauth2/authorize/github?redirect_uri=" +
    OAUTH2_REDIRECT_URI;
