import 'dart:io';
import 'dart:convert';
import 'package:desafio_tecnico_busca_milhas/Models/AirPortModel.dart';
import 'package:desafio_tecnico_busca_milhas/env.dart';

class AirPortViewModel{

  var client = HttpClient();
  String url = env().url;


  Future<List<AirPortModel>> getAirports(String parameter) async {
    List<AirPortModel> AirPortList = [];
    if(parameter.isEmpty){
      HttpClientRequest request = await this.client.getUrl(Uri.parse(this.url + "/aeroportos"));
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      List<dynamic> jsonList = jsonDecode(responseBody);
      AirPortList = jsonList.map((json)=> AirPortModel.fromJson(json)).toList();
    }
    else{
      HttpClientRequest request = await this.client.getUrl(Uri.parse(this.url + "/aeroportos?q=${parameter}"));
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      List<dynamic> jsonList = jsonDecode(responseBody);
      AirPortList = jsonList.map((json)=> AirPortModel.fromJson(json)).toList();
    }
    // client.close();
    return Future.value(AirPortList);
  }





}