import 'package:desafio_tecnico_busca_milhas/DTO/FlightPointsDTO.dart';
import 'package:desafio_tecnico_busca_milhas/DTO/FlightPriceDTO.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaFlightData/TipoValor.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaFlightData/TipoMilhas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';




class FlightPrice extends StatefulWidget{

  List<FlightPriceDTO>? valor;
  List<FlightPointsDTO>? milhas;
  SessionData session_data = SessionData();

  FlightPrice({
    Key? key,
    required this.valor,
    required this.milhas,
  }) : super(key : key);

  FlightPriceState createState() => FlightPriceState();
}


class FlightPriceState extends State<FlightPrice>{

  int? n_adultos;
  int? n_criancas;
  int? n_bebes;

  bool tipo_milhas_ou_valor = false;
  bool exibir_detalhes = false;
  String button_text = "Exibir Detalhes";

  void getSessionData() async{
    int? adulto = await widget.session_data.getNAdultos();
    int? crianca = await widget.session_data.getNCriancas();
    int? bebe = await widget.session_data.getNBebes();
    setState(() {
      n_adultos  = adulto;
      n_criancas  = crianca;
      n_bebes  = bebe;
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
                  exibir_detalhes = !exibir_detalhes;
                  if(exibir_detalhes == false){
                    button_text = "Exibir Detalhes";
                  }
                  else if(exibir_detalhes == true){
                    button_text = "Fechar Detalhes";
                  }
                })
              },
              child: Text(
                  "${button_text}",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
              )
          ),
          const SizedBox(height:20),
          if(exibir_detalhes == false)
            const Column()
          else
            Column(
                children:[
                  Row(
                    children: [
                      Switch(
                        value: tipo_milhas_ou_valor,
                        activeColor: Colors.blue,
                        onChanged: (bool value) {
                          setState(() {
                            tipo_milhas_ou_valor = !tipo_milhas_ou_valor;
                          });
                        },
                      ),
                    ],
                  ),
                  if(tipo_milhas_ou_valor)
                    Column(
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Valor",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          TipoValor(Valor: widget.valor, n_adultos: n_adultos, n_criancas: n_criancas, n_bebes: n_bebes),
                        ]
                    )
                  else
                    Column(
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Milhas",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          TipoMilhas(Milhas: widget.milhas, n_adultos: n_adultos, n_criancas: n_criancas, n_bebes: n_bebes)
                        ]
                    ),
                ]
            ),
          const SizedBox(height:40),
        ]
      ),
    );
  }


}