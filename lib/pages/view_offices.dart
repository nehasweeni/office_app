import 'package:flutter/material.dart';

class ViewOffices extends StatefulWidget {
  const ViewOffices({Key? key}) : super(key: key);

  @override
  _ViewOfficesState createState() => _ViewOfficesState();
}

class _ViewOfficesState extends State<ViewOffices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(161, 66, 83, 1.0),
            Color.fromRGBO(67, 83, 196, 1.0),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          top: true,
          bottom: true,
          right: true,
          left: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
                    child: Container(
                      width: 300,
                      height: 120,
                      color: Colors.transparent,
                      child: Text(
                        "View Offices",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500,
                            fontSize: 50,
                            letterSpacing: 3,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
