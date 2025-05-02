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
  bool switch_value = true;
  String ida_ou_idavolta = "IdaVolta";
  String? msg = "Tipo de viagem";


  void TipoDeViagemChange(){
    if(switch_value == true){
      setState(() {
        this.ida_ou_idavolta = "IdaVolta";
        widget.controller.text = this.ida_ou_idavolta;
      });
    }
    if(switch_value == false){
      setState(() {
        this.ida_ou_idavolta = "Ida";
        widget.controller.text = this.ida_ou_idavolta;;
      });
    }
  }

  void initState() {
    super.initState();
    widget.controller.text = "IdaVolta";
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
                      value: this.switch_value,
                      activeColor: Colors.blue,
                      onChanged: (bool value) {
                        setState(() {
                          this.switch_value = value;
                          TipoDeViagemChange();
                        });
                      },
                    ),
                    Text(
                      "${this.ida_ou_idavolta}",
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



