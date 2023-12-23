import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/AllAdmin.dart';
import 'package:tvs_app/Screens/AdminScreen/AllCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerInvoice.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerProfile.dart';
import 'package:http/http.dart' as http;
import 'package:tvs_app/Screens/AdminScreen/HomeScreen.dart';
import 'package:tvs_app/Screens/CommonScreen/ProductScreen.dart';
import 'package:uuid/uuid.dart';




class SingleBikeInfo extends StatefulWidget {

  final String BikeName;
  final String BikeColor;
  final String BikeSalePrice;
  final String CustomerNID;
  final String CustomerPhoneNumber;



  const SingleBikeInfo({super.key, required this.BikeName, required this.BikeColor, required this.BikeSalePrice, required this.CustomerNID, required this.CustomerPhoneNumber});

  @override
  State<SingleBikeInfo> createState() => _SingleBikeInfoState();
}

class _SingleBikeInfoState extends State<SingleBikeInfo> {

  TextEditingController BikeNameController = TextEditingController();
  TextEditingController BikeChassisNoController = TextEditingController();
  TextEditingController BikeEngineNoController = TextEditingController();
  TextEditingController BikeColorController = TextEditingController();
  TextEditingController BikeSalePriceController = TextEditingController();
  TextEditingController BikeDeliveryNoController = TextEditingController();
  TextEditingController BikeConditionMonthController = TextEditingController();
  TextEditingController BikeBillPayController = TextEditingController();



  bool loading = false;

  var adminEmail ="";
  var adminName ="";





var uuid = Uuid();



  
  //  void snackShow(context,bool snackVisible, String CustomerPhoneNumber, String Amount, String CustomerNID, String BikeChassisNo, String BikeEngineNo, String BikeConditionMonth, String BikeName, String BikeBillPay) async{


  //       if (snackVisible == true) {

  //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //         await SendSMSToCustomer(CustomerPhoneNumber, CustomerNID, BikeSalePriceController.text, BikeName, BikeEngineNo, BikeChassisNo, BikeConditionMonth, BikeBillPay);

  //         await SendSMSToAdmin("01721915550", CustomerNID, Amount, BikeName, BikeBillPay);

          

  //     Navigator.push(context,
  //                       MaterialPageRoute(builder: (context) => CustomerProfile(CustomerNID: widget.CustomerNID) ));

                  

  //                 setState(() {
  //                           loading = false;
  //                         });
          
  //       }

  //       if (snackVisible == false) {

  //         setState(() {
  //           loading = false;
  //         });

  //         ScaffoldMessenger.of(context).showSnackBar(wrongSnackBar);
          
  //       }

        

  //     }



  @override
  void initState() {
    // TODO: implement initState
        FirebaseAuth.instance
                  .authStateChanges()
                  .listen((User? user) {
                    if (user != null) {
                      setState(() {
                        adminEmail = user.email!;
                        adminName = user.displayName!;
                      });
                    }
                  });
    super.initState();
  }
  


  @override
  Widget build(BuildContext context) {

    FocusNode myFocusNode = new FocusNode();

    var SaleID = uuid.v4();

    BikeNameController.text = widget.BikeName;
    BikeSalePriceController.text = widget.BikeSalePrice;
    // BikeColorController.text = widget.BikeColor;


    
 

    return Scaffold(
      backgroundColor: Colors.white,


      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 9),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
      
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () async{


                  FirebaseAuth.instance
                  .authStateChanges()
                  .listen((User? user) {
                    if (user == null) {
                      print('User is currently signed out!');
                    } else {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(userName: user.displayName, userEmail: user.email, indexNumber: "1",)));
                    }
                  });

                  
                   



                },
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),



              IconButton(
                enableFeedback: false,
                onPressed: () {

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductScreen(indexNumber: "2")));



                },
                icon: const Icon(
                  Icons.electric_bike_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),




              IconButton(
                enableFeedback: false,
                onPressed: () {


                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllAdmin(indexNumber: "3")));



                },
                icon: const Icon(
                  Icons.admin_panel_settings_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),


         IconButton(
                enableFeedback: false,
                onPressed: () {


                  
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllCustomer(indexNumber: "4")));




                },
                icon: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
          ),),
      ),





      
      appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Bike Information",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: loading?Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: const Color(0xFF1A1A3F),
          secondRingColor: Theme.of(context).primaryColor,
          thirdRingColor: Colors.white,
          size: 100,
        ),
      ):SingleChildScrollView(

        child:  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              
         
            
            
            
              TextField(
                focusNode: myFocusNode,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Bike Name',
                     labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
            ),
                    hintText: 'Enter Your Bike Name',
            
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
                controller: BikeNameController,
              ),
            
            
            
            
              SizedBox(
                height: 20,
              ),
            
            
            
            
            
              TextField(
                
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Chassis No',
                     labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
            ),
                    hintText: 'Enter Chassis No',
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
                controller: BikeChassisNoController,
              ),
            
              SizedBox(
                height: 10,
              ),



              TextField(
                
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Engine No',
                     labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
            ),
                    hintText: 'Enter Engine No',
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
                controller: BikeEngineNoController,
              ),
            
              SizedBox(
                height: 10,
              ),


              TextField(
               
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Bike Color',
                     labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
            ),
                    hintText: 'Enter Bike Color',
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
                controller: BikeColorController,
              ),
            
              SizedBox(
                height: 10,
              ),

              TextField(
                
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Delivery No',
                     labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
            ),
                    hintText: 'Enter Delivery No',
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
                controller: BikeDeliveryNoController,
              ),
            
              SizedBox(
                height: 10,
              ),

               TextField(
              keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Per Bike Sale price',
                 labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
        ),
                hintText: 'Per Bike Sale price',
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
            controller: BikeSalePriceController,
          ),

           SizedBox(
                height: 10,
              ),

               TextField(
              keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'জমা টাকা',
                 labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
        ),
                hintText: 'জমা টাকা',
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
            controller: BikeBillPayController,
          ),
        
        
          SizedBox(
            height: 10,
          ),


          Text("আপনি কত মাসের কিস্তিতে দিতে চান?", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),


           TextField(
              keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Condition Month',
                 labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
        ),
                hintText: 'Condition Month',
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
            controller: BikeConditionMonthController,
          ),
        
          SizedBox(
            height: 10,
          ),








            
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 150, child:TextButton(onPressed: () async{


                    setState(() {
                          loading = true;
                        });




          
          //Update Firebase Collection Customer Data 

        Future EditCustomerInformation(String CustomerNID, String BikeChassisNo, String BikeEngineNo, String BikeConditionMonth, String BikeDeliveryNo, String BikeSalePrice, String BikeBillPay) async{



           

              int BikeSalePriceInt = int.parse(BikeSalePrice);
              int BikeBillPayInt = int.parse(BikeBillPay);
              int BikePaymentDueInt =  BikeSalePriceInt - BikeBillPayInt;
              var CustomerType = "Due";

              if (BikePaymentDueInt == 0) {

                setState(() {
                  CustomerType = "Paid";
                });

                
              } else {

                CustomerType = "Due";
                
              }



              var BikePaymentDueString = BikePaymentDueInt.toString();

              int DuePaymentGivingDayInt = int.parse(DateTime.now().day.toString());

              if (DuePaymentGivingDayInt>30) {

                DuePaymentGivingDayInt = 30;
                
              }


            final docUser = FirebaseFirestore.instance.collection("customer").doc(CustomerNID);

            

            final UpadateData ={
              "BikeName":BikeNameController.text,
              "BikeColor":BikeColorController.text,
              "BikeChassisNo":BikeChassisNoController.text,
              "BikeEngineNo":BikeEngineNoController.text,
              "BikeConditionMonth":BikeConditionMonthController.text,
              "BikeDeliveryNo":BikeDeliveryNoController.text,
              "BikeSalePrice":BikeSalePriceController.text,
              "BikeDeliveryDate":DateTime.now(),
              "BikeBillPay":BikeBillPay,
              "BikePaymentDue":BikePaymentDueString,
              "CustomerType":CustomerType,
              "DuePaymentGivingDay":DuePaymentGivingDayInt.toString()
              
            

          
          
          };





          // user Data Update and show snackbar

            docUser.update(UpadateData).then((value) => setState(() async{








              await SendSMSToCustomer(widget.CustomerPhoneNumber, CustomerNID, BikeSalePriceController.text, widget.BikeName, BikeEngineNo, BikeChassisNo, BikeConditionMonth, BikeBillPay);

              await SendSMSToAdmin("", widget.CustomerPhoneNumber, widget.BikeName, BikeBillPay);









            })).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
                        content: const Text('Something Wrong!!! Try again'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      )));


        

        }








                    EditCustomerInformation(widget.CustomerNID, BikeChassisNoController.text, BikeEngineNoController.text, BikeConditionMonthController.text, BikeDeliveryNoController.text, BikeSalePriceController.text, BikeBillPayController.text);

                    

                   





            Future CustomerBikeSaleInfo(String BikeName, String BikeColor, String BikeChassisNo, String BikeEngineNo,String BikeDeliveryNo,  String BikeSalePrice, String CustomerNID, String BikeBillPay) async{



            






                int BikeSalePriceInt = int.parse(BikeSalePrice);
                int BikeBillPayInt = int.parse(BikeBillPay);
                int BikePaymentDueInt =  BikeSalePriceInt - BikeBillPayInt;
                var CustomerType = "Due";

              if (BikePaymentDueInt == 0) {

                setState(() {
                  CustomerType = "Paid";
                });

                
              } else {

                CustomerType = "Due";
                
              }
                var BikePaymentDueString = BikePaymentDueInt.toString();




                List CustomerData = [0];


      CollectionReference _collectionDataRef =
    FirebaseFirestore.instance.collection('customer');

    
    Query queryData = _collectionDataRef.where("CustomerNID", isEqualTo: CustomerNID);
    QuerySnapshot querySnapshot = await queryData.get();

    // Get data from docs and convert map to List
     CustomerData = querySnapshot.docs.map((doc) => doc.data()).toList();





                final docUser = FirebaseFirestore.instance.collection("BikeSaleInfo");

                final jsonData ={
                  "SaleID":SaleID,
                  "CustomerNID": widget.CustomerNID,
                  "BikeChassisNo":BikeChassisNoController.text,
                  "BikeEngineNo":BikeEngineNoController.text,
                  "BikeDeliveryNo":BikeDeliveryNoController.text,
                  "BikeName":BikeNameController.text,
                  "BikeColor":BikeColorController.text,
                  "BikeSalePrice":BikeSalePriceController.text,
                  "BikeDeliveryDate":DateTime.now(),
                  "BikeSaleDate":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                  "BikeSaleMonth":"${DateTime.now().month}/${DateTime.now().year}",
                  "BikeSaleYear":"${DateTime.now().year}",
                  "BikeBillPay":BikeBillPayController.text,
                  "BikePaymentDue":BikePaymentDueString,
                  "CustomerType":CustomerType,
                  "CustomerName":CustomerData[0]["CustomerName"],
                  "CustomerPhoneNumber":CustomerData[0]["CustomerPhoneNumber"],
                  "BikeConditionMonth":CustomerData[0]["BikeConditionMonth"],
                  "CustomerFatherName":CustomerData[0]["CustomerFatherName"],
                  "CustomerGuarantor1Address":CustomerData[0]["CustomerGuarantor1Address"],
                  "CustomerGuarantor1NID":CustomerData[0]["CustomerGuarantor1NID"],
                  "CustomerGuarantor1Name":CustomerData[0]["CustomerGuarantor1Name"],
                  "CustomerGuarantor1PhoneNumber":CustomerData[0]["CustomerGuarantor1PhoneNumber"],
                  "CustomerGuarantor2Address":CustomerData[0]["CustomerGuarantor2Address"],
                  "CustomerGuarantor2NID":CustomerData[0]["CustomerGuarantor2NID"],
                  "CustomerGuarantor2Name":CustomerData[0]["CustomerGuarantor2Name"],
                  "CustomerGuarantor2PhoneNumber":CustomerData[0]["CustomerGuarantor2PhoneNumber"],
                  "DuePaymentGivingDay":CustomerData[0]["DuePaymentGivingDay"],
                  "CustomerMotherName":CustomerData[0]["CustomerMotherName"],
                  "adminEmail":adminEmail,
                  "adminName":adminName
                  
                };


              await docUser.doc(SaleID).set(jsonData).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
                        content: const Text('Successfull'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      ))).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
                        content: const Text('Something Wrong!'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      )));










                      final salePrice = FirebaseFirestore.instance.collection("BikeSalePrice");

                      final saleData ={

                        "SalePrice":BikeSalePrice,
                        "DuePrice":BikePaymentDueInt.toString(),
                        "BikeSaleDate":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                        "CustomerNID":CustomerNID,
                        "CustomerPhoneNumber":CustomerData[0]["CustomerPhoneNumber"],
                        "BikeSaleMonth":"${DateTime.now().month}/${DateTime.now().year}",
                        "BikeSaleYear":"${DateTime.now().year}",
                        "adminEmail":adminEmail,
                        "adminName":adminName
                  


                      };

                    await salePrice.add(saleData).then((value) => print(""));









                    List BikeData = [0];


      CollectionReference _BikecollectionDataRef =
    FirebaseFirestore.instance.collection('product');

    
    Query BikequeryData = _BikecollectionDataRef.where("BikeName", isEqualTo: BikeName);
    QuerySnapshot BikequerySnapshot = await BikequeryData.get();

    // Get data from docs and convert map to List
     BikeData = BikequerySnapshot.docs.map((doc) => doc.data()).toList();

     var bikeAvailableNumber = BikeData[0]["BikeShowroomAvailableNumber"];

     int bikeAvailableNumberInt = int.parse(bikeAvailableNumber.toString());

     int BikeUpdateAvailableNumber = bikeAvailableNumberInt - 1;

     
    BikequerySnapshot.docs[0].reference.update({"BikeShowroomAvailableNumber":BikeUpdateAvailableNumber.toString()}).then((value) => setState(() {

                setState(() {
                        loading = false;
                      });




                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PdfPreviewPage(CustomerName: CustomerData[0]["CustomerName"], CustomerNID: widget.CustomerNID, CustomerPhoneNumber: CustomerData[0]["CustomerPhoneNumber"], CustomerFileNo: BikeDeliveryNoController.text, CustomerAddress: CustomerData[0]["CustomerAddress"], BikeName: widget.BikeName, BikeEngineNo: BikeEngineNoController.text, BikeChassisNo: BikeChassisNoController.text, BikeSalePrice: BikeSalePrice, BikeCashInAmount: BikeBillPay, BikePaymentDue: BikePaymentDueString, BikeColor: widget.BikeColor, BikeCondition: BikeConditionMonthController.text) ));
      












    },));







                        
              }







            



            CustomerBikeSaleInfo(widget.BikeName, widget.BikeColor, widget.BikeColor, BikeEngineNoController.text, BikeDeliveryNoController.text, BikeSalePriceController.text, widget.CustomerNID, BikeBillPayController.text);








          




                   



                    // fetchAlbum();

                    
        



                  }, child: Text("Save", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                   
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



  
 final snackBar = SnackBar(
            content: const Text('Customer Information Setup Seccessful!'),
            backgroundColor: (Colors.green),
            action: SnackBarAction(
              label: 'dismiss',
              onPressed: () {

                
                
              },
            ),
          );



          final wrongSnackBar = SnackBar(
            content: const Text('Something Wrong!! Try again'),
            backgroundColor: (Colors.red),
            action: SnackBarAction(
              label: 'dismiss',
              onPressed: () {
              },
            ),
          );
}



class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.purple;
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











          
Future SendSMSToCustomer(String CustomerPhoneNumber, String CustomerNID, String amount,String BikeName, String BikeEngineNo,String BikeChassisNo, String BikeConditionMonth, String BikeBillPay) async {


try {



    var customerMsg = "Dear Customer,Kalai Tvs Center থেকে ${BikeBillPay} টাকা পরিশোধ করে ${BikeName} Bike ক্রয় করেছেন। Thank You";



  final response = await http
      .get(Uri.parse('https://api.greenweb.com.bd/api.php?token=100651104321696050272e74e099c1bc81798bc3aa4ed57a8d030&to=${CustomerPhoneNumber}&message=${customerMsg}'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
   

    
    
   
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }






  
} catch (e) {
  
}


}






Future SendSMSToAdmin(String AdminPhoneNumber, String CustomerPhoneNumber, String BikeName, String BikeBillPay) async {



  try {



    var AdminMsg = "Dear Admin, Kalai Tvs Center থেকে ${BikeBillPay} টাকা পরিশোধ করে ${BikeName} Bike ক্রয় করেছেন। Phone no:$CustomerPhoneNumber}";



  final response = await http
      .get(Uri.parse('https://api.greenweb.com.bd/api.php?token=100651104321696050272e74e099c1bc81798bc3aa4ed57a8d030&to=01713773514&message=${AdminMsg}'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(jsonDecode(response.body));
    
   
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }







    
  } catch (e) {
    
  }


  
  
}