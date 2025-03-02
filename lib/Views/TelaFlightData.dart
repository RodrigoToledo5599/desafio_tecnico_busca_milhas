import 'package:desafio_tecnico_busca_milhas/Widgets/TelaFlightData/TelaFlightDataBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';
import 'package:desafio_tecnico_busca_milhas/Models/FlightModel.dart';




class SpaceBetweenRows extends StatelessWidget{
  double spacebetweenRows = 0.01;
  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * this.spacebetweenRows,
    );
  }
}

class RowSidePadding extends StatelessWidget{
  double sidePadding = 0.05;
  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: MediaQuery.sizeOf(context).height * this.sidePadding,
    );
  }
}


class TelaFlightData extends StatefulWidget{
  FlightModel Flight = FlightModel();

  TelaFlightData({
    Key? key,
    required this.Flight
  }) : super(key: key);
  TelaFlightDataState createState() => TelaFlightDataState();
}


class TelaFlightDataState extends State<TelaFlightData>{
  TextEditingController textController = TextEditingController();
  double fontsize = 15;

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
                child:Column(
                    children:[
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            RowSidePadding(),
                            Text(
                              "${widget.Flight.NumeroVoo}",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: this.fontsize,
                              ),
                            ),
                            RowSidePadding(),
                          ]
                      ),
                      SpaceBetweenRows(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            RowSidePadding(),
                            Text(
                              "Duração:  ${widget.Flight.Duracao}",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: this.fontsize,
                              ),
                            ),
                            RowSidePadding(),
                          ]
                      ),
                      SpaceBetweenRows(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            RowSidePadding(),
                            Text(
                              "Companhia: ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: this.fontsize,
                              ),
                            ),
                            Text(
                              "${widget.Flight.Companhia}",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: this.fontsize,
                              ),
                            ),

                          ]
                      ),
                      SpaceBetweenRows(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            RowSidePadding(),
                            Text(
                              "N° Conexões: ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: this.fontsize,
                              ),
                            ),
                            Text(
                              "${widget.Flight.NumeroConexoes}",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: this.fontsize,
                              ),
                            ),
                            RowSidePadding(),
                          ]
                      ),
                    ]
                ),
              )
        )
      ),
    );
  }
}