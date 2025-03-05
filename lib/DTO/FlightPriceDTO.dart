


class FlightPriceDTO{

  double? Adulto;
  int? Crianca;
  double? Bebe;
  bool? Executivo;
  double? TaxaEmbarque;
  String? TipoValor;
  int? BagagemDespachada;
  int? BagagemMao;

  FlightPriceDTO({
    this.Adulto,
    this.Crianca,
    this.Bebe,
    this.Executivo,
    this.TaxaEmbarque,
    this.TipoValor,
    this.BagagemDespachada,
    this.BagagemMao
  });


  factory FlightPriceDTO.fromJson(dynamic json){
    return FlightPriceDTO(
      Adulto: json["Adulto"],
      Crianca: json["Crianca"],
      Bebe: json["Bebe"],
      Executivo: json["Executivo"],
      TaxaEmbarque: json["TaxaEmbarque"],
      TipoValor: json["TipoValor"],
      BagagemDespachada: json["LimiteBagagem"]["BagagemDespachada"]["23kg"],
      BagagemMao: json["LimiteBagagem"]["BagagemMao"]["10kg"],
    );
  }

}