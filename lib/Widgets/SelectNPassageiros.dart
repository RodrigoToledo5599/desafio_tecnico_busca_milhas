import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class SelectNPassageiros extends StatefulWidget{
  
  TextEditingController adultosController = TextEditingController();
  TextEditingController criancasController = TextEditingController();
  TextEditingController bebesController = TextEditingController();

  SelectNPassageiros({
    required this.adultosController,
    required this.bebesController,
    required this.criancasController,
    Key? key,
    }) : super(key: key);
  SelectNPassageirosState createState() => SelectNPassageirosState();

}

class SelectNPassageirosState extends State<SelectNPassageiros>{
  String msgAdulto = "N° de adultos: 0";
  String msgCrianca = "N° de crianças: 0";
  String msgBebe = "N° de bebes: 0";
  String warningMsg = "";

  List<int> values = [0,1,2,3,4,5,6,7,8,9,10];


  void assuringThereAreMoreAdultsThanBabies(){
    int Nbabies = int.parse(widget.bebesController.text);
    int NAdults = int.parse(widget.adultosController.text);
    if(NAdults < Nbabies){
      setState((){
        warningMsg = "não é possível ter mais bebes do que adultos";
        widget.bebesController.text = (NAdults - 1).toString();
        msgBebe = "N° de bebes ${NAdults}";   
      });
    }

  }

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
        child: SingleChildScrollView(
          child: Column(
              children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("N° de Adultos: "),
                      Container(
                        child: TextFormField(
                            controller: widget.adultosController,
                            decoration:
                            InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                        ),
                          width: MediaQuery.of(context).size.width * 0.15
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("N° de Crianças: "),
                      Container(
                          child: TextFormField(
                            controller: widget.criancasController,
                            decoration:
                            InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          width: MediaQuery.of(context).size.width * 0.15
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("N° de bebes: "),
                      Container(
                          child: TextFormField(
                            controller: widget.bebesController,
                            decoration:
                            InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          width: MediaQuery.of(context).size.width * 0.15
                      )
                    ],
                  ),
                  Text("${warningMsg}"),
              ]
          ),
        )
    );
  }
}



