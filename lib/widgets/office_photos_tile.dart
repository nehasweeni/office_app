import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:office_app/model/office_photos.dart';

class OfficePhotosTile extends StatefulWidget {
  final Uint8List officePhoto;

  const OfficePhotosTile({Key? key, required this.officePhoto})
      : super(key: key);

  @override
  _OfficePhotosTileState createState() => _OfficePhotosTileState();
}

class _OfficePhotosTileState extends State<OfficePhotosTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80.0,
        width: 80.0,
        child: Image.memory(
          widget.officePhoto,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
