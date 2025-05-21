import 'package:desafio_tecnico_busca_milhas/Models/FlightModel.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';
import 'package:desafio_tecnico_busca_milhas/Views/TelaFlightData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class SingleFlightData extends StatefulWidget{
  FlightModel Flight = FlightModel();
  SessionData sd;
  SingleFlightData({
    Key? key,
    required this.sd,
    required this.Flight,
  }) : super(key: key);
  SingleFlightDataState createState() => SingleFlightDataState();
}


class SingleFlightDataState extends State<SingleFlightData>{
  @override
  Widget build(BuildContext context){
    return
      ElevatedButton(
        onPressed: () =>{
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TelaFlightData(sd:this.widget.sd ,Flight: widget.Flight)
            )
          )
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          overlayColor:Colors.transparent,
        ),
        child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 128, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            width: MediaQuery.sizeOf(context).width * 0.8,
            padding: const EdgeInsets.all(12.0),
            child: Column(
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text(
                          "${widget.Flight.NumeroVoo}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Conexões: ${widget.Flight.NumeroConexoes}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text(
                          "Duração: ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${widget.Flight.Duracao}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text(
                          "Companhia: ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${widget.Flight.Companhia}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ]
                  ),
                ]
            )
        ),
      );
  }
}