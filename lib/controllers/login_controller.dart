import 'dart:math';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:desafio_tecnico_busca_milhas/ViewModels/UserViewModel.dart';
import 'package:desafio_tecnico_busca_milhas/DTO/LoginResponseDTO.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var is_loading = false.obs;
  var email_error_message = ''.obs;
  var password_error_message = ''.obs;
  var request_error_message = ''.obs;

  bool checkIfArrobaExists() {
    return !email.value.contains("@");
  }

  void loading() {
    is_loading.value = true;
  }

  void notLoading() {
    is_loading.value = false;
  }

  void validadeEmail() {
    if (email.value == "") {
      email_error_message.value = "Preencha este campo";
    } else if (checkIfArrobaExists()) {
      email_error_message.value = "Email inválido";
    } else {
      email_error_message.value = "";
    }
  }

  void validadePassword() {
    if (password.value == "") {
      password_error_message.value = "Preencha este campo";
    } else {
      password_error_message.value = "";
    }
  }

  Future<bool> validationAndSendingScript() async {
    this.request_error_message.value = "";

    loading();
    LoginResponseDTO result =
        await UserViewModel().Login(email.value, password.value);
    if (result.auth_token == "" || result.auth_token == null) {
      notLoading();
      this.request_error_message.value = "Credenciais erradas";
      return false;
    }
    this.request_error_message.value = "";
    return true;
  }
}
