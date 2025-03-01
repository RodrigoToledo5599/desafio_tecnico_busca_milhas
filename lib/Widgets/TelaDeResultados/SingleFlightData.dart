import 'package:desafio_tecnico_busca_milhas/Models/FlightModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class SingleFlightData extends StatefulWidget{
  FlightModel Flight = FlightModel();
  SingleFlightData({
    Key? key,
    required this.Flight,
  }) : super(key: key);
  SingleFlightDataState createState() => SingleFlightDataState();
}


class SingleFlightDataState extends State<SingleFlightData>{


  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child:Column(
          children:[
            Text("${widget.Flight.NumeroVoo}  -  ${widget.Flight.NumeroConexoes}"),
          ]
        )
      ),
    );
  }

}