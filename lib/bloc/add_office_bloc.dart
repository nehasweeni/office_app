import 'dart:convert';

import 'package:office_app/api/add_office_provider.dart';
import 'package:office_app/model/office.dart';
import 'package:office_app/model/office_photos.dart';
import 'package:rxdart/rxdart.dart';

class OfficeBloc {
  List<Office> _offices = [];

  OfficeProvider officeProvider = OfficeProvider();
  final PublishSubject<List<Office>> _officeList =
      PublishSubject<List<Office>>();

  Future<void> getAllOffices() async {
    List<Office> list = await officeProvider.getOffices();
    print(list[0].officeName);
    _offices = list;
    _officeList.sink.add(list);
  }

  Future<bool> addOffice(int? officeID, String officeName, String officeAddress, List<OfficePhotos> officePhotosList) async {
    Office office = new Office(officeID, officeName, officeAddress, officePhotosList);

    Future<bool> success = officeProvider.addOffice(office);


    return success;

  }

  Future<void> getAllPhotos(int officeId) async {
    _offices.forEach((element) {
      if (element.officeID == officeId) {
        return null;
      }
    });
  }

  dispose() {
    _officeList.close();

  }
}

final officeBloc = OfficeBloc();
