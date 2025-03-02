import 'package:desafio_tecnico_busca_milhas/ViewModels/TravelOptionsViewModel.dart';
import 'package:flutter_test/flutter_test.dart';




void main() async{

  TravelOptionsViewModel travelOptVM = new TravelOptionsViewModel();


  test('createTravelOptions', () async{
    travelOptVM.createTravelOptionsCode(["AZUL"], "3/4/2025", "3/6/2025", "AAA", "AAB", "Ida");
    


  });





}