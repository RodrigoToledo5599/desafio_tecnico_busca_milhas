import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class SingleFlightData extends StatefulWidget{
  SingleFlightData({Key? key}) : super(key: key);
  SingleFlightDataState createState() => SingleFlightDataState();
}


class SingleFlightDataState extends State<SingleFlightData>{


  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,

      ),
    );
  }

}