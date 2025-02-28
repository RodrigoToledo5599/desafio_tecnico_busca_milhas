


class FlightConnectionModel{
  
  String NumeroVoo;
  String EmbarqueCompleto;
  String DesembarqueCompleto;
  String Embarque;
  String Desembarque;
  String Origem;
  String Destino;
  String Duracao;

  FlightConnectionModel({
    required this.NumeroVoo,
    required this.EmbarqueCompleto,
    required this.DesembarqueCompleto,
    required this.Embarque,
    required this.Desembarque,
    required this.Origem,
    required this.Destino,
    required this.Duracao
  });

  factory FlightConnectionModel.fromJson(Map<String, dynamic> json){
    return FlightConnectionModel(
      NumeroVoo: json['NumeroVoo'], 
      EmbarqueCompleto: json['EmbarqueCompleto'],
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