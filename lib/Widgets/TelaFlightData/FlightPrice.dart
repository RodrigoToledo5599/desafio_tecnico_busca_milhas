import 'package:desafio_tecnico_busca_milhas/DTO/FlightPriceDTO.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaFlightData/TipoValor.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaFlightData/TipoMilhas.dart';
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

  bool TipoMilhasOuValor = false;      // false = Valor | true = Milhas

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
      width: MediaQuery.sizeOf(context).width * 0.8,
      child:Column(
        children:[
          Row(
            children: [
              Switch(
                value: TipoMilhasOuValor,
                activeColor: Colors.blue,
                onChanged: (bool value) {
                  setState(() {
                    TipoMilhasOuValor = !TipoMilhasOuValor;
                  });
                },
              ),
            ],
          ),
          if(TipoMilhasOuValor)
            Column(
              children:[
                Text(
                "Valor",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
                TipoValor(Valor: widget.Valor, NAdultos: NAdultos, NCriancas: NCriancas, NBebes: NBebes),
              ]
            )
          else
            Column(
                children:[
                  Text(
                    "Milhas",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  TipoMilhas(Milhas: widget.Milhas, NAdultos: NAdultos, NCriancas: NCriancas, NBebes: NBebes)
                ]
            ),
        ]
      )
    );
  }


}