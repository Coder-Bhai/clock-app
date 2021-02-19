import 'package:flutter/material.dart';
import 'package:clock_app/widgets/clock_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F2C35),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFEBEBED),
                  borderRadius: BorderRadius.circular(70.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                width: 300,
                height: 300,
                child: ClockWidget()),
            SizedBox(
              height: 50.0,
            ),
            Divider(
              color: Colors.white,
              thickness: 1.5,
              indent: 90.0,
              endIndent: 90.0,
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              margin: EdgeInsets.symmetric(horizontal: 80.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.0)),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFF2F2C35),
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(40.0),
                            right: Radius.circular(40.0))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}