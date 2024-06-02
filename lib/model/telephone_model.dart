class TelephoneModel {
  TelephoneModel({required this.telephoneList
      // required this.telephoneList,
      });
  // late final TelephoneList telephoneList;
  List<TelephoneList> telephoneList = <TelephoneList>[];

  TelephoneModel.fromJson(Map<String, dynamic> json) {
    if (json['telephone_list'] != null) {
      telephoneList = <TelephoneList>[];
      json['telephone_list'].forEach((v) {
        telephoneList.add(new TelephoneList.fromJson(v));
      });
    }
    // telephoneList = TelephoneList.fromJson(json['telephone_list']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    //_data['telephone_list'] = telephoneList.toJson();
    return _data;
  }
}

class TelephoneList {
  TelephoneList({this.name, this.no, this.isRed});
  String? name;
  String? no;
  bool? isRed;

  TelephoneList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    no = json['no'];
    isRed = json['isRed'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    // _data['telephone_list'] = telephoneList.map((e)=>e.toJson()).toList();
    return _data;
  }
}
