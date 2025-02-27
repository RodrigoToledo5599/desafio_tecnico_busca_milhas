import 'dart:io';
import 'dart:convert';
import 'package:desafio_tecnico_busca_milhas/env.dart';



class Repository {


  var client = HttpClient();
  String url = env().url;


  Future<List<dynamic>> getAirports(String parameter) async {
    if(parameter.isEmpty){
      HttpClientRequest request = await this.client.getUrl(Uri.parse(this.url + "/aeroportos"));
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      List<dynamic> result = jsonDecode(responseBody);
      return result;
    }
    else{
      HttpClientRequest request = await this.client.getUrl(Uri.parse(this.url + "/aeroportos?q=${parameter}"));
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      List<dynamic> result = jsonDecode(responseBody);
      return result;
    }
  }
}