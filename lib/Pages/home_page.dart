import 'package:flutter/material.dart';
import 'package:template/Pages/create_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Home page')),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Padding(
                      //Vill tillägga dynamisk padding med MediaQuery classen men inte säker hur man gör än :P
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                    ),
                    Expanded(child: Text('Task $index')),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ]));
            }),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 40),
          child: SizedBox(
            width: 70.0,
            height: 70.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePage()),
                );
              },
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              child: Icon(Icons.add),
            ),
          ),
        ));
  }
}
