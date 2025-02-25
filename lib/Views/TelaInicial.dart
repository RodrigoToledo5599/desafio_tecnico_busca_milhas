import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/PesquisaAeroporto.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/SelectCompanhiaAerea.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/SelectData.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/SelectNPassageiros.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/SelectTipoDeViagem.dart';


class TelaInicial extends StatefulWidget{
  TelaInicial({Key? key}) : super(key: key);
  TelaInicialState createState() => TelaInicialState();
}

class TelaInicialState extends State<TelaInicial> {
  TextEditingController AeroportoControllerOrigem = TextEditingController();
  TextEditingController AeroportoControllerDestino = TextEditingController();
  TextEditingController DataControllerIda = TextEditingController();
  TextEditingController DataControllerVolta = TextEditingController();
  TextEditingController CompanhiaAereaController = TextEditingController();
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
                  Row(
                    children:[
                      SizedBox(width: MediaQuery.sizeOf(context).width * 0.11),
                      Text("Origem"),
                    ]
                  ),
                  SizedBox(height: 20),
                  PesquisaAeroporto(controller: AeroportoControllerOrigem),
                  Row(
                      children:[
                        SizedBox(width: MediaQuery.sizeOf(context).width * 0.11),
                        Text("Destino"),
                      ]
                  ),
                  SizedBox(height: 20),
                  PesquisaAeroporto(controller: AeroportoControllerDestino),
                  SizedBox(height: 20),
                  Row(
                      children:[
                        SizedBox(width: MediaQuery.sizeOf(context).width * 0.11),
                        Text("Ida"),
                      ]
                  ),
                  SelectData(controller: DataControllerIda),
                  SizedBox(height: 20),

                  Row(
                      children:[
                        SizedBox(width: MediaQuery.sizeOf(context).width * 0.11),
                        Text("Volta (Opcional)"),
                      ]
                  ),
                  SelectData(controller: DataControllerVolta),

                  ElevatedButton(
                      onPressed:(){
                        print("${DataControllerIda.text}");
                        print("${DataControllerVolta.text}");
                      },
                      child: Text("Press here")
                  ),

                  // SelectCompanhiaAerea(),
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