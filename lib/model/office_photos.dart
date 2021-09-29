import 'dart:typed_data';

class OfficePhotos {
  final Uint8List photo;
  final String? contentType;

  OfficePhotos(this.photo, this.contentType);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['photo'] = photo;
    map['content_type'] = contentType;
    return map;
  }

  OfficePhotos.fromJson(Map<String, dynamic> value)
      : photo = value['photo'],
        contentType = value['content_type'];
}
