import 'package:nike_project/model/modelUserRequestLogin/user_request_login.dart';
import 'package:nike_project/repositories/auth/auth_repository_imple.dart';

class AuthViewModel {
  callApiLogin(String url, payload) {
    AuthRepositoryImplement().postLogin(url, payload);
  }
}
