import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:desafio_tecnico_busca_milhas/Models/AirPortModel.dart';
import 'package:desafio_tecnico_busca_milhas/env.dart';

class AirPortViewModel{

  var client = HttpClient();
  String url = env().url;


  dynamic getAirports(String parameter) async {
    String stringData = "";
    if(parameter.isEmpty){
      HttpClientRequest request = await this.client.getUrl(Uri.parse(this.url + "/aeroportos"));
      HttpClientResponse response = await request.close();
      stringData = await response.transform(utf8.decoder).join();
    }
    else{
      HttpClientRequest request = await this.client.getUrl(Uri.parse(this.url + "/aeroportos?q=${parameter}"));
      HttpClientResponse response = await request.close();
      stringData = await response.transform(utf8.decoder).join();
    }
    client.close();
    return stringData;
  }





}