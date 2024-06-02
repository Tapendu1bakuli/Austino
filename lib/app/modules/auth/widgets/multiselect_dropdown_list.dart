import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../../../../common/device_manager/colors.dart';

class MultiSelectDropDownScreen extends StatelessWidget {
  final int? id;
  final String? name ;
  MultiSelectDropDownScreen({this.id,
     this.name}) ;

  @override
  Widget build(BuildContext context) {
     List<MultiSelectDropDownScreen> _list = [
       MultiSelectDropDownScreen(id: 1, name: "Retired"),
       MultiSelectDropDownScreen(id: 2, name: "Officer"),
       MultiSelectDropDownScreen(id: 3, name: "Detective"),
       MultiSelectDropDownScreen(id: 4, name: "Corporal"),
       MultiSelectDropDownScreen(id: 5, name: "Sergent"),
       MultiSelectDropDownScreen(id: 6, name: "Lieutenant"),
       MultiSelectDropDownScreen(id: 7, name: "Commander"),
       MultiSelectDropDownScreen(id: 8, name: "Assistant Chief"),
       MultiSelectDropDownScreen(id: 9, name: "Chief"),
    ];

     final _items = _list
         .map((list) => MultiSelectItem<MultiSelectDropDownScreen>(list, list.name ?? "------- Select Rank -------"))
         .toList();

    return Padding(
      padding: const EdgeInsets.only(left: 65.0),
      child: MultiSelectDialogField(
        separateSelectedItems: true,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide.none)
      ),
        items: _items,
        selectedColor: AppColors.primaryColorDash,
        buttonIcon: Icon(
          Icons.arrow_drop_down_sharp,
          color: Colors.black,
        ),
        buttonText: Text(
          "------- Select Rank -------",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        onConfirm: (results) {
          //_selectedAnimals = results;
        },
      ),
    );
  }
}
