import 'package:desafio_tecnico_busca_milhas/Models/AirPortModel.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/AirPortViewModel.dart';
import 'package:flutter_test/flutter_test.dart';


void main() async {

  AirPortViewModel airPortVM = new AirPortViewModel();


  test('getAirports', () async {
    List<AirPortModel> result = await airPortVM.getAirports("");
    expect(result[0].Iata,"AAA");
    expect(result[0].Nome,"Anaa Airport");
    expect(result[0].Pais,"Polinésia Francesa");
    expect(result[3].Iata,"AAD");
    expect(result[3].Nome,"Cadaado Airport");
  });

}