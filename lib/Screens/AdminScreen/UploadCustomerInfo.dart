import 'dart:convert';
import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:tvs_app/Screens/AdminScreen/FileView.dart';
import 'package:tvs_app/Screens/AdminScreen/SingleBikeInfo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:uuid/uuid.dart';
import 'package:flutter/foundation.dart' show kIsWeb;




class UploadCustomerInfo extends StatefulWidget {


  
  final String CustomerNID;
  final String BikeName;
  final String BikeColor;
  final String BikeSalePrice;
  final String CustomerPhoneNumber;
  final String BikeID;
  final String CustomerID;

  const UploadCustomerInfo({super.key, required this.CustomerNID, required this.BikeColor, required this.BikeName, required this.BikeSalePrice, required this.CustomerPhoneNumber, required this.BikeID, required this.CustomerID});

  @override
  State<UploadCustomerInfo> createState() => _UploadCustomerInfoState();
}

class _UploadCustomerInfoState extends State<UploadCustomerInfo> {

 var uuid = Uuid();
 
  TextEditingController FileNameController = TextEditingController();

    File? _photo;

  String image64 = "";

  String UploadImageURl = "";
  
 bool ImageLoading = false;

 bool loading = false;

List AllUploadImageUrl =[];


 

  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery(BuildContext context) async {
    //old
    // final pickedFile = await _picker.pickImage(source: ImageSource.gallery);


     var pickedFile = await FilePicker.platform.pickFiles();

        if (pickedFile != null) {
          print(pickedFile.files.first.name);
        }

    //old
    setState(() {
      if (pickedFile != null) {


        final bytes = Uint8List.fromList(pickedFile.files.first.bytes as List<int>);


        setState(() {
          image64 = base64Encode(bytes);
        });

        uploadFile(context);
      } else {
        print('No image selected.');
      }
    });




  }






  
  Future imgFromCamera(BuildContext context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        setState(() {
        loading = true;
      });
        uploadFile(context);
      } else {
        print('No image selected.');
      }
    });
  }





  
  Future uploadFile(BuildContext context) async {

    setState(() {
                    loading = true;
                  });


    try {


      



   var request = await http.post(Uri.parse("https://api.imgbb.com/1/upload?key=9a7a4a69d9a602061819c9ee2740be89"),  body: {
          'image':'$image64',
        } ).then((value) => setState(() {


          print(jsonDecode(value.body));



          var serverData = jsonDecode(value.body);

          var serverImageUrl = serverData["data"]["url"];

          setState(() {
            UploadImageURl = serverImageUrl;
            AllUploadImageUrl.insert(AllUploadImageUrl.length, serverImageUrl);
          });

          print(serverImageUrl);

          // updateData(serverImageUrl,context);


            setState(() {
                    loading = false;
                  });

        
             final snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Your Image Upload Successfull',
                      message:
                          'Your Image Upload Successfull',
        
                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.success,
                    ),
                  );
        
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);



        })).onError((error, stackTrace) => setState((){


      setState(() {
        loading = false;
      });




           final snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Something Wrong!!!',
                      message:
                          'Try again later',
        
                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.failure,
                    ),
                  );
        
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);






        }));




    } catch (e) {
      print(e);
    }
  }




  Future updateData(String FileID,BuildContext context) async{

    setState(() {
        loading = true;
      });



  

         final docUser = FirebaseFirestore.instance.collection("CustomerFileInfo").doc(FileID);

                  final UpadateData ={
                    "FileID":FileID,
                    "FileUrl":UploadImageURl,
                    "FileName":FileNameController.text.trim().toLowerCase(),
                    "CustomerNID":widget.CustomerNID,
                    "CustomerPhoneNumber":widget.CustomerPhoneNumber,
                    "BikeID":widget.BikeID,
                    "CustomerID":widget.CustomerID,
                    "Date":DateTime.now().toIso8601String(),
                    "month":"${DateTime.now().month}/${DateTime.now().year}",
                    "year":"${DateTime.now().year}",

                
                };


                // user Data Update and show snackbar

                  docUser.set(UpadateData).then((value) => setState((){


                    
                    getData();


                      setState(() {
                            loading = false;
                       
                          });


                    print("Done");
 
                       final snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Your Image Upload Successfull',
                      message:
                          'Your Image Upload Successfull',
        
                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.success,
                    ),
                  );
        
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);



                  })).onError((error, stackTrace) => setState((){

                    loading = false;
      
                       final snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Image Upload Failed',
                      message:
                          'Image Upload Failed',
        
                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.failure,
                    ),
                  );
        
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);

                    print(error);

                  }));



  }





  List  AllData = [];



Future<void> getData() async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();
    
  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('CustomerFileInfo');


    Query query = _collectionRef.where("CustomerID", isEqualTo: widget.CustomerID);
    QuerySnapshot querySnapshot = await query.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();

     if (AllData.isEmpty) {

              setState(() {
                
                    loading = false;
              });


       
     } else {

     setState(() {
       AllData = querySnapshot.docs.map((doc) => doc.data()).toList();

      loading = false;
     });
       
     }



    print(AllData);
}








         




  @override
  Widget build(BuildContext context) {




  var FileID = uuid.v4();










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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleBikeInfo(BikeName: widget.BikeName, BikeColor: widget.BikeColor, BikeSalePrice: widget.BikeSalePrice, CustomerNID: widget.CustomerNID, CustomerPhoneNumber: widget.CustomerPhoneNumber, CustomerID: widget.CustomerID, BikeID: widget.BikeID,)));
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


                      Center(
                        child: Container(
                      
                                  color: Theme.of(context).primaryColor,
                                  
                                  
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("আপনি একাধিক File Upload করতে পারেন", style: TextStyle(color: Colors.white),),
                                  )),
                      ),




            
          SizedBox(height: 25,),







                  Center(
                                        child: GestureDetector(
                                                    onTap: () {
                                                      _showPicker(context);
                                                    },
                                                    child: CircleAvatar(
                                                      radius: 100,
                                                      backgroundColor: Theme.of(context).primaryColor,
                                                      child: UploadImageURl.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          "${UploadImageURl}",
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(5)),
                                        width: 200,
                                        height: 200,
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                                    ),
                                        ),
                                      ),


              

                     const SizedBox(height: 10,),


                      Center(
                        child: Container(
                          width: kIsWeb?MediaQuery.of(context).size.width/3:MediaQuery.of(context).size.width,
                          child: TextField(
                            onChanged: (value) {},
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter File Name',
                            
                              hintText: 'Enter File Name',
                            
                              //  enabledBorder: OutlineInputBorder(
                              //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                              //     ),
                              focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Theme.of(context).primaryColor),
                              ),
                              errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                              ),
                            ),
                            controller: FileNameController,
                          ),
                        ),
                      ),



                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                                                
                                                                
                                              ElevatedButton(onPressed: () async{
                                                                
                                                                
                                                updateData(FileID,context);
                                                                
                                                                
                                                                
                                              }, child: Text("Upload"))])),



                              

                                SizedBox(
                        height: 20,
                      ),

      
      
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Table(
                           border: const TableBorder(
                           horizontalInside:
                      BorderSide(color: Colors.white, width: 10.0)),
                          textBaseline: TextBaseline.ideographic,
                            children: [


                             
                    
                    
                    
                    
                          
                                TableRow(
                              
                              decoration: BoxDecoration(color: Colors.pink.shade300),
                              children: [
                                      Container(
                                        
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text("File Name", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.white),),
                                        )),
                                      
                                      
                                   


                                         
                                      Container(
                                        
                                        
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(child: Text("View", style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold, color: Colors.white),)),
                                        )),





                                      
                                     


                                        
                                        
                                        
                                         Container(
                                        
                                        
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(child: Text("Delete", style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold, color: Colors.white),)),
                                        )),
                                    
                                    ]),




                            for(int i=0; i<AllData.length; i++)
                                    
                                TableRow(
                              
                              decoration: BoxDecoration(color: Colors.grey[100]),
                              children: [
                                      Container(
                                        
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${AllData[i]["FileName"].toString().toUpperCase()}", style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, ),),
                                        )),
                                      
                                    

                                         
                                      Container(
                                        
                                        
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {

                                    
                                     Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                       FileView(FileName: AllData[i]["FileName"], FileUrl: AllData[i]["FileUrl"])),
                                              );
                                              

                                            },
                                            child: Text("View", style: const TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,),)),
                                        )),


                                 


                                         
                                   


                                         
                                   




                                          Container(
                                        
                                        
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: IconButton(onPressed: (){

                   showDialog(
                    context: context,
                    builder: (context) {
                  

                      return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                                              title:const Text('Delete'),
                                              content:const Text('Are you Sure You want to Delete it?'),
                                              actions: [
                                                ElevatedButton(
                                                
                                                  onPressed: () {

                                                     Navigator.pop(context);

                                                  },
                                                  child: Text('CANCEL'),
                                                ),
                                                ElevatedButton(
                                                 
                                                  onPressed: () async{
                        

                        setState(() {

                          loading = true;
                          
                        },);
                                              
                        CollectionReference collectionRef =
                        FirebaseFirestore.instance.collection('CustomerFileInfo');
                            collectionRef.doc(AllData[i]["FileID"]).delete().then(
                                    (doc) => setState((){


                                          getData();


                                        Navigator.pop(context);





                                    final snackBar = SnackBar(
                                  
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        title: 'Delete Successfull',
                                        message:
                                            'Hey Thank You. Good Job',
                          
                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                        contentType: ContentType.success,
                                      ),
                                    );
                          
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);

                                


                                
                            



                                          setState(() {
                                              loading = false;
                                            });




                                    }),
                                    onError: (e) => setState((){


                                    


                                        Navigator.pop(context);





                                                final snackBar = SnackBar(
                                  
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        title: 'Something Wrong!!!',
                                        message:
                                            'Try again later...',
                          
                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                        contentType: ContentType.failure,
                                      ),
                                    );
                          
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);

                                


                                
                            



                                          setState(() {
                                              loading = false;
                                            });





                                    }),
                                  );




                                                  },
                                                  child: const Text('DELETE'),
                                                ),
                                              ],
                                            );});});





                                          }, icon: Icon(Icons.delete, color: Colors.red.shade400,)),
                                        )),
                                    
                                    ]),
                          
                          

                           
                            ],
                          ),
                    ),
                  ),


                    const SizedBox(height: 15,),




          
       





















                    
                    


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

















