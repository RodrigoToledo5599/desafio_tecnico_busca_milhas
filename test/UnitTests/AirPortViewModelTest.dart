import 'package:desafio_tecnico_busca_milhas/ViewModels/AirPortViewModel.dart';
import 'package:flutter_test/flutter_test.dart';


void main() async {

  AirPortViewModel apvm = new AirPortViewModel();


  test('getAirports', () async {
    apvm.getAirports("BBQ");
  });


}