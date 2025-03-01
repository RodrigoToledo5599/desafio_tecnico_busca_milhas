import 'package:desafio_tecnico_busca_milhas/ViewModels/AirPortViewModel.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/TravelOptionsViewModel.dart';


void main() async{

  AirPortViewModel airPortVM = new AirPortViewModel();
  TravelOptionsViewModel travelOptVM = new TravelOptionsViewModel();
  // var resp = await travelOptVM.createTravelOptionsCode("AZUL", "3/04/2025", "3/06/2025", "AAA", "AAB", "Ida");
  // var resp2 = await travelOptVM.queryTravelOptions(resp!["Busca"]);
  var resp2 = await travelOptVM.queryTravelOptions("c875ba70-6b6a-49db-9d88-e1fca779358e");
  print(resp2["Voos"][0]);













  // testes para rodar abaixo:

}