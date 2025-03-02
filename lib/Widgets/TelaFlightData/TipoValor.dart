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

  @override
  Widget build(BuildContext context){
    return Container(
      child:Column(
        children:[

        ]
      )
    );

  }


}