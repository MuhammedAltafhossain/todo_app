import 'package:flutter/material.dart';
import 'package:todo_app/style.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List todoList = [];
  TextEditingController textEditingController = new TextEditingController();
  TextEditingController updateTextEditingController =
      new TextEditingController();

  final updateItemKey = GlobalKey<FormState>();

  void itemAddList() {
    String item = textEditingController.text.trim();
    if (item.isNotEmpty) {
      todoList.add({"item": item});
    }
    textEditingController.text = '';
    setState(() {});
  }

  void deleteItem(index) {
    todoList.removeAt(index);
    setState(() {});
  }

  void editItem(index) {
    todoList.where((element) => element.id == index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                  flex: 15,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 80,
                        child: TextFormField(
                          controller: textEditingController,
                          decoration: InputDecorationStyle('Todo Text'),
                        ),
                      ),
                      Expanded(
                          flex: 25,
                          child: ElevatedButton(
                            onPressed: () {
                              itemAddList();
                            },
                            child: const Text('Submit'),
                            style: ButtonStyleApp(),
                          )),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                color: Colors.green.shade100,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Todo List',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 90,
                child: ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      final String todoItem = todoList[index]["item"];

                      return Card(
                          elevation: 12,
                          child: SizedBox50(Row(
                            children: [
                              Expanded(
                                flex: 80,
                                child: Text(
                                  todoItem,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: IconButton(
                                  onPressed: () {
                                    deleteItem(index);
                                  },
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: IconButton(
                                  onPressed: () {
                                    updateTextEditingController.text = todoItem;
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Form(
                                            key: updateItemKey,
                                            child: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    color:
                                                        Colors.green.shade100,
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        'Update',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  TextFormField(
                                                    controller:
                                                        updateTextEditingController,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please write something';
                                                      }
                                                      return null;
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText:
                                                          'Write your todo',
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      String item =
                                                          updateTextEditingController
                                                              .text
                                                              .trim();
                                                      if (updateItemKey
                                                          .currentState!
                                                          .validate()) {
                                                        todoList[index]
                                                            ["item"] = item;

                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                    child: const Text("Update"),
                                                    style: ButtonStyleApp(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  icon: const Icon(Icons.edit),
                                  color: Colors.green,
                                ),
                              )
                            ],
                          )));
                    }),
              )
            ],
          ),
        ));
  }
}
