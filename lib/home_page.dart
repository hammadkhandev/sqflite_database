import 'package:flutter/material.dart';
import 'package:simple_database/data_base.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = DatabaseHelper.instance;


  Future<void> insert () async {
    User user = User(name: "First Name", value: 1);
    final id = await  dbHelper.create(user);
    print(id);
  }

  Future<void> read () async {
    User user ;
    user = await dbHelper.readUser(1);
    print('user id: ${ user.id} user value: ${user.value} user ${user.name}');
  }

  Future<void> readAll() async {
    List<User> userAll;
    userAll = await  dbHelper.readAllUsers();
    userAll.forEach((element) {
      print(element.name);
      print(element.value);
      print(element.id);
    });
  }


  Future<void> update ()  async{
    User user = User(name: "name", value: 1, id: 1);
    final res = await dbHelper.update(user);
    print(res);
  }

  Future<void> delete () async {
    final res = await dbHelper.delete(1);
    print(res);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.lightGreen.shade500,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.lightGreen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4
                  )
              ),
              child: MaterialButton(onPressed: insert,
                child: const Text("Insert"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4
                  )
              ),
              child: MaterialButton(onPressed: read,
                child: const Text("Read"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4
                  )
              ),
              child: MaterialButton(onPressed: readAll,
                child: const Text("Read all"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4
                  )
              ),
              child: MaterialButton(onPressed: update,
                child: const Text("Update"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4
                  )
              ),
              child: MaterialButton(onPressed: delete,
                child: const Text("Delete"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}