import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';





class SelectCompanhiaAerea extends StatefulWidget{
  TextEditingController controller = TextEditingController();

  SelectCompanhiaAerea({
    Key? key,
    required this.controller,
  }) : super(key: key);
  SelectCompanhiaAereaState createState() => SelectCompanhiaAereaState();

}

class SelectCompanhiaAereaState extends State<SelectCompanhiaAerea>{
  final List<String> values = <String>['AMERICAN AIRLINES', 'GOL', 'IBERIA', 'INTERLINE', 'LATAM', 'AZUL', 'TAP'];
  String? msg = "Escolha aqui";
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: Container(
          child: Column(
              children:[
                DropdownButton<String>(
                  hint: Text("${msg}"),
                  items: values.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      widget.controller.text = value!;
                      msg = value;
                    });
                  },
                )
              ]
          ),
        )
    );
  }
}



