import 'package:desafio_tecnico_busca_milhas/ViewModels/AirPortViewModel.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/TravelOptionsViewModel.dart';


void main() async{

  AirPortViewModel airPortVM = new AirPortViewModel();
  TravelOptionsViewModel travelOptVM = new TravelOptionsViewModel();
  // var resp = await travelOptVM.createTravelOptionsCode(["AZUL"], "19/05/2025", "3/06/2025", "AAA", "AAB", "Ida");
  // print(resp);
  // var resp2 = await travelOptVM.queryTravelOptions(resp!["Busca"]);
  var resp2 = await travelOptVM.queryTravelOptions("1d056f5e-cf4c-462b-9ab4-eb24febdfa5d");
  print(resp2[0]);
  // print("Companhia: "+resp2[0].Companhia!);
  // print("Sentido: "+resp2[0].Sentido!);
  // print("Origem: "+resp2[0].Origem!);
  // print("Destino: "+resp2[0].Destino!);
  // print("Embarque: "+resp2[0].Embarque!);
  // print("Desembarque: "+resp2[0].Desembarque!);
  // print("Conexoes:\n");
  // print(resp2[0].Conexoes!);
  // print("NumeroConexoes: ${resp2[0].NumeroConexoes!}");
  // print("Duracao: "+resp2[0].Duracao!);
  // print("NumeroVoo: "+resp2[0].NumeroVoo!);
  // print("Valor: \n");
  // print(resp2[0].Valor!);
  // print("Milhas: \n");
  // print(resp2[0].Milhas!);

}