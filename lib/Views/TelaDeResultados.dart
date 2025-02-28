import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';
import 'package:desafio_tecnico_busca_milhas/Views/TelaInicial.dart';




class TelaDeResultados extends StatefulWidget{

  TelaDeResultados({Key? key}) : super(key: key);
  TelaDeResultadosState createState() => TelaDeResultadosState();
}

class TelaDeResultadosState extends State<TelaDeResultados>{



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: UpBar(),
        body: Container(
          color: Color.fromRGBO(255, 255, 255,1),
          width: MediaQuery.sizeOf(context).width * 1,
          height: MediaQuery.sizeOf(context).height * 1,
          child: SingleChildScrollView(
            child:Column(
              children:[
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaInicial()
                          )
                      );
                    },
                    child: Text("Voltar")
                ),
              ]
            )
          )
        )
      )
    );
  }

}