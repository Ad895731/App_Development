import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Upload profile picture to Supabase
  /// Returns public image URL
  Future<String> uploadProfilePic(Uint8List file) async {
    try {
      // current user id
      final String uid = _auth.currentUser!.uid;

      // file path inside bucket
      final String path = '$uid.jpg';

      // upload image
      await _supabase.storage
          .from('profilePics') // bucket name
          .uploadBinary(
            path,
            file,
            fileOptions: const FileOptions(
              contentType: 'image/jpeg',
            ),
          );

      // get public URL
      final String imageUrl =
          _supabase.storage.from('profilePics').getPublicUrl(path);

      return imageUrl;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}