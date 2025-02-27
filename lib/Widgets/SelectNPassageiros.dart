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
        child: SingleChildScrollView(
          child: Column(
              children:[
                DropdownButton<int>(
                  hint: Text("${msgAdulto}"),
                  items: values.map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      widget.adultosController.text = value.toString();
                      msgAdulto = "N° de adultos: "+value.toString();
                      // assuringThereAreMoreAdultsThanBabies();
                    });
                  },
                ),
                DropdownButton<int>(
                  hint: Text("${msgCrianca}"),
                  items: values.map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      widget.criancasController.text = value.toString();
                      msgCrianca = "N° de crianças: "+value.toString();
                    });
                  },
                ),
                DropdownButton<int>(
                  hint: Text("${msgBebe}"),
                  items: values.map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      widget.bebesController.text = value.toString();
                      msgBebe = "N° de bebes: "+value.toString();
                      assuringThereAreMoreAdultsThanBabies();
                    });
                  },
                ),
                Text("${warningMsg}"),
              ]
          ),
        )
    );
  }
}



