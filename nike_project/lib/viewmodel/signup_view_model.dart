import 'package:nike_project/model/repositories/impl/sign_up_impl_repository.dart';
import 'package:nike_project/model/request/user_signup_request.dart';
import 'package:nike_project/model/service/impl/sign_up_impl_service.dart';

class SignUpViewModel {
  signUp(UserSignUpRequest req){
    SignUpImplRepository().signUpRepositories(req);
  }
}