import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/AirPortViewModel.dart';
import 'package:desafio_tecnico_busca_milhas/Models/AirPortModel.dart';




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
  List<AirPortModel> airPorts = [];
     

  void search(String airport) async {
    // print(airport);
    // print("aokpowsokwowokwo");
    List<AirPortModel> temporary = await this.airPortVM.getAirports(airport);
    setState(() {
      this.airPorts = temporary;
    });
  }

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1,
        child: Column(
          children:[
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
                          onPressed:(){
                            search(widget.controller.text);
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
                            ),
                          ),
                          child: Icon(
                              Icons.search
                          ),
                      ),
                    ]
                  ),
                  SizedBox(
                    height:20
                  ),
                  Container(
                      child:FutureBuilder<List<AirPortModel>?>(
                          future: Future.value(this.airPorts),
                          builder: (context, snapshot){
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator()); // Show loading spinner
                            }
                            if (snapshot.hasError) {
                              return Center(child: Text("Error loading Airports"));
                            }
                            if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return Center(child: Text(""));
                            }
                            this.airPorts = snapshot.data!;
                            return Container(
                              // color: Colors.purple,
                              height: MediaQuery.sizeOf(context).height * 0.3,
                              width: MediaQuery.sizeOf(context).width * 0.75,
                              child:SingleChildScrollView(
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: this.airPorts.map((airport){
                                    return Text(
                                        "${airport.Nome} - ${airport.Iata}\n",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: false,
                                        style: TextStyle(
                                            fontSize: 12
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          }
                      )
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



