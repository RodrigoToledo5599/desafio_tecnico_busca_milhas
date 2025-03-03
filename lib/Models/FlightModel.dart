import 'package:desafio_tecnico_busca_milhas/DTO/FlightPointsDTO.dart';
import 'package:desafio_tecnico_busca_milhas/DTO/FlightPriceDTO.dart';
import 'package:desafio_tecnico_busca_milhas/DTO/FlightConnectionDTO.dart';


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
  List<FlightPriceDTO>? Valor;
  List<FlightPointsDTO>? Milhas;
  List<FlightConnectionDTO>? Conexoes;

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

    List<FlightPriceDTO> FlightPrices = [];
    List<FlightPointsDTO> FlightPoints = [];
    List<FlightConnectionDTO> FlightConnections = [];

    for(var item in json["Valor"]){
      FlightPrices.add(FlightPriceDTO.fromJson(item));
    }
    for(var item in json["Milhas"]){
      FlightPoints.add(FlightPointsDTO.fromJson(item));
    }
    for(var item in json["Conexoes"]){
      FlightConnections.add(FlightConnectionDTO.fromJson(item));
    }

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
      Valor: FlightPrices,
      Milhas: FlightPoints,
      Conexoes: FlightConnections
    );
  }


  @override // apenas esses 2 por agora;
  String toString() {
    return 'TaskModel(Iata: ${this.Companhia}, Nome: ${this.Sentido})';
  }



}