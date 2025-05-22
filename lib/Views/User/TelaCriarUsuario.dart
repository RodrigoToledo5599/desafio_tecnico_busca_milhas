import 'package:desafio_tecnico_busca_milhas/DTO/CreateUserDTO.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WidgetsDeTela/TelaCriarUsuario/CriarUsuarioAppBar.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/UserViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/InputLogin.dart';



class TelaCriarUsuario extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  UserViewModel uvm = UserViewModel();
  SessionData sd;

  TextEditingController LoginUserNameController = TextEditingController();
  TextEditingController LoginEmailController = TextEditingController();
  TextEditingController LoginPasswordController = TextEditingController();


  TelaCriarUsuario({
    required this.sd,
    Key? key,
  }) : super(key: key);

  TelaCriarUsuarioState createState() => TelaCriarUsuarioState();
}

class TelaCriarUsuarioState extends State<TelaCriarUsuario>{
  String? msg = "";

  Future<bool> ValidationScript() async {
    if(this.widget.LoginEmailController.text == "" || this.widget.LoginPasswordController.text == "" || this.widget.LoginUserNameController.text == "" ){
      setState(() {
        this.msg = "Preencha todos os campos";
      });
      return false;
    }
    CreateUserDTO result = await widget.uvm.CreateUser(widget.LoginEmailController.text, widget.LoginUserNameController.text, widget.LoginPasswordController.text);
    return true;
  }

  @override Widget build(BuildContext context){
    return
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: CriarusUsuarioAppBar(sd: this.widget.sd),
              body: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Criar Conta",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            // color: Colors.white,
                            color: Color.fromRGBO(0, 0, 128, 1),
                          )
                      ),
                      Container(
                        // padding: const EdgeInsets.all(0),
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          color: Colors.white,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child:
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:[
                                    InputLogin(
                                      controller: widget.LoginEmailController,
                                      controller_name: "Email",
                                      obscure_text: false,
                                      keyboard_type: true,
                                    ),
                                    InputLogin(
                                      controller: widget.LoginUserNameController,
                                      controller_name: "UserName",
                                      obscure_text: false,
                                      keyboard_type: true,
                                    ),
                                    InputLogin(
                                      controller: widget.LoginPasswordController,
                                      controller_name: "Password",
                                      obscure_text: true,
                                      keyboard_type: true,
                                    ),
                                  ]
                              )
                          )
                      ),
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(0, 0, 128, 1),
                          foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          side: BorderSide(
                            width: 4.0,
                            color: Colors.white,
                          ),
                        ),
                        icon: const Icon(
                            Icons.login,
                            size:40
                        ),
                        onPressed: () async {
                          bool isValid = await this.ValidationScript();
                          if(isValid){
                            setState(() {

                            });
                          }

                        },
                      ),

                    ]
                ),
                width: double.infinity,
                height: double.infinity,
                color:Colors.white,
              )
          )
      );
  }
}
