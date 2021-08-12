import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {
  Map student;

  //Create Data
  addData(String Book_Name, String Rack_No, String Std_Name) {
    Map<String, dynamic> demoData = {
      "Book_Name": Book_Name,
      "Std_Name": Std_Name,
      "Rack_No": Rack_No,
    };

    //collection reference
    CollectionReference studentCollection =
        FirebaseFirestore.instance.collection('student');
    studentCollection.add(demoData);
  }

  //Delete data
  deleteItem(String docId) async {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection('student').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }

  //Update Data
  updateData(String docId, String bookName, String rackNo, String stdName) {
    FirebaseFirestore.instance.collection('student').doc(docId).update({
      "Book_Name": bookName,
      "Std_Name": stdName,
      "Rack_No": rackNo,
    });
  }
}
