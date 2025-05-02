import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';




class TelaInicialService{
  String? aeroporto_origem;
  String? aeroporto_destino;
  String? data_ida;
  String? data_volta;
  String? horario_ida;
  String? horario_volta;
  String? companhia_aerea;
  String? tipo_de_viagem;
  String? n_passageiros_adultos;
  String? n_passageiros_criancas;
  String? n_passageiros_bebes;

  SessionData sd = SessionData();

  TelaInicialService({
    this.aeroporto_origem,
    this.aeroporto_destino,
    this.data_ida,
    this.data_volta,
    this.horario_ida,
    this.horario_volta,
    this.companhia_aerea,
    this.tipo_de_viagem,
    this.n_passageiros_adultos,
    this.n_passageiros_criancas,
    this.n_passageiros_bebes,
  });

  // METHODS ============================================================================

  void printAllResults(){
    print("Origem: ${aeroporto_origem}");
    print("Destino: ${aeroporto_destino}");
    print("Ida: ${data_ida}");
    print("Horário Ida: ${horario_ida}");
    print("Volta: ${data_volta}");
    print("Horário Volta: ${horario_volta}");
    print("Copanhia(s) Aéreas: ${companhia_aerea}");
    print("Tipo de Viagem: ${tipo_de_viagem}");
    print("Nadultos: ${n_passageiros_adultos}");
    print("Ncriancas: ${n_passageiros_criancas}");
    print("Nbebes: ${n_passageiros_bebes}");
  }

  // travelCode!["Busca"]
  void savingSessionData(String travelCode){
    sd.setCodigoViagemOptions(travelCode);
    sd.setNAdultos(int.parse(n_passageiros_adultos!));
    sd.setNCriancas(int.parse(n_passageiros_criancas!));
    sd.setNBebes(int.parse(n_passageiros_bebes!));
  }

  List<String> AerialCompaniesListFormat(){
    if(companhia_aerea!.substring(0,1) == '['){
      companhia_aerea = companhia_aerea!.substring(1, companhia_aerea!.length - 1);
    }
    List<String> companhiasList = companhia_aerea!.split(",");
    for(int i =0; i < companhiasList.length; i++){
      companhiasList[i] = companhiasList[i].trim();
    }
    return companhiasList;
  }

  bool checkIfAllRequiredFieldsAreFilled(){
    print("Tipo De viagem: ${tipo_de_viagem}");
    if(aeroporto_origem == null || aeroporto_origem == ""){
      return false;
    }
    else if(aeroporto_destino == null || aeroporto_destino == ""){
      return false;
    }
    else if(data_ida == null || data_ida == ""){
      return false;
    }
    else if(data_volta == null || data_volta == ""){
      return false;
    }
    else if(companhia_aerea == null || companhia_aerea == "[]"){
      return false;
    }
    return true;
  }

  bool assuringThereAreMoreAdultsThanBabies(){
    int NBabies = int.parse(n_passageiros_bebes!);
    int NAdults = int.parse(n_passageiros_adultos!);
    if(NAdults < NBabies){
      return false;
    }
    return true;
  }



}