import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';



class UpBar extends StatelessWidget implements PreferredSizeWidget{
  const UpBar({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return AppBar(
      actions: [
        Container(
          color: Color.fromRGBO(0, 0, 128, 1),
          width: MediaQuery.sizeOf(context).width * 1,
          child:
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Container(
                  child: Row(
                      children:[
                        SizedBox(width: MediaQuery.sizeOf(context).width * 0.075),
                        const Icon(
                          Icons.account_circle,
                          size: 40,
                          color: Colors.white,
                        ),
                        const Text(
                          " Account",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                          ),
                        ),
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
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}