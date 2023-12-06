// ignore_for_file: avoid_print, invalid_use_of_protected_member, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  GetStorage box = GetStorage();
  // 文字列表
  var text_list = [].obs;

  void add(String text) {
    // 向本地存储中添加数据 get_storage
    text_list.add({"text": text, "active": false});
    // 向本地存储中添加数据 get_storage
    box.write('text_list', text_list);
  }

  // 从本地获取数据
  void get() {
    text_list.value = box.read('text_list') ?? []; // 从本地获取数据
    text_list.value.isEmpty // 如果本地没有数据
        ? text_list.value = [
            {"text": '功德 + 1', "active": true}
          ]
        : text_list.value = box.read('text_list');
  }

  // 删除本地数据
  void delete(int index) {
    if (text_list.length == 1) {
      return;
    }
    text_list.removeAt(index);
    box.write('text_list', text_list);
  }

  // 设置active
  void active(int index) {
    for (var element in text_list) {
      element['active'] = false;
    }
    text_list[index]['active'] = true;

    box.write('text_list', text_list);
  }
}

//*全局控制器
Controller C = Get.find();
