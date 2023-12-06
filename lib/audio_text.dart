// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class AudioText extends StatefulWidget {
  const AudioText({super.key});

  @override
  State<AudioText> createState() => _AudioTextState();
}

class _AudioTextState extends State<AudioText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('文字声音',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            Obx(
              () => Expanded(
                child: ListView.builder(
                    itemCount: C.text_list.length + 1,
                    itemBuilder: (context, index) {
                      if (C.text_list.length == index) {
                        return SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Center(
                            child: IconButton(
                                onPressed: () {
                                  TextEditingController textController =
                                      TextEditingController();
                                  Get.defaultDialog(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.3),
                                    title: '添加文字',
                                    titleStyle: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    radius: 10,
                                    content: Container(
                                      height: 50,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextField(
                                        controller: textController,
                                        autofocus: true, // 自动聚焦
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '请输入文字',
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14)),
                                        style: const TextStyle(
                                          color: Colors.white, // 设置文本颜色
                                        ),
                                      ),
                                    ),
                                    confirm: ElevatedButton(
                                      onPressed: () {
                                        C.add(textController.text);
                                        Get.back();
                                      },
                                      child: const Text('确定'),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.black.withOpacity(0.3)),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ),
                        );
                      }
                      return ListTile(
                        title: Text(C.text_list[index]['text'],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                        trailing: C.text_list[index]['active']
                            ? const Icon(Icons.volume_up,
                                color: Colors.white, size: 20)
                            : const Icon(Icons.volume_off,
                                color: Colors.white, size: 20),
                        onTap: () {
                          C.active(index);
                          setState(() {});
                        },
                        onLongPress: () {
                          C.delete(index);
                          setState(() {});
                        },
                      );
                    }),
              ),
            ),
          ],
        ));
  }
}
