import 'package:shared_preferences/shared_preferences.dart';
class SharePrefService{
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future setData(String pass , String userid) async {
    final SharedPreferences prefs = await _prefs;


  }

  Future getData() async {
    final SharedPreferences prefs = await _prefs;

    //return [username ,password];
  }

  Future setToken(String token) async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString('fcmtoken', token);
  }
  Future getToken() async{
    final SharedPreferences prefs = await _prefs;
    String token = prefs.getString('fcmtoken');
    return token; 
  }

  Future setLogin() async{
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("login", 1);
  }

  Future resetLogin() async{
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("login", 0);
  }

  Future getLogin()async{
    final SharedPreferences prefs = await _prefs;
    int login = prefs.getInt("login");
    return login;
  }

  Future setName(String name) async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString('name', name);
  }
  Future getName() async{
    final SharedPreferences prefs = await _prefs;
    String name = prefs.getString('name');
    return name; 
  }
  Future setEmail(String email) async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString('email', email);
  }
  Future getEmail() async{
    final SharedPreferences prefs = await _prefs;
    String email = prefs.getString('email');
    return email; 
  }
}