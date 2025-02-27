import 'package:desafio_tecnico_busca_milhas/Models/AirPortModel.dart';
import 'package:desafio_tecnico_busca_milhas/Repository/Repository.dart';

class AirPortViewModel{

  Repository repo = Repository();

  Future<List<AirPortModel>> getAirports(String parameter) async {
    List<AirPortModel> AirPortList = [];
    List<dynamic> jsonList = await repo.getAirports(parameter);
    AirPortList = jsonList.map((json)=> AirPortModel.fromJson(json)).toList();
    return Future.value(AirPortList);
  }





}