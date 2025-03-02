import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';
import 'package:desafio_tecnico_busca_milhas/Models/FlightModel.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/SelectCompanhiaAerea.dart';



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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: UpBar(),
        body:SingleChildScrollView(
            child: Container(
                width: MediaQuery.sizeOf(context).width * 1,
                child:Column(
                    children:[

                    ]
                )
            )
        ),
      ),
    );
  }
}