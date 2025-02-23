import 'package:desafio_tecnico_busca_milhas/ViewModels/AirPortViewModel.dart';


void main() async{

  AirPortViewModel airPortVM = new AirPortViewModel();
  var resp = await airPortVM.getAirports("");
  print(resp[123]);












  // testes para rodar abaixo:

}