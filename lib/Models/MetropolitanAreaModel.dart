import 'package:desafio_tecnico_busca_milhas/Models/AirPortModel.dart';




class MetropolitanAreaModel {

  String? Iata;
  String? Nome;
  String? Continente;
  String? Pais;
  String? PaisCodigo;
  String? Regiao;
  String? RegiaoCodigo;
  String? Local;
  String? SubLocal;
  String? FusoHorario;
  List<AirPortModel>? Aeroportos;

  MetropolitanAreaModel({
    this.Iata,
    this.Nome,
    this.Continente,
    this.Pais,
    this.PaisCodigo,
    this.Regiao,
    this.RegiaoCodigo,
    this.Local,
    this.SubLocal,
    this.FusoHorario,
    this.Aeroportos
  });




}