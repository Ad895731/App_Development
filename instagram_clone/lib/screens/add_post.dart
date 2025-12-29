import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:instagram_clone/resources/firestore_method.dart';
import 'package:instagram_clone/utils/color.dart';
import 'package:instagram_clone/utils/utils.dart';

class Addpostscreen extends StatefulWidget {
  const Addpostscreen({super.key});

  @override
  State<Addpostscreen> createState() => _AddpostscreenState();
}

class _AddpostscreenState extends State<Addpostscreen> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();
  bool isLoading = false;

  // ---------------- POST IMAGE ----------------
  void postImage(String uid, String username, String profImage) async {
    if (_file == null) {
      showSnackBar("Please select an image", context);
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      String res = await FirestoreMethod().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
        profImage,
      );

      if (res == "success") {
        if (context.mounted) {
          showSnackBar("Posted!", context);
        }
        clearImage();
      } else {
        if (context.mounted) {
          showSnackBar(res, context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(e.toString(), context);
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  // ---------------- SELECT IMAGE ----------------
  void _selectImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Take a photo'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.camera);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Choose from Gallery'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.gallery);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  // ---------------- CLEAR IMAGE ----------------
  void clearImage() {
    setState(() {
      _file = null;
      _descriptionController.clear();
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser!;

    return _file == null
        ? Center(
            child: IconButton(
              icon: const Icon(Icons.upload, size: 40),
              onPressed: () => _selectImage(context),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: clearImage,
              ),
              title: const Text('Post to'),
              actions: [
                TextButton(
                  onPressed: () =>
                      postImage(user.uid, user.username, user.photoUrl),
                  child: const Text(
                    'Post',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                if (isLoading) const LinearProgressIndicator(),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(user.photoUrl)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          hintText: 'Write a caption...',
                          border: InputBorder.none,
                        ),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.memory(_file!, fit: BoxFit.cover),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
// import 'dart:typed_data';

// import 'package:firebase_auth/firebase_auth.dart' hide User;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:instagram_clone/models/user.dart';
// import 'package:instagram_clone/provider/user_provider.dart';
// import 'package:instagram_clone/utils/color.dart';
// import 'package:instagram_clone/utils/utils.dart';
// import 'package:provider/provider.dart';
// import 'package:instagram_clone/resources/firestore_method.dart';
// import 'package:instagram_clone/resources/firestore_method.dart';

// class Addpostscreen extends StatefulWidget {
//   const Addpostscreen({super.key});

//   @override
//   State<Addpostscreen> createState() => _AddpostscreenState();
// }

// class _AddpostscreenState extends State<Addpostscreen> {
//   Uint8List? _file;
//   final TextEditingController _descriptionController = TextEditingController();
//   void postImage(String uid, String username, String profImage) async {
//     try {
//       // upload post (Supabase + Firestore)
//       String res = await FirestoreMethod().uploadPost(
//         _descriptionController.text,
//         _file!,
//         uid,
//         username,
//         profImage,
//       );

//       if (res == "success") {
//         if (context.mounted) {
//           showSnackBar(context, "Posted!");
//         }
//         clearImage();
//       } else {
//         if (context.mounted) {
//           showSnackBar(context, res);
//         }
//       }
//     } catch (e) {
//       if (context.mounted) {
//         showSnackBar(context, e.toString());
//       }
//     }
//   }

//   _selectimage(BuildContext context) async {
//     // Implement image selection logic here
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return SimpleDialog(
//           title: Text('Create a Post'),
//           children: [
//             SimpleDialogOption(
//               padding: EdgeInsets.all(20),
//               child: Text('Take a photo'),
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 // Implement image capture logic here
//                 Uint8List file = await pickImage(ImageSource.camera);
//                 setState(() {
//                   _file = file;
//                 });
//               },
//             ),
//             SimpleDialogOption(
//               padding: EdgeInsets.all(20),
//               child: Text('Choose from Gallery'),
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 // Implement image capture logic here
//                 Uint8List file = await pickImage(ImageSource.gallery);
//                 setState(() {
//                   _file = file;
//                 });
//               },
//             ),
//             SimpleDialogOption(
//               padding: EdgeInsets.all(20),
//               child: Text('Cancel'),
//               onPressed: () async {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _descriptionController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final User? user = Provider.of<UserProvider>(context).getUser;
//     ;
//     return _file == null
//         ? Container(
//             child: IconButton(
//               icon: const Icon(Icons.upload),
//               onPressed: () => _selectimage(context),
//             ),
//           )
//         : Scaffold(
//             appBar: AppBar(
//               backgroundColor: mobileBackgroundColor,
//               leading: IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.arrow_back),
//               ),
//               title: const Text('Post to'),
//               centerTitle: false,
//               actions: [
//                 TextButton(
//                   onPressed: postImage,
//                   child: Text(
//                     'Post',
//                     style: TextStyle(
//                       color: Colors.blueAccent,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             body: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: NetworkImage(user?.photoUrl ?? ''),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.3,
//                       child: TextField(
//                         controller: _descriptionController,
//                         decoration: InputDecoration(
//                           hintText: 'Write a caption...',
//                           border: InputBorder.none,
//                         ),
//                         maxLines: 8,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 45,
//                       width: 45,
//                       child: AspectRatio(
//                         aspectRatio: 487 / 451,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: MemoryImage(_file!),
//                               fit: BoxFit.cover,
//                               alignment: FractionalOffset.center,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//   }
// }
