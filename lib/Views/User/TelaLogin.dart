import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/WidgetsDeTela/TelaLogin/InputLogin.dart';
import 'package:iconic/iconic.dart';



class TelaLogin extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();

  TextEditingController LoginEmailController = TextEditingController();
  TextEditingController LoginPasswordController = TextEditingController();

  @override Widget build(BuildContext context){
    return
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Login",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    )
                ),
                Container(
                    child: Column(
                        children:[
                          InputLogin(
                            controller: LoginEmailController,
                            controller_name: "Email",
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
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 0, 128, 1),
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
          color: Color.fromRGBO(0, 0, 128, 1), // Cor final do gradiente



        )
      )
    );
  }
}
