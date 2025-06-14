import 'dart:io';
import 'dart:convert';
import 'package:desafio_tecnico_busca_milhas/DTO/LoginResponseDTO.dart';
import 'package:desafio_tecnico_busca_milhas/DTO/CreateUserDTO.dart';
import 'package:desafio_tecnico_busca_milhas/Models/UserModel.dart';
import 'package:desafio_tecnico_busca_milhas/Repository/Repository.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';

class UserViewModel{

  Repository repo = Repository();

  Future<LoginResponseDTO> Login(String email,String password) async {
    final response = repo.Login(email, password);
    HttpClientResponse responseBodyNotFuture = await Future.value(response);
    String responseBody = await responseBodyNotFuture.transform(utf8.decoder).join();
    Map<String,dynamic?> result = jsonDecode(responseBody);
    LoginResponseDTO resultFinal = new LoginResponseDTO();
    if(result.containsKey('access_token')){
      SessionData().setAuthTokenAndUserName(result['access_token'], result['user_name']);
      resultFinal.auth_token = result['access_token'];
      resultFinal.error_message = "";
    }
    else{
      SessionData().setAuthTokenAndUserName("","");
      resultFinal.auth_token = "";
      resultFinal.error_message = result['message'];
    }
    return resultFinal;
  }

  Future<CreateUserDTO> CreateUser(String email,String username,String password) async {
    final response = repo.CreateUser(email, username, password);
    HttpClientResponse responseBodyNotFuture = await Future.value(response);
    String responseBody = await responseBodyNotFuture.transform(utf8.decoder).join();
    Map<String,dynamic?> result = jsonDecode(responseBody);
    CreateUserDTO resultFinal = new CreateUserDTO();
    resultFinal.message = result['message'];
    resultFinal.sucessfull = result['sucessfull'];
    return resultFinal;
  }






}