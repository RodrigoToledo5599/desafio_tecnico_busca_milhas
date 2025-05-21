import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';



class LoginAppBar extends StatelessWidget implements PreferredSizeWidget{
  const LoginAppBar({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return AppBar(
      actions:[
        Container(
          color: const Color.fromRGBO(0, 0, 128, 1),
          width: MediaQuery.sizeOf(context).width * 1,
        ),
      ],
      backgroundColor: const Color.fromRGBO(0, 0, 128, 1),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}