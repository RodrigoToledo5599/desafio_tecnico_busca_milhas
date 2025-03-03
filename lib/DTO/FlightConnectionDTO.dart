


class FlightConnectionDTO{

  String NumeroVoo;
  String EmbarqueCompleto;
  String DesembarqueCompleto;
  String DataDesembarque;
  String Embarque;
  String DataEmbarque;
  String Desembarque;
  String Origem;
  String Destino;
  String Duracao;

  FlightConnectionDTO({
    required this.NumeroVoo,
    required this.EmbarqueCompleto,
    required this.DataDesembarque,
    required this.DataEmbarque,
    required this.DesembarqueCompleto,
    required this.Embarque,
    required this.Desembarque,
    required this.Origem,
    required this.Destino,
    required this.Duracao
  });

  factory FlightConnectionDTO.fromJson(dynamic json){
    return FlightConnectionDTO(
      NumeroVoo: json['NumeroVoo'],
      EmbarqueCompleto: json['EmbarqueCompleto'],
      DataEmbarque: json["DataEmbarque"],
      DataDesembarque: json['DataDesembarque'],
      DesembarqueCompleto: json['DesembarqueCompleto'],
      Embarque: json['Embarque'],
      Desembarque: json['Desembarque'],
      Origem: json['Origem'],
      Destino: json['Destino'],
      Duracao: json['Duracao'],
    );
  }

  @override
  String toString(){
    return "FlightConnectionModel(NumeroVoo: ${NumeroVoo}), Origem: ${Origem} Destino: ${Destino}";
  }


}