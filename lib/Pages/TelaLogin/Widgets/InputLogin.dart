import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputLogin extends StatelessWidget {
  // const InputLoginWidget({super.key});

  final String label_text;
  final ValueChanged<String> on_changed;
  bool obscure_text;
  bool keyboard_type;
  String error_msg;
  InputLogin({
    required this.on_changed,
    required this.label_text,
    required this.obscure_text,
    required this.keyboard_type,
    required this.error_msg,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: TextFormField(
                onChanged: this.on_changed,
                obscureText: this.obscure_text,
                // maxLength: this.size,
                // controller: controller,
                decoration: InputDecoration(
                  errorText: this.error_msg == "" ? null : this.error_msg,
                  labelText: this.label_text,
                  fillColor: Colors.white,
                  filled: true,
                  // hintText: this.hint_text,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromRGBO(0, 0, 128, 1),
                    ),
                  ),
                ),
                keyboardType: keyboard_type == false
                    ? TextInputType.number
                    : TextInputType.text,
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.65),
      ],
    );
  }
}
