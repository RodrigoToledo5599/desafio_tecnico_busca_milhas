import 'package:get/get.dart';
import 'package:flutter/material.dart';



class TelaInicialController extends GetxController {

  var aeroporto = ''.obs;




  var aeroportoError = RxnString();







  bool validateForm(){
    bool isValid = true;

    if(aeroporto.isEmpty || aeroporto == null) {
      aeroportoError.value = "Preencha ambos os campos de aeroporto";
      isValid = false;
    } else {
      aeroportoError.value = null;
    }

    return isValid;

  }



}