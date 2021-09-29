import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:office_app/bloc/add_office_bloc.dart';
import 'package:office_app/model/office_photos.dart';
import 'package:office_app/pages/view_offices.dart';
import 'package:office_app/widgets/button_widget.dart';
import 'package:office_app/widgets/office_photos_tile.dart';
import 'package:office_app/widgets/submitButton_widget.dart';
import 'package:office_app/widgets/textField_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var imageFile;
  List<OfficePhotos> officePhotosList = [];

  // late File _image;
  TextEditingController textEditingController01 = TextEditingController();
  TextEditingController textEditingController02 = TextEditingController();
  TextEditingController textEditingController03 = TextEditingController();

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
                      height: 90,
                      color: Colors.transparent,
                      child: Text(
                        "Add Office",
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
                TextFieldWidget(
                  bgColor: Colors.white,
                  fontColor: Colors.black,
                  label: "Enter office name",
                  placeholder: "Enter office name",
                  text: textEditingController01,
                ),
                TextFieldWidget(
                  bgColor: Colors.white,
                  fontColor: Colors.black,
                  label: "Enter office address",
                  placeholder: "Enter office address",
                  text: textEditingController02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          print("Clicked camera");
                        },
                        child:
                            ButtonWidget(icon: 'lib/assets/icons/camera.svg')),
                    GestureDetector(
                        onTap: () {
                          _imgFromGallery();
                          _containsImage();
                          print("Clicked gallery");
                        },
                        child:
                            ButtonWidget(icon: 'lib/assets/icons/picture.svg')),
                  ],
                ),
                _containsImage()
                    ? Container(
                        height: 100,
                        width: 250,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: _buildOfficePhotosList(),
                        ),
                      )
                    : Container(),
                GestureDetector(
                    onTap: () {
                      officeBloc.addOffice(null, textEditingController01.text,
                          textEditingController02.text, officePhotosList);
                    },
                    child: SubmitButtonWidget(label: 'Add Office')),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewOffices()),
                      );
                    },
                    child: SubmitButtonWidget(label: 'View Offices'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _imgFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
    print(pickedFile);
    // print(pickedFile!.readAsBytes());
    imageFile = await pickedFile!.readAsBytes();
    OfficePhotos officePhotos = new OfficePhotos(imageFile, null);
    officePhotosList.add(officePhotos);
    _getPhotosIndex();
    _containsImage();
  }

  _containsImage() {
    if (officePhotosList.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  _getPhotosIndex() {
    for (int i = 0; i < officePhotosList.length; i++) {
      print(i); //
    }
  }

  List<Widget> _buildOfficePhotosList() {
    List<Widget> _theOfficePhotosList = [];

    for (int i = 0; i < officePhotosList.length; i++) {
      OfficePhotosTile officePhotosTile =
          OfficePhotosTile(officePhoto: officePhotosList[i].photo);
      _theOfficePhotosList.add(officePhotosTile);
    }
    return _theOfficePhotosList;
  }
}
