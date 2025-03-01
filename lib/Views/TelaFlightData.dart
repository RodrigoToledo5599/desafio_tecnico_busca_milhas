import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';
import 'package:desafio_tecnico_busca_milhas/Models/FlightModel.dart';



class TelaFlightData extends StatefulWidget{
  FlightModel Flight = FlightModel();

  TelaFlightData({
    Key? key,
    required this.Flight
  }) : super(key: key);
  TelaFlightDataState createState() => TelaFlightDataState();
}


class TelaFlightDataState extends State<TelaFlightData>{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child:Column(
          children:[

          ]
        )
      )
    );
  }
}