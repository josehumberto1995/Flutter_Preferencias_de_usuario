import 'package:flutter/material.dart';
import 'package:preferencias_usuarios/src/pages/home_page.dart';
import 'package:preferencias_usuarios/src/pages/settings_page.dart';
import 'package:preferencias_usuarios/src/share_prefs/preferencias_usuario.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final prefs = new PreferenciasUsuario();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PREFERENCIAS',
      initialRoute: prefs.ultimaPagina, //inicializamos la ruta en el home page agregando el string que se puso en el home page
      routes: {
       HomePage.routName     : (BuildContext context) => HomePage(), 
       SettingsPage.routName : (BuildContext context) => SettingsPage(), 
      },
        
     
    );
  }
}
