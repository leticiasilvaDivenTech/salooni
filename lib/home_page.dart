import 'package:flutter/material.dart';
import 'package:salooni/slide_home_page.dart';
class HomePage extends StatefulWidget {

  _HomePageState createState() => _HomePageState();

}


class _HomePageState extends State<HomePage> {
  @override



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9977ae),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                itemBuilder: (_,currentIndex){
                  if(currentIndex==1){
                    return SlidePage2();
                  }
                  else if(currentIndex==2){
                    return SlidePage3();
                  }
                  else {
                    return SlidePage();
                  }
                },

              )
            ),
            _buildBullets()
          ],
        ),
      ),
            );
  }

  Widget _buildBullets() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFededed)),
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFededed)),
          ),
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFededed)),
          )
        ],
      ),
    );
  }
}