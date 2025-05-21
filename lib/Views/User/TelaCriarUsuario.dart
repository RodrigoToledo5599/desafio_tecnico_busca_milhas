import 'package:desafio_tecnico_busca_milhas/Widgets/WidgetsDeTela/TelaLogin/LoginAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/InputLogin.dart';



class TelaCriarUsuario extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();

  TextEditingController LoginUserNameController = TextEditingController();
  TextEditingController LoginEmailController = TextEditingController();
  TextEditingController LoginPasswordController = TextEditingController();


  bool SendingScript(){
    print(LoginEmailController.text);
    print(LoginPasswordController.text);
    return true;
  }

  @override Widget build(BuildContext context){
    return
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: LoginAppBar(),
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
                                      controller: LoginEmailController,
                                      controller_name: "Email",
                                      obscure_text: false,
                                      keyboard_type: false,
                                    ),
                                    InputLogin(
                                      controller: LoginUserNameController,
                                      controller_name: "UserName",
                                      obscure_text: false,
                                      keyboard_type: false,
                                    ),
                                    InputLogin(
                                      controller: LoginPasswordController,
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
                          SendingScript();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Depositarousacar()
                          //     )
                          // );
                        },
                      ),
                    ]
                ),
                width: double.infinity,
                height: double.infinity,
                // color: Color.fromRGBO(0, 0, 128, 1),
                color:Colors.white,
              )
          )
      );
  }
}
