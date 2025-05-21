import 'dart:io';
import 'dart:convert';
import 'package:desafio_tecnico_busca_milhas/DTO/LoginResponseDTO.dart';
import 'package:desafio_tecnico_busca_milhas/Models/UserModel.dart';
import 'package:desafio_tecnico_busca_milhas/Repository/Repository.dart';

class UserViewModel{

  Repository repo = Repository();

  Future<LoginResponseDTO> Login(String email,String password) async {
    final response = repo.Login(email, password);
    HttpClientResponse responseBodyNotFuture = await Future.value(response);
    String responseBody = await responseBodyNotFuture.transform(utf8.decoder).join();
    // Map<String,dynamic?> result = jsonDecode(responseBody);
    dynamic result = jsonDecode(responseBody);
    LoginResponseDTO resultFinal = result.map((login_response) => LoginResponseDTO.fromJson(login_response));

    print("chegou aq");
    return resultFinal;
  }





}