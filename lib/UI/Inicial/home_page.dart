import 'package:flutter/material.dart';
import 'package:salooni/UI/Login/login_user.dart';
class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();



  @override
  void initState() {
    _pageController.addListener(() {});
    super.initState();
  }

  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF9977ae),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    itemBuilder: (_, currentIndex) {
                      if (currentIndex == 0) {
                        return Container(
                          decoration: BoxDecoration(
                              //  borderRadius: BorderRadius.circular(0),
                              image: DecorationImage(
                                  image: AssetImage("images/Tela1M.png"),
                                  fit: BoxFit.cover)),
                        );
                      } else if (currentIndex == 1) {
                        return Container(
                          decoration: BoxDecoration(
                              //  borderRadius: BorderRadius.circular(0),
                              image: DecorationImage(
                                  image: AssetImage("images/Tela2M.png"),

                                  fit: BoxFit.cover)),
                        );
                      } else {
                        return Stack(
                            //alignment: Alignment.center,
                            children: <Widget>[
                          Image.asset("images/Tela3M.png",
                            // width:double.infinity ,
                              height: double.infinity,
                              fit: BoxFit.cover),
                          Positioned(
                            bottom:_alturaTela*0.11,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB
                                (_LarguraTela* 0.5,_alturaTela* 0.01,0,0),
                              child: FlatButton(
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => LoginUser())
                                  );
                                },
                                child: Text("Vamos lá?  > ",
                                  style: TextStyle(color: Color(0xFF9977ae),
                                    fontFamily: "SaniTrixieSans",
                                    fontSize:_LarguraTela* 0.061,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                              ),

                            ),
                          )
                        ]);
                      }
                    })),
            // _buildBullets()
          ],
        ),
      ),
    );
  }


}
