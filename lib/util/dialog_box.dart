import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';

class DialogBox extends StatelessWidget{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purpleAccent.shade100,
      title: const Text("Add a New Task"),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      content: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.black
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.black
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
                hintText: "define task here...",
                hintStyle: const TextStyle(
                  color: Colors.white,
                )
              ),
            ),

            // SizedBox(height: 6,),
            // buttons: add & cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Add",onPressed: onSave),

                const SizedBox(width: 10,),
                // cancel button
                MyButton(text: "Cancel",onPressed: onCancel,),
              ],
            )

          ],
        ),
      ),
    );
  }
}