import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/SelectData.dart';


class SelectDataETipoDeViagem extends StatefulWidget{
  final TextEditingController DataControllerIda;
  final TextEditingController HorarioControllerIda;
  final TextEditingController DataControllerVolta;
  final TextEditingController HorarioControllerVolta;
  final TextEditingController TipoDeViagemController;

  SelectDataETipoDeViagem({
    Key? key,
    required this.TipoDeViagemController,
    required this.DataControllerIda,
    required this.HorarioControllerIda,
    required this.DataControllerVolta,
    required this.HorarioControllerVolta,
  }) : super(key: key);


  SelectDataETipoDeViagemState createState() => SelectDataETipoDeViagemState();
}


class SelectDataETipoDeViagemState extends State<SelectDataETipoDeViagem>{
  final List<String> values = <String>['Ida','IdaVolta'];
  bool switchValue = true;
  String IdaOuIdaVolta = "IdaVolta";
  String? msg = "Tipo de viagem";


  void TipoDeViagemChange(){
    if(switchValue == true){
      setState(() {
        this.IdaOuIdaVolta = "IdaVolta";
        widget.TipoDeViagemController.text = this.IdaOuIdaVolta;
        widget.DataControllerVolta.text = "";
        widget.HorarioControllerVolta.text = "";
      });
    }
    if(switchValue == false){
      setState(() {
        this.IdaOuIdaVolta = "Ida";
        widget.TipoDeViagemController.text = this.IdaOuIdaVolta;
        widget.DataControllerVolta.text = "";
        widget.HorarioControllerVolta.text = "";
      });
    }
  }

  void initState() {
    super.initState();
    widget.TipoDeViagemController.text = "IdaVolta";
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
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
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
                        ]
                      ),
                      SizedBox(height: 50),
                      Row(
                          children:[
                            SizedBox(width: MediaQuery.sizeOf(context).width * 0.1),
                            Text(
                              "Ida",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue
                              ),
                            ),
                          ]
                      ),
                      SelectData(
                        Datacontroller: widget.DataControllerIda,
                        Horascontroller: widget.HorarioControllerIda,
                      ),
                      SizedBox(height: 20),
                      if(this.IdaOuIdaVolta == "IdaVolta")
                        Column(
                          children:[
                            Row(
                                children:[
                                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.1),
                                  Text(
                                    "Volta",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue
                                    ),
                                  ),
                                ]
                            ),
                            SelectData(
                              Datacontroller: widget.DataControllerVolta,
                              Horascontroller: widget.HorarioControllerVolta,
                            )
                          ]
                        )
                    ]
                ),
              ]
          ),
        )
    );
  }

}