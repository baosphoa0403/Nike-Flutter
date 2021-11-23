import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nike_project/model/entity/role/role.dart';
import 'package:nike_project/model/entity/status/status.dart';
import 'package:nike_project/model/request/user_signup_request.dart';
import 'package:nike_project/model/response/user_signup_response.dart';
import 'package:nike_project/model/service/sign_up_service.dart';
import 'package:nike_project/viewmodel/contants/contants.dart';


class SignUpImplService extends SignUpService {
  @override
  Future<UserSignUpResponse?> postSignUp(UserSignUpRequest req) async{
    UserSignUpResponse? responseResult;
    try{
      String url="${URL_API}user/createUserProfile";
      print(req.toJson());
      Response response = await Dio().post(url, data: req.toJson());
      responseResult= returnReponse(response);
    } catch (e) {
      print(e);
    }
    return responseResult;
  }

  UserSignUpResponse? returnReponse(Response response) {
    switch(response.statusCode) {
      case 201:
      return UserSignUpResponse.fromJson(jsonEncode(response.data));
    //   case 400:
    //     throw BadRequestException(response.body.toString());
    //   case 401:
    //   case 403:
    //     throw UnauthorisedException(response.body.toString());
    //   case 500:
    //   default:
    //     throw FetchDataException(
    //         'Error occured while communication with server' +
    //             ' with status code : ${response.statusCode}'); 
    }
  }
}