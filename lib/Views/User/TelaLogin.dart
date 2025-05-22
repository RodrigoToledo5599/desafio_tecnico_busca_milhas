import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';
import 'package:desafio_tecnico_busca_milhas/Views/TelaOpcoesDeVoos.dart';
import 'package:desafio_tecnico_busca_milhas/Views/User/TelaCriarUsuario.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WarningMessage.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WidgetsDeTela/TelaLogin/LoginAppBar.dart';
  import 'package:desafio_tecnico_busca_milhas/ViewModels/UserViewModel.dart';
import 'package:desafio_tecnico_busca_milhas/DTO/LoginResponseDTO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/InputLogin.dart';



class TelaLogin extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController LoginEmailController = TextEditingController();
  TextEditingController LoginPasswordController = TextEditingController();
  SessionData sd;
  UserViewModel uvm = UserViewModel();
  String msg = "";
  TelaLoginState createState() => TelaLoginState();

  TelaLogin({
    required this.sd,
    Key? key,
  }): super(key: key);
}

class TelaLoginState extends State<TelaLogin>{

  Future<bool> ValidationScript() async {
    if(widget.LoginEmailController.text == "" || widget.LoginPasswordController.text == "" ){
      setState(() {
        this.widget.msg = "Preencha todos os campos";
      });
      return false;
    }
    LoginResponseDTO result = await widget.uvm.Login(widget.LoginEmailController.text, widget.LoginPasswordController.text);
    // print("voltei do login e p token é ${result.auth_token}");
    if(result.auth_token == "" || result.auth_token == null){
      setState(() {
        this.widget.msg = "Credenciais erradas";
      });
      return false;
    }
    setState(() {
      this.widget.msg == "";
    });
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
                Text("Login",
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
                      size: 40
                  ),
                  onPressed: () async {
                    bool isValid = await this.ValidationScript();
                    if(isValid == true){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaOpcoesDeVoos(sd: widget.sd, warning_msg: "")
                          )
                      );
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaCriarUsuario(sd: this.widget.sd)
                          )
                      );
                    },
                    child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 128, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                              children:[
                                Text(
                                  "Criar Conta",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ]
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        overlayColor:Colors.transparent,
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0),

                      ),
                ),
                WarningMessage(msg: widget.msg)
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
