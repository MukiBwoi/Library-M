import 'package:flutter/material.dart';
import 'package:new_app/Service/database.dart';
import 'package:new_app/UI/Homepage/widgets/Snackbar.dart';
import 'package:new_app/UI/Homepage/widgets/TextFormField.dart';

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
        appBar: new AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Color(0xffff5722),
          ),
        ),
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
                    elevation: 7,
                    onPressed: () async {
                      await DatabaseService().updateData(
                          id, bName.text, rackNo.text, stdName.text);
                      Navigator.pop(context);
                      showSnack(context, "Item Updated Successfully");
                    },
                    child: Text(
                      "Update All",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xffff5722),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

SizedBox whiteSpace(double h) {
  return SizedBox(
    height: h,
  );
}
