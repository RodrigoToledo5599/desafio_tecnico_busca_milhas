import 'package:flutter/cupertino.dart';




class SelectData extends StatefulWidget{
  SelectData({Key? key}) : super(key: key);
  SelectDataState createState() => SelectDataState();

}

class SelectDataState extends State<SelectData>{

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: Container(
          child: Column(
              children:[
                Text("Select Data"),
              ]
          ),
        )
    );
  }
}



