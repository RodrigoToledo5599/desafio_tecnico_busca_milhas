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
        body: FutureBuilder<List<FlightModel>?>(
          future: Future.value(this.flights_available),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator()); // Show loading spinner
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Error loading tasks"));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No flights available"));
            }
            List<FlightModel> flights = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                color: const Color.fromRGBO(255, 255, 255,1),
                width: MediaQuery.sizeOf(context).width * 1,
                child: Column(
                  children:[
                    const SizedBox(height:20),
                    const Text(
                      "Voos encontrados",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(height:20),
                    Column(
                      children:
                      flights.map((flight) {
                        return Container(
                          child: Column(
                            children:[
                              const SizedBox(height: 10),
                              SingleFlightData(Flight: flight),
                            ]
                          )
                        );
                      }).toList(),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.05)
                  ]
                )
              ),
            );
          }),
        )
      );
  }
}