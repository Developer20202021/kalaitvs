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




  
   void snackShow(bool snackVisible, String CustomerPhoneNumber, String Amount, String CustomerNID, String BikeChassisNo, String BikeEngineNo, String BikeConditionMonth, String BikeName, String BikeBillPay) async{


        if (snackVisible == true) {

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          await SendSMSToCustomer(CustomerPhoneNumber, CustomerNID, Amount, BikeName, BikeEngineNo, BikeChassisNo, BikeConditionMonth, BikeBillPay);



                  Future.delayed(const Duration(milliseconds: 2500), () {

                      // Here you can write your code

                        setState(() {
                                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CustomerProfile(CustomerNID: widget.CustomerNID) ),
                      );
                        });

                      });

   
          
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


            final docUser = FirebaseFirestore.instance.collection("customer").doc(CustomerNID);

            final UpadateData ={

              "BikeChassisNo":BikeChassisNo,
              "BikeEngineNo":BikeEngineNo,
              "BikeConditionMonth":BikeConditionMonth,
              "BikeDeliveryNo":BikeDeliveryNo,
              "BikeSalePrice":BikeSalePrice,
              "BikeDeliveryDate":DateTime.now(),
              "BikeBillPay":BikeBillPay

          
          
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

                final docUser = FirebaseFirestore.instance.collection("BikeSaleInfo");

                final jsonData ={
                  
                  "CustomerNID": widget.CustomerNID,
                  "BikeChassisNo":BikeChassisNo,
                  "BikeEngineNo":BikeEngineNo,
                  "BikeDeliveryNo":BikeDeliveryNo,
                  "BikeName":widget.BikeName,
                  "BikeColor":widget.BikeColor,
                  "BikeSalePrice":widget.BikeSalePrice,
                  "BikeDeliveryDate":DateTime.now(),
                  "BikeBillPay":BikeBillPay
                };


              await docUser.doc(CustomerNID).set(jsonData).then((value) => snackShow(true, widget.CustomerPhoneNumber, widget.BikeSalePrice, CustomerNID, BikeChassisNo, BikeEngineNo, BikeConditionMonthController.text, BikeName, BikeBillPay)).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
                        content: const Text('Something Wrong!'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      )));



              }







            



            CustomerBikeSaleInfo(widget.BikeName, widget.BikeColor, widget.BikeColor, BikeEngineNoController.text, BikeDeliveryNoController.text, BikeSalePriceController.text, widget.CustomerNID, BikeBillPayController.text);



          







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