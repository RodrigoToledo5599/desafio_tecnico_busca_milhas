import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class SelectTipoDeViagem extends StatefulWidget{
  TextEditingController controller = TextEditingController();
  SelectTipoDeViagem({
    Key? key,
    required this.controller,
  }) : super(key: key);
  SelectTipoDeViagemState createState() => SelectTipoDeViagemState();

}

class SelectTipoDeViagemState extends State<SelectTipoDeViagem>{

  final List<String> values = <String>['ida','idavolta'];
  String? msg = "tipo de viagem";
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



