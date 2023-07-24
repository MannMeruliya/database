import 'package:database/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DataBase"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [MaterialButton(onPressed: () {})],
          ),
        ));
  }
}
