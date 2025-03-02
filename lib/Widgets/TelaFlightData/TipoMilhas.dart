import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class TipoMilhas extends StatelessWidget{

  List<dynamic>? Milhas;
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

  dynamic? precoTotal(dynamic PrecoAdulto, dynamic PrecoCrianca, dynamic PrecoBebe, double taxa)
  {
    double? total = (NAdultos! * PrecoAdulto) + (NCriancas! * PrecoCrianca) + (NBebes! * PrecoBebe) + taxa;
    return total;
  }

  @override
  Widget build(BuildContext context){
    return Container(
        child:Column(
            children:[
              for(var item in this.Milhas!)
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
                                  children:[
                                    Text(
                                      "Tipo: ${item["TipoValor"]}",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]
                              ),
                              Row(
                                  children:[
                                    Text(
                                      "Preço adulto: ${item["Adulto"]}",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]
                              ),
                              Row(
                                  children:[
                                    Text(
                                      "Preço criança: ${item["Crianca"]}",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]
                              ),
                              Row(
                                  children:[
                                    Text(
                                      "Preço bebe: ${item["Bebe"]}",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]
                              ),
                              Row(
                                  children:[
                                    Text(
                                      "Preço Total: ${this.precoTotal(item["Adulto"], item["Crianca"], item["Bebe"], item["TaxaEmbarque"])}",
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