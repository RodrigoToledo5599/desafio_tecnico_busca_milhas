import 'package:desafio_tecnico_busca_milhas/DTO/FlightConnectionDTO.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class ConexaoRow extends StatelessWidget{
  String text;
  String fieldName;
  ConexaoRow({
    Key? key,
    required this.fieldName,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
        Text(
          "${fieldName}: ",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        Text(
          "${text}",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ]
    );
  }
}


class Conexoes extends StatefulWidget {

  List<FlightConnectionDTO> conexoes;

  Conexoes({
    Key? key,
    required this.conexoes
  }) : super(key: key);


  ConexoesState createState() => ConexoesState();
}


class ConexoesState extends State<Conexoes>{

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
      child:Column(
        children:[
          Row(
            children:[
              Text(
                "Conexoes",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ]
          ),
          for(var item in widget.conexoes)
            Column(
              children:[
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          ConexaoRow(text: item.Origem,fieldName: "Origem"),
                          ConexaoRow(text: item.Destino,fieldName: "Destino"),
                          ConexaoRow(text: item.NumeroVoo,fieldName: "NumeroVoo"),
                          ConexaoRow(text: item.Duracao,fieldName: "Duracao"),
                          ConexaoRow(text: item.DataDesembarque,fieldName: "DataDesembarque"),
                          ConexaoRow(text: item.Desembarque,fieldName: "Desembarque"),
                          ConexaoRow(text: item.DesembarqueCompleto,fieldName: "DesembarqueCompleto"),
                          ConexaoRow(text: item.DataEmbarque,fieldName: "DataEmbarque"),
                          ConexaoRow(text: item.Embarque,fieldName: "Embarque"),
                          ConexaoRow(text: item.EmbarqueCompleto,fieldName: "EmbarqueCompleto"),
                        ]
                    )
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              ]
            ),
        ]
      )
    );
  }
}