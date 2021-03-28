import 'package:flutter/material.dart';
import 'package:salooni/Registro/registar_proprietario.dart';
import 'package:salooni/Registro/registrar_parceiro.dart';


class Registrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFededed),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Tab(icon: new Image.asset("images/icone7.png")),
            Padding(
              padding: EdgeInsets.fromLTRB(0,_alturaTela* 0.13,0,0),
              child: Text("Registro",
                style: TextStyle(color: Color(0xFF9977ae),
                    fontSize:_alturaTela* 0.043,
                    fontFamily:"Generic"),
                textAlign: TextAlign.center,
              ),

            ),
      Padding(
        padding: EdgeInsets.fromLTRB
          (_LarguraTela* 0.1,_alturaTela *0.01,_LarguraTela* 0.1,_alturaTela *0.06),
        child: Text("Como gostaria de se cagastrar?",
          style: TextStyle(color: Color(0xFF0f0f0f),
              fontSize:_LarguraTela* 0.061,
              fontFamily:"Generic"),
          textAlign: TextAlign.center,
        ),
      ),
                  Padding(padding: EdgeInsets.fromLTRB(0,0,0,0),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegistrarProprietario())
                        );
                      },
                      //padding: EdgeInsets.fromLTRB(0,0,0,0),
                      child:  Image.asset("images/icone_Proprietario.png",
                        width: _LarguraTela* 0.4,
                        height: _alturaTela* 0.2,
                        ),),
                    ),
            Padding(
              padding: EdgeInsets.fromLTRB(_LarguraTela*0.1,0,_LarguraTela*0.1,_alturaTela*0.04),

              child: Text("Proprietário",

                style: TextStyle(color: Color(0xFF0f0f0f),
                    fontSize:_LarguraTela* 0.061,
                    fontFamily:"Generic"),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0,0,0,0),
              child: FlatButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrarParceiro())
                  );
                },
                padding: EdgeInsets.fromLTRB(0,_alturaTela*0.02,0,0),
                child:  Image.asset("images/icone_Parceiro.png",
                  width: _LarguraTela* 0.4,
                  height: _alturaTela* 0.2,
                ),),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB
                (_LarguraTela*0.1,0,_LarguraTela*0.1,0),
              child: Text("Parceiro",
                style: TextStyle(color: Color(0xFF0f0f0f),
                    fontSize:_LarguraTela* 0.061,
                    fontFamily:"Generic"),
                textAlign: TextAlign.center,
              ),
            ),
                ],

              ),
            ),

  );
  }
}
