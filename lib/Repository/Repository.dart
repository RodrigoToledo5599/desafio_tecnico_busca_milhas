import 'dart:io';
import 'dart:convert';
import 'package:desafio_tecnico_busca_milhas/env.dart';
import 'package:intl/intl.dart';



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



  Future<HttpClientResponse> createTravelOptions(
      String companhias,
      String dataIda,
      String? dataVolta,
      String origem,
      String destino,
      String tipo
      ) async
  {
    HttpClientRequest request = await this.client.postUrl(Uri.parse(this.url + "busca/criar"));
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    final body = jsonEncode({
      "Companhias": [companhias],
      "DataIda": dataIda,
      "DataVolta": dataVolta,
      "Origem": origem,
      "Destino": destino,
      "Tipo": tipo
    });
    print(body);
    request.write(body);
    final response = await request.close();
    return response;
  }
}