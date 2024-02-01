import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tvs_app/Screens/AdminScreen/AllCustomer.dart';

class EditSaleInfo extends StatefulWidget {

  final List BikeSaleInfo;

  const EditSaleInfo({super.key, required this.BikeSaleInfo});

  @override
  State<EditSaleInfo> createState() => _EditSaleInfoState();
}

class _EditSaleInfoState extends State<EditSaleInfo> {

  TextEditingController BikeEngineNoController = TextEditingController();

  TextEditingController BikeChassisNoController = TextEditingController();

  TextEditingController PhoneNoController = TextEditingController();

  TextEditingController FileNoController = TextEditingController();

  TextEditingController CustomerNameController = TextEditingController();

  TextEditingController CustomerFatherNameController = TextEditingController();

  TextEditingController CustomerMotherNameController = TextEditingController();

  TextEditingController CustomerAddressController = TextEditingController();



  bool loading = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }





  @override
  Widget build(BuildContext context) {

    BikeEngineNoController.text = widget.BikeSaleInfo[0]["BikeEngineNo"];
    BikeChassisNoController.text = widget.BikeSaleInfo[0]["BikeChassisNo"];
    PhoneNoController.text = widget.BikeSaleInfo[0]["CustomerPhoneNumber"];
    FileNoController.text = widget.BikeSaleInfo[0]["BikeDeliveryNo"];
    CustomerNameController.text = widget.BikeSaleInfo[0]["CustomerName"];
    CustomerFatherNameController.text = widget.BikeSaleInfo[0]["CustomerFatherName"];
    CustomerMotherNameController.text = widget.BikeSaleInfo[0]["CustomerMotherName"];
    CustomerAddressController.text = widget.BikeSaleInfo[0]["CustomerAddress"];





    return Scaffold(
      appBar:AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title:  Text("Edit Bike Sale Information(${widget.BikeSaleInfo[0]["BikeDeliveryNo"]})",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body:loading?LinearProgressIndicator(): SingleChildScrollView(child: Column(children: [




                TextField(
                decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Bike Engine No',
                      hintText: 'Bike Engine No',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.purple),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                          ),
                      
                      
                      ),
                  controller: BikeEngineNoController,
                ),
              
              
              
              
                SizedBox(
                  height: 20,
                ),




              TextField(
                decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Bike Chassis No',
                      hintText: 'Bike Chassis No',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.purple),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                          ),
                      
                      
                      ),
                  controller: BikeChassisNoController,
                ),
              
              
              
              
                SizedBox(
                  height: 20,
                ),




                
              TextField(
                decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'File No',
                      hintText: 'File No',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.purple),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                          ),
                      
                      
                      ),
                  controller: FileNoController,
                ),
              
              
              
              
                SizedBox(
                  height: 20,
                ),




                
                
              TextField(
                decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone No',
                      hintText: 'Phone No',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.purple),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                          ),
                      
                      
                      ),
                  controller: PhoneNoController,
                ),
              
              
              
              
                SizedBox(
                  height: 20,
                ),



              TextField(
                decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Customer Name',
                      hintText: 'Customer Name',
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
                      labelText: 'Customer Father Name',
                      hintText: 'Customer Father Name',
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
                      labelText: 'Customer Mother Name',
                      hintText: 'Customer Mother Name',
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
                      labelText: 'Customer Address',
                      hintText: 'Customer Address',
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
                  height: 20,
                ),



              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  ElevatedButton(onPressed: () async{

              
                    setState(() {
                      loading = true;
                    });


                final docUser = FirebaseFirestore.instance.collection("BikeSaleInfo").doc(widget.BikeSaleInfo[0]["SaleID"]);

                  final UpadateData ={
              
                  "CustomerName":CustomerNameController.text.trim().toLowerCase(),
                  "CustomerPhoneNumber":PhoneNoController.text.trim(),
                  "CustomerFatherName":CustomerFatherNameController.text.trim().toLowerCase(),
                  "CustomerMotherName":CustomerMotherNameController.text.trim().toLowerCase(),
                  "BikeEngineNo":BikeEngineNoController.text.trim(),
                  "BikeChassisNo":BikeChassisNoController.text.trim(),
                  "BikeDeliveryNo":FileNoController.text.trim(),
                  "CustomerAddress":CustomerAddressController.text.trim()

                
                };





                // user Data Update and show snackbar

                  docUser.update(UpadateData).then((value) =>    
                   setState((){

                    // Navigator.pop(context);


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllCustomer(indexNumber: "4")),
                      );


                    setState(() {
                      loading = false;
                    });


                  
                                    final snackBar = SnackBar(
                                  
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        title: 'Edit Successfull',
                                        message:
                                            'Hey Thank You. Good Job',
                          
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
                                  
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        title: 'Network Problem',
                                        message:
                                            'Something Wrong !!!',
                          
                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                        contentType: ContentType.failure,
                                      ),
                                    );
                          
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);




                   }));



                  }, child: Text("Update"))

              ],)




      ],),),
      
      );
  }
}