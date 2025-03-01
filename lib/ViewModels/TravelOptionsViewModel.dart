import 'dart:convert';
import 'dart:io';
import 'package:desafio_tecnico_busca_milhas/Repository/Repository.dart';



class TravelOptionsViewModel {

  Repository repo = Repository();


  Future<Map<String,dynamic>>? createTravelOptionsCode(
      String companhias,
      String dataIda,
      String? dataVolta,
      String origem,
      String destino,
      String tipo
      ) async
  {
    final response = repo.createTravelOptionsCode(companhias, dataIda, dataVolta, origem, destino, tipo);
    HttpClientResponse responseBodyNotFuture = await Future.value(response);
    String responseBody = await responseBodyNotFuture.transform(utf8.decoder).join();
    Map<String,dynamic> result = jsonDecode(responseBody);
    return result;
  }

  Future<Map<String, dynamic>> queryTravelOptions(String code) async{
    final response = repo.queryTravelOptions(code);
    HttpClientResponse responseBodyNotFuture = await Future.value(response);
    String responseBody = await responseBodyNotFuture.transform(utf8.decoder).join();
    Map<String,dynamic> result = jsonDecode(responseBody);
    return result;

  }



}