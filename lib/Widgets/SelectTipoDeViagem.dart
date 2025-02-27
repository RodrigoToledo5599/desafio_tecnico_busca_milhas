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
  final List<String> values = <String>['Ida','IdaVolta'];
  String? msg = "Tipo de viagem";
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.6,
          child: Row(
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



