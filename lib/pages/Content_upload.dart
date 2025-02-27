import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart'; // Uncomment for image upload
// import 'dart:io'; // Uncomment for image upload

class UploadContentPage extends StatefulWidget {
  const UploadContentPage({Key? key}) : super(key: key);

  @override
  _UploadContentPageState createState() => _UploadContentPageState();
}

class _UploadContentPageState extends State<UploadContentPage> {
  final _postController = TextEditingController();
  final _locationController = TextEditingController();

  // File? _mediaFile; // Uncomment for image/video upload
  // final ImagePicker _picker = ImagePicker(); // Uncomment for image upload

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
        centerTitle: true,
        backgroundColor: Color(0xFFD32F2F), // Use your theme color
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.post_add, color: Colors.white),
            onPressed: () {
              // Handle post submission
              // _postContent();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Post Text Field
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ]),
              child: TextField(
                controller: _postController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "What's on your mind?",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Media Upload Section
            _buildMediaUploadSection(),
            SizedBox(height: 20),

            // Location Field
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ]),
              child: TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  hintText: "Add location",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                  prefixIcon: Icon(Icons.location_on, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Post Button
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFD32F2F), Color(0xFFF44336)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ]),
              child: ElevatedButton(
                onPressed: () {
                  // Handle post submission
                  // _postContent();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Post",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Media Upload Section
  Widget _buildMediaUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add Media",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            _buildMediaButton(Icons.photo_library, "Photo"),
            SizedBox(width: 10),
            _buildMediaButton(Icons.video_library, "Video"),
          ],
        ),

        // Uncomment when Firebase integration is done
        //
        // _mediaFile != null
        //     ? Container(
        //         height: 100,
        //         width: double.infinity,
        //         margin: EdgeInsets.only(top: 10),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(15),
        //           image: DecorationImage(
        //             image: FileImage(_mediaFile!), // Display uploaded media
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       )
        //     : Container(), // Show nothing if no media is selected
      ],
    );
  }

  Widget _buildMediaButton(IconData icon, String label) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ]),
        child: TextButton(
          onPressed: () {
            // Handle media selection
            // _pickMedia();
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          child: Column(
            children: [
              Icon(icon, size: 40, color: Color(0xFFD32F2F)),
              SizedBox(height: 5),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Function to pick media (commented for now)
// Future<void> _pickMedia() async {
//   final XFile? media = await _picker.pickImage(source: ImageSource.gallery);
//   if (media != null) {
//     setState(() {
//       _mediaFile = File(media.path);
//     });
//   }
// }

// Function to post content (commented for now)
// void _postContent() {
//   if (_postController.text.isEmpty) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Please write something to post!")),
//     );
//     return;
//   }
//
//   // Save post logic here
//   // Example: Upload media to Firebase Storage, save post to Firestore, etc.
//   // Uncomment and implement Firebase code later.
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text("Post uploaded successfully!")),
//   );
//
//   // Clear fields after posting
//   _postController.clear();
//   _locationController.clear();
//   setState(() {
//     // _mediaFile = null; // Uncomment for image upload
//   });
// }
}