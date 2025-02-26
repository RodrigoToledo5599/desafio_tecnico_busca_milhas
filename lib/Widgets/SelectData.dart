import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
// import 'package:duration_picker/duration_picker.dart';
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
                  dateFormat: DateFormat.yMd(),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            color: Colors.blue,
                            border: Border.all(
                              width: 0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child:Align(
                            alignment: Alignment.center,
                            child: Text(
                                "${time.hour}",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                            ),
                          )
                      ),
                      Text(
                          ":",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue
                          ),
                      ),
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            color: Colors.blue,
                            border: Border.all(
                              width: 0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child:Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${time.minute}",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                          )
                      ),
                      ElevatedButton(
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
                          child: Text("Pick Time")
                      )
                    ]
                ),
                SizedBox(height:40),
              ]
          ),
        );
  }
}



