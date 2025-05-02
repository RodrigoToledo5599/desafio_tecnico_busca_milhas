import 'package:desafio_tecnico_busca_milhas/DTO/FlightConnectionDTO.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class ConexaoRow extends StatelessWidget{
  String text;
  String field_name;
  ConexaoRow({
    Key? key,
    required this.field_name,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
        Text(
          "${field_name}: ",
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        Text(
          "${text}",
          style: const TextStyle(
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
              const Text(
                "Conexões",
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
                          ConexaoRow(text: item.Origem,field_name: "Origem"),
                          ConexaoRow(text: item.Destino,field_name: "Destino"),
                          ConexaoRow(text: item.NumeroVoo,field_name: "NumeroVoo"),
                          ConexaoRow(text: item.Duracao,field_name: "Duracao"),
                          ConexaoRow(text: item.DataDesembarque,field_name: "DataDesembarque"),
                          ConexaoRow(text: item.Desembarque,field_name: "Desembarque"),
                          ConexaoRow(text: item.DesembarqueCompleto,field_name: "DesembarqueCompleto"),
                          ConexaoRow(text: item.DataEmbarque,field_name: "DataEmbarque"),
                          ConexaoRow(text: item.Embarque,field_name: "Embarque"),
                          ConexaoRow(text: item.EmbarqueCompleto,field_name: "EmbarqueCompleto"),
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