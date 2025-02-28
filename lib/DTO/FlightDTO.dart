import 'package:desafio_tecnico_busca_milhas/DTO/FlightPointsDTO.dart';
import 'package:desafio_tecnico_busca_milhas/DTO/FlightPriceDTO.dart';
import 'package:desafio_tecnico_busca_milhas/Models/FlightConnectionModel.dart';


class FlightDTO{
  String? Companhia;
  String? Sentido;
  String? Origem;
  String? Destino;
  String? Embarque;
  String? Desembarque;
  String? Duracao;
  String? NumeroVoo;
  int? NumeroConexoes;
  FlightPriceDTO? Valor;
  FlightPointsDTO? Milhas;
  FlightConnectionModel? Conexoes;
}