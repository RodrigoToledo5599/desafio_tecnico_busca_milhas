import 'package:desafio_tecnico_busca_milhas/Pages/TelaOpcoesDeVoos/TelaOpcoesDeVoos.dart';
import 'package:desafio_tecnico_busca_milhas/Pages/TelaCriarUsuario/TelaCriarUsuario.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WarningMessage.dart';
import 'package:desafio_tecnico_busca_milhas/Pages/TelaLogin/Widgets/LoginAppBar.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/UserViewModel.dart';
import 'package:desafio_tecnico_busca_milhas/Pages/TelaLogin/Widgets/InputLogin.dart';
import 'package:desafio_tecnico_busca_milhas/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TelaLogin extends StatefulWidget {
  LoginController login_controller = Get.put(LoginController());
  SessionData sd;
  UserViewModel uvm = UserViewModel();
  TelaLoginState createState() => TelaLoginState();

  TelaLogin({
    required this.sd,
    Key? key,
  }) : super(key: key);
}

class TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: const LoginAppBar(),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
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
                        )),
                    Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        color: Colors.white,
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Obx(() => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InputLogin(
                                          on_changed: (value) {
                                            widget.login_controller.email
                                                .value = value;
                                            widget.login_controller
                                                .validadeEmail();
                                          },
                                          label_text: "Email",
                                          obscure_text: false,
                                          keyboard_type: true,
                                          error_msg: widget.login_controller
                                              .email_error_message.value),
                                      InputLogin(
                                        on_changed: (value) {
                                          widget.login_controller.password
                                              .value = value;
                                          widget.login_controller
                                              .validadePassword();
                                        },
                                        label_text: "Password",
                                        obscure_text: true,
                                        keyboard_type: true,
                                        error_msg: widget.login_controller
                                            .password_error_message.value,
                                      ),
                                    ])))),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              foregroundColor:
                                  const Color.fromRGBO(0, 0, 128, 1),
                              backgroundColor:
                                  const Color.fromRGBO(255, 255, 255, 1),
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
                              bool isValid = await widget.login_controller
                                  .validationAndSendingScript();
                              if (isValid == true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TelaOpcoesDeVoos(
                                            sd: widget.sd, warning_msg: "")));
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.person_add, size: 50),
                            style: IconButton.styleFrom(
                              foregroundColor:
                                  const Color.fromRGBO(0, 0, 128, 1),
                              backgroundColor:
                                  const Color.fromRGBO(255, 255, 255, 1),
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
                                      builder: (context) => TelaCriarUsuario(
                                          sd: this.widget.sd)));
                            },
                          ),
                        ]),
                    Obx(() {
                      if (widget.login_controller.is_loading.value == true)
                        return CircularProgressIndicator();
                      else
                        return WarningMessage(
                            msg: widget
                                .login_controller.request_error_message.value);
                    }),
                  ]),
            )));
  }
}
