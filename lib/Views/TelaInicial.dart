import 'package:desafio_tecnico_busca_milhas/Services/TelaInicialService.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/TravelOptionsViewModel.dart';
import 'package:desafio_tecnico_busca_milhas/Views/TelaDeResultados.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/SelectDataETipoDeViagem.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/PesquisaAeroporto.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/SelectCompanhiaAerea.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/SelectData.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/SelectTipoDeViagem.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaInicial/SelectNPassageiros.dart';


class TelaInicial extends StatefulWidget{
  String warningMsg;

  TelaInicial({
    Key? key,
    required this.warningMsg,
  }) : super(key: key);
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

  TravelOptionsViewModel tovm = TravelOptionsViewModel();

  // primeiro metodo a ser invocado após o botão de enviar ser pressionado.
  void ensuringTheNullsWontBeNulls(){
    if(NPassageirosAdultosController.text == ""){
      NPassageirosAdultosController.text = "0";
    }
    if(NPassageirosCriancasController.text == ""){
      NPassageirosCriancasController.text = "0";
    }
    if(NPassageirosBebesController.text == ""){
      NPassageirosBebesController.text = "0";
    }
    if(TipoDeViagemController.text == "Ida"){
      print("chegou aq");
      DataControllerVolta.text = "01/01/9999";
      HorarioControllerVolta.text = "00:00";
    }

  }

  Future<bool> sendingScript() async {
    this.ensuringTheNullsWontBeNulls();
    TelaInicialService Services = TelaInicialService(
        AeroportoOrigem: this.AeroportoControllerOrigem.text,
        AeroportoDestino: this.AeroportoControllerDestino.text,
        DataIda: this.DataControllerIda.text,
        DataVolta: this.DataControllerVolta.text,
        HorarioIda: this.HorarioControllerIda.text,
        HorarioVolta: this.HorarioControllerVolta.text,
        CompanhiaAerea: this.CompanhiaAereaController.text,
        TipoDeViagem: this.TipoDeViagemController.text,
        NPassageirosAdultos: this.NPassageirosAdultosController.text,
        NPassageirosCriancas: this.NPassageirosCriancasController.text,
        NPassageirosBebes: this.NPassageirosBebesController.text
    );
    if(Services.checkIfAllRequiredFieldsAreFilled() == false){
      setState(() {
        widget.warningMsg = "Preencha todos os campos para continuar";
      });
      return false;
    }
    if(Services.assuringThereAreMoreAdultsThanBabies() == false){
      setState(() {
        widget.warningMsg = "Não é permitido ter mais bebês do que adultos";
      });
      return false;
    }
    var AerialCompaniesListFormat = Services.AerialCompaniesListFormat();
    Map<String,dynamic>? travelCode = await tovm.createTravelOptionsCode(
        AerialCompaniesListFormat,
        DataControllerIda.text,
        DataControllerVolta.text,
        AeroportoControllerOrigem.text.toUpperCase(),
        AeroportoControllerDestino.text.toUpperCase(),
        TipoDeViagemController.text
    );
    Services.savingSessionData(travelCode!["Busca"]);
    Services.printAllResults();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaDeResultados()
        )
    );
    return true;
  }



  //============================================================================================================



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
                  SizedBox(height:20),
                  Row(
                    children:[
                      SizedBox(width: MediaQuery.sizeOf(context).width * 0.1),
                    ]
                  ),
                  SizedBox(height: 20),
                  PesquisaAeroporto(controller: AeroportoControllerOrigem, LabelText: "Origem"),
                  PesquisaAeroporto(controller: AeroportoControllerDestino, LabelText: "Destino"),
                  SizedBox(height:30),
                  SelectDataETipoDeViagem(
                      TipoDeViagemController: TipoDeViagemController,
                      DataControllerIda: DataControllerIda,
                      HorarioControllerIda: HorarioControllerIda,
                      DataControllerVolta: DataControllerVolta,
                      HorarioControllerVolta: HorarioControllerVolta
                  ),
                  
                  SelectCompanhiaAerea(controller: CompanhiaAereaController),
                  SelectNPassageiros(
                    adultosController: NPassageirosAdultosController ,
                    bebesController: NPassageirosBebesController,
                    criancasController: NPassageirosCriancasController,
                  ),
                  SizedBox(height:70),
                  ElevatedButton(
                      onPressed:() async{
                        sendingScript();
                      },
                      child: Text(
                          "Enviar",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),
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
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width:MediaQuery.sizeOf(context).width * 0.1),
                      Container(
                        width:MediaQuery.sizeOf(context).width * 0.8,
                        child: Text(
                          "${widget.warningMsg}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(width:MediaQuery.sizeOf(context).width * 0.1),
                    ],
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