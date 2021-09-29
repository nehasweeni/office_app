import 'package:flutter/material.dart';

class SubmitButtonWidget extends StatefulWidget {
  final String label;

  const SubmitButtonWidget({Key? key, required this.label}) : super(key: key);

  @override
  _SubmitButtonWidgetState createState() => _SubmitButtonWidgetState();
}

class _SubmitButtonWidgetState extends State<SubmitButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Center(
          child: Container(
            child: Text(
              widget.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  letterSpacing: 3,
                  color: Colors.white),
            ),
          ),
        ),
        height: 50,
        width: 130,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.black45,
        ),
      ),
    );
  }
}
