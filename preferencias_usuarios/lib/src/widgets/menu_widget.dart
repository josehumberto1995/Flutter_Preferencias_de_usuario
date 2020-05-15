import 'package:flutter/material.dart';
import 'package:preferencias_usuarios/src/pages/home_page.dart';
import 'package:preferencias_usuarios/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Drawer(

     child: ListView(
       padding: EdgeInsets.zero,
     children: <Widget>[
       DrawerHeader(
         child: Container(),
           decoration: BoxDecoration(
             image: DecorationImage (
               image: AssetImage ('assets/original.jpg'),
               fit: BoxFit.cover
             )
           ),
        ),
        ListTile(
          leading: Icon(Icons.pages, color: Colors.blueAccent),
          title: Text('Home'),
          onTap: (){
            Navigator.pushReplacementNamed(context, HomePage.routName);
          },
        ),
        ListTile(
          leading: Icon(Icons.party_mode, color: Colors.blueAccent),
          title: Text('Party Mode'),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.people, color: Colors.blueAccent),
          title: Text('Personas'),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.settings, color: Colors.blueAccent),
          title: Text('Ajustes'),
          onTap: (){
            Navigator.pop(context);
            //Navigator.pushNamed(context, SettingsPage.routName);
            Navigator.pushReplacementNamed(context, SettingsPage.routName); // para no regresar a la pagina derivada que fue llamada, se utiliza mas para login

          } 
        ),
     ],
    ),

   );
  }
}