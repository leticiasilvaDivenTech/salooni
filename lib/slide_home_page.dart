import 'package:flutter/material.dart';

class SlidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9977ae),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Tab(icon: new Image.asset("images/icone7.png")),
            Padding(
              padding: EdgeInsets.fromLTRB(0,120,0,20),
              child: Image.asset("images/icone1.png",
                width: 155,
                height: 155,
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0,60,0,50),
              child: Text("Seja Bem Vindo(a)",
                style: TextStyle(color: Color(0xFFededed),
                    fontSize:45,
                    fontFamily:"Generic"),
                textAlign: TextAlign.center,
              ),

            ),
            Padding(padding: EdgeInsets.fromLTRB(60,0,60,10),
                child: Text("O Salooni te ajudará a organizar seu "
                    "salão de maneira rápida e prática",
                  style: TextStyle(color: Color(0xFF0f0f0f),
                      fontSize:26,
                      fontFamily:"SaniTrixieSans"),
                  textAlign: TextAlign.center,
                )
            ),
            Padding(padding: EdgeInsets.fromLTRB(60,30,60,10),
                child: Text("Vamos nessa?",
                  style: TextStyle(color: Color(0xFF0f0f0f),
                    fontFamily: "SaniTrixieSans",
                    fontSize:30,
                  ),
                  textAlign: TextAlign.center,
                )
            )
          ],
        ),
      ),
    );
  }
}
class SlidePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededed),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(0,100,0,0),
              child: Text("Agende seus clientes"
                  " sem complicação",
                style: TextStyle(color: Color(0xFF9977ae),
                    fontSize:35,
                    fontFamily:"Generic"),
                textAlign: TextAlign.center,
              ),

            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0,30,0,0),
              child:
              Icon(Icons.access_time, size: 200.0, color: Color(0xFF9977ae),
              ),),

            Padding(padding: EdgeInsets.fromLTRB(70,40,70,0),
              child: Text("Esqueça as agenda cheia de texto ou com pouca"
                  " informação",
                style: TextStyle(color: Color(0xFF0f0f0f),
                    fontSize:25,
                    fontFamily:"SaniTrixieSans"),
                textAlign: TextAlign.center,
              ),

            ),

            Padding(padding: EdgeInsets.fromLTRB(80,40,80,0),
                child: Text("Marque o essencial que você precisa sem se perder!",
                  style: TextStyle(color: Color(0xFF0f0f0f),
                    fontFamily: "SaniTrixieSans",
                    fontSize:25,
                  ),
                  textAlign: TextAlign.center,
                )
            )
          ],
        ),
      ),
    );
  }
}

class SlidePage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFededed),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(60,100,60,0),
              child: Text("Programe-se antes e fique em paz ",
                style: TextStyle(color: Color(0xFF9977ae),
                    fontSize:35,
                    fontFamily:"Generic"),
                textAlign: TextAlign.center,
              ),

            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0,30,0,0),
              child:
              Icon(Icons.wysiwyg, size: 200.0, color: Color(0xFF9977ae),
              ),),

            Padding(padding: EdgeInsets.fromLTRB(90,40,90,0),
              child: Text("Crie calendário e contumize-os de sua maneira",
                style: TextStyle(color: Color(0xFF0f0f0f),
                    fontSize:25,
                    fontFamily:"SaniTrixieSans"),
                textAlign: TextAlign.center,
              ),

            ),

            Padding(padding: EdgeInsets.fromLTRB(60,40,60,0),
                child: Text("Ao colocar cada coisa em seu lugar, você fica"
                    " livre de qualquer imprevisto",
                  style: TextStyle(color: Color(0xFF0f0f0f),
                    fontFamily: "SaniTrixieSans",
                    fontSize:25,
                  ),
                  textAlign: TextAlign.center,
                )
            ),

            Padding(padding: EdgeInsets.fromLTRB(230,70,0,0),
                child: FlatButton(
                    onPressed: (){},
                    child: Text("Vamos lá?  > ",
                  style: TextStyle(color: Color(0xFF9977ae),
                    fontFamily: "SaniTrixieSans",
                    fontSize:25,
                  ),
                  textAlign: TextAlign.center,
                ),

                ),

            ),
          ],
        ),
      ),
    );
  }
}


