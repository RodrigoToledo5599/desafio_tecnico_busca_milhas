import 'package:desafio_tecnico_busca_milhas/Views/User/TelaLogin.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';





class UpBar extends StatefulWidget implements PreferredSizeWidget{
  String? name;
  SessionData sd;
  UpBar({
    required this.sd,
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
              child: Padding (
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.sizeOf(context).width * 0.075,
                      0,
                      MediaQuery.sizeOf(context).width * 0.075,
                      0
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text("Olá, ${widget.name}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 24
                          ),
                        ),
                        IconButton(
                          iconSize: 35,
                          color: Colors.white,
                          icon: Icon(
                              Icons.account_circle,
                          ),
                          // SvgPicture.asset('lib/assets/imgs/switch-user-svgrepo-com.svg'),
                          onPressed: () async {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => TelaLogin(sd: this.widget.sd)),
                            );
                          },
                        ),
                      ]
                  )
              ),
          )
        ],
      backgroundColor: Color.fromRGBO(0, 0, 128, 1),
    );
  }
}
