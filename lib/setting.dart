import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'audio_text.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('设置',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('关于',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 20),
              onTap: () {
                // Get.to(() => const About(), transition: Transition.topLevel);
              },
            ),
            ListTile(
              title: const Text('文字声音',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 20),
              onTap: () {
                Get.to(() => const AudioText());
              },
            ),
            ListTile(
              title: const Text('联系作者',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 20),
              onTap: () {
                // Get.to(() => const Contact(), transition: Transition.topLevel);
              },
            ),
            ListTile(
              title: const Text('捐赠作者',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 20),
              onTap: () {
                // Get.to(() => const Donate(), transition: Transition.topLevel);
              },
            ),
            ListTile(
              title: const Text('隐私政策',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 20),
              onTap: () {
                // Get.to(() => const Privacy(), transition: Transition.topLevel);
              },
            ),
            ListTile(
              title: const Text('使用条款',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 20),
              onTap: () {
                // Get.to(() => const Terms(), transition: Transition.topLevel);
              },
            ),
            ListTile(
              title: const Text('开源许可',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 20),
              onTap: () {
                // Get.to(() => const License(), transition: Transition.topLevel);
              },
            ),
          ],
        ));
  }
}
