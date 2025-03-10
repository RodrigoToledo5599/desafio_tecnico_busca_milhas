import 'package:desafio_tecnico_busca_milhas/DTO/FlightPointsDTO.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class TipoMilhas extends StatelessWidget{

  List<FlightPointsDTO>? Milhas;
  int? NAdultos;
  int? NCriancas;
  int? NBebes;

  TipoMilhas({
    Key? key,
    required this.Milhas,
    required this.NAdultos,
    required this.NCriancas,
    required this.NBebes,
  }) : super(key : key);

  dynamic? precoTotal(dynamic PrecoAdulto, dynamic PrecoCrianca, dynamic PrecoBebe, double? taxa)
  {
    double? total = (NAdultos! * PrecoAdulto) + (NCriancas! * PrecoCrianca) + (taxa! *(NAdultos! + NCriancas!));
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
                        padding: EdgeInsets.all(10),
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
                                    Text(
                                      "Tipo:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${item.TipoMilhas}",
                                      style: TextStyle(
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
                                    Text(
                                      "Preço adulto: ",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${item.Adulto!.toStringAsFixed(2)}",
                                      style: TextStyle(
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
                                    Text(
                                      "Preço criança:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${item.Crianca!.toStringAsFixed(2)}",
                                      style: TextStyle(
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
                                    Text(
                                      "Preço bebe:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${item.Bebe!.toStringAsFixed(2)}",
                                      style: TextStyle(
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
                                    Text(
                                      "Preço Taxa:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${item.TaxaEmbarque!.toStringAsFixed(2)}",
                                      style: TextStyle(
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
                                    Text(
                                      "Preço Total:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${this.precoTotal(item.Adulto, item.Crianca, item.Bebe, item.TaxaEmbarque)!.toStringAsFixed(2)}",
                                      style: TextStyle(
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
                                    Text(
                                      "Limite Bagagem Despachada:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "23kg: ${item.BagagemDespachada}",
                                      style: TextStyle(
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
                                    Text(
                                      "Limite Bagagem Mão:",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "10kg: ${item.BagagemMao}",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]
                              ),
                            ]
                        )
                    ),
                    SizedBox(height: 10)
                  ],
                )


            ]
        )
    );

  }


}