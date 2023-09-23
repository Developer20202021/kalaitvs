import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomerPaymentAdd extends StatefulWidget {
  const CustomerPaymentAdd({super.key});

  @override
  State<CustomerPaymentAdd> createState() => _CustomerPaymentAddState();
}

class _CustomerPaymentAddState extends State<CustomerPaymentAdd> {
  
  TextEditingController CustomerNIDController = TextEditingController();
  TextEditingController CustomerPhoneNumberController = TextEditingController();
  TextEditingController PaidAmountController = TextEditingController();

  



   void snackShow(bool snackVisible, String CustomerPhoneNumber, String Amount, String CustomerNID) async{


        if (snackVisible == true) {

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // await SendSMSToCustomer(CustomerPhoneNumber, CustomerNID, Amount);
          
        }

        if (snackVisible == false) {

          ScaffoldMessenger.of(context).showSnackBar(wrongSnackBar);
          
        }

        

      }
  

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();

    dynamic paymentDate = DateTime.now();

    // date pick 

    // void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    //   // TODO: implement your code here

    //   dynamic value = args.value;
      
    //   print(value);
    //   setState(() {
    //     paymentDate = value;
    //   });
    // }






     





    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: Icon(Icons.chevron_left)),
        title: const Text(
          "Customer Payment Add",
          style: TextStyle(color: Colors.black),
        ),
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
              // Lottie.network(
              //   'https://assets8.lottiefiles.com/packages/lf20_7Ht9wn.json',
              //   width: 700,
              //   height: 200,
              // ),
             
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Customer NID',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.purple : Colors.black),
                  hintText: 'Customer NID',
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
                maxLines: 20,
                minLines: 1,
                controller: CustomerNIDController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.purple : Colors.black),
                  hintText: 'Amount',
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
                maxLines: 20,
                minLines: 1,
                controller: PaidAmountController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Customer Phone Number',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.purple : Colors.black),
                  hintText: 'Customer Phone Number',
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
                maxLines: 20,
                minLines: 1,
                controller: CustomerPhoneNumberController,
              ),
              SizedBox(
                height: 10,
              ),


              // Container(
              //   child: Text("Pick Payment Date"),
              // ),

               SizedBox(
                height: 10,
              ),








              // Container(
              //   child: SfDateRangePicker(
              //     onSelectionChanged: _onSelectionChanged,
              //     selectionMode: DateRangePickerSelectionMode.range,
              //     todayHighlightColor: Colors.purple,
              //   ),
              // ),



              SizedBox(
                height: 10,
              ),
              Container(
                width: 150,
                child: TextButton(
                  onPressed: () {




                     Future DuePaymentAdd(String CustomerNID, String CustomerPhoneNumber, String Amount) async{

                      final docUser = FirebaseFirestore.instance.collection("DuePaymentAddInfo");

                      final jsonData ={
                        "CustomerNID":CustomerNID,
                        "CustomerPhoneNumber":CustomerPhoneNumber,
                        "Amount": Amount,
                        "PaymentDate":paymentDate
                        
                      };


                    await docUser.doc(CustomerNID).set(jsonData).then((value) => snackShow(true, CustomerPhoneNumber, Amount, CustomerNID)).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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




                DuePaymentAdd(CustomerNIDController.text, CustomerPhoneNumberController.text, PaidAmountController.text);
                






                  



                 





                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.purple),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




   final snackBar = SnackBar(
            content: const Text('Customer Payment Add Successful!!!'),
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




          
Future SendSMSToCustomer(String CustomerPhoneNumber, String CustomerNID, String Amount) async {

  var customerMsg = "Dear Customer আপনি TVS কালাই শুরুমে ${CustomerNID} Account No এ ${Amount}৳ কিস্তি পরিশোধ করেছেন। ধন্যবাদ ";



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