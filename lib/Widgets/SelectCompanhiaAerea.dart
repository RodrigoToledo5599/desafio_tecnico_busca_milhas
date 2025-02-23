import 'package:flutter/cupertino.dart';




class SelectCompanhiaAerea extends StatefulWidget{
  SelectCompanhiaAerea({Key? key}) : super(key: key);
  SelectCompanhiaAereaState createState() => SelectCompanhiaAereaState();

}

class SelectCompanhiaAereaState extends State<SelectCompanhiaAerea>{

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: Container(
          child: Column(
              children:[
                Text("Select Companhia Aérea"),
              ]
          ),
        )
    );
  }
}



