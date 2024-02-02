import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/Accessories/AccessoriesScreen.dart';
import 'package:tvs_app/Screens/AdminScreen/AllAdmin.dart';
import 'package:tvs_app/Screens/AdminScreen/HomeScreen.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';




class UploadAccessories extends StatefulWidget {
  const UploadAccessories({super.key});

  @override
  State<UploadAccessories> createState() => _UploadAccessoriesState();
}

class _UploadAccessoriesState extends State<UploadAccessories> {

    var uuid = Uuid();
 
  TextEditingController AccessoriesSalePriceController = TextEditingController();
  TextEditingController AccessoriesNameController = TextEditingController();
  TextEditingController AccessoriesAvailableNumberController = TextEditingController();
  TextEditingController PartsIDController = TextEditingController();
  TextEditingController ModelController = TextEditingController();




  bool loading = false;

  bool buttonVisible = false;








  @override
  void initState() {
    // TODO: implement initState
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      var AccessoriesID = uuid.v4();

    FocusNode myFocusNode = new FocusNode();
 

    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Upload Accessories",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: loading?Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                      child: LoadingAnimationWidget.discreteCircle(
                        color: const Color(0xFF1A1A3F),
                        secondRingColor: Theme.of(context).primaryColor,
                        thirdRingColor: Colors.white,
                        size: 100,
                      ),
                    ),
              ): SingleChildScrollView(

        child:  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              
         
            
            
            
              TextField(
               
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product Name',
                     labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
            ),
                    hintText: 'Product Name',
            
                    //  enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                    //     ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                    
                    
                    ),
                controller: AccessoriesNameController,
              ),


              SizedBox(height: 8,),

              TextField(
                keyboardType: TextInputType.number,
               
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product Sale Price',
                     labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
            ),
                    hintText: 'Product Sale Price',
            
                    //  enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                    //     ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                    
                    
                    ),
                controller: AccessoriesSalePriceController,
              ),



              SizedBox(height: 8,),

              TextField(
                keyboardType: TextInputType.number,
               
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Available Number',
                     labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
            ),
                    hintText: 'Available Number',
            
                    //  enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                    //     ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                    
                    
                    ),
                controller: AccessoriesAvailableNumberController,
              ),



              SizedBox(height: 8,),

              TextField(
               keyboardType: TextInputType.name,

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Parts ID',
                     labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
            ),
                    hintText: 'Parts ID',
            
                    //  enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                    //     ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                    
                    
                    ),
                controller: PartsIDController,
              ),
            
            
              SizedBox(
                height: 10,
              ),


          
             TextField(
               keyboardType: TextInputType.name,

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Model',
                     labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
            ),
                    hintText: 'Model',
            
                    //  enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                    //     ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                    
                    
                    ),
                controller: ModelController,
              ),
            
            
              SizedBox(
                height: 10,
              ),
            
            
            
            
            
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 150, child: TextButton(onPressed: (){

                    setState(() {
                      loading = true;
                    });

                    final docUser = FirebaseFirestore.instance.collection("accessoriesinfo");


                var AccessoriesData ={

                  "AccessoriesName":AccessoriesNameController.text.trim().toLowerCase(),
                  "AccessoriesSalePrice":AccessoriesSalePriceController.text.trim(),
                  "AccessoriesAvailableNumber":AccessoriesAvailableNumberController.text.trim(),
                  "ImageLink":"https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg",
                  "AccessoriesID":AccessoriesID.toString(),
                  "PartsID":PartsIDController.text.trim(),
                  "Model":ModelController.text.trim(),


               
                };



                    docUser.doc(AccessoriesID).set(AccessoriesData).then((value) =>setState((){



                      loading = false;


              
                          final snackBar = SnackBar(
                                        
                                        elevation: 0,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                        titleFontSize: 12,
                                        title: 'successfull',
                                        message: 'Hey Thank You. Good Job',

                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                        contentType: ContentType.success,
                                                ),
                                            );

                    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);




                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccessoriesScreen()),
                );









                    })).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
                        content: const Text('Something Wrong'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      )));










                  }, child: Text("Upload", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                   
          backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
        ),),),



              




                ],
              )
            
            
            
            ],
          ),
        ),
        ),
      
      
    );
  }
}



class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xf08f00ff);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
