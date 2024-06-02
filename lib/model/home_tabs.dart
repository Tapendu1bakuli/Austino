import 'model.dart';

class BasicUIModel extends Model{
  int? indexId;
  String? name;
  bool? isSelected;
  BasicUIModel({this.indexId,this.name,this.isSelected = false});
  BasicUIModel.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    name = stringFromJson(json, 'name').replaceAll('\n', ' ');
    indexId = intFromJson(json, 'id');
    isSelected = false;//boolFromJson(json, 'is_selected')?? false;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.indexId;
    data['name'] = this.name;
    data['is_selected'] = this.isSelected;
    return data;
  }
}