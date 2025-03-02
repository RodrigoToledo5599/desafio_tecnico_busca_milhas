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
    print("Nadultos: ${NPassageirosAdultosController.text}");
    print("Ncriancas: ${NPassageirosCriancasController.text}");
    print("Nbebes: ${NPassageirosBebesController.text}");
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
  List<String> AerialCompaniesListFormat(String companhiasAereas){
    if(companhiasAereas.substring(0,1) == '['){
      companhiasAereas = companhiasAereas.substring(1, companhiasAereas.length - 1);
    }
    List<String> companhiasList = companhiasAereas.split(",");
    for(int i =0; i < companhiasList.length; i++){
      companhiasList[i] = companhiasList[i].trim();
    }
    return companhiasList;
  }

  void savingSessionData(String travelCode,int nAdultos, int nCriancas, nBebes){
    sd.setCodigoViagemOptions(travelCode);
    sd.setNAdultos(nAdultos);
    sd.setNCriancas(nCriancas);
    sd.setNBebes(nBebes);
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
                  SizedBox(height:20),
                  Row(
                    children:[
                      SizedBox(width: MediaQuery.sizeOf(context).width * 0.1),
                      Text(
                          "Origem",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 16
                          ),
                      ),
                    ]
                  ),
                  SizedBox(height: 20),
                  PesquisaAeroporto(controller: AeroportoControllerOrigem),
                  Row(
                      children:[
                        SizedBox(width: MediaQuery.sizeOf(context).width * 0.1),
                        Text(
                            "Destino",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 16
                            ),
                        ),
                      ]
                  ),
                  SizedBox(height: 20),
                  PesquisaAeroporto(controller: AeroportoControllerDestino),
                  Row(
                      children:[
                        SizedBox(width: MediaQuery.sizeOf(context).width * 0.1),
                        Text(
                            "Ida",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue
                            ),
                        ),
                      ]
                  ),
                  SelectData(
                      Datacontroller: DataControllerIda,
                      Horascontroller: HorarioControllerIda,
                  ),
                  SizedBox(height: 20),
                  Row(
                      children:[
                        SizedBox(width: MediaQuery.sizeOf(context).width * 0.1),
                        Text(
                          "Volta (Opcional)",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue
                          ),
                        ),
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
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Padding
                      ),
                      onPressed:() async
                      {
                        this.printAllResults();
                        if(this.assuringThereAreMoreAdultsThanBabies() == true){
                          Map<String,dynamic>? travelCode = await tovm.createTravelOptionsCode(
                              AerialCompaniesListFormat(CompanhiaAereaController.text),
                              DataControllerIda.text,
                              DataControllerVolta.text,
                              AeroportoControllerOrigem.text.toUpperCase(),
                              AeroportoControllerDestino.text.toUpperCase(),
                              TipoDeViagemController.text
                          );
                          print("VTNC: ");
                          print(travelCode);
                          savingSessionData(
                            travelCode!["Busca"],
                            int.parse(NPassageirosAdultosController.text),
                            int.parse(NPassageirosCriancasController.text),
                            int.parse(NPassageirosBebesController.text)
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TelaDeResultados()
                              )
                          );
                        }
                        else{}
                      },
                      child: Text(
                          "Enviar",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      )
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