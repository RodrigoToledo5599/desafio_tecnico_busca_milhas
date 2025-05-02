import 'package:desafio_tecnico_busca_milhas/Widgets/CheckBoxStyle.dart';
import 'package:flutter/material.dart';

class SelectCompanhiaAerea extends StatefulWidget {
  final TextEditingController controller;

  SelectCompanhiaAerea({Key? key, required this.controller}) : super(key: key);

  @override
  SelectCompanhiaAereaState createState() => SelectCompanhiaAereaState();
}

class SelectCompanhiaAereaState extends State<SelectCompanhiaAerea> {
  final List<String> air_lines = [
    'AMERICAN AIRLINES',
    'GOL',
    'IBERIA',
    'INTERLINE',
    'LATAM',
    'AZUL',
    'TAP'
  ];
  Map<String, bool> selectedAirlines = {
    'AMERICAN AIRLINES': false,
    'GOL': false,
    'IBERIA': false,
    'INTERLINE': false,
    'LATAM': false,
    'AZUL': false,
    'TAP': false
  };

  void savingAirCompanies(){
    List<String> savedCompanies = [];
    for(String item in air_lines){
       if(selectedAirlines[item] == true){
         savedCompanies.add(item);
       }
    }
    widget.controller.text = savedCompanies.toString();
    print(widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width * 0.8,
      child:
      Column(
        children:[
          Column(
            children: air_lines.map((item) {
              return Row(
                children: [
                  Checkbox(
                    side: BorderSide(
                      color: CheckBoxStyle.getBorderSideColor(),
                      width: 2.0,
                    ),
                    checkColor: Colors.white,
                    value: this.selectedAirlines[item],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    onChanged: (bool? value) {
                      setState(() {
                        selectedAirlines[item] = !selectedAirlines[item]!;
                      });
                      this.savingAirCompanies();
                    },
                  ),
                  Text(
                    item,
                    style: const TextStyle(
                        color: Colors.blue
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ]
      ),

    );
  }
}
