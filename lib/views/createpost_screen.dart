import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
 File _image;
 TextEditingController _captionController = TextEditingController();
 String _caption ='';
 bool _isLoading = false;
  _showSelectImageDialog() {
    return Platform.isIOS ? _isIosBottomSheet() : _isAndroidBottomSheet();
  }

  _isIosBottomSheet() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text('Add Photo'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                  onPressed: () => _handleImage(ImageSource.camera), 
                  child: Text('Take Photo')),
              CupertinoActionSheetAction(
                  onPressed: () =>  _handleImage(ImageSource.gallery),
                  child: Text('Choose from Gallery')),
            ],
            cancelButton: CupertinoActionSheetAction(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancel')),
          );
        });
  }

  _isAndroidBottomSheet() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Add Photo'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Take Photo'),
                onPressed: () =>  _handleImage(ImageSource.camera),
              ),
              SimpleDialogOption(
                child: Text('Choose from Gallery'),
                onPressed: () =>  _handleImage(ImageSource.gallery),
              ),
              SimpleDialogOption(
                child: Text('Cancel', style: TextStyle(color: Colors.red)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        });
  }

  _handleImage(ImageSource source) async {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(source: source);
    if(imageFile != null){
      imageFile =await _cropImage(imageFile);
      setState(() {
        _image = imageFile;
      });
    }
  }


  _cropImage(File imageFile)async{
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0)
      );
     return croppedImage;
  }

  _submit()async{
    if (!_isLoading && _image !=null && _caption.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Create Post',
            style: GoogleFonts.abel(color: Colors.black, fontSize: 20),
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
           onPressed: () => _submit)
        ],
      ),
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Container(
            height: height,
                  child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: _showSelectImageDialog,
                  child: Container(
                    height: width,
                    width: width,
                    color: Colors.grey[300],
                    child: _image == null ?Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 100,
                    ): Image(image: FileImage(_image),
                    fit: BoxFit.cover,
                    )
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    controller: _captionController,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Caption'
                    ),
                    onChanged: (input)=> _caption = input,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
