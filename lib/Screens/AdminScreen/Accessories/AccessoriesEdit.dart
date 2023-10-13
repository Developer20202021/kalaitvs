import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/Accessories/AccessoriesScreen.dart';
import 'package:tvs_app/Screens/AdminScreen/AllAdmin.dart';
import 'package:tvs_app/Screens/AdminScreen/HomeScreen.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';




class EditAccessories extends StatefulWidget {

  final AcceessoriesID;
  final AccessoriesSalePrice;
  final AccessoriesName;
  final AccessoriesAvailableNumber;
  final ImageLink;




  const EditAccessories({super.key, required this.AcceessoriesID, required this.AccessoriesAvailableNumber, required this.AccessoriesName, required this.AccessoriesSalePrice, required this.ImageLink});

  @override
  State<EditAccessories> createState() => _EditAccessoriesState();
}

class _EditAccessoriesState extends State<EditAccessories> {

    // var uuid = Uuid();
 
  TextEditingController AccessoriesSalePriceController = TextEditingController();
  TextEditingController AccessoriesNameController = TextEditingController();
  TextEditingController AccessoriesAvailableNumberController = TextEditingController();
  TextEditingController ImageLinkController = TextEditingController();




  bool loading = false;








  @override
  void initState() {
    // TODO: implement initState
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      // var AccessoriesID = uuid.v4();


      AccessoriesSalePriceController.text = widget.AccessoriesSalePrice;
      AccessoriesNameController.text = widget.AccessoriesName;
      AccessoriesAvailableNumberController.text = widget.AccessoriesAvailableNumber;
      ImageLinkController.text = widget.ImageLink;









    FocusNode myFocusNode = new FocusNode();
 

    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
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
               keyboardType: TextInputType.url,
               
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Image Link',
                     labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
            ),
                    hintText: 'Image Link',
            
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
                controller: ImageLinkController,
              ),
            
            
            
            
            
            
            
            
            
            
              SizedBox(
                height: 10,
              ),
            
            
            
            
            
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 150, child:TextButton(onPressed: (){

                    setState(() {
                      loading = true;
                    });

                    final docUser = FirebaseFirestore.instance.collection("accessoriesinfo").doc(widget.AcceessoriesID);


                var AccessoriesData ={

                  "AccessoriesName":AccessoriesNameController.text.trim().toLowerCase(),
                  "AccessoriesSalePrice":AccessoriesSalePriceController.text.trim(),
                  "AccessoriesAvailableNumber":AccessoriesAvailableNumberController.text.trim(),
                  "ImageLink":ImageLinkController.text.trim(),
                  "AccessoriesID":widget.AcceessoriesID.toString()


               
                };









                 












                    docUser.update(AccessoriesData).then((value) =>setState((){



                      loading = false;




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










                  }, child: Text("Edit", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                   
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
