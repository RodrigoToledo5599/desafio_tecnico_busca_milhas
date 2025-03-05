import 'package:desafio_tecnico_busca_milhas/DTO/FlightPointsDTO.dart';
import 'package:desafio_tecnico_busca_milhas/DTO/FlightPriceDTO.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaFlightData/TipoValor.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaFlightData/TipoMilhas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';




class FlightPrice extends StatefulWidget{

  List<FlightPriceDTO>? Valor;
  List<FlightPointsDTO>? Milhas;
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

  bool TipoMilhasOuValor = false;
  bool exibirDetalhes = false;
  String buttonText = "Exibir Detalhes";

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
          ElevatedButton(
              onPressed: () =>{
                setState(() {
                  exibirDetalhes = !exibirDetalhes;
                  if(exibirDetalhes == false){
                    buttonText = "Exibir Detalhes";
                  }
                  else if(exibirDetalhes == true){
                    buttonText = "Fechar Detalhes";
                  }
                })
              },
              child: Text(
                  "${buttonText}",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
              )
          ),
          SizedBox(height:20),
          if(exibirDetalhes == false)
            Column()
          else
            Column(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Valor",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          TipoValor(Valor: widget.Valor, NAdultos: NAdultos, NCriancas: NCriancas, NBebes: NBebes),
                        ]
                    )
                  else
                    Column(
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Milhas",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          TipoMilhas(Milhas: widget.Milhas, NAdultos: NAdultos, NCriancas: NCriancas, NBebes: NBebes)
                        ]
                    ),
                ]
            ),
          SizedBox(height:40),
        ]
      ),
    );
  }


}