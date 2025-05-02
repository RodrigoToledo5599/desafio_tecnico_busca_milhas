import 'package:desafio_tecnico_busca_milhas/DTO/FlightPointsDTO.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//
// class EstilizacaoDosCampos{
//   static getTextStyling(){
//     return const TextStyle(
//       color: Colors.blue,
//       fontWeight: FontWeight.w600,
//       fontSize: 12,
//     );
//   }
// }

class TipoMilhas extends StatelessWidget{

  List<FlightPointsDTO>? Milhas;
  int? n_adultos;
  int? n_criancas;
  int? n_bebes;

  TipoMilhas({
    Key? key,
    required this.Milhas,
    required this.n_adultos,
    required this.n_criancas,
    required this.n_bebes,
  }) : super(key : key);

  dynamic? precoTotal(dynamic preco_adulto, dynamic preco_crianca, dynamic preco_bebe, double? taxa)
  {
    double? total = (n_adultos! * preco_adulto) + (n_criancas! * preco_crianca) + (taxa! *(n_adultos! + n_criancas!));
    return total;
  }

  @override
  Widget build(BuildContext context){
    return Container(
        child:Column(
            children:[
              for(FlightPointsDTO item in this.Milhas!)
                Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children:[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    const Text(
                                      "Tipo:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${item.TipoMilhas}",
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )
                                    ),
                                  ]
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    const Text(
                                      "Preço adulto: ",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )
                                    ),
                                    Text(
                                      "${item.Adulto!.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )
                                    ),
                                  ]
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    const Text(
                                      "Preço criança:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )
                                    ),
                                    Text(
                                      "${item.Crianca!.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    const Text(
                                      "Preço bebe:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${item.Bebe!.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    const Text(
                                      "Preço Taxa:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${item.TaxaEmbarque!.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    const Text(
                                      "Preço Total:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${this.precoTotal(item.Adulto, item.Crianca, item.Bebe, item.TaxaEmbarque)!.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    const Text(
                                      "Limite Bagagem Despachada:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "23kg: ${item.BagagemDespachada}",
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    const Text(
                                      "Limite Bagagem Mão:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "10kg: ${item.BagagemMao}",
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )
                                    ),
                                  ]
                              ),
                            ]
                        )
                    ),
                    const SizedBox(height: 10)
                  ],
                )


            ]
        )
    );

  }


}