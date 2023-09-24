
import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:tvs_app/Screens/CommonScreen/ProductScreen.dart';








class UploadBikeImage extends StatefulWidget {
  const UploadBikeImage({super.key});

  @override
  State<UploadBikeImage> createState() => _UploadBikeImageState();
}

class _UploadBikeImageState extends State<UploadBikeImage> {

   firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  int count = 0;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);

      setState(() {
        count++;
      });


      
      
   
     
    } catch (e) {
      print('error occured');
    }
  }








  




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title:  Text("Upload Bike Image ${count}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child:  Column(
        children: <Widget>[
          SizedBox(
            height: 12,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: CircleAvatar(
                radius: 155,
                backgroundColor: Colors.purple,
                child: _photo != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.file(
                          _photo!,
                          width: 400,
                          height: 400,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5)),
                        width: 400,
                        height: 400,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),

          SizedBox(height: 15,),



           Container(width: 150, child:TextButton(onPressed: (){


                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductScreen()));





                        }, child: Text("Done", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                         
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
              ),),),


           SizedBox(height: 15,),





            
          Container(

            color: Colors.purple,
            
            
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("আপনি ${count} টি Image Upload করেছেন।", style: TextStyle(color: Colors.white),),
            )),




            
          SizedBox(height: 25,),



          Container(

            color: Color.fromARGB(255, 245, 201, 42),
            
            
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("আপনি একাধিক Image Select করতে পারেন। আপনার Image Selection শেষ হলে Done Button এ Click করুন।", style: TextStyle(color: Colors.black),),
            )),


        



          
        ],
      ),)),
                 
                  
                  );
  }




  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

}


