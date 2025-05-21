


class LoginResponseDTO{

  String? auth_token;
  String? errorMessage;


  LoginResponseDTO({
    this.auth_token,
    this.errorMessage
  });

  factory LoginResponseDTO.fromJson(dynamic json){
    return LoginResponseDTO(
      auth_token: json['access_token'],
      errorMessage: json['message'],
    );
  }


}