import 'dart:convert';
import 'dart:io';

import 'package:nike_project/api/app_exception.dart';
import 'package:nike_project/model/modelUserRequestLogin/user_request_login.dart';

import 'auth_repository.dart';
import 'package:http/http.dart' as http;

class AuthRepositoryImplement extends AuthRepository {
  @override
  Future postLogin(String url, payload) async {
    dynamic responseJson;
    print(json.encode(payload));
    try {
      final response = await http.post(
          Uri.parse("http://management-shoes.herokuapp.com/auth/login"),
          body: payload);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    print(responseJson);
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
