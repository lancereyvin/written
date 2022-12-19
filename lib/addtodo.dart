import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {

  Database? database;
  var key = GlobalKey<FormState>();
  TextEditingController todoController =TextEditingController();

  @override
  void initState() {
    initialDatabase();
    super.initState();
  }

  initialDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Dacut.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('Create TABLE todo (id INTEGER PRIMARY KEY, content TEXT',);
    }
    );
  }

  insertData() async {
  String value = todoController.text;
  var response =  await database?.rawInsert('INSERT INTO Test(content) VALUES (?)',[value]);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddTodo'),
      ),
      body: Form(
        key: key,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: todoController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'ToDo',
                hintText: 'Anything'
              ),
              validator: (String? value) {
                return value!.isEmpty ? 'Please enter to do' : null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  insertData();
                },
                child: const Text('Submit')
            )
          ],
        ),
      ),
    );
  }
}
