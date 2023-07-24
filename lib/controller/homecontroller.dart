import 'package:database/model/DBHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  DBHelper dbHelper = DBHelper.instance;
  List<Map<String, dynamic>> list = [];
  List<String> searchResult = [];
  TextEditingController searchController = TextEditingController();

  getList() async {
    list = await dbHelper.queryAllRows();
    update();
  }

  searchOperation(String value) {
    print("List :: $list");
    searchController.clear();
    if (searchController.text.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        String data = list[i]['name'];
        print("Data :: $data");
        print("Value :: $value");

        if (data.toLowerCase().contains(value.toLowerCase())) {
          searchResult.add(data);
        }
      }
    }
  }
}
