import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 59, 59, 59),
      content: SizedBox(
        height: 200,
        child: Column(children: [
          //user input
          TextField(
            decoration: InputDecoration(hintText: 'Task Name'),
          ),

          // buttons save + cancel
          Row(
            children: [

              
              //save buttoon

              //cancel Button
            ],
          )
        ]),
      ),
    );
  }
}
