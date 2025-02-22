import 'package:desafio_tecnico_busca_milhas/ViewModels/AirPortViewModel.dart';


void main() async{

  AirPortViewModel apvm = new AirPortViewModel();
  var resp = await apvm.getAirports("BBQ");
  print(resp);

}