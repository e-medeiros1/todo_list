import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  var list = [].obs;

  addNotes(TextEditingController getxcontroller) {
    if (getxcontroller.text.isEmpty) return;
    list.add(getxcontroller.text);
    getxcontroller.clear();
    update();
  }

  removeNotes(int index) {
    list.removeAt(index);
    update();
  }
}
