import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:tvs_app/Screens/AdminScreen/SingleBikeInfo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;






class UploadCustomerInfo extends StatefulWidget {


  
  final String CustomerNID;
  final String BikeName;
  final String BikeColor;
  final String BikeSalePrice;
  final String CustomerPhoneNumber;

  const UploadCustomerInfo({super.key, required this.CustomerNID, required this.BikeColor, required this.BikeName, required this.BikeSalePrice, required this.CustomerPhoneNumber});

  @override
  State<UploadCustomerInfo> createState() => _UploadCustomerInfoState();
}

class _UploadCustomerInfoState extends State<UploadCustomerInfo> {



     firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  int count = 0;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery(Context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile(context);
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera(Context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile(context);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile(Context) async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!).then((p0) =>setState(() {
        count++;

        print(p0);
      }));


     String BikeImageUrl = (await ref.getDownloadURL()).toString();
   








          saveBikeImage(String  CustomerFileUrl, CustomerNID, BikeName) async{

                      final docUser = FirebaseFirestore.instance.collection("CustomerFileInfo");

                      final jsonData ={
                        "FileName":"${count}/${destination}/${BikeName}/${DateTime.now().toString()}",
                        "CustomerFileUrl":CustomerFileUrl,
                        "BikeName":BikeName,
                        "FileUploadDateTime":DateTime.now().toString(),
                        "CustomerNID":CustomerNID
                       
                   
                      };


           await docUser.add(jsonData).then((value) =>print("Done")).onError((error, stackTrace) => print(error));



                    }







                  



                  saveBikeImage(BikeImageUrl, widget.CustomerNID, widget.BikeName);





      

      // setState(() {
      //   count++;

      
      // });


      
      
   
     
    } catch (e) {
      print('error occured');
    }
  }








  @override
  Widget build(BuildContext context) {













    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        actions: [
    IconButton(
      icon: Icon(
        Icons.save_as_outlined,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleBikeInfo(BikeName: widget.BikeName, BikeColor: widget.BikeColor, BikeSalePrice: widget.BikeSalePrice, CustomerNID: widget.CustomerNID, CustomerPhoneNumber: widget.CustomerPhoneNumber,)));
      },
    )
  ],
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Upload Customer File", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                      Container(

            color: Theme.of(context).primaryColor,
            
            
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("আপনি ${count} টি Image Upload করেছেন।", style: TextStyle(color: Colors.white),),
            )),




            
          SizedBox(height: 25,),







                    Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: CircleAvatar(
                radius: 155,
                backgroundColor: Theme.of(context).primaryColor,
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


          
          Container(

            color: Color.fromARGB(255, 245, 201, 42),
            
            
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("আপনি একাধিক Image Select করতে পারেন। আপনার Image Selection শেষ হলে Save Button এ Click করুন।", style: TextStyle(color: Colors.black),),
            )),













           SizedBox(height: 15,),



           Container(width: 150, child:TextButton(onPressed: (){


                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleBikeInfo(BikeName: widget.BikeName, BikeColor: widget.BikeColor, BikeSalePrice: widget.BikeSalePrice, CustomerNID: widget.CustomerNID, CustomerPhoneNumber: widget.CustomerPhoneNumber,)));





                        }, child: Text("Save", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                         
                backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
              ),),),









                    
                    


                  ]))),
                  
                  
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
                        imgFromGallery(context);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera(context);
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

















