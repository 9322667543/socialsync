// ignore_for_file: prefer_interpolation_to_compose_strings, use_build_context_synchronously, use_key_in_widget_constructors

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oneview/GlobalVariables/Global.dart';
import 'package:oneview/pages/selectPlatormsPage.dart';

class PostUpload extends StatefulWidget {
  @override
  State<PostUpload> createState() => _PostUploadState();
}

class _PostUploadState extends State<PostUpload> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _hashtagController = TextEditingController();

  getMultipleFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      List<File?> file = result.paths.map((path) => File(path!)).toList();
      files = file;
      // image_url = "https://vespstaff.000webhostapp.com/" +
      //     files[0]!.path.split("/").last;
      final File fileForFtp = File(files[0]!.path.toString());
      Uint8List _bytes = await fileForFtp.readAsBytes();

// base64 encode the bytes
      // String _base64String = base64.encode(_bytes);

      // FTPConnect ftpConnect = FTPConnect('files.000webhost.com',
      //     user: 'vespstaff', pass: 'X4N61TG5QRWIeHFSNFyZ');

// connect to the server
//       await ftpConnect.connect();
//       await ftpConnect.changeDirectory('public_html');
// // get the file path

// // upload the file
//       await ftpConnect.uploadFile(fileForFtp);

// disconnect from the server
      //  await ftpConnect.disconnect();
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select atleast 1 file'),
      ));
    }
  }

  List<File?> files = [];

  List<String> hashtags = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        // title: const Text(
        //   "dashboard",
        //   style: TextStyle(
        //     color: Colors.white,
        //   ),
        // ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upload",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          getMultipleFile();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(246, 159, 29, 1),
                        ),
                        child: const Text(
                          "Choose a file",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        child: ListView.builder(
                          itemCount: files.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(files[index]!.path.split("/").last,
                                  style: const TextStyle(color: Colors.white)),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _descriptionController,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        maxLines: 4, // Larger size for description
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _hashtagController,
                              decoration: const InputDecoration(
                                hintText: 'Enter hashtag',
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              if (_hashtagController.text.isNotEmpty) {
                                setState(() {
                                  hashtags.add(_hashtagController.text);
                                  _hashtagController.clear();
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      hashtags.isEmpty
                          ? const Text("No hastags added")
                          // : Container(
                          //     padding: EdgeInsets.all(20),
                          //     color: Colors.white,
                          //     constraints: const BoxConstraints(
                          //       maxWidth: 200,
                          //     ),
                          //     child: FittedBox(
                          //       fit: BoxFit.fill,
                          //       child: Text(
                          //         ' ${hashtags.join(', ')}',
                          //         style: const TextStyle(
                          //           color: Colors.black,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          : Container(
                              height: 50,
                              child: ListView.builder(
                                itemCount: hashtags.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Text(
                                        "#${hashtags[index]}",
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          titleforpost = _titleController.text.toString();
                          Description = _descriptionController.text;
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => selectPlatformsPage(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(246, 159, 29, 1),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
