import 'dart:async';
import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/UploadCustomerInfo.dart';
import 'package:tvs_app/Screens/CommonScreen/LogInScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:tvs_app/Screens/DeveloperFolder/InternetChecker.dart';



class ProductSaleEditCustomer extends StatefulWidget {

  

  final String CustomerNID;
  final String CustomerName;
  final String CustomerAddress;
  final String CustomerPhoneNumber;
  final String BikeName;
  final String BikeColor;
  final String BikeModelName;
  final String BikeSalePrice;
  final String BikeId;
  final String BikeBuyingPrice;
  final String CustomerID;
  final List AllData;
  final bool AllDataEmpty;
  


  const ProductSaleEditCustomer({super.key,  required this.CustomerNID, required this.CustomerAddress, required this.CustomerName, required this.CustomerPhoneNumber, required this.BikeColor, required this.BikeModelName, required this.BikeName, required this.BikeSalePrice, required this.BikeBuyingPrice, required this.BikeId, required this.CustomerID, required this.AllData, required this.AllDataEmpty});

  @override
  State<ProductSaleEditCustomer> createState() => _ProductSaleEditCustomerState();
}

class _ProductSaleEditCustomerState extends State<ProductSaleEditCustomer> {
  TextEditingController CustomerNameController = TextEditingController();
  TextEditingController CustomerFatherNameController = TextEditingController();
  TextEditingController CustomerMotherNameController = TextEditingController();
  TextEditingController CustomerAddressController = TextEditingController();
  TextEditingController CustomerPhoneNumberController = TextEditingController();
  TextEditingController CustomerEmailController = TextEditingController();
  TextEditingController CustomerNIDController = TextEditingController();
  TextEditingController CustomerGuarantor1NameController = TextEditingController();
  TextEditingController CustomerGuarantor1NIDController = TextEditingController();
  TextEditingController CustomerGuarantor1PhoneNumberController = TextEditingController();
  TextEditingController CustomerGuarantor1AddressController = TextEditingController();

  TextEditingController CustomerGuarantor2NameController = TextEditingController();
  TextEditingController CustomerGuarantor2PhoneNumberController = TextEditingController();
  TextEditingController CustomerGuarantor2AddressController = TextEditingController();
  TextEditingController CustomerGuarantor2NIDController = TextEditingController();



String LastUpdatedCustomerImageUrl ="https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png";

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






// Internet Connection Checker

bool online = true;
Future getInternetValue() async{

bool onlineData =await getInternetConnectionChecker().getInternetConnection() ;

setState(() {
  online = onlineData;
  
});


}






@override
  void initState() {


  // var period = const Duration(seconds:1);
  //   Timer.periodic(period,(arg) {
  //                getInternetValue();
  //   });

    // TODO: implement initState
    super.initState();
  }





 
  






  @override
  Widget build(BuildContext context) {

    FocusNode myFocusNode = new FocusNode();

    bool value = false;


    // Create New Customer Page Data set to textField
    CustomerNameController.text = widget.CustomerName;
    CustomerAddressController.text = widget.CustomerAddress;
    CustomerPhoneNumberController.text = widget.CustomerPhoneNumber;
    CustomerNIDController.text = widget.CustomerNID;
   CustomerFatherNameController.text = widget.AllDataEmpty?"":widget.AllData[0]["CustomerFatherName"];
   CustomerMotherNameController.text = widget.AllDataEmpty?"":widget.AllData[0]["CustomerMotherName"];













   

    return  Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Edit Customer Account", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body:loading?Center(
        child: CircularProgressIndicator(),
      ):online==false?Center(child: Text("No Internet Connection", style: TextStyle(fontSize: 24, color: Colors.red),)):SingleChildScrollView(

              child: Padding(
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
            
             SizedBox(
                      height: 20,
                    ),
            
            
                    TextField(
                    
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Name',
           
                          hintText: 'Enter Customer Name',
            
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
                      controller: CustomerNameController,
                    ),
            
            
            
            
                 


                      SizedBox(
                      height: 20,
                    ),
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Father Name',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
                  ),
                          hintText: 'Enter Customer Father Name',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: CustomerFatherNameController,
                    ),


                    
            
            
            

             SizedBox(
                      height: 20,
                    ),
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Mother Name',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
                  ),
                          hintText: 'Enter Customer Mother Name',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: CustomerMotherNameController,
                    ),


                         SizedBox(
                      height: 20,
                    ),
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Address',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.green: Colors.black
                  ),
                          hintText: 'Enter Customer Address',
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
                      controller: CustomerAddressController,
                    ),
            
                    SizedBox(
                      height: 10,
                    ),



                    SizedBox(
                      height: 20,
                    ),
            
            
            
                    TextField(
                   
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Phone Number',
      
                          hintText: 'Enter Customer Phone Number',
            
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
                      controller: CustomerPhoneNumberController,
                    ),
            
            
            
            
                    SizedBox(
                      height: 20,
                    ),
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Email',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.green: Colors.black
                  ),
                          hintText: 'Enter Customer Email',
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
                      controller: CustomerEmailController,
                    ),
            
                    SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer NID',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.green: Colors.black
                  ),
                          hintText: 'Enter Customer NID',
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
                      controller: CustomerNIDController,
                    ),


                    
                     SizedBox(
                      height: 10,
                    ),






                    // guarantor


                     SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor1 Name',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.green: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 Name',
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
                      controller: CustomerGuarantor1NameController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),


                        SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor1 Phone Number',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.green: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 Phone Number',
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
                      controller: CustomerGuarantor1PhoneNumberController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),



                        SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor1 NID',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.green: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 NID',
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
                      controller: CustomerGuarantor1NIDController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),




    SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor1 Address',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.green: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 Address',
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
                      controller: CustomerGuarantor1AddressController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),
                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor2 Name',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.green: Colors.black
                  ),
                          hintText: 'Enter Guarantor2 Name',
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
                      controller: CustomerGuarantor2NameController,
                    ),


                        SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor2 Phone Number',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.green: Colors.black
                  ),
                          hintText: 'Enter Guarantor2 Phone Number',
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
                      controller: CustomerGuarantor2PhoneNumberController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),



    SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor2 NID',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.green: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 NID',
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
                      controller: CustomerGuarantor2NIDController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),

            
            

                SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor2 Address',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.green: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 Address',
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
                      controller: CustomerGuarantor2AddressController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),

                   










            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 150, child:TextButton(onPressed: (){







          //Update Firebase Collection Customer Data 

              Future ProductSaleEditCustomerrmation(String CustomerFatherName, String CustomerMotherName, String CustomerAddress, String CustomerEmail, String CustomerGuarantor1Name, String CustomerGuarantor1PhoneNumber, String CustomerGuarantor1NID, String CustomerGuarantor1Address, String CustomerGuarantor2Name, String CustomerGuarantor2PhoneNumber, String CustomerGuarantor2NID, String CustomerGuarantor2Address, String CustomerNID) async{


                  final docUser = FirebaseFirestore.instance.collection("customer").doc(widget.CustomerID);

                  final UpadateData ={
                  "CustomerName":CustomerNameController.text.trim().toLowerCase(),
                  "CustomerPhoneNumber":CustomerPhoneNumberController.text.trim(),
                  "CustomerFatherName":CustomerFatherName,
                  "CustomerMotherName":CustomerMotherName,
                  "CustomerEmail":CustomerEmail,
                  "CustomerAddress":CustomerAddress,
                  "CustomerGuarantor1Name":CustomerGuarantor1Name,
                  "CustomerGuarantor1NID":CustomerGuarantor1NID,
                  "CustomerGuarantor1Address": CustomerGuarantor1Address,
                  "CustomerGuarantor1PhoneNumber":CustomerGuarantor1PhoneNumber,
                  "CustomerGuarantor2Name":CustomerGuarantor2Name,
                  "CustomerGuarantor2NID":CustomerGuarantor2NID,
                  "CustomerGuarantor2Address":CustomerGuarantor2Address,
                  "CustomerGuarantor2PhoneNumber":CustomerGuarantor2PhoneNumber,
                  "CustomerImageUrl":UploadImageURl
                
                };





                // user Data Update and show snackbar

                  docUser.update(UpadateData).then((value) =>    
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UploadCustomerInfo(CustomerNID: widget.CustomerNID, BikeColor: widget.BikeColor, BikeName: widget.BikeName, BikeSalePrice: widget.BikeSalePrice, CustomerPhoneNumber: widget.CustomerPhoneNumber, BikeID: widget.BikeId, CustomerID: widget.CustomerID,)),
                      )).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                              content: const Text('Something Wrong'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            )));




              }








                          ProductSaleEditCustomerrmation(CustomerFatherNameController.text, CustomerMotherNameController.text, CustomerAddressController.text, CustomerEmailController.text, CustomerGuarantor1NameController.text, CustomerGuarantor1PhoneNumberController.text, CustomerGuarantor1NIDController.text, CustomerGuarantor1AddressController.text, CustomerGuarantor2NameController.text, CustomerGuarantor2PhoneNumberController.text, CustomerGuarantor2NIDController.text, CustomerGuarantor2AddressController.text, widget.CustomerNID);

                          

                         

                







                          // Delay call Function and go to next screen

                    //       Future.delayed(const Duration(milliseconds: 4500), () {

                    //           // Here you can write your code

                    //             setState(() {
                    
                    
                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => UploadCustomerInfo(CustomerNID: widget.CustomerNID, BikeColor: widget.BikeColor, BikeName: widget.BikeName, BikeSalePrice: widget.BikeSalePrice, CustomerPhoneNumber: widget.CustomerPhoneNumber,)),
                    //   );


                    //             });

                    //           });
                          

                        





                        }, child: Text("Save", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                         
                backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
              ),),),






              





                      ],
                    )
            
            
            
                  ],
                ),
              ),
            ),
        
        floatingActionButton: FloatingActionButton(
      onPressed: (){



        

        
          _showPicker(context);


      },
        tooltip: 'Upload Customer Image',
        child: const Icon(Icons.upload_outlined),
      ), 
      
    );


    
  }



  
   void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child:  Wrap(
                children: <Widget>[
                 ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGallery(context);
                        Navigator.of(context).pop();
                      }),
                   ListTile(
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



class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green;
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







