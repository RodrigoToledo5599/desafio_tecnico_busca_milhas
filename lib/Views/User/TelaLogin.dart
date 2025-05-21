import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';
import 'package:desafio_tecnico_busca_milhas/Views/TelaOpcoesDeVoos.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WarningMessage.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WidgetsDeTela/TelaLogin/LoginAppBar.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/UserViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/InputLogin.dart';



class TelaLogin extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController LoginEmailController = TextEditingController();
  TextEditingController LoginPasswordController = TextEditingController();
  SessionData sd = SessionData();
  UserViewModel uvm = UserViewModel();
  String msg = "";
  TelaLoginState createState() => TelaLoginState();
}

class TelaLoginState extends State<TelaLogin>{

  // bool CheckingIfWarningMsgIsEmpty(){
  //   if(widget.msg == ""){
  //     return true;
  //   }
  //   return false;
  // }

  bool CheckingIfWarningMsgIsEmpty(){
    bool result = widget.msg != "";
    return result;
  }

  Future<bool> SendingScript() async {
    if (this.CheckingIfWarningMsgIsEmpty() == false){

    }
    if(widget.LoginEmailController.text == "" || widget.LoginPasswordController.text == "" ){
      setState(() {
        this.widget.msg = "Preencha todos os campos";
      });
      return false;
    }
    widget.uvm.Login(widget.LoginEmailController.text, widget.LoginPasswordController.text);
    String token = await widget.sd.getAuthToken();
    if(token == ""){
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
                              keyboard_type: false,
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
                    SendingScript();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => TelaOpcoesDeVoos(warning_msg: "")
                    //     )
                    // );
                  },
                ),
                // WarningMessage(msg: widget.msg),
                this.CheckingIfWarningMsgIsEmpty() ?
                WarningMessage(msg: widget.msg) : Container()
                // WarningMessage(msg: widget.msg)
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
