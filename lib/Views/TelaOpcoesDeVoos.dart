import 'package:desafio_tecnico_busca_milhas/Views/TelaListaDeVoos.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WarningMessage.dart';
import 'package:flutter/material.dart';

import 'package:desafio_tecnico_busca_milhas/Services/TelaOpcoesDeVoosService.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/TravelOptionsViewModel.dart';

import 'package:desafio_tecnico_busca_milhas/Widgets/WidgetsDeTela/TelaOpcoesDeVoos/SelectDataETipoDeViagem.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WidgetsDeTela/TelaOpcoesDeVoos/PesquisaAeroporto.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WidgetsDeTela/TelaOpcoesDeVoos/SelectCompanhiaAerea.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WidgetsDeTela/TelaOpcoesDeVoos/SelectNPassageiros.dart';


class TelaOpcoesDeVoos extends StatefulWidget{
  String warning_msg = "";

  TelaOpcoesDeVoos({
    Key? key,
    required this.warning_msg,
  }) : super(key: key);
  TelaOpcoesDeVoosState createState() => TelaOpcoesDeVoosState();
}

class TelaOpcoesDeVoosState extends State<TelaOpcoesDeVoos> {
  TextEditingController aeroporto_controller_origem = TextEditingController();
  TextEditingController aeroporto_controller_destino = TextEditingController();
  TextEditingController data_controller_ida = TextEditingController();
  TextEditingController horario_controller_ida = TextEditingController();
  TextEditingController data_controller_volta = TextEditingController();
  TextEditingController horario_controller_volta = TextEditingController();
  TextEditingController companhia_aerea_controller = TextEditingController();
  TextEditingController tipo_de_viagem_controller = TextEditingController();
  TextEditingController n_passageiros_adultos_controller = TextEditingController();
  TextEditingController n_passageiros_criancas_controller = TextEditingController();
  TextEditingController n_passageiros_bebes_controller = TextEditingController();

  TravelOptionsViewModel tovm = TravelOptionsViewModel();
  //
  // bool CheckingIfWarningMsgIsEmpty(){
  //   bool result = widget.warning_msg != "";
  //   return result;
  // }

  // primeiro metodo a ser invocado após o botão de enviar ser pressionado.
  void ensuringTheNullsWontBeNulls(){
    if(n_passageiros_adultos_controller.text == ""){
      n_passageiros_adultos_controller.text = "0";
    }
    if(n_passageiros_criancas_controller.text == ""){
      n_passageiros_criancas_controller.text = "0";
    }
    if(n_passageiros_bebes_controller.text == ""){
      n_passageiros_bebes_controller.text = "0";
    }
    if(tipo_de_viagem_controller.text == "Ida"){
      data_controller_volta.text = "01/01/9999";
      horario_controller_volta.text = "00:00";
    }

  }

  Future<bool> sendingScript() async {
    this.widget.warning_msg = "";
    this.ensuringTheNullsWontBeNulls();
    TelaOpcoesDeVoosService Services = TelaOpcoesDeVoosService(
        aeroporto_origem: this.aeroporto_controller_origem.text,
        aeroporto_destino: this.aeroporto_controller_destino.text,
        data_ida: this.data_controller_ida.text,
        data_volta: this.data_controller_volta.text,
        horario_ida: this.horario_controller_ida.text,
        horario_volta: this.horario_controller_volta.text,
        companhia_aerea: this.companhia_aerea_controller.text,
        tipo_de_viagem: this.tipo_de_viagem_controller.text,
        n_passageiros_adultos: this.n_passageiros_adultos_controller.text,
        n_passageiros_criancas: this.n_passageiros_criancas_controller.text,
        n_passageiros_bebes: this.n_passageiros_bebes_controller.text
    );
    if(Services.checkIfAllRequiredFieldsAreFilled() == false){
      setState(() {
        widget.warning_msg = "Preencha todos os campos para continuar";
      });
      return false;
    }
    if(int.parse(this.n_passageiros_adultos_controller.text) < 1){
      setState(() {
        widget.warning_msg= "Deve ter pelo menos 1 adulto";
      });
      return false;
    }
    if(int.parse(this.n_passageiros_bebes_controller.text) + int.parse(this.n_passageiros_criancas_controller.text) + int.parse(this.n_passageiros_adultos_controller.text) > 9){
      setState(() {
        widget.warning_msg = "Número máximo de 9 passageiros foi excedido";
      });
      return false;
    }
    if(Services.assuringThereAreMoreAdultsThanBabies() == false){
      setState(() {
        widget.warning_msg = "Não é permitido ter mais bebês do que adultos";
      });
      return false;
    }
    var AerialCompaniesListFormat = Services.AerialCompaniesListFormat();
    Map<String,dynamic>? travelCode = await tovm.createTravelOptionsCode(
        AerialCompaniesListFormat,
        data_controller_ida.text,
        data_controller_volta.text,
        aeroporto_controller_origem.text.toUpperCase(),
        aeroporto_controller_destino.text.toUpperCase(),
        tipo_de_viagem_controller.text
    );
    Services.savingSessionData(travelCode!["Busca"]);
    Services.printAllResults();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaListaDeVoos()
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
                  child:
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0,),
                    child: Column(
                        children:[
                          PesquisaAeroporto(controller: aeroporto_controller_origem, label_text: "Origem"),
                          PesquisaAeroporto(controller: aeroporto_controller_destino, label_text: "Destino"),
                          SelectDataETipoDeViagem(
                              tipo_de_viagem_controller: tipo_de_viagem_controller,
                              data_controller_ida: data_controller_ida,
                              horario_controller_ida: horario_controller_ida,
                              data_controller_volta: data_controller_volta,
                              horario_controller_volta: horario_controller_volta
                          ),
                          SelectCompanhiaAerea(controller: companhia_aerea_controller),
                          SelectNPassageiros(
                            adultos_controller: n_passageiros_adultos_controller ,
                            bebes_controller: n_passageiros_bebes_controller,
                            criancas_controller: n_passageiros_criancas_controller,
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
                              backgroundColor: Color.fromRGBO(0, 0, 128, 1),
                              foregroundColor: Colors.white,
                              elevation: 5,
                              shadowColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Padding
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                  MediaQuery.sizeOf(context).width * 0.1,
                                  20,
                                  MediaQuery.sizeOf(context).width * 0.1,
                                  50
                              ),
                              child: WarningMessage(msg: widget.warning_msg)
                          )
                        ]
                    ),
                  ),
                )
            )
        )
    );
  }
}