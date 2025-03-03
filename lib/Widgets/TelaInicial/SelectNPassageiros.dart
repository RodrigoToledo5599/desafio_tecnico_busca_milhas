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

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
        child: SingleChildScrollView(
          child: Column(
              children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Número de Adultos: ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue
                          ),
                      ),
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Número de Crianças: ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue
                          ),
                      ),
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Número de Bebes: ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue
                          ),
                      ),
                      Container(
                          child: TextFormField(
                            controller: widget.bebesController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          width: MediaQuery.of(context).size.width * 0.15
                      )
                    ],
                  ),
              ]
          ),
        )
    );
  }
}



