import 'package:desafio_tecnico_busca_milhas/Models/FlightModel.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/TravelOptionsViewModel.dart';
import 'package:desafio_tecnico_busca_milhas/Views/TelaInicial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/TelaDeResultados/SingleFlightData.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/BottomBar.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';




class TelaDeResultados extends StatefulWidget{
  TelaDeResultados({Key? key}) : super(key: key);
  TelaDeResultadosState createState() => TelaDeResultadosState();
}

class TelaDeResultadosState extends State<TelaDeResultados>{

  SessionData sd = new SessionData();
  bool is_loading = true;
  TravelOptionsViewModel tovm = new TravelOptionsViewModel();

  String? codigo;
  List<FlightModel> flights_available = [];


  @override
  void initState(){
    super.initState();
    this.LoadCode();
    this.LoadFlightOptions();
  }


  Future<void> LoadCode() async{
    String? codeString = await this.sd.getCodigoViagemOptions();
    setState((){
      this.codigo = codeString;
    });
  }

  Future<void> LoadFlightOptions() async {
    String? codeString = await this.sd.getCodigoViagemOptions();
    var result = await this.tovm.queryTravelOptions(codeString);
    setState(() {
      this.flights_available = result;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
            appBar: const UpBar(),
            bottomNavigationBar: BottomBar(prev_page: TelaInicial(warning_msg: "")),
            body:
              Container(
                child:
                  Column(
                    children:[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child:
                        Text(
                          "Voos encontrados",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 128, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: 20
                          ),
                        ),
                      ),
                      Expanded(
                        child:ListView.builder(
                            itemCount: flights_available.length,
                            itemBuilder: (context, index){
                              final flight = flights_available[index];
                              return Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: SingleFlightData(Flight: flight)
                              );
                            }
                        ),
                      )

                    ]
                  )
              )

        )
    );
  }
}