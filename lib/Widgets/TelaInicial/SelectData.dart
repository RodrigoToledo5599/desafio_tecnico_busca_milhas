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
  String minutesShowing = "00";
  String hoursShowing = "00";
  TimeOfDay time = TimeOfDay(hour: 12, minute: 0);
  final _formKey = GlobalKey<FormState>();
  DateTime today = DateTime.now();
  DateTime? selectedDate;
  DateTime? selectedTime;
  DateTime? selectedDateTime;


  void convertToHoursFormat(){
    if(time.hour < 10){
      setState(() {
        this.hoursShowing = "0"+ time.hour.toString();
        this.minutesShowing = "0"+ time.minute.toString();
      });
    }
    if(time.minute < 10) {
      setState(() {
        this.minutesShowing = "0" + time.minute.toString();
      });
    }
    if(time.hour >= 10){
      setState(() {
        this.hoursShowing = time.hour.toString();
      });
    }
    if(time.minute >= 10){
      setState(() {
        this.minutesShowing = time.minute.toString();
      });
    }
  }

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
                        String day = value.day.toString();
                        String month = value.month.toString();
                        String year = value.year.toString();
                        widget.Datacontroller.text = "${day}/${month}/${year}";
                      }
                    });
                  },
                ),
                SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Container(
                          width: 82,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(
                              width: 2,
                              color: Colors.blue,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child:Align(
                            alignment: Alignment.center,
                            child: Text(
                                "${hoursShowing}:${minutesShowing}",
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
                            this.convertToHoursFormat();
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



