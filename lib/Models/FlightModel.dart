import 'package:desafio_tecnico_busca_milhas/DTO/FlightPointsDTO.dart';
import 'package:desafio_tecnico_busca_milhas/DTO/FlightPriceDTO.dart';
import 'package:desafio_tecnico_busca_milhas/Models/FlightConnectionModel.dart';


class FlightModel{
  String? Companhia;
  String? Sentido;
  String? Origem;
  String? Destino;
  String? Embarque;
  String? Desembarque;
  String? Duracao;
  String? NumeroVoo;
  int? NumeroConexoes;
  // FlightPriceDTO? Valor;
  // FlightPointsDTO? Milhas;
  // FlightConnectionModel? Conexoes;
  List<dynamic>? Valor;
  List<dynamic>? Milhas;
  List<dynamic>? Conexoes;

  FlightModel({
    this.Companhia,
    this.Sentido,
    this.Origem,
    this.Destino,
    this.Embarque,
    this.Desembarque,
    this.Duracao,
    this.NumeroVoo,
    this.NumeroConexoes,
    this.Valor,
    this.Milhas,
    this.Conexoes
  });

  factory FlightModel.fromJson(Map<String, dynamic> json){
    return FlightModel(
      Companhia: json["Companhia"],
      Sentido: json["Sentido"],
      Origem: json["Origem"],
      Destino: json["Destino"],
      Embarque: json["Embarque"],
      Desembarque: json["Desembarque"],
      Duracao: json["Duracao"],
      NumeroVoo: json["NumeroVoo"],
      NumeroConexoes: json["NumeroConexoes"],
      Valor: json["Valor"],
      Milhas: json["Milhas"],
      Conexoes: json["Conexoes"]
    );
  }


  @override // apenas esses 2 por agora;
  String toString() {
    return 'TaskModel(Iata: ${this.Companhia}, Nome: ${this.Sentido})';
  }



}