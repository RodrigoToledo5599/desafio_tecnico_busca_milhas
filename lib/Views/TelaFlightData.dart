import 'package:desafio_tecnico_busca_milhas/Widgets/TelaFlightData/Conexoes.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaFlightData/FlightPrice.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaFlightData/TelaFlightDataBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';
import 'package:desafio_tecnico_busca_milhas/Models/FlightModel.dart';




class SpaceBetweenRows extends StatelessWidget{
  const SpaceBetweenRows({super.key});
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
  TelaFlightData({
    Key? key,
    this.Flight
  }) : super(key: key);
  TelaFlightDataState createState() => TelaFlightDataState();
}


class TelaFlightDataState extends State<TelaFlightData>{
  TextEditingController textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: UpBar(),
        bottomNavigationBar: TelaFlightDataBottomBar(),
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1,
              child:SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      MediaQuery.sizeOf(context).width * 0.1,  // Left
                      30,  // Top
                      MediaQuery.sizeOf(context).width * 0.1,  // Right
                      14, // Bottom
                    ),
                    child: Column(
                      children:[
                        Padding(
                          child:
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                                Text(
                                  "Número do Voo:   ${widget.Flight!.NumeroVoo}",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ]
                          ),
                          padding: EdgeInsets.fromLTRB(
                            0,  // Left
                            0,  // Top
                            0,  // Right
                            14, // Bottom
                          ),
                        ),
                        Padding(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                                Text(
                                  "Duração:  ${widget.Flight!.Duracao}",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ]
                          ),
                          padding: EdgeInsets.fromLTRB(
                            0,  // Left
                            0,  // Top
                            0,  // Right
                            14, // Bottom
                          ),
                        ),
                        Padding(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                                Text(
                                  "Companhia:   ",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${widget.Flight!.Companhia}",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ]
                          ),
                          padding: const EdgeInsets.fromLTRB(
                            0,  // Left
                            0,  // Top
                            0,  // Right
                            14, // Bottom
                          ),
                        ),
                        Padding(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                                Text(
                                  "Número de Conexões:  ",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${widget.Flight!.NumeroConexoes}",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ]
                          ),
                          padding: const EdgeInsets.fromLTRB(
                            0,  // Left
                            0,  // Top
                            0,  // Right
                            14, // Bottom
                          ),
                        ),
                        Padding(
                          child:Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                                Text(
                                  "Embarque:  ",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${widget.Flight!.Embarque}",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ]
                          ),
                          padding: const EdgeInsets.fromLTRB(
                            0,  // Left
                            0,  // Top
                            0,  // Right
                            14, // Bottom
                          ),
                        ),
                        Padding(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                                Text(
                                  "Desembarque:   ",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${widget.Flight!.Desembarque}",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ]
                          ),
                          padding: const EdgeInsets.fromLTRB(
                            0,  // Left
                            0,  // Top
                            0,  // Right
                            14, // Bottom
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:[
                              Conexoes(conexoes: widget.Flight!.Conexoes!),
                            ]
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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