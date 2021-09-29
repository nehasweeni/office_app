import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonWidget extends StatefulWidget {
  final Color bgColor = Colors.transparent;
  final Color borderColor = Colors.black45;
  final String icon;

  const ButtonWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: widget.borderColor),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: widget.bgColor,
        ),
        child: SizedBox(
            width: 5,
            height: 5,
            child: SvgPicture.asset(
              widget.icon,
            )),
      ),
    );
  }
}
