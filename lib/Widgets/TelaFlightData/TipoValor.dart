import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class TipoValor extends StatelessWidget{

  List<dynamic>? Valor;
  int? NAdultos;
  int? NCriancas;
  int? NBebes;


  TipoValor({
    Key? key,
    required this.Valor,
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
          for(var item in this.Valor!)
            Container(
              child: Column(
                children:[
                  Row(
                    children:[
                      Text("Preço adulto: ${item["Adulto"]}"),
                    ]
                  ),
                  Row(
                      children:[
                        Text("Preço criança: ${item["Crianca"]}"),
                      ]
                  ),
                  Row(
                      children:[
                        Text("Preço bebe: ${item["Bebe"]}"),
                      ]
                  ),
                  Row(
                      children:[
                        Text("Preço Total: ${this.precoTotal(item["Adulto"], item["Crianca"], item["Bebe"], item["TaxaEmbarque"])}"),
                      ]
                  ),


                ]
              )
            )
        ]
      )
    );

  }



}