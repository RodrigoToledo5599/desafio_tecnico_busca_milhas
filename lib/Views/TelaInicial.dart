import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/PesquisaAeroporto.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/SelectData.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/SelectNPassageiros.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/SelectTipoDeViagem.dart';


class TelaInicial extends StatefulWidget{
  TelaInicial({Key? key}) : super(key: key);
  TelaInicialState createState() => TelaInicialState();
}

class TelaInicialState extends State<TelaInicial> {
  TextEditingController AeroportoController = TextEditingController();
  TextEditingController CompanhiaAereaController = TextEditingController();
  TextEditingController DataController = TextEditingController();
  TextEditingController NPassageirosController = TextEditingController();
  TextEditingController TipoDeViagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:UpBar(),
        body:Container(
          color: Color.fromRGBO(255, 255, 255,1),
          width:  MediaQuery.sizeOf(context).width * 1,
          height: MediaQuery.sizeOf(context).height * 1,
          child: SingleChildScrollView(
            child:Column(
                children:[
                  PesquisaAeroporto(controller: AeroportoController),
                  // SelectCompanhiaAerea(),
                  // SelectData(),
                  // SelectNPassageiros(),
                  // SelectTipoDeViagem()
                ]
            )
          ),
        )
      )
    );
  }


}