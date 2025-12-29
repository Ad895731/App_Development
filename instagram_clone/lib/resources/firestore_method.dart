import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:instagram_clone/resources/storage_method.dart';
import 'package:instagram_clone/models/post.dart';

class FirestoreMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = "some error occurred";
    try {
      // upload image to Supabase
      final photoUrl = await StorageMethods().uploadPostImage(file);

      final postId = const Uuid().v1();

      final post = Post(
        description: description,
        uid: uid,
        username: username,
        likes: [],
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
      );

      await _firestore.collection("posts").doc(postId).set(post.toJson());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
       await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid]),
        });
      }
      else{
       await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

// // import 'dart:typed_data';

// import 'dart:typed_data';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:uuid/uuid.dart';

// class StorageMethods {
//   final SupabaseClient _supabase = Supabase.instance.client;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   /// Upload post image to Supabase
//   /// Returns public image URL
//   Future<String> uploadPostImage(Uint8List file) async {
//     final uid = _auth.currentUser!.uid;
//     final postId = const Uuid().v1();
//     final path = '$uid/$postId.jpg';

//     await _supabase.storage
//         .from('posts')
//         .uploadBinary(
//           path,
//           file,
//           fileOptions: const FileOptions(
//             contentType: 'image/jpeg',
//           ),
//         );

//     return _supabase.storage.from('posts').getPublicUrl(path);
//   }
// }// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreMethod {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   //upload post
//   Future<String> uploadPost(String uid, String description, Uint8List file) async {
//     String res = "some error occured";
//     try {
//       String photoUrl = await StorageMethod().uploadImageToStorage("posts", file, true);
//       String postId = const Uuid().v1();
//       Post post = Post(
//         uid: uid,
//         postId: postId,
//         description: description,
//         datePublished: DateTime.now(),
//         likes: [],
//         postUrl: photoUrl,
//       );
//       await _firestore.collection("posts").doc(postId).set(post.toJson());
//       res = "success";
//     } catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }
// }
