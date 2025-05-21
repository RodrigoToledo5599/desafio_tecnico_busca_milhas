import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';




class UpBar extends StatefulWidget implements PreferredSizeWidget{
  String? name;
  UpBar({
    required this.name,
    Key? key
  }) : super(key: key);

  UpBarState createState() => UpBarState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
   


class UpBarState extends State<UpBar>{

  @override
  Widget build (BuildContext context){
    return AppBar(
      actions: [
        Container(
          color: Color.fromRGBO(0, 0, 128, 1),
          width: MediaQuery.sizeOf(context).width * 1,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Container(
                  child: Row(
                      children:[
                        Padding(
                          padding: EdgeInsets.fromLTRB(MediaQuery.sizeOf(context).width * 0.075, 0, 0, 0),
                          child: Text(
                            "${widget.name}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 24
                            ),
                          ),
                        )
                      ]
                  ),
                  color:  Color.fromRGBO(0, 0, 128, 1),
                ),
                Container(
                    color: Color.fromRGBO(0, 0, 128, 1),
                    child:
                      Row(
                        children:[
                          Text(
                            "",
                          ),
                          SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.075,
                          ),
                        ]
                      )
                ),
              ]
          ),
        ),
      ],
      backgroundColor: Color.fromRGBO(0, 0, 128, 1),
    );
  }
}
