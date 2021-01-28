import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8c6eb0),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
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
                color: Color(0xFF575ba8)),
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