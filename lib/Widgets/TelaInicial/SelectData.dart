import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';




class SelectData extends StatefulWidget{
  final TextEditingController Datacontroller;
  final TextEditingController Horascontroller;

  SelectData({
    Key? key,
    required this.Datacontroller,
    required this.Horascontroller,
  }) : super(key: key);
  SelectDataState createState() => SelectDataState();

}

class SelectDataState extends State<SelectData>{
  TimeOfDay time = TimeOfDay(hour: 12, minute: 00);
  final _formKey = GlobalKey<FormState>();
  DateTime today = DateTime.now();
  DateTime? selectedDate;
  DateTime? selectedTime;
  DateTime? selectedDateTime;

  @override
  Widget build(BuildContext context){
    return Container(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Column(
              children:[
                DateTimeField(
                  value: selectedDate,
                  dateFormat: DateFormat("dd/MM/yyyy"),
                  mode: DateTimeFieldPickerMode.date,
                  initialPickerDateTime: this.today,
                  onChanged: (DateTime? value) {
                    setState(() {
                      selectedDate = value!;
                      if(selectedDate != null || selectedDate != ""){
                        widget.Datacontroller.text = DateFormat.yMd().format(selectedDate!);
                      }
                    });
                  },
                ),
                SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Container(
                          width: 76,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(
                              width: 3,
                              color: Colors.blue,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child:Align(
                            alignment: Alignment.center,
                            child: Text(
                                "${time.hour}:${time.minute}",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: Colors.blue
                              ),
                            ),
                          )
                      ),
                      IconButton(
                          onPressed: () async {
                            TimeOfDay? newTime = await showTimePicker(
                                context: context,
                                initialTime: time
                            );
                            setState(() {
                              time = newTime!;
                              widget.Horascontroller.text = "${newTime.hour}:${newTime.minute}";
                            });
                          },
                          icon: Icon(
                              Icons.alarm,
                              color: Colors.blue,
                              size: 40,
                          )
                      )
                    ]
                ),
                SizedBox(height:40),
              ]
          ),
        );
  }
}



