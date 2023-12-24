import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:tvs_app/Screens/AdminScreen/UploadBikeImage.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/foundation.dart' show kIsWeb;



class UploadProduct extends StatefulWidget {
  const UploadProduct({super.key});

  @override
  State<UploadProduct> createState() => _UploadProductState();
}

class _UploadProductState extends State<UploadProduct> {

  var uuid = Uuid();
 
  
  TextEditingController BikeTypeController = TextEditingController();
  TextEditingController BikeEngineCapacityController = TextEditingController();
  TextEditingController BikeMaximumPowerController = TextEditingController();
  TextEditingController BikeMaximumTorqueController = TextEditingController();
  TextEditingController BikeFuelSupplySystemController = TextEditingController();
  TextEditingController BikeFuelsupplysystemController = TextEditingController();
  TextEditingController BikeValvePerCylinderController = TextEditingController();
  TextEditingController BikePowertoWeightRationController = TextEditingController();
  TextEditingController BikeCoolingSystemController = TextEditingController();
  TextEditingController BikeMufflerController = TextEditingController();
  TextEditingController BikeGearBoxController = TextEditingController();
  TextEditingController BikeRearSuspensionController = TextEditingController();
  TextEditingController BikeFrameController = TextEditingController();
  TextEditingController BikeFrontSuspensionController = TextEditingController();
  TextEditingController BikeMaxSpeedController = TextEditingController();
  TextEditingController BikeBatteryRatingController = TextEditingController();
  TextEditingController BikeTailLampController = TextEditingController();
  TextEditingController BikeTyreFrontController = TextEditingController();
  TextEditingController BikeHeadlampController = TextEditingController();
  TextEditingController BikeTyreRearController = TextEditingController();
  TextEditingController BikeABSController = TextEditingController();
  TextEditingController BikeBrakeFluidController = TextEditingController();
  TextEditingController BikeBrakeFrontController = TextEditingController();
  TextEditingController BikeBrakeRearController = TextEditingController();
  TextEditingController BikeFuelTankCapacityController = TextEditingController();
  TextEditingController BikeGroundClearanceController = TextEditingController();
  TextEditingController BikeHeightController = TextEditingController();
  TextEditingController BikeLengthController = TextEditingController();
  TextEditingController BikeWidthController = TextEditingController();
  TextEditingController BikeKerbWeightController = TextEditingController();
  TextEditingController BikeSaddleHeightController = TextEditingController();
  TextEditingController BikeWheelBaseController = TextEditingController();
  TextEditingController BikeFeaturesController = TextEditingController();
  TextEditingController BikeShowroomAvailableNumberController = TextEditingController();
  TextEditingController BikeBuyingPriceController = TextEditingController();
  TextEditingController BikeSalePriceController = TextEditingController();
  TextEditingController BikeNameController = TextEditingController();
  TextEditingController ColorAvailableController = TextEditingController();
  TextEditingController YearOfManufactureController = TextEditingController();
  TextEditingController SeatingCapacityController = TextEditingController();
  

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



bool SalePriceFieldEmpty = true;

void CheckSalePriceField(){

  if (BikeSalePriceController.text.isEmpty) {

    setState(() {
      SalePriceFieldEmpty = true;
    });
    
  } else {

     setState(() {
      SalePriceFieldEmpty = false;
    });
    
  }

}




bool BuyingPriceFieldEmpty = true;

void CheckBuyingPriceField(){

  if (BikeBuyingPriceController.text.isEmpty) {

    setState(() {
      BuyingPriceFieldEmpty = true;
    });
    
  } else {

     setState(() {
      BuyingPriceFieldEmpty = false;
    });
    
  }

}



bool StockNumberEmpty = true;

void CheckStockNumberField(){

  if (BikeShowroomAvailableNumberController.text.isEmpty) {

    setState(() {
      StockNumberEmpty = true;
    });
    
  } else {

    setState(() {
      StockNumberEmpty = false;
    });
    
  }

}

bool bikeNameFieldEmpty = true;

void CheckBikeNameField(){

  if (BikeNameController.text.isEmpty) {
    setState(() {
      bikeNameFieldEmpty = true;
    });
    
  } else {

    setState(() {
      bikeNameFieldEmpty = false;
    });
    
  }

}




bool BikeColorFieldEmpty = true;

void CheckBikeColor(){

  if (ColorAvailableController.text.isEmpty) {

    setState(() {
      BikeColorFieldEmpty = true;
    });
    
  } else {
    
    setState(() {
      BikeColorFieldEmpty = false;
    });
    
  }

}





// Internet Connection Checker 
bool online = true;

// internet 

Future getConnection() async{

  final connectivityResult = await (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.mobile) {
  print("mobile");
  if (this.mounted) {

    setState(() {
    online = true;
  });
    
  }
} else if (connectivityResult == ConnectivityResult.wifi) {
   print("wifi");

  if (this.mounted) {
    setState(() {
    online = true;
  });
    
  }
  // I am connected to a wifi network.
} else if (connectivityResult == ConnectivityResult.ethernet) {
   print("Ethernet");
 if (this.mounted) {

  setState(() {
    online = true;
  });
   
 }
  // I am connected to a ethernet network.
} else if (connectivityResult == ConnectivityResult.vpn) {
   print("vpn");

if (this.mounted) {

    setState(() {
    online = true;
  });
  
}
  // I am connected to a vpn network.
  // Note for iOS and macOS:
  // There is no separate network interface type for [vpn].
  // It returns [other] on any device (also simulator)
} else if (connectivityResult == ConnectivityResult.bluetooth) {
   print("bluetooth");
 
  if (this.mounted) {

     setState(() {
    online = true;
  });
    
  }
  // I am connected to a bluetooth.
} else if (connectivityResult == ConnectivityResult.other) {
   print("other");

   if (this.mounted) {

  setState(() {
    online = true;
  });
     
   }


  // I am connected to a network which is not in the above mentioned networks.
} else if (connectivityResult == ConnectivityResult.none) {
   print("none");

if (this.mounted) {

   setState(() {
    online = false;
  });
  
}
   
  // I am not connected to any network.
}
}



// String Speed = " ";



// Future getInternetSpeed() async{


//      final url = 
//       'https://drive.google.com/file/d/1lEn1DtJQW6-nTcoS_FG7-EB3Kamy0147/view?usp=sharing'; 
//     final stopwatch = Stopwatch()..start(); 
  
//     try { 
//       final response = await http.get(Uri.parse(url)); 
  
//       if (response.statusCode == 200) { 
//         final elapsed = stopwatch.elapsedMilliseconds; 
//         final speedInKbps = 
//             ((response.bodyBytes.length / 1024) / (elapsed / 1000)) * 
//                 8; // Calculate download speed in Kbps 
  

//         setState(() {
//           Speed = "Download speed: ${speedInKbps.toStringAsFixed(2)} Kbps";
//         });
//         print(Speed);
//         // Show download speed in an AlertDialog 
//         // showDialog( 
//         //   context: context, 
//         //   builder: (BuildContext context) { 
//         //     return AlertDialog( 
//         //       title: Text('Network Speed'), // Set the dialog title 
//         //       content: Text( 
//         //           // Display download speed 
//         //           'Download speed: ${speedInKbps.toStringAsFixed(2)} Kbps'),  
//         //       actions: <Widget>[ 
//         //         TextButton( 
//         //           onPressed: () { 
//         //             Navigator.of(context).pop(); 
//         //           }, 
//         //           child: Text('OK'), // Button to close the dialog 
//         //         ), 
//         //       ], 
//         //     ); 
//         //   }, 
//         // ); 
//       } else { 
//         // Show an error dialog if the download failed 
//         // showDialog( 
//         //   context: context, 
//         //   builder: (BuildContext context) { 
//         //     return AlertDialog( 
//         //       title: Text('Error'), // Set the error dialog title 
//         //       content: Text( 
//         //           // Display error message 
//         //           'Failed to download the file. Status code: ${response.statusCode}'),  
//         //       actions: <Widget>[ 
//         //         TextButton( 
//         //           onPressed: () { 
//         //             Navigator.of(context).pop(); 
//         //           }, 
//         //           child: Text('OK'), // Button to close the dialog 
//         //         ), 
//         //       ], 
//         //     ); 
//         //   }, 
//         // ); 
//       } 
//     } catch (e) { 
//       // Show an error dialog in case of an exception 
//       // showDialog( 
//       //   context: context, 
//       //   builder: (BuildContext context) { 
//       //     return AlertDialog( 
//       //       title: Text('Error'), // Set the exception dialog title 
//       //       content: Text('Error: $e'), // Display the exception message 
//       //       actions: <Widget>[ 
//       //         TextButton( 
//       //           onPressed: () { 
//       //             Navigator.of(context).pop(); 
//       //           }, 
//       //           child: Text('OK'), // Button to close the dialog 
//       //         ), 
//       //       ], 
//       //     ); 
//       //   }, 
//       // ); 
//     } 
  
  




// }



@override
  void initState() {

    var period = const Duration(seconds:1);
    Timer.periodic(period,(arg) {
                  getConnection();
                  
    });
    // TODO: implement initState
    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    FocusNode myFocusNode = new FocusNode();

     var bikeid = uuid.v4();
 

    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Colors.green),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Upload Bike Information",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body:online==false?Center(child: Text("No Internet Connection", style: TextStyle(fontSize: 24, color: Colors.red),)): SingleChildScrollView(
        child: Container(
      
          child:  Padding(
            padding: EdgeInsets.only(left:kIsWeb?205:5, right: kIsWeb?205:5,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

            
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
                  
                  
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                                          
                                              for(int i=0; i<AllUploadImageUrl.length; i++)
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(5),
                                                    child: Image.network(
                                                      "${AllUploadImageUrl[i]}",
                                                      width: 150,
                                                      height: 50,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                              ),
                                                          
                                            ],
                                          ),
                                        ),
              
                
              
              
              SizedBox(
                  height: 20,
                ),



                TextField(
                  onChanged: (value) {
                    CheckBikeNameField();
                    CheckStockNumberField();
                    CheckBikeColor();
                    CheckSalePriceField();
                    CheckBuyingPriceField();
                  },
                 
                  decoration: InputDecoration(
                    helperStyle: TextStyle(color: Colors.red),
                    helperText: bikeNameFieldEmpty?'*Required Enter Bike Name':"",
                      border: OutlineInputBorder(),
                      labelText: 'Bike Name',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Bike Name',
              
                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.green),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                          ),
                      
                      
                      ),
                  controller: BikeNameController,
                ),
              
              
              
              
                SizedBox(
                  height: 20,
                ),
              
              
              
           
              Text("ENGINE & PERFORMANCE", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      
          SizedBox(
                  height: 20,
                ),
              
                TextField(
                 
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Type',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Type',
              
                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.green),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                          ),
                      
                      
                      ),
                  controller: BikeTypeController,
                ),
              
              
              
              
                SizedBox(
                  height: 20,
                ),
              
              
              
              
              
                TextField(

                  onChanged: (value) {
                    CheckBikeNameField();
                    CheckStockNumberField();
                    CheckBikeColor();
                    CheckSalePriceField();
                    CheckBuyingPriceField();
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Engine Capacity or CC',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Engine Capacity or CC',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeEngineCapacityController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
      
                  TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Maximum Power or Horse Power',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Maximum Power or Horse Power',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeMaximumPowerController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                  TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Maximum Torque',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Maximum Torque',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeMaximumTorqueController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
        TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Fuel supply system',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Fuel supply system',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeFuelSupplySystemController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
      
                  TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'valve per cylinder',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'valve per cylinder',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeValvePerCylinderController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
      
                  TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Power to Weight Ration',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Power to weight Ratio',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikePowertoWeightRationController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                  TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cooling System',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Cooling system',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeCoolingSystemController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
      
        TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Muffler',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Muffler',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller:BikeMufflerController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
      
                  TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Gear Box',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Gear Box',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeGearBoxController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                  TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Rear Suspension',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Rear Suspension',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeRearSuspensionController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                  TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Frame',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Frame',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeFrameController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                  
      
      
      
      
                  TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Max Speed',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Max Speed',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeMaxSpeedController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
      
                      SizedBox(
                  height: 20,
                ),
              
           
              Text("CHASSIS, SUSPENSION & ELECTRICAL", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      
          SizedBox(
                  height: 20,
                ),
      
      
      
      
                
                 
                SizedBox(
                  height: 10,
                ),
      
      
                  TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Front Suspension',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Front Suspension',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeFrontSuspensionController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Battery Rating',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Battery rating',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeBatteryRatingController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Head lamp',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Head lamp',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeHeadlampController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tail Lamp',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Tail Lamp',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeTailLampController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
      
      
                      SizedBox(
                  height: 20,
                ),
              
           
              Text("WHEEL, TYRE & BRAKE", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      
      
      
              
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tyre Front',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Tyre Front',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeTyreFrontController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
      
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tyre Rear',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Tyre Rear',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeTyreRearController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
      
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ABS',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'ABS',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeABSController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
      
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Brake Fluid',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Brake Fluid',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeBrakeFluidController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Brake Front',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Brake Front',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeBrakeFrontController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Brake Rear',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Brake Rear',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeBrakeRearController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
      
                
                      SizedBox(
                  height: 20,
                ),
              
           
              Text("DIMENSIONS, WEIGHT & FUEL TANK CAPACITY", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      
      
              
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Fuel Tank Capacity',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Fuel Tank Capacity',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeFuelTankCapacityController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
                
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ground Clearance',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Ground Clearance',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeGroundClearanceController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Height',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Height',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeHeightController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
                
      
                
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Length',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Length',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeLengthController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Width',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Width',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeWidthController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kerb Weight',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Kerb Weight',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeKerbWeightController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
      
                
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Saddle Height',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Saddle Height',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeSaddleHeightController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'WheelBase',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'WheelBase',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeWheelBaseController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                        
                      SizedBox(
                  height: 20,
                ),
              
           
              Text("FEATURES", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      
      
              
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Features',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Features',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeFeaturesController,
                ),
              
                SizedBox(
                  height: 10,
                ),



                 TextField(
                  onChanged: (value) {
                    CheckBikeNameField();
                    CheckStockNumberField();
                    CheckBikeColor();
                    CheckSalePriceField();
                    CheckBuyingPriceField();
                  },
                  decoration: InputDecoration(
                    helperStyle: TextStyle(color: Colors.red),
                    helperText: BikeColorFieldEmpty?'*Required Enter Bike Color':"",
                      border: OutlineInputBorder(),
                      labelText: 'Color Available',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Color Available',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: ColorAvailableController,
                ),
              
                SizedBox(
                  height: 10,
                ),



                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Seating Capacity',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Seating Capacity',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: SeatingCapacityController,
                ),
              
                SizedBox(
                  height: 10,
                ),




                TextField(
                    onChanged: (value) {
                    CheckBikeNameField();
                    CheckStockNumberField();
                    CheckBikeColor();
                    CheckSalePriceField();
                    CheckBuyingPriceField();
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Year of Manufacture',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Year of Manufacture',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: YearOfManufactureController,
                ),
              
                SizedBox(
                  height: 10,
                ),





                



              
              
      
      
      
      
                 SizedBox(
                  height: 20,
                ),
              
           
             Text(
                     "কত গুলো বাইক স্টক করতে চান তা নিচে যুক্ত করুন এবং বাইকের ক্রয় ও বিক্রয় মূল্য যুক্ত করুন",
                   style: const TextStyle(
                       fontSize: 14,
                       fontWeight:
                           FontWeight.bold,
                       fontFamily:
                           "Josefin Sans",
                       color: Colors.white)),
      
            
                 TextField(
                    onChanged: (value) {
                    CheckBikeNameField();
                    CheckStockNumberField();
                    CheckBikeColor();
                    CheckSalePriceField();
                    CheckBuyingPriceField();
                  },
                  
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      helperStyle: TextStyle(color: Colors.red),
                      helperText: StockNumberEmpty?'*Required Enter Bike Stock No':"",
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Number',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeShowroomAvailableNumberController,
                ),
              
                SizedBox(
                  height: 10,
                ),



                   TextField(
                 onChanged: (value) {
                    CheckBikeNameField();
                    CheckStockNumberField();
                    CheckBikeColor();
                    CheckSalePriceField();
                    CheckBuyingPriceField();
                  },
                    keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    helperStyle: TextStyle(color: Colors.red),
                    helperText: BuyingPriceFieldEmpty?'*Required Enter Bike Price':"",
                      border: OutlineInputBorder(),
                      labelText: 'Per Bike Buying Price',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Per Bike Buying Price',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeBuyingPriceController,
                ),
              
                SizedBox(
                  height: 10,
                ),


                 TextField(
                    onChanged: (value) {
                    CheckBikeNameField();
                    CheckStockNumberField();
                    CheckBikeColor();
                    CheckSalePriceField();
                    CheckBuyingPriceField();
                  },
                    keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    helperStyle: TextStyle(color: Colors.red),
                    helperText: SalePriceFieldEmpty?'*Required Enter Bike Sale Price':"",
                      border: OutlineInputBorder(),
                      labelText: 'Per Bike Sale price',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Per Bike Sale price',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: BikeSalePriceController,
                ),
              
                SizedBox(
                  height: 10,
                ),



                
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
              
              
          bikeNameFieldEmpty||BikeColorFieldEmpty||StockNumberEmpty||BuyingPriceFieldEmpty||SalePriceFieldEmpty? Text(""):Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 150, child:ElevatedButton(onPressed: (){







                        Future uploadBike() async{

                      final docUser = FirebaseFirestore.instance.collection("product");

                      // var productID = docUser.doc().id;
                      print("___________________________________________________________________________________________________${bikeid}");

                      final jsonData ={
                        "BikeName":BikeNameController.text.trim(),
                        "BikeType":BikeTypeController.text.trim(),
                        "BikeABS":BikeABSController.text.trim(),
                        "BikeBatteryRating":BikeBatteryRatingController.text.trim(),
                        "BikeBrakeFluid":BikeBrakeFluidController.text.trim(),
                        "BikeBrakeFront":BikeBrakeFrontController.text.trim(),
                        "BikeBrakeRear":BikeBrakeRearController.text.trim(),
                        "BikeBuyingPrice":BikeBuyingPriceController.text.trim(),
                        "BikeCoolingSystem":BikeCoolingSystemController.text.trim(),
                        "ColorAvailable":ColorAvailableController.text.trim(),
                        "BikeEngineCapacity":BikeEngineCapacityController.text.trim(),
                        "BikeFeatures":BikeFeaturesController.text.trim(),
                        "BikeFrame":BikeFrameController.text.trim(),
                        "BikeFrontSuspension":BikeFrontSuspensionController.text.trim(),
                        "BikeFuelSupplySystem":BikeFuelSupplySystemController.text.trim(),
                        "BikeFuelTankCapacity":BikeFuelTankCapacityController.text.trim(),
                        "BikeFuelsupplysystem":BikeFuelSupplySystemController.text.trim(),
                        "BikeGearBox":BikeGearBoxController.text.trim(),
                        "BikeGroundClearance":BikeGroundClearanceController.text.trim(),
                        "BikeHeadlamp":BikeHeadlampController.text.trim(),
                        "BikeHeight":BikeHeightController.text.trim(),
                        "BikeKerbWeight":BikeKerbWeightController.text.trim(),
                        "BikeLength":BikeLengthController.text.trim(),
                        "BikeMaxSpeed":BikeMaxSpeedController.text.trim(),
                        "BikeMaximumPower":BikeMaximumPowerController.text.trim(),
                        "BikeMaximumTorque":BikeMaximumTorqueController.text.trim(),
                        "BikeMuffler":BikeMufflerController.text.trim(),
                        "BikePowertoWeightRation":BikePowertoWeightRationController.text.trim(),


                        //

                        
                        "BikeRearSuspension":BikeRearSuspensionController.text.trim(),
                        "BikeSaddleHeight":BikeSaddleHeightController.text.trim(),
                        "BikeSalePrice":BikeSalePriceController.text.trim(),
                        "BikeShowroomAvailableNumber":BikeShowroomAvailableNumberController.text.trim(),
                        "BikeTailLamp":BikeTailLampController.text.trim(),
                        "BikeTyreFront":BikeTyreFrontController.text.trim(),
                        "BikeTyreRear":BikeTyreRearController.text.trim(),
                        "BikeValvePerCylinder":BikeValvePerCylinderController.text.trim(),
                        "BikeWheelBase":BikeWheelBaseController.text.trim(),
                        "BikeWidth":BikeWidthController.text.trim(),
                        "BikeID":bikeid,
                        "AllBikeImage":AllUploadImageUrl,
                        "SeatingCapacity":SeatingCapacityController.text.trim(),
                        "YearOfManufacture":YearOfManufactureController.text.trim()

                  
                      };


                    await docUser.doc(bikeid).set(jsonData).then((value) => setState((){


                                        AwesomeDialog(
                                            showCloseIcon: true,

                                            btnOkOnPress: () {
                                             Navigator.pop(context);
                                            },
                                        
                                            context: context,
                                            dialogType: DialogType.success,
                                            animType: AnimType.rightSlide,
                                            body: SingleChildScrollView(
                                              child: Text("Upload Successfull"))).show();

        



                    })).onError((error, stackTrace) => setState((){

                      AwesomeDialog(
                                            showCloseIcon: true,

                                            btnOkOnPress: () {
                                             Navigator.pop(context);
                                            },
                                        
                                            context: context,
                                            dialogType: DialogType.error,
                                            animType: AnimType.rightSlide,
                                            body: SingleChildScrollView(
                                              child: Text("Something Wrong!!! Try again later ${error}"))).show();


                    }));



                    }










                              uploadBike();

















            //                 Navigator.push(
            //             context,

            //  MaterialPageRoute(builder: (context) => const UploadBikeImage()),
            //           );





                    }, child: Text("Upload Product", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                     
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
          ),),),
      
      
      
      
      
      
      
      
                  ],
                ),


                SizedBox(height: 20,),
              
              
              
              ],
            ),
          ),
          ),
      ),
      
      
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






Future UploadProductInfo(String CustomerName, CustomerNID, CustomerAddress, CustomerPhoneNumber) async{

  final docUser = FirebaseFirestore.instance.collection("Bikes");

  final jsonData ={
    "CustomerName":CustomerName,
    "CustomerNID":CustomerNID,
    "CustomerAddress":CustomerAddress,
    "CustomerPhoneNumber":CustomerPhoneNumber
  };


 await docUser.doc(CustomerNID).set(jsonData);



}