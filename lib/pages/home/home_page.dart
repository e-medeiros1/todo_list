import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/pages/home/controller/todo_controller.dart';
import 'package:to_do_list/pages/home/widgets/dismisseble_item.dart';

import 'widgets/custom_icon_button.dart';
import 'widgets/input.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  final instance = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            'Lista de afazeres',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GetX<TodoController>(
          init: TodoController(),
          builder: (instance) => Column(
            children: [
              Input(controller: controller),
              Container(
                padding: const EdgeInsets.all(10),
                height: 310,
                child: ListView.builder(
                  itemCount: instance.list.length,
                  itemBuilder: (context, index) {
                    return DismissebleItem(
                      title: instance.list[index],
                      onDismissed: (_) => instance.removeNotes(index),
                      key: ValueKey(instance.list[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          CustomIconButton(onPressed: () => instance.addNotes(controller)),
    );
  }
}
