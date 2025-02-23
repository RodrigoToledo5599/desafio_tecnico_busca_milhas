import 'package:flutter/cupertino.dart';




class SelectNPassageiros extends StatefulWidget{
  SelectNPassageiros({Key? key}) : super(key: key);
  SelectNPassageirosState createState() => SelectNPassageirosState();

}

class SelectNPassageirosState extends State<SelectNPassageiros>{

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: Container(
          child: Column(
              children:[
                Text("Select Número de Passageiros"),
              ]
          ),
        )
    );
  }
}



