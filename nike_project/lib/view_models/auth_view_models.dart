import 'package:nike_project/repositories/auth/auth_repository.implement.dart';

class AuthViewModel {
  callApiLogin(String url, payload) {
    AuthRepositoryImplement().postLogin(url, payload);
  }
}
