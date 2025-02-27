import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/PesquisaAeroporto.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/SelectCompanhiaAerea.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/SelectData.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/SelectTipoDeViagem.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/SelectNPassageiros.dart';


class TelaInicial extends StatefulWidget{
  TelaInicial({Key? key}) : super(key: key);
  TelaInicialState createState() => TelaInicialState();
}

class TelaInicialState extends State<TelaInicial> {
  TextEditingController AeroportoControllerOrigem = TextEditingController();

  TextEditingController AeroportoControllerDestino = TextEditingController();

  TextEditingController DataControllerIda = TextEditingController();
  TextEditingController HorarioControllerIda = TextEditingController();
  TextEditingController DataControllerVolta = TextEditingController();
  TextEditingController HorarioControllerVolta = TextEditingController();


  TextEditingController CompanhiaAereaController = TextEditingController();
  TextEditingController TipoDeViagemController = TextEditingController();

  TextEditingController NPassageirosAdultosController = TextEditingController();
  TextEditingController NPassageirosCriancasController = TextEditingController();
  TextEditingController NPassageirosBebesController = TextEditingController();

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
                  Row(
                      children:[
                        SizedBox(width: MediaQuery.sizeOf(context).width * 0.11),
                        Text("Ida"),
                      ]
                  ),
                  SelectData(
                      Datacontroller: DataControllerIda,
                      Horascontroller: HorarioControllerIda,
                  ),
                  SizedBox(height: 20),
                  Row(
                      children:[
                        SizedBox(width: MediaQuery.sizeOf(context).width * 0.11),
                        Text("Volta (Opcional)"),
                      ]
                  ),
                  SelectData(
                      Datacontroller: DataControllerVolta,
                      Horascontroller: HorarioControllerVolta,
                  ),
                  
                  SelectCompanhiaAerea(controller: CompanhiaAereaController),
                  SizedBox(height:30),
                  SelectTipoDeViagem(controller: TipoDeViagemController),
                  SizedBox(height:50),
                  SelectNPassageiros(
                    adultosController: NPassageirosAdultosController ,
                    bebesController: NPassageirosBebesController,
                    criancasController: NPassageirosCriancasController,
                  ),

                  SizedBox(height:70),
                  ElevatedButton(
                      onPressed:(){
                        print("${AeroportoControllerOrigem.text}");
                        print("${AeroportoControllerDestino.text}");
                        print("${DataControllerIda.text}");
                        print("${HorarioControllerIda.text}");
                        print("${DataControllerVolta.text}");
                        print("${HorarioControllerVolta.text}");
                        print("${CompanhiaAereaController.text}");
                        print("${TipoDeViagemController.text}");
                        print("${NPassageirosAdultosController.text}");
                        print("${NPassageirosCriancasController.text}");
                        print("${NPassageirosBebesController.text}");
                      },
                      child: Text("Mostrar resultados aqui")
                  ),
                  SizedBox(height: 50),


                  

                ]
            )
          ),
        )
      )
    );
  }


}