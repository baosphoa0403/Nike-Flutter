import 'package:nike_project/model/modelUserRequestLogin/user_login_request.dart';
import 'package:nike_project/model/modelUserResponse/info_user.dart';

abstract class AuthRepository {
  Future<UserInfor> postLogin(String url, UserLoginRequest payload);
}
