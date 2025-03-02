import 'package:desafio_tecnico_busca_milhas/Models/FlightModel.dart';
import 'package:desafio_tecnico_busca_milhas/Views/TelaFlightData.dart';
import 'package:desafio_tecnico_busca_milhas/Views/TelaInicial.dart';
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
    return
      ElevatedButton(
        onPressed: () =>{
          Navigator.push(
            context,
            MaterialPageRoute(
              // builder: (context) => TelaFlightData(Flight: widget.Flight)
              builder: (context) => TelaInicial()
            )
          )
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
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