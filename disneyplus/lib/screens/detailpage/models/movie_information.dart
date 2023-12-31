import 'package:cloud_firestore/cloud_firestore.dart';

class MovieInformation {
  String? docID;
  String? name;
  String? runningTime;
  String? imageURL;
  bool? isSaved;
  int? openDate;
  String? genre;
  String? size;
  String? summary;
  DocumentReference? reference;

  MovieInformation(
    this.docID,
    this.name,
    this.runningTime,
    this.imageURL,
    this.isSaved,
    this.openDate,
    this.genre,
    this.size,
    this.summary,
  );

  MovieInformation.fromJson(dynamic json, this.reference) {
    docID = json['docID'];
    name = json['name'];
    runningTime = json['runningTime'];
    imageURL = json['imageURL'];
    isSaved = json['isSaved'];
    openDate = json['openDate'];
    genre = json['genre'];
    size = json['size'];
    summary = json['summary'];
  }

  MovieInformation.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data(), snapshot.reference);

  MovieInformation.fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data(), snapshot.reference);

// 파이어 베이스로 저장 할때 쓴다.
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['docID'] = docID;
    map['name'] = name;
    map['runningTime'] = runningTime;
    map['imageURL'] = imageURL;
    map['isSaved'] = isSaved;
    map['openDate'] = imageURL;
    map['genre'] = imageURL;
    map['size'] = imageURL;
    map['summary'] = imageURL;

    return map;
  }
}
