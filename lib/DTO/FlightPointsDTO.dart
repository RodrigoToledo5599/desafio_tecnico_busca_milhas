





class FlightPointsDTO{
  
  int? Adulto;
  int? Crianca;
  int? Bebe;
  bool? Executivo;
  double? TaxaEmbarque;
  String? TipoMilhas;
  int? BagagemDespachada;
  int? BagagemMao;


  FlightPointsDTO({
    this.Adulto,
    this.Crianca,
    this.Bebe,
    this.Executivo,
    this.TaxaEmbarque,
    this.TipoMilhas,
    this.BagagemDespachada,
    this.BagagemMao
  });

  factory FlightPointsDTO.fromJson(dynamic json){
    return FlightPointsDTO(
      Adulto: json["Adulto"],
      Crianca: json["Crianca"],
      Bebe: json["Bebe"],
      Executivo: json["Executivo"],
      TaxaEmbarque: json["TaxaEmbarque"],
      TipoMilhas: json["TipoMilhas"],
      BagagemDespachada: json["LimiteBagagem"]["BagagemDespachada"]["23kg"],
      BagagemMao: json["LimiteBagagem"]["BagagemMao"]["10kg"],
    );
  }


}