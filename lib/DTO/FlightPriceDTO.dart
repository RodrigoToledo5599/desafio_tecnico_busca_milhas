


class FlightPriceDTO{

  double? Adulto;
  int? Crianca;
  double? Bebe;
  bool? Executivo;
  double? TaxaEmbarque;
  String? TipoValor;

  FlightPriceDTO({
    this.Adulto,
    this.Crianca,
    this.Bebe,
    this.Executivo,
    this.TaxaEmbarque,
    this.TipoValor
  });


  factory FlightPriceDTO.fromJson(dynamic json){
    return FlightPriceDTO(
      Adulto: json["Adulto"],
      Crianca: json["Crianca"],
      Bebe: json["Bebe"],
      Executivo: json["Executivo"],
      TaxaEmbarque: json["TaxaEmbarque"],
      TipoValor: json["TipoValor"],
    );
  }

}