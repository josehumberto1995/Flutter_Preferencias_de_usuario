import 'package:flutter/material.dart';
import 'package:preferencias_usuarios/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuarios/src/widgets/menu_widget.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {

  static final String routName = 'settings';  
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  //String _nombre = 'Hvmberto';

  TextEditingController _textEditingController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
      super.initState();
      //cargarPref();
      prefs.ultimaPagina = 'SettingsPage';
      _genero = prefs.genero;
      _colorSecundario = prefs.colorSecundario;
      _textEditingController = new TextEditingController(text: prefs.nombreUsuario);
  }

  /*cargarPref() async {

      SharedPreferences prefs = await SharedPreferences.getInstance();
       _genero = prefs.getInt('genero');
       setState(() {});
  }*/

  void _setSelectRadio(int value)  {

    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setInt('genero', value);
    prefs.genero = value;
    _genero = value;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget() ,
      body: ListView(
        children: <Widget>[ 
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Ajustes', style: TextStyle (fontSize: 45, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario, 
            title: Text('Color Secundario'),
            onChanged: ( value ) {
              setState(() {
                 _colorSecundario = value;
                 prefs.colorSecundario = value;
              });
             
            }
          ),

          RadioListTile(
            title: Text('Masculino'),
            value: 1, 
            groupValue: _genero, 
            onChanged: _setSelectRadio,
            
            
          ),
          RadioListTile(
            title: Text('Femenino'),
            value: 2, 
            groupValue: _genero, 
            onChanged: _setSelectRadio,
          ),

          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Nombres',
                helperText: 'Escribir su nombre',
              ),

              onChanged: (value) {
                prefs.nombreUsuario = value;
              },
            ),
          )
        ],
      ),
    );
    
  }

  
}