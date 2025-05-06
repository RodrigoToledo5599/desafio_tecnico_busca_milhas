import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/AirPortViewModel.dart';
import 'package:desafio_tecnico_busca_milhas/Models/AirPortModel.dart';




class PesquisaAeroporto extends StatefulWidget{
  final TextEditingController? controller;
  final label_text;
  PesquisaAeroporto({
    Key? key,
    required this.controller,
    required this.label_text,
  }) : super(key: key);
  PesquisaAeroportoState createState() => PesquisaAeroportoState();
}

class PesquisaAeroportoState extends State<PesquisaAeroporto>{
  final _formKey = GlobalKey<FormState>();
  bool is_loading = false;
  AirPortViewModel airPortVM = new AirPortViewModel();
  List<AirPortModel> airPorts = [];


  void search(String airport) async {
    setState(() {
      is_loading = true;
    });
    List<AirPortModel> temporary = await this.airPortVM.getAirports(airport);
    setState(() {
      is_loading = false;
      this.airPorts = temporary;
    });
  }

  @override
  Widget build(BuildContext context){
    return  Container(
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
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              child:
                              TextFormField(
                                controller: widget.controller,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelText: widget.label_text,
                                  fillColor: const Color.fromRGBO(245, 247, 249, 1),
                                  filled: true,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:  BorderSide(
                                      color:  Color.fromRGBO(245, 247, 249, 1),
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
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
                                search(widget.controller!.text.toUpperCase());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                                side: BorderSide.none,
                                shadowColor: Colors.transparent,
                                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color:Color.fromRGBO(255, 255, 255, 1),
                                    width: 0.0,
                                  ),
                                ),
                              ),
                              child: const Icon(
                                Icons.search,
                                color: Color.fromRGBO(0, 0, 128, 1),
                                size: 25,
                              ),
                            ),
                            ElevatedButton(
                              onPressed:(){
                                setState(() {
                                  widget.controller!.text = "";
                                  this.airPorts = [];
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                                side: BorderSide.none,
                                shadowColor: Colors.transparent,
                                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                shape: const RoundedRectangleBorder(
                                  side:BorderSide(
                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                    width: 0.0,
                                  ),
                                ),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Color.fromRGBO(0, 0, 128, 1),
                                size: 25,
                              ),
                            ),
                          ]
                      ),
                      // const SizedBox(height:20),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: this.is_loading ?
                        const Center(child: CircularProgressIndicator())
                          :
                        airPorts.isNotEmpty
                            ?
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.3,
                          child: ListView.builder(
                            itemCount: airPorts.length,
                            itemBuilder: (context, index) {
                              final airport = airPorts[index];
                              return ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    airPorts = [];
                                    widget.controller!.text = airport.Iata.toString();
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.transparent,
                                  overlayColor: Colors.transparent,
                                ),
                                child:
                                Row(
                                  children:[
                                    Container(
                                      child:
                                        Text(
                                          "${airport.Nome} - ${airport.Iata}\n",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          softWrap: false,
                                          style: const TextStyle(
                                            color: Color.fromRGBO(0, 0, 128, 1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                    ),
                                  ]
                                )
                              );
                            },
                          ),
                        )
                            : const Center(child: Text("")),
                      )
                    ]
                )
            ),
          ]
      ),
    );
  }
}



