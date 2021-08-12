import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Map student;

  //Create Data
  addData(String bName, String rNo, String stdName) {
    Map<String, dynamic> demoData = {
      "Book_Name": bName,
      "Std_Name": stdName,
      "Rack_No": rNo,
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
