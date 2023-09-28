import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerProfile.dart';
import 'package:http/http.dart' as http;




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




  
   void snackShow(context,bool snackVisible, String CustomerPhoneNumber, String Amount, String CustomerNID, String BikeChassisNo, String BikeEngineNo, String BikeConditionMonth, String BikeName, String BikeBillPay) async{


        if (snackVisible == true) {

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // await SendSMSToCustomer(CustomerPhoneNumber, CustomerNID, BikeSalePriceController.text, BikeName, BikeEngineNo, BikeChassisNo, BikeConditionMonth, BikeBillPay);

      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CustomerProfile(CustomerNID: widget.CustomerNID) ));

                  

   
          
        }

        if (snackVisible == false) {

          ScaffoldMessenger.of(context).showSnackBar(wrongSnackBar);
          
        }

        

      }
  


  @override
  Widget build(BuildContext context) {

    FocusNode myFocusNode = new FocusNode();

    BikeNameController.text = widget.BikeName;
    BikeSalePriceController.text = widget.BikeSalePrice;
    BikeColorController.text = widget.BikeColor;
 

    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Bike Information",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(

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
        color: myFocusNode.hasFocus ? Colors.purple: Colors.black
            ),
                    hintText: 'Enter Your Bike Name',
            
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
        color: myFocusNode.hasFocus ? Colors.purple: Colors.black
            ),
                    hintText: 'Enter Chassis No',
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
        color: myFocusNode.hasFocus ? Colors.purple: Colors.black
            ),
                    hintText: 'Enter Engine No',
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
        color: myFocusNode.hasFocus ? Colors.purple: Colors.black
            ),
                    hintText: 'Enter Bike Color',
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
        color: myFocusNode.hasFocus ? Colors.purple: Colors.black
            ),
                    hintText: 'Enter Delivery No',
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
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
        ),
                hintText: 'Per Bike Sale price',
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
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
        ),
                hintText: 'জমা টাকা',
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
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
        ),
                hintText: 'Condition Month',
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
            controller: BikeConditionMonthController,
          ),
        
          SizedBox(
            height: 10,
          ),








            
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 150, child:TextButton(onPressed: () async{






          
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

            docUser.update(UpadateData).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
                        content: const Text('Customer Information Setup Seccessful! and Message Sent'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      ))).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                  
                  "CustomerNID": widget.CustomerNID,
                  "BikeChassisNo":BikeChassisNoController.text,
                  "BikeEngineNo":BikeEngineNoController.text,
                  "BikeDeliveryNo":BikeDeliveryNoController.text,
                  "BikeName":BikeNameController.text,
                  "BikeColor":BikeColorController.text,
                  "BikeSalePrice":BikeSalePriceController.text,
                  "BikeDeliveryDate":DateTime.now(),
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
                  
                };


              await docUser.doc(CustomerNID).set(jsonData).then((value) => snackShow(context,true, widget.CustomerPhoneNumber, widget.BikeSalePrice, CustomerNID, BikeChassisNo, BikeEngineNo, BikeConditionMonthController.text, BikeName, BikeBillPay)).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                        "CustomerPhoneNumber":CustomerData[0]["CustomerPhoneNumber"]


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

     
    BikequerySnapshot.docs[0].reference.update({"BikeShowroomAvailableNumber":BikeUpdateAvailableNumber.toString()}).then((value) => print("Done"));







                        
              }







            



            CustomerBikeSaleInfo(widget.BikeName, widget.BikeColor, widget.BikeColor, BikeEngineNoController.text, BikeDeliveryNoController.text, BikeSalePriceController.text, widget.CustomerNID, BikeBillPayController.text);







                          Future.delayed(const Duration(milliseconds: 2500), () {

                      // Here you can write your code

                        setState(() {
                                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CustomerProfile(CustomerNID: widget.CustomerNID) ),
                      );
                        });

                      });

          







                    // fetchAlbum();

                    
        



                  }, child: Text("Save", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                   
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
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











          
Future SendSMSToCustomer(String CustomerPhoneNumber, String CustomerNID, String Amount,String BikeName, String BikeEngineNo,String BikeChassisNo, String BikeConditionMonth, String BikeBillPay) async {

  var customerMsg = "Dear Customer আপনি TVS কালাই শুরুম থেকে ${Amount}৳ টাকায় ${BikeName} Bike ${BikeBillPay} টাকা পরিশোধ করে ক্রয় করেছেন।";



  final response = await http
      .get(Uri.parse('https://api.greenweb.com.bd/api.php?token=1006521063716953951972494eacc94f0c06da0f4d7f5e6a81d19&to=${CustomerPhoneNumber}&message=${customerMsg}'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(jsonDecode(response.body));
    
   
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}