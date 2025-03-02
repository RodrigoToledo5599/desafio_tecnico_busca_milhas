import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';




class FlightPrice extends StatefulWidget{

  List<dynamic>? Valor;
  List<dynamic>? Milhas;
  SessionData sessionData = SessionData();

  FlightPrice({
    Key? key,
    required this.Valor,
    required this.Milhas,
  }) : super(key : key);

  FlightPriceState createState() => FlightPriceState();
}


class FlightPriceState extends State<FlightPrice>{

  int? NAdultos;
  int? NCriancas;
  int? NBebes;

  void getSessionData() async{
    int? adulto = await widget.sessionData.getNAdultos();
    int? crianca = await widget.sessionData.getNCriancas();
    int? bebe = await widget.sessionData.getNBebes();
    setState(() {
      NAdultos  = adulto;
      NCriancas  = crianca;
      NBebes  = bebe;
    });
  }

  void initState() {
    super.initState();
    this.getSessionData();
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child:Column(
        children:[
          Text("numero de adultos : ${NAdultos}"),
          Text("numero de kids : ${NCriancas}"),
          Text("numero de bebes : ${NBebes}"),
        ]
      )
    );
  }


}