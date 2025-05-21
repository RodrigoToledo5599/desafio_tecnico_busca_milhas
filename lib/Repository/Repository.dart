import 'dart:io';
import 'dart:convert';
import 'package:desafio_tecnico_busca_milhas/env.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';
import 'package:intl/intl.dart';



class Repository {
  var client = HttpClient();
  String url = env().url;



  Future<List<dynamic>> getAirports(String parameter) async {
    String auth_token = await SessionData().getAuthToken();
    if(parameter.isEmpty){
      HttpClientRequest request = await this.client.getUrl(Uri.parse(this.url + "aeroportos"));
      request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
      request.headers.set('auth-token', auth_token);
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      print(responseBody);
      List<dynamic> result = jsonDecode(responseBody);
      return result;
    }
    else{
      HttpClientRequest request = await this.client.getUrl(Uri.parse(this.url + "aeroportos?q=${parameter}"));
      request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
      request.headers.set('auth-token', auth_token);
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      List<dynamic> result = jsonDecode(responseBody);
      return result;
    }
  }

  Future<HttpClientResponse> createTravelOptionsCode(
      List<String> companhias,
      String dataIda,
      String? dataVolta,
      String origem,
      String destino,
      String tipo
      ) async
  {
    String auth_token = await SessionData().getAuthToken();
    HttpClientRequest request = await this.client.postUrl(Uri.parse(this.url + "busca/criar"));
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set('auth-token', auth_token);
    final body = jsonEncode({
      "Companhias": companhias,
      "DataIda": dataIda,
      "DataVolta": dataVolta,
      "Origem": origem,
      "Destino": destino,
      "Tipo": tipo
    });
    request.write(body);
    final response = await request.close();
    return response;
  }

  Future<HttpClientResponse> queryTravelOptions(String code) async{
    String auth_token = await SessionData().getAuthToken();
    HttpClientRequest request = await this.client.getUrl(Uri.parse(this.url + "busca/${code}"));
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set('auth-token', auth_token);
    HttpClientResponse response = await request.close();
    return response;
  }

  Future<HttpClientResponse> Login(String email, String password) async {
    HttpClientRequest request = await this.client.postUrl(Uri.parse(this.url + "users/login"));
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');

    final body = jsonEncode({
      "email": email,
      "password": password
    });
    request.write(body);
    final response = await request.close();
    return response;

  }




}