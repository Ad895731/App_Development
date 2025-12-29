import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/storage_method.dart';
import 'package:instagram_clone/models/user.dart' as model;

class AuthMethod {
  //FirebaseAuth is a class that provides methods for authenticating users and managing their accounts. _auth is an instance of FirebaseAuth.which will help us to interact with Firebase Authentication.
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //FirebaseFirestore is a class that provides methods for interacting with Cloud Firestore, a NoSQL document database. _firestore is an instance of FirebaseFirestore which will help us to interact with the Firestore database.
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }
  //sign up user
  //here we used future because we want to return a string value after the user is signed up , future is used when we want to perform asynchronous operations , asynchronous ?
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    //Uint8List is used because we need to upload the image file to Firebase Storage
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          // ignore: unnecessary_null_comparison
          file != null) {
        // register user
        // here UserCredential is a class that contains information about the newly created user , cred is the instance of UserCredential , await is used to wait for the asynchronous operation to complete , _auth.createUserWithEmailAndPassword is a method that creates a new user with the given email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print(cred.user!.uid);
        // add user to our database
        String photoUrl = await StorageMethods().uploadProfilePic(file);
        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          photoUrl: photoUrl,
          followers: [],
          following: [],
        );
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "success";
      }
    }
    // here on is used to catch specific exceptions related to Firebase Authentication , FirebaseAuthException is a subclass of FirebaseException that represents errors that occur during authentication operations.
    // on FirebaseAuthException catch(err){
    //   if(err.code == "invalid-email"){
    //     res = "The email is badly formatted.";
    //   }
    catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
