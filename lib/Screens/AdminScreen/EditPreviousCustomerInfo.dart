import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerProfile.dart';
import 'package:tvs_app/Screens/AdminScreen/UploadCustomerInfo.dart';
import 'package:tvs_app/Screens/CommonScreen/LogInScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';





class EditPreviousCustomer extends StatefulWidget {

  

  final  CustomerNID;
  final  CustomerName;
  final  CustomerAddress;
  final  CustomerPhoneNumber;
  final  CustomerFatherName;
  final CustomerMotherName;
  final CustomerEmail;
  final CustomerGuarantor1Name;
  final CustomerGuarantor1Address;
  final CustomerGuarantor1PhoneNumber;
  final CustomerGuarantor1NID;
  final CustomerGuarantor2Name;
  final CustomerGuarantor2Address;
  final CustomerGuarantor2PhoneNumber;
  final CustomerGuarantor2NID;
  
  


  const EditPreviousCustomer({super.key,  required this.CustomerNID, required this.CustomerAddress, required this.CustomerName, required this.CustomerPhoneNumber,required this.CustomerEmail, required this.CustomerFatherName, required this.CustomerMotherName, required this.CustomerGuarantor1Name, required this.CustomerGuarantor1PhoneNumber, required this.CustomerGuarantor1Address, required this.CustomerGuarantor2Name, required this.CustomerGuarantor2PhoneNumber, required this.CustomerGuarantor2NID, required this.CustomerGuarantor2Address, required this.CustomerGuarantor1NID});

  @override
  State<EditPreviousCustomer> createState() => _EditPreviousCustomerState();
}

class _EditPreviousCustomerState extends State<EditPreviousCustomer> {
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


  bool loading = false;
  bool DataSaveLoading = false;



String LastUpdatedCustomerImageUrl ="https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png";






   firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  int count = 0;

  File? _photo;
  final ImagePicker _picker = ImagePicker();


  Future uploadFile(Context) async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

  // image loading sign
    setState(() {
      loading = true;
    });

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!).then((p0) =>setState(() {
        count++;

        print(p0);
      }));


      String CustomerImageUrl = (await ref.getDownloadURL()).toString();

     //Update Firebase Collection Customer Data 

              Future EditPreviousCustomerrmation(String CustomerImageUrl) async{


                  final docUser = FirebaseFirestore.instance.collection("customer").doc(widget.CustomerNID);

                  final UpadateData ={
                  "CustomerImageUrl":CustomerImageUrl,
               
                
                };





                // user Data Update and show snackbar

                  docUser.update(UpadateData).then((value) =>    
                  setState(() {
                    loading = false;
              LastUpdatedCustomerImageUrl = CustomerImageUrl; 
                  })).onError((error, stackTrace) => print(error));




              }








                          EditPreviousCustomerrmation(CustomerImageUrl);

















      
    } catch (e) {
      print('error occured');
    }
  }





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




  








 
  






  @override
  Widget build(BuildContext context) {

    FocusNode myFocusNode = new FocusNode();




    // Create New Customer Page Data set to textField
    CustomerNameController.text = widget.CustomerName;
    CustomerAddressController.text = widget.CustomerAddress;
    CustomerPhoneNumberController.text = widget.CustomerPhoneNumber;
    CustomerNIDController.text = widget.CustomerNID;
    CustomerEmailController.text = widget.CustomerEmail;
    CustomerFatherNameController.text = widget.CustomerFatherName;
    CustomerMotherNameController.text = widget.CustomerMotherName;
    CustomerGuarantor1NameController.text = widget.CustomerGuarantor1Name;
    CustomerGuarantor1PhoneNumberController.text = widget.CustomerGuarantor1PhoneNumber;
    CustomerGuarantor1NIDController.text = widget.CustomerGuarantor1NID;
    CustomerGuarantor1AddressController.text = widget.CustomerGuarantor1Address;
    CustomerGuarantor2NameController.text = widget.CustomerGuarantor2Name;
    CustomerGuarantor2AddressController.text = widget.CustomerGuarantor2Address;
    CustomerGuarantor2PhoneNumberController.text = widget.CustomerGuarantor2PhoneNumber;
    CustomerGuarantor2NIDController.text =widget.CustomerGuarantor2NID;


















   

    return  Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Edit Customer Account", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(

              child: DataSaveLoading?Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: const Color(0xFF1A1A3F),
          secondRingColor: const Color(0xFFEA3799),
          thirdRingColor: Colors.white,
          size: 100,
        ),
      ):Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            
                    
                    loading?Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: const Color(0xFF1A1A3F),
          rightDotColor: Colors.purple,
          size: 50,
        ),
      ):
                    Center(
                      child:  CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                          "${LastUpdatedCustomerImageUrl}",
                        ),
                      ),
                    ),
            
             SizedBox(
                      height: 20,
                    ),
            
            
                    TextField(
                      focusNode: myFocusNode,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Name',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer Name',
            
                          //  enabledBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //     ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.purple),
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
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer Father Name',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
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
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer Mother Name',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
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
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer Address',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
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
                      focusNode: myFocusNode,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Phone Number',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer Phone Number',
            
                          //  enabledBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //     ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.purple),
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
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer Email',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
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
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer NID',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
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
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 Name',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
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
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 Phone Number',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
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
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 NID',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
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
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 Address',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
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
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor2 Name',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
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
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor2 Phone Number',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
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
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 NID',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
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
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 Address',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
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



                          setState(() {
                            DataSaveLoading=true;
                          });



          //Update Firebase Collection Customer Data 

              Future EditPreviousCustomerrmation(String CustomerFatherName, String CustomerMotherName, String CustomerAddress, String CustomerEmail, String CustomerGuarantor1Name, String CustomerGuarantor1PhoneNumber, String CustomerGuarantor1NID, String CustomerGuarantor1Address, String CustomerGuarantor2Name, String CustomerGuarantor2PhoneNumber, String CustomerGuarantor2NID, String CustomerGuarantor2Address, String CustomerNID) async{


                  final docUser = FirebaseFirestore.instance.collection("customer").doc(CustomerNID);

                  final UpadateData ={
                  "CustomerFatherName":CustomerFatherNameController.text,
                  "CustomerMotherName":CustomerMotherNameController.text,
                  "CustomerEmail":CustomerEmailController.text,
                  "CustomerAddress":CustomerAddressController.text,
                  "CustomerGuarantor1Name":CustomerGuarantor1NameController.text,
                  "CustomerGuarantor1NID":CustomerGuarantor1NIDController.text,
                  "CustomerGuarantor1Address": CustomerGuarantor1AddressController.text,
                  "CustomerGuarantor1PhoneNumber":CustomerGuarantor1PhoneNumberController.text,
                  "CustomerGuarantor2Name":CustomerGuarantor2NameController.text,
                  "CustomerGuarantor2NID":CustomerGuarantor2NIDController.text,
                  "CustomerGuarantor2Address":CustomerGuarantor2AddressController.text,
                  "CustomerGuarantor2PhoneNumber":CustomerGuarantor2PhoneNumberController.text
                
                };





                // user Data Update and show snackbar

                  docUser.update(UpadateData).then((value) =>    
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CustomerProfile(CustomerNID: CustomerNID)),
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


                          setState(() {
                            DataSaveLoading=false;
                          });


              }








                          EditPreviousCustomerrmation(CustomerFatherNameController.text, CustomerMotherNameController.text, CustomerAddressController.text, CustomerEmailController.text, CustomerGuarantor1NameController.text, CustomerGuarantor1PhoneNumberController.text, CustomerGuarantor1NIDController.text, CustomerGuarantor1AddressController.text, CustomerGuarantor2NameController.text, CustomerGuarantor2PhoneNumberController.text, CustomerGuarantor2NIDController.text, CustomerGuarantor2AddressController.text, widget.CustomerNID);

                          

                         

                







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
                         
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
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



