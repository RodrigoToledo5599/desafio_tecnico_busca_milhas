import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';
import 'package:desafio_tecnico_busca_milhas/Views/TelaOpcoesDeVoos.dart';
import 'package:desafio_tecnico_busca_milhas/Views/User/TelaCriarUsuario.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WarningMessage.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WidgetsDeTela/TelaLogin/LoginAppBar.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool is_loading = false;
  TelaLoginState createState() => TelaLoginState();

  TelaLogin({
    required this.sd,
    Key? key,
  }): super(key: key);
}

class TelaLoginState extends State<TelaLogin>{

  Future<bool> ValidationAndSendingScript() async {
    setState(() {
      this.widget.msg = "";
    });
    if(widget.LoginEmailController.text == "" || widget.LoginPasswordController.text == "" ){
      setState(() {
        this.widget.msg = "Preencha todos os campos";
      });
      return false;
    }
    setState(() {
      this.widget.is_loading = !this.widget.is_loading;
    });
    LoginResponseDTO result = await widget.uvm.Login(widget.LoginEmailController.text, widget.LoginPasswordController.text);
    if(result.auth_token == "" || result.auth_token == null){
      setState(() {
        this.widget.msg = "Credenciais erradas";
        this.widget.is_loading = false;
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
        appBar: const LoginAppBar(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color:Colors.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Login",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      // color: Colors.white,
                      color: Color.fromRGBO(0, 0, 128, 1),
                    )
                ),
                Container(
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      IconButton(
                        style: IconButton.styleFrom(
                          foregroundColor: const Color.fromRGBO(0, 0, 128, 1),
                          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          side: BorderSide(
                            width: 6.0,
                            color: const Color.fromRGBO(0, 0, 128, 1),
                          ),
                        ),
                        icon: const Icon(
                            Icons.login,
                            size: 50
                        ),
                        onPressed: () async {
                          bool isValid = await this.ValidationAndSendingScript();
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
                      IconButton(
                        icon: const Icon(
                            Icons.person_add,
                            size:50
                        ),
                        style: IconButton.styleFrom(
                          foregroundColor: const Color.fromRGBO(0, 0, 128, 1),
                          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          side: BorderSide(
                            width: 6.0,
                            color: const Color.fromRGBO(0, 0, 128, 1),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TelaCriarUsuario(sd: this.widget.sd)
                              )
                          );
                        },
                      ),
                    ]
                ),
                this.widget.is_loading ? CircularProgressIndicator() : WarningMessage(msg: widget.msg)
              ]
          ),

        )
      )
    );
  }
}
