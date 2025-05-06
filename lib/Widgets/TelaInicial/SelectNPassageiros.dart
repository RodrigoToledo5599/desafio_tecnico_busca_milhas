import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class SelectNPassageiros extends StatefulWidget{
  
  TextEditingController adultos_controller = TextEditingController();
  TextEditingController criancas_controller = TextEditingController();
  TextEditingController bebes_controller = TextEditingController();

  SelectNPassageiros({
    required this.adultos_controller,
    required this.bebes_controller,
    required this.criancas_controller,
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
                              color: Color.fromRGBO(0, 0, 128, 1)
                          ),
                      ),
                      Container(
                        child: TextFormField(
                            controller: widget.adultos_controller,
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
                              color: Color.fromRGBO(0, 0, 128, 1)
                          ),
                      ),
                      Container(
                          child: TextFormField(
                            controller: widget.criancas_controller,
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
                              color: Color.fromRGBO(0, 0, 128, 1)
                          ),
                      ),
                      Container(
                          child: TextFormField(
                            controller: widget.bebes_controller,
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



