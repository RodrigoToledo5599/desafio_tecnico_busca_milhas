import 'package:shared_preferences/shared_preferences.dart';


class SessionData{

  // salva o código gerado na criação da listagem de voos
  Future<void> setCodigoViagemOptions(String codigo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("code", codigo);
  }

  // retorna o valor do código
  Future<String?> getCodigoViagemOptions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString("code");
    if(result == null || result == ""){
      return "";
    }
    return result;
  }







}