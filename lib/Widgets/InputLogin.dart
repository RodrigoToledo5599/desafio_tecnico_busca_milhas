import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class InputLogin extends StatelessWidget{
  // const InputLoginWidget({super.key});

  var controller = new TextEditingController();
  final String controller_name;
  bool obscure_text;
  bool keyboard_type;

  InputLogin({
    required this.controller,
    required this.controller_name,
    required this.obscure_text,
    required this.keyboard_type
  });




  @override
  Widget build(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
        SizedBox(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child:
              TextFormField(
                obscureText: this.obscure_text,
                // maxLength: this.size,
                controller: controller,
                decoration: InputDecoration(
                  labelText: this.controller_name,
                  fillColor: Colors.white,
                  filled: true,
                  // hintText: this.hint_text,
                  contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromRGBO(0, 0, 128, 1),
                    ),
                  ),
                ),
                keyboardType: keyboard_type == false ? TextInputType.number : TextInputType.text,
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.65
        ),
      ],
    );
  }
}