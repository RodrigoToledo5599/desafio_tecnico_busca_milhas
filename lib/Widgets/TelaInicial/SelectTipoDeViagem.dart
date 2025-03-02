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
  bool switchValue = true;
  String IdaOuIdaVolta = "IdaVolta";
  String? msg = "Tipo de viagem";


  void TipoDeViagemChange(){
    if(switchValue == true){
      setState(() {
        this.IdaOuIdaVolta = "IdaVolta";
        widget.controller.text = this.IdaOuIdaVolta;
      });
    }
    if(switchValue == false){
      setState(() {
        this.IdaOuIdaVolta = "Ida";
        widget.controller.text = this.IdaOuIdaVolta;;
      });
    }
  }



  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Column(
            children:[
              Row(
                children: [
                  Text(
                    "Tipo De Viagem",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 15
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Switch(
                      value: this.switchValue,
                      activeColor: Colors.blue,
                      onChanged: (bool value) {
                        setState(() {
                          this.switchValue = value;
                          TipoDeViagemChange();
                        });
                      },
                    ),
                    Text(
                      "${this.IdaOuIdaVolta}",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                      ),
                    ),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),

                  ]
              ),
            ]
          ),
        )
    );
  }
}



