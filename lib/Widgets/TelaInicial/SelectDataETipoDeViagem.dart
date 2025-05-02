import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/SelectData.dart';


class SelectDataETipoDeViagem extends StatefulWidget{
  final TextEditingController data_controller_ida;
  final TextEditingController horario_controller_ida;
  final TextEditingController data_controller_volta;
  final TextEditingController horario_controller_volta;
  final TextEditingController tipo_de_viagem_controller;

  SelectDataETipoDeViagem({
    Key? key,
    required this.tipo_de_viagem_controller,
    required this.data_controller_ida,
    required this.horario_controller_ida,
    required this.data_controller_volta,
    required this.horario_controller_volta,
  }) : super(key: key);


  SelectDataETipoDeViagemState createState() => SelectDataETipoDeViagemState();
}


class SelectDataETipoDeViagemState extends State<SelectDataETipoDeViagem>{
  final List<String> values = <String>['Ida','IdaVolta'];
  bool switch_value = true;
  String ida_ou_ida_volta = "IdaVolta";
  String? msg = "Tipo de viagem";


  void TipoDeViagemChange(){
    if(switch_value == true){
      setState(() {
        this.ida_ou_ida_volta = "IdaVolta";
        widget.tipo_de_viagem_controller.text = this.ida_ou_ida_volta;
        widget.data_controller_volta.text = "";
        widget.horario_controller_volta.text = "";
      });
    }
    if(switch_value == false){
      setState(() {
        this.ida_ou_ida_volta = "Ida";
        widget.tipo_de_viagem_controller.text = this.ida_ou_ida_volta;
        widget.data_controller_volta.text = "";
        widget.horario_controller_volta.text = "";
      });
    }
  }

  void initState() {
    super.initState();
    widget.tipo_de_viagem_controller.text = "IdaVolta";
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
                            "${this.ida_ou_ida_volta}",
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
                        data_controller: widget.data_controller_ida,
                        horas_controller: widget.horario_controller_ida,
                      ),
                      SizedBox(height: 20),
                      if(this.ida_ou_ida_volta == "IdaVolta")
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
                              data_controller: widget.data_controller_volta,
                              horas_controller: widget.horario_controller_volta,
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