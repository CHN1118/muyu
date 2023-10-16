// ignore_for_file: avoid_print, invalid_use_of_protected_member, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  GetStorage box = GetStorage();
  var text = '功德 + 1'.obs;
  var text_list = [].obs;

  void add(String text) {
    // 向本地存储中添加数据 get_storage
    text_list.add({"text": text, "active": false});
    // 向本地存储中添加数据 get_storage
    box.write('text_list', text_list);
  }

  // 从本地获取数据
  void get() {
    text_list.value = box.read('text_list') ??
        [
          {"text": '功德 + 1', "active": true}
        ];
  }

  // 删除本地数据
  void delete(int index) {
    text_list.removeAt(index);
    box.write('text_list', text_list);
  }

  // 设置active
  void active(int index) {
    text_list[index]['active'] = !text_list[index]['active'];
    box.write('text_list', text_list);
  }
}

//*全局控制器
Controller C = Get.find();
