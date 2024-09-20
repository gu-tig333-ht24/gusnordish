import 'package:flutter/material.dart';

class ToDotile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  ToDotile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 59, 59, 59),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: (onChanged),
              side: BorderSide(
                  color: const Color.fromARGB(
                    255,
                    20,
                    20,
                    20,
                  ),
                  width: 2.0),
              activeColor: Colors.white,
              checkColor: Colors.black,
            ),

            //The task name:
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                (taskName),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    decorationColor: Colors.white,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
