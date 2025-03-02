import 'package:desafio_tecnico_busca_milhas/Widgets/CheckBoxStyle.dart';
import 'package:flutter/material.dart';

class SelectCompanhiaAerea extends StatefulWidget {
  final TextEditingController controller;

  SelectCompanhiaAerea({Key? key, required this.controller}) : super(key: key);

  @override
  SelectCompanhiaAereaState createState() => SelectCompanhiaAereaState();
}

class SelectCompanhiaAereaState extends State<SelectCompanhiaAerea> {
  final List<String> airlines = [
    'AMERICAN AIRLINES',
    'GOL',
    'IBERIA',
    'INTERLINE',
    'LATAM',
    'AZUL',
    'TAP'
  ];
  bool v = false;
  Map<String, bool> selectedAirlines = {
    'AMERICAN AIRLINES': false,
    'GOL': false,
    'IBERIA': false,
    'INTERLINE': false,
    'LATAM': false,
    'AZUL': false,
    'TAP': false
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: Column(
        children: airlines.map((item) {
          return Row(
            children: [
              Checkbox(
                side: BorderSide(
                  color: CheckBoxStyle.getBorderSideColor(),
                  width: 2.0,
                ),
                checkColor: Colors.white,
                // value: this.selectedAirlines[item],
                value: this.v,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                onChanged: (bool? value) {
                  print("100 ${item}  ${selectedAirlines[item]}");
                  setState(() {
                    // selectedAirlines[item] = value ?? false;
                  });
                },
              ),
              Text(
                item,
                style: TextStyle(color: Colors.white),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
