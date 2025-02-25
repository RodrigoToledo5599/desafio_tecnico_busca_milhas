import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';





class SelectData extends StatefulWidget{
  final TextEditingController controller;

  SelectData({
    Key? key,
    required this.controller,
  }) : super(key: key);
  SelectDataState createState() => SelectDataState();

}

class SelectDataState extends State<SelectData>{
  final _formKey = GlobalKey<FormState>();
  DateTime today = DateTime.now();
  DateTime? selectedDate;
  DateTime? selectedTime;
  DateTime? selectedDateTime;

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.78,
          child: Column(
              children:[
                DateTimeField(
                  decoration: const InputDecoration(
                    // labelText: 'Escolha a data',
                    helperText: 'YYYY/MM/DD',
                  ),
                  value: selectedDate,
                  mode: DateTimeFieldPickerMode.date,
                  initialPickerDateTime: this.today,
                  onChanged: (DateTime? value) {
                    setState(() {
                      selectedDate = value;
                      print(selectedDate);
                      if(selectedDate != null || selectedDate != ""){
                        widget.controller.text = selectedDate!.toString();
                      }
                    });
                  },
                ),
              ]
          ),
        )
    );
  }
}



