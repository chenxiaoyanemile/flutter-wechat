import 'package:flutter_demo/widgets/az_common.dart';

class ContactInfo extends ISuspensionBean {
  String name;
  String path;
  String tagIndex;
  String namePinyin;

  ContactInfo({
    this.name,
    this.path,
    this.tagIndex,
    this.namePinyin,
  });


  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'] == null ? "" : json['name'],
        path = json['path'] == null ? "" : json['path'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'path':path,
    'tagIndex': tagIndex,
    'namePinyin': namePinyin,
    'isShowSuspension': isShowSuspension
  };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => "CityBean {" + " \"name\":\"" + name + "\"" + '}';
}
