import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nike_project/model/modelUserRequestLogin/user_login_request.dart';
import 'package:nike_project/model/modelUserResponse/info_user.dart';
import 'package:nike_project/toast/toast.dart';
import 'auth_repository.abstract.dart';

class AuthRepositoryImplement extends AuthRepository {
  @override
  Future<UserInfor> postLogin(String url, UserLoginRequest payload) async {
    UserInfor? responseJson;
    try {
      Response response = await Dio().post(url, data: payload.toJson());
      responseJson = UserInfor.fromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return responseJson!;
  }
}
