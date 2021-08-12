import 'package:flutter/material.dart';
import 'package:new_app/Service/database.dart';

class UpdateForm extends StatelessWidget {
  final String id;
  final String oldBName;
  final String oldSName;
  final String oldRNo;
  const UpdateForm(
      {Key key, this.id, this.oldBName, this.oldRNo, this.oldSName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController bName = TextEditingController();
    TextEditingController stdName = TextEditingController();
    TextEditingController rackNo = TextEditingController();
    bName.text = oldBName;
    stdName.text = oldSName;
    rackNo.text = oldRNo;

    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              whiteSpace(20),
              customField("Book Name", bName),
              whiteSpace(20),
              customField("Student Name", stdName),
              whiteSpace(20),
              customField("Rack No", rackNo),
              whiteSpace(20),
              MaterialButton(
                onPressed: () async {
                  await DatabaseService()
                      .updateData(id, bName.text, rackNo.text, stdName.text);
                  Navigator.pop(context);
                },
                child: Text("Update All"),
                color: Colors.orange,
              )
            ],
          ),
        ),
      ),
    ));
  }
}

TextFormField customField(String label, dynamic controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      focusColor: Colors.orange,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 2.0)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 2.0, color: Colors.orange)),
    ),
  );
}

SizedBox whiteSpace(double h) {
  return SizedBox(
    height: h,
  );
}
