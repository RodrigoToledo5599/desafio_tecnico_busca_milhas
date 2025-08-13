import 'package:desafio_tecnico_busca_milhas/DTO/CreateUserDTO.dart';
import 'package:desafio_tecnico_busca_milhas/Pages/TelaLogin/TelaLogin.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WarningMessage.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/UserViewModel.dart';
import 'package:desafio_tecnico_busca_milhas/Pages/TelaLogin/Widgets/InputLogin.dart';
import 'package:desafio_tecnico_busca_milhas/Pages/TelaCriarUsuario/Widgets/Aviso.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaCriarUsuario extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  UserViewModel uvm = UserViewModel();
  bool is_loading = false;
  bool is_sucessfull = false;
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

class TelaCriarUsuarioState extends State<TelaCriarUsuario> {
  String? msg = "";

  Future<bool> ValidationAndSendingScript() async {
    setState(() {
      this.widget.is_loading = true;
    });
    if (this.widget.LoginEmailController.text == "" ||
        this.widget.LoginPasswordController.text == "" ||
        this.widget.LoginUserNameController.text == "") {
      setState(() {
        this.widget.is_loading = false;
        this.msg = "Preencha todos os campos";
      });
      return false;
    }
    CreateUserDTO result = await widget.uvm.CreateUser(
        widget.LoginEmailController.text,
        widget.LoginUserNameController.text,
        widget.LoginPasswordController.text);
    if (result.sucessfull!) {
      setState(() {
        this.widget.is_loading = false;
        this.widget.is_sucessfull = true;
        this.msg = "";
      });
      return true;
    }
    setState(() {
      this.widget.is_loading = false;
      this.msg = "Usuário não pode ser criado";
      this.widget.is_sucessfull = false;
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Crie sua conta",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 128, 1),
                  )),
              Container(
                  // padding: const EdgeInsets.all(0),
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("DEPOIS EU IMPLEMENTO AQ"),
                            // InputLogin(
                            //   controller: widget.LoginEmailController,
                            //   controller_name: "Email",
                            //   obscure_text: false,
                            //   keyboard_type: true,
                            // ),
                            // InputLogin(
                            //   controller: widget.LoginUserNameController,
                            //   controller_name: "User Name",
                            //   obscure_text: false,
                            //   keyboard_type: true,
                            // ),
                            // InputLogin(
                            //   controller: widget.LoginPasswordController,
                            //   controller_name: "Password",
                            //   obscure_text: true,
                            //   keyboard_type: true,
                            // ),
                          ]))),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
                    Icons.keyboard_return,
                    color: const Color.fromRGBO(0, 0, 128, 1),
                    size: 45,
                  ),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaLogin(sd: this.widget.sd),
                        ));
                  },
                ),
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
                  icon: const Icon(Icons.login, size: 50),
                  onPressed: () async {
                    bool isValid = await this.ValidationAndSendingScript();
                    if (isValid) {
                      setState(() {});
                    }
                  },
                ),
              ]),
              this.widget.is_sucessfull
                  ? Aviso(msg: "Usário foi criado com sucesso")
                  : SizedBox.shrink(),
              this.widget.is_loading
                  ? CircularProgressIndicator()
                  : WarningMessage(msg: this.msg)
            ],
          ),
        )));
  }
}
