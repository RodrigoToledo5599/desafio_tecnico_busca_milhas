import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';
import 'package:desafio_tecnico_busca_milhas/Views/User/TelaLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';



class CriarusUsuarioAppBar extends StatelessWidget implements PreferredSizeWidget{
  SessionData sd;
  CriarusUsuarioAppBar({
    required this.sd,
    Key? key
  }) : super(key: key);

  @override
  Widget build (BuildContext context){
    return AppBar(
      actions:[
        Container(
          height: MediaQuery.sizeOf(context).height * 0.1,
          width: MediaQuery.sizeOf(context).width * 1,
          color: Color.fromRGBO(0, 0, 128, 1),
          child:
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  IconButton(
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TelaLogin(sd: this.sd)
                            )
                        )
                      },
                      icon: const Icon(
                        Icons.keyboard_return,
                        color: Colors.white,
                        size: 45,
                      )
                  )
                ]
            ),
        )
      ],
      backgroundColor: const Color.fromRGBO(0, 0, 128, 1),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}