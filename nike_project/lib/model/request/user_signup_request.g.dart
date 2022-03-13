// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpRequest _$UserSignUpRequestFromJson(Map<String, dynamic> json) {
  return $checkedNew('UserSignUpRequest', json, () {
    $checkKeys(json, allowedKeys: const [
      'email',
      'password',
      'username',
      'name',
      'yearOfBirth',
      'address'
    ]);
    final val = UserSignUpRequest(
      email: $checkedConvert(json, 'email', (v) => v as String),
      password: $checkedConvert(json, 'password', (v) => v as String),
      username: $checkedConvert(json, 'username', (v) => v as String),
      name: $checkedConvert(json, 'name', (v) => v as String),
      yearOfBirth: $checkedConvert(json, 'yearOfBirth', (v) => v as int),
      address: $checkedConvert(json, 'address', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {'yearOfBirth': 'yearOfBirth'});
}

Map<String, dynamic> _$UserSignUpRequestToJson(UserSignUpRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
      'name': instance.name,
      'yearOfBirth': instance.yearOfBirth,
      'address': instance.address,
    };
