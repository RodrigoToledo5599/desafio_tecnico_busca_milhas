import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/AirPortViewModel.dart';




class PesquisaAeroporto extends StatefulWidget{
  final TextEditingController controller;

  PesquisaAeroporto({
    Key? key,
    required this.controller
  }) : super(key: key);
  PesquisaAeroportoState createState() => PesquisaAeroportoState();
}

class PesquisaAeroportoState extends State<PesquisaAeroporto>{
  final _formKey = GlobalKey<FormState>();
  AirPortViewModel airPortVM = new AirPortViewModel();


  void search(String airport){

  }

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1,
        child: Column(
          children:[
            Text("Pesquisa Aeroporto"),
            Form(
              key: _formKey,
              child:
              Column(
                children:[
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        child:
                        TextFormField(
                          controller: widget.controller,
                          decoration: InputDecoration(
                            fillColor: Color.fromRGBO(245, 247, 249, 1),
                            filled: true,
                            hintText: '',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(245, 247, 249, 1),
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(245, 247, 249, 1),
                                width: 0.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: (){
                            setState((){

                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(245, 247, 249, 1),
                            side: BorderSide.none,
                            shadowColor: Colors.transparent,
                            // foregroundColor: Color.fromRGBO(0, 127, 255, 1),
                            padding: EdgeInsets.symmetric(horizontal: 9, vertical: 15),
                            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                              side:BorderSide(
                                color:Color.fromRGBO(245, 247, 249, 1),
                                width: 0.0,
                              ),
                              // borderRadius: BorderRadius.only(
                              // topLeft: Radius.circular(20),
                              // bottomLeft: Radius.circular(20),
                              // ),
                            ),
                          ),
                          child: Icon(
                              Icons.search
                          ),

                      )
                    ]
                  )
                ]
              )
            ),
          ]
        ),
      )
    );
  }
}



