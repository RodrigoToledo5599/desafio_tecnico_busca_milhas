import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafio_tecnico_busca_milhas/Views/TelaInicial.dart';



class ResultadosBottomBar extends StatelessWidget {
  ResultadosBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.1,
      color: Colors.blue,
      child: Row(
        children:[
          IconButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TelaInicial()
                    )
                )
              },
              icon: Icon(
                Icons.keyboard_return,
                color: Colors.white,
                size: 40,
              )

          )
        ]
      ),
    );
  }


}


