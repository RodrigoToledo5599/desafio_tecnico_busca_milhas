import 'package:desafio_tecnico_busca_milhas/ViewModels/AirPortViewModel.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/TravelOptionsViewModel.dart';


void main() async{

  AirPortViewModel airPortVM = new AirPortViewModel();
  TravelOptionsViewModel travelOptVM = new TravelOptionsViewModel();
  var resp = await travelOptVM.createTravelOptions("AZUL", "3/04/2025", "3/06/2025", "AAA", "AAB", "Ida");
  print(resp);












  // testes para rodar abaixo:

}