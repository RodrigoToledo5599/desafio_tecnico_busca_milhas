import 'dart:convert';
import 'dart:io';
import 'package:desafio_tecnico_busca_milhas/Models/FlightModel.dart';
import 'package:desafio_tecnico_busca_milhas/Repository/Repository.dart';



class TravelOptionsViewModel {

  Repository repo = Repository();

  Future<Map<String,dynamic>>? createTravelOptionsCode(List<String> companhias, String dataIda, String? dataVolta, String origem, String destino, String tipo) async
  {
    // companhias = companhias.substring(1, companhias.length - 1);
    // companhias = companhias.replaceAll(" ", "");
    // List<String> companhiasList = companhias.split(",");
    print("print viewModel: ${companhias}");
    final response = repo.createTravelOptionsCode(companhias, dataIda, dataVolta, origem, destino, tipo);
    HttpClientResponse responseBodyNotFuture = await Future.value(response);
    String responseBody = await responseBodyNotFuture.transform(utf8.decoder).join();
    Map<String,dynamic?> result = jsonDecode(responseBody);
    return result;
  }

  Future<List<FlightModel>> queryTravelOptions(String? code) async{
    final response = repo.queryTravelOptions(code!);
    HttpClientResponse responseBodyNotFuture = await Future.value(response);
    String responseBody = await responseBodyNotFuture.transform(utf8.decoder).join();
    Map<String,dynamic> result = jsonDecode(responseBody);
    List<dynamic> resultVoos = result["Voos"];
    List<FlightModel> resultFinal = resultVoos.map((flight) => FlightModel.fromJson(flight)).toList();
    return resultFinal;

  }



}