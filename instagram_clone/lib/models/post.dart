import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final  datePublished;
  final String postUrl;
  final String profImage;
  final likes;
  Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });
  //here Map<String, dynamic> is used to convert the json data to User object, json is the parameter that contains the json data , json data means the data that is received from the server in the form of key-value pairs , toJson means the method that converts the User object to json data, so finally Map<String, dynamic> toJson() =>  will return a map of key-value pairs where the keys are strings and the values are dynamic (can be any type) and that map contain the user data in json format converted to User object
  Map<String, dynamic> toJson() => {
    "description": description,
    "uid": uid,
    "username": username,
    "postId": postId,
    "datePublished": datePublished,
    "postUrl": postUrl,
    "profImage": profImage,
    "likes": likes,
  };
  //static is used to define a method that can be called without creating an instance of the class ,
  // here fromSnap is a static method that takes a DocumentSnapshot as a parameter and returns a User object , snap is the parameter that contains the document snapshot data , DocumentSnapshot is a class that contains data read from a document in a Firestore database, static means that the method can be called without creating an instance of the User class, static user fromSnap(DocumentSnapshot snap) means that the method returns a User object created from the document snapshot data , static user fromSnap(DocumentSnapshot snap) here user is the return type of the method which is User object and that method is fromSnap and it takes DocumentSnapshot snap as parameter it is static method
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      description: snapshot['description'],
      uid: snapshot['uid'],
      username: snapshot['username'],
      postId: snapshot['postId'],
      datePublished: snapshot['datePublished'],
      postUrl: snapshot['postUrl'],
      profImage: snapshot['profImage'],
      likes: snapshot['likes'],
      
    );
  }
}
