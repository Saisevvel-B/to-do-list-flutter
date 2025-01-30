import 'package:flutter/material.dart';

void main() {
  runApp(mainapp());
}

class mainapp extends StatefulWidget {
  @override
  State<mainapp> createState() => _mainappState();
}

class _mainappState extends State<mainapp> {
  List<String> tasklist = [];
  TextEditingController textcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("TODO LIST-APP"),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: textcontrol,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Enter the task")),
                        ))),
                MaterialButton(
                  height: 50,
                  color: const Color.fromARGB(235, 243, 31, 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    setState(() {
                      tasklist.add(textcontrol.text);
                      textcontrol.clear();
                    });
                  },
                  child: Text(
                    "click",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: tasklist.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              tasklist[index],
                              style: TextStyle(fontSize: 20),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              tasklist.removeAt(index);
                            });
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
