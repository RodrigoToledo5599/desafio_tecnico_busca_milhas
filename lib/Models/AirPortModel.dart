


class AirPortModel{

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

  AirPortModel({
    this.Iata,
    this.Nome,
    this.Continente,
    this.Pais,
    this.PaisCodigo,
    this.Regiao,
    this.RegiaoCodigo,
    this.Local,
    this.SubLocal,
    this.FusoHorario
  });

  factory AirPortModel.fromJson(Map<String, dynamic> json) {
    return AirPortModel(
      Iata: json['Iata'],
      Nome: json['Nome'],
      Continente: json['Continente'],
      Pais:json['Pais'],
      PaisCodigo:json['PaisCodigo'],
      Regiao:json['Regiao'],
      RegiaoCodigo:json['RegiaoCodigo'],
      Local:json['Local'],
      SubLocal:json['SubLocal'],
      FusoHorario:json['FusoHorario'],
    );
  }


  @override // apenas esses 2 por agora;
  String toString() {
    return 'AirPortModel(Iata: ${this.Iata}, Nome: ${this.Nome})';
  }


}