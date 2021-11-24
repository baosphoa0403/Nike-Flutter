import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nike_project/model/request/user_signup_request.dart';
import 'package:nike_project/model/response/user_signup_response.dart';
import 'package:nike_project/repositories/sign_up_repository.dart';
import 'package:nike_project/view/common/toast/toast.dart';

class SignUpImplRepository extends SignUpRepository {
  @override
  Future<UserSignUpResponse> postSignUp(
      String url, UserSignUpRequest req) async {
    UserSignUpResponse? responseResult;
    try {
      print(req.toJson());
      Response response = await Dio().post(url, data: req.toJson());
      responseResult = UserSignUpResponse.fromJson(jsonEncode(response.data));
      print(response);
    } on DioError catch (e) {
      print(e);
      showToastFail(e.response?.data["message"]);
    }
    return responseResult!;
  }
}
