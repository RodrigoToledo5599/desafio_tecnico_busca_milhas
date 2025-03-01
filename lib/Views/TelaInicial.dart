import 'package:desafio_tecnico_busca_milhas/ViewModels/TravelOptionsViewModel.dart';
import 'package:desafio_tecnico_busca_milhas/Views/TelaDeResultados.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/PesquisaAeroporto.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/SelectCompanhiaAerea.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/SelectData.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/SelectTipoDeViagem.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/SelectNPassageiros.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';


class TelaInicial extends StatefulWidget{
  TelaInicial({Key? key}) : super(key: key);
  TelaInicialState createState() => TelaInicialState();
}

class TelaInicialState extends State<TelaInicial> {
  String warningMsg = "";
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

  TravelOptionsViewModel tovm = TravelOptionsViewModel();
  SessionData sd = SessionData();


  void printAllResults(){
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
  }

  bool assuringThereAreMoreAdultsThanBabies(){
    int NBabies = int.parse(this.NPassageirosBebesController.text);
    int NAdults = int.parse(this.NPassageirosAdultosController.text);
    if(NAdults < NBabies){
      setState((){
        warningMsg = "Não é possível ter mais bebes do que adultos";
        this.NPassageirosBebesController.text = (NAdults - 1).toString();
      });
      return false;
    }
    setState((){
      warningMsg = "";
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:UpBar(),
        body:Container(
          color: Color.fromRGBO(255, 255, 255,1),
          width: MediaQuery.sizeOf(context).width * 1,
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
                      onPressed:() async
                      {
                        this.printAllResults();
                        if(this.assuringThereAreMoreAdultsThanBabies() == true){
                          Map<String,dynamic>? travelCode = await tovm.createTravelOptionsCode(
                              CompanhiaAereaController.text,
                              DataControllerIda.text,
                              DataControllerVolta.text,
                              AeroportoControllerOrigem.text.toUpperCase(),
                              AeroportoControllerDestino.text.toUpperCase(),
                              TipoDeViagemController.text
                          );
                          print(travelCode);
                          sd.setCodigoViagemOptions(travelCode!["Busca"]);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TelaDeResultados()
                              )
                          );
                        }
                        else{}
                      },
                      child: Text("Enviar")
                  ),
                  Text("${warningMsg}"),
                  SizedBox(height: 50),
                ]
            )
          ),
        )
      )
    );
  }


}