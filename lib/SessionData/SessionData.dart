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


  Future<void> setNAdultos(int Nadultos) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("Nadultos", Nadultos);
  }

  Future<int?> getNAdultos() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? result = prefs.getInt("Nadultos");
    return result;
  }




  Future<void> setNCriancas(int Ncriancas) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("Ncriancas", Ncriancas);
  }

  Future<int?> getNCriancas() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? result = prefs.getInt("Ncriancas");
    return result;
  }



  Future<void> setNBebes(int Nbebes) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("Nbebes", Nbebes);
  }

  Future<int?> getNBebes() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? result = prefs.getInt("Nbebes");
    return result;
  }

  Future<void> setAuthTokenAndUserName(String token,String username) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("auth-token", token);
    prefs.setString("user-name", username);
  }

  Future<String> getAuthToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString("auth-token");
    if(result == null){
      result = "";
    }
    return result;
  }

  Future<String> getUserName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString("user-name");
    if(result == null){
      result = "";
    }
    return result;
  }






}