


class LoginResponseDTO{

  String? auth_token;
  String? error_message;


  LoginResponseDTO({
    this.auth_token,
    this.error_message
  });

  // factory LoginResponseDTO.fromJson(dynamic json){
  //   return LoginResponseDTO(
  //     auth_token: json['access_token'],
  //     error_message: json['message'],
  //   );
  // }


}