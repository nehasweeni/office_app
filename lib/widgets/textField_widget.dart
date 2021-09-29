import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final Color bgColor;
  final Color fontColor;
  final String label;
  final String placeholder;
  final TextEditingController text;

  const TextFieldWidget(
      {Key? key,
      required this.bgColor,
      required this.fontColor,
      required this.label,
      required this.placeholder,
      required this.text})
      : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        color: Colors.transparent,
        child: Align(
            alignment: Alignment(-10.0, 0.0),
            child: TextField(
              controller: widget.text,
              style: TextStyle(color: Colors.white),
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: widget.label,
                  labelStyle: TextStyle(
                    color: Colors.white,
                  )),
            )),
        height: 50,
        width: 300,
      ),
    );
  }
}
