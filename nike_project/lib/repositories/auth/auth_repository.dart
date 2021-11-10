import 'package:nike_project/model/modelUserRequestLogin/user_request_login.dart';

abstract class AuthRepository {
  Future<dynamic> postLogin(String url,payload);
}
