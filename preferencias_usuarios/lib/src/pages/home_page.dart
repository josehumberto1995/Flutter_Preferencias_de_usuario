import 'package:flutter/material.dart';
import 'package:preferencias_usuarios/src/share_prefs/preferencias_usuario.dart';
//import 'package:preferencias_usuarios/src/settings_page.dart';
import 'package:preferencias_usuarios/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routName = 'home';  //otra forma para las rutas de las paginas, agreagar una palabra estacica de tipo string
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = 'HomePage';

      return Scaffold(
      drawer: MenuWidget() ,
      appBar: AppBar(
        title: Text ('Preferencias de Usuarios'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secuandario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre Usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }

}