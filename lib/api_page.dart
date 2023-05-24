import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  String? nameStudent1;

  List<String> listNameStudent = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final dio = Dio();
    final response =
        await dio.get('https://js-post-api.herokuapp.com/api/students');
    // print(response);

    final listStudent = response.data as List<dynamic>;

    // listNameStudent =
    //     listStudent.map((student) => student['name'].toString()).toList();

    for (final student in listStudent) {
      final name = student['name'];

      listNameStudent.add(name.toString());
    }

    print(listNameStudent.length);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Api Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final dio = Dio();
          final response =
              await dio.get('https://js-post-api.herokuapp.com/api/students');
          // print(response);

          final listStudent = response.data as List<dynamic>;

          // listNameStudent =
          //     listStudent.map((student) => student['name'].toString()).toList();

          for (final student in listStudent) {
            final name = student['name'];

            listNameStudent.add(name.toString());
          }

          print(listNameStudent.length);

          setState(() {});
        },
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listNameStudent.length, //1000
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  color: Colors.green, child: Text(listNameStudent[index])),
            );
          },
        ),
      ),
    );
  }
}


// Column(
//   [
//     Text(listNameStudent[1])
//     Text(listNameStudent[2])
//   ]
// )