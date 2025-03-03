





class FlightPointsDTO{
  
  int? Adulto;
  int? Crianca;
  int? Bebe;
  bool? Executivo;
  double? TaxaEmbarque;
  String? TipoMilhas;


  FlightPointsDTO({
    this.Adulto,
    this.Crianca,
    this.Bebe,
    this.Executivo,
    this.TaxaEmbarque,
    this.TipoMilhas
  });

  factory FlightPointsDTO.fromJson(dynamic json){
    return FlightPointsDTO(
      Adulto: json["Adulto"],
      Crianca: json["Crianca"],
      Bebe: json["Bebe"],
      Executivo: json["Executivo"],
      TaxaEmbarque: json["TaxaEmbarque"],
      TipoMilhas: json["TipoMilhas"],
    );
  }


}