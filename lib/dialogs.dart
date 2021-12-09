import 'package:flutter/material.dart';

class Dialogs extends StatefulWidget {
  const Dialogs({Key? key}) : super(key: key);

  @override
  _DialogsState createState() => _DialogsState();
}

class _DialogsState extends State<Dialogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialogs Page"),
      ),
      body: Wrap(
        spacing: 10,
        runSpacing: 5,
        children: [
          TextButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: const Text("AlertDialog"),
                        content: const Text("This is an AlertDialog"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"))
                        ],
                      );
                    });
              },
              child: const Text("AlertDialog")),
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return SimpleDialog(
                        title: const Text("SimpleDialog"),
                        children: [
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              child: Text("Chinese"),
                              padding: EdgeInsets.symmetric(vertical: 6),
                            ),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("English"),
                          )
                        ],
                      );
                    });
              },
              child: const Text("SimpleDialog")),
          TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return Dialog(
                      child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            return ListTile(
                              title: Text("Hello ListDialog $index"),
                            );
                          },
                          itemCount: 20),
                    );
                  });
            },
            child: const Text("ListDialog"),
          ),
          TextButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text("This is a BottomSheetDialog"),
                        ),
                      );
                    },
                    isDismissible: false,
                    enableDrag: false);
              },
              child: const Text("BottomSheetDialog")),
          TextButton(
              onPressed: () {
                final date = showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1970),
                    lastDate: DateTime(2050));
                date.then((value) {
                  debugPrint(value.toString());
                });
              },
              child: const Text("DatePicker"))
        ],
      ),
    );
  }
}
