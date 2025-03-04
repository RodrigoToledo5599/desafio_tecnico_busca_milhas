import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';




class TelaInicialService{
  String? AeroportoOrigem;
  String? AeroportoDestino;
  String? DataIda;
  String? DataVolta;
  String? HorarioIda;
  String? HorarioVolta;
  String? CompanhiaAerea;
  String? TipoDeViagem;
  String? NPassageirosAdultos;
  String? NPassageirosCriancas;
  String? NPassageirosBebes;

  SessionData sd = SessionData();

  TelaInicialService({
    this.AeroportoOrigem,
    this.AeroportoDestino,
    this.DataIda,
    this.DataVolta,
    this.HorarioIda,
    this.HorarioVolta,
    this.CompanhiaAerea,
    this.TipoDeViagem,
    this.NPassageirosAdultos,
    this.NPassageirosCriancas,
    this.NPassageirosBebes,
  });

  // METHODS ============================================================================

  void printAllResults(){
    print("Origem: ${AeroportoOrigem}");
    print("Destino: ${AeroportoDestino}");
    print("Ida: ${DataIda}");
    print("Horário Ida: ${HorarioIda}");
    print("Volta: ${DataVolta}");
    print("Horário Volta: ${HorarioVolta}");
    print("Copanhia(s) Aéreas: ${CompanhiaAerea}");
    print("Tipo de Viagem: ${TipoDeViagem}");
    print("Nadultos: ${NPassageirosAdultos}");
    print("Ncriancas: ${NPassageirosCriancas}");
    print("Nbebes: ${NPassageirosBebes}");
  }

  // travelCode!["Busca"]
  void savingSessionData(String travelCode){
    sd.setCodigoViagemOptions(travelCode);
    sd.setNAdultos(int.parse(NPassageirosAdultos!));
    sd.setNCriancas(int.parse(NPassageirosCriancas!));
    sd.setNBebes(int.parse(NPassageirosBebes!));
  }

  List<String> AerialCompaniesListFormat(){
    if(CompanhiaAerea!.substring(0,1) == '['){
      CompanhiaAerea = CompanhiaAerea!.substring(1, CompanhiaAerea!.length - 1);
    }
    List<String> companhiasList = CompanhiaAerea!.split(",");
    for(int i =0; i < companhiasList.length; i++){
      companhiasList[i] = companhiasList[i].trim();
    }
    return companhiasList;
  }

  bool checkIfAllRequiredFieldsAreFilled(){
    print("Tipo De viagem: ${TipoDeViagem}");
    if(AeroportoOrigem == null || AeroportoOrigem == ""){
      return false;
    }
    else if(AeroportoDestino == null || AeroportoDestino == ""){
      return false;
    }
    else if(DataIda == null || DataIda == ""){
      return false;
    }
    else if(DataVolta == null || DataVolta == ""){
      return false;
    }
    else if(CompanhiaAerea == null || CompanhiaAerea == "[]"){
      return false;
    }
    return true;
  }

  bool assuringThereAreMoreAdultsThanBabies(){
    int NBabies = int.parse(NPassageirosBebes!);
    int NAdults = int.parse(NPassageirosAdultos!);
    if(NAdults < NBabies){
      return false;
    }
    return true;
  }



}