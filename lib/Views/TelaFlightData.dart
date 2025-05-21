import 'package:desafio_tecnico_busca_milhas/Views/TelaListaDeVoos.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WidgetsDeTela/TelaFlightData/FlightPrice.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WidgetsDeTela/TelaFlightData/Conexoes.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/BottomBar.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';
import 'package:desafio_tecnico_busca_milhas/Models/FlightModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class SpaceBetweenRows extends StatelessWidget{
  SpaceBetweenRows({super.key});
  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 14,
    );
  }
}

class RowSidePadding extends StatelessWidget{
  const RowSidePadding({super.key});
  final double sidePadding = 0.1;
  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * this.sidePadding,
    );
  }
}


class TelaFlightData extends StatefulWidget{
  FlightModel? Flight = FlightModel();
  SessionData sd;
  TelaFlightData({
    Key? key,
    required this.sd,
    this.Flight
  }) : super(key: key);
  TelaFlightDataState createState() => TelaFlightDataState();
}


class TelaFlightDataState extends State<TelaFlightData>{
  TextEditingController textController = TextEditingController();
  String? name;

  @override
  void initState(){
    super.initState();
    widget.sd.getUserName().then((name){
      setState(() {
        this.name = name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: UpBar(name: this.name),
        bottomNavigationBar: BottomBar(prev_page: TelaListaDeVoos(sd: this.widget.sd)),
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1,
              child:SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      MediaQuery.sizeOf(context).width * 0.1,
                      30,
                      MediaQuery.sizeOf(context).width * 0.1,
                      14,
                    ),
                    child: Column(
                      children:[
                        Padding(
                          child:
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text(
                                  "Número do Voo:",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 128, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${widget.Flight!.NumeroVoo}",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 128, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ]
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                        ),
                        Padding(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text(
                                  "Duração:  ",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 128, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${widget.Flight!.Duracao}",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 128, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ]
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                        ),
                        Padding(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text(
                                  "Companhia:   ",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 128, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${widget.Flight!.Companhia}",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 128, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ]
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                        ),
                        Padding(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text(
                                  "Número de Conexões:  ",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 128, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${widget.Flight!.NumeroConexoes}",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 128, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ]
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                        ),
                        Padding(
                          child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text(
                                  "Embarque:  ",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 128, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${widget.Flight!.Embarque}",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 128, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ]
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                        ),
                        Padding(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text(
                                  "Desembarque:   ",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 128, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${widget.Flight!.Desembarque}",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 128, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ]
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Conexoes(conexoes: widget.Flight!.Conexoes!),
                            ]
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              FlightPrice(
                                  valor: widget.Flight!.Valor,
                                  milhas: widget.Flight!.Milhas
                              ),
                            ]
                        )
                      ]
                    ),
                )
              )
        )
      ),
    );
  }
}