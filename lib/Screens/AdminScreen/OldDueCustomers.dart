import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:tvs_app/Screens/AdminScreen/SingleCustomer.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:uuid/uuid.dart';



class OldDueCustomer extends StatefulWidget {




  const OldDueCustomer({super.key,});

  @override
  State<OldDueCustomer> createState() => _OldDueCustomerState();
}

class _OldDueCustomerState extends State<OldDueCustomer> {

   var uuid = Uuid();

  TextEditingController DueAmountPayController = TextEditingController();



  bool loading = false;




  
   // Firebase All Customer Data Load

List  AllDueCustomerInfo = [];




Future<void> getData() async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();

    setState((){
      loading = true;
    });

  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('OldDueCustomer');


    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
     AllDueCustomerInfo = querySnapshot.docs.map((doc) => doc.data()).toList();


     if (AllDueCustomerInfo.isNotEmpty) {

      setState((){
         AllDueCustomerInfo = querySnapshot.docs.map((doc) => doc.data()).toList();
        loading = false;
        
      });


       
     } else {

    setState((){
        loading = false;
      });

       
     }



    print(AllDueCustomerInfo);
}







@override
  void initState() {

    getData();
    super.initState();
  }

















  @override
  Widget build(BuildContext context) {

    var TrxID = uuid.v4();
 

    return Scaffold(
      
      backgroundColor: Colors.white,
      
      appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Old Due Customer",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: Container(

        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
             surfaceTintColor: Colors.white,
             elevation: 20,
             child: Padding(
             padding: const EdgeInsets.all(16),
               child: DataTable2(
           
                 isHorizontalScrollBarVisible: true,
                    headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                     columnSpacing: 12,
                     headingRowColor: MaterialStatePropertyAll(Colors.green),
                     horizontalMargin: 12,
                     minWidth: 2500,
                     dividerThickness: 3,
               columns: const[
                 DataColumn2(
                   label: Text('SL'),
                   size: ColumnSize.L,
                 ),
                 DataColumn(
                   label: Text('Customer Name'),
                 ),
                 DataColumn(
                   label: Text('Customer Phone No'),
                 ),
                 DataColumn(
                   label: Text('Customer Address'),
                 ),
                 DataColumn(
                   label: Text('Father Name'),
                   numeric: true,
                 ),
           
                 DataColumn(
                   label: Text('Mother Name'),
                   numeric: true,
                 ),
           
                 DataColumn(
                   label: Text('Sale Price'),
                   numeric: true,
                 ),
           
                 DataColumn(
                   label: Text('Due Amount'),
                   numeric: true,
                 ),
           
                 DataColumn(
                   label: Text('Engine No'),
                   numeric: true,
                 ),
           
                 DataColumn(
                   label: Text('Chassis No'),
                   numeric: true,
                 ),
           
                 DataColumn(
                   label: Text('Sale Date'),
                   numeric: true,
                 ),
           
           
                 DataColumn(
                   label: Text('Type'),
                   numeric: true,
                 ),
           
           
           
           
           
                 DataColumn(
                   label: Text('Edit'),
                   numeric: true,
                 ),
           
                //  DataColumn(
                //    label: Text('Pay'),
                //    numeric: true,
                //  ),
           
           
                  DataColumn(
                   label: Text('Message'),
                   numeric: true,
                 ),

          
          
          
                 
                  DataColumn(
                   label: Text('Comment'),
                   numeric: true,
                 ),


                  DataColumn(
                   label: Text('Pay'),
                   numeric: true,
                 ),
          
           
               ],
               rows: List<DataRow>.generate(
                   AllDueCustomerInfo.length,
                   (index) => DataRow(cells: [
                         DataCell(Text('${index+1}')),
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerName"].toString().toUpperCase())),
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerPhoneNo"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerAddress"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerFatherName"].toString().toUpperCase())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerMotherName"].toString().toUpperCase())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["BikeSalePrice"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["DueAmount"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["EngineNo"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["ChassisNo"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["SaleDate"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerType"].toString())),
           
                         DataCell(Text("Edit")),
           
                        //  DataCell(Text("Pay")),
           
                         DataCell(Text("Message")),
           
                         DataCell(Text("Comment")),
           
                     DataCell(ElevatedButton(onPressed: (){
          
          
          
                                          showDialog(
                                                          context: context,
                                                          builder: (context) {
          
                                                            bool loading = false;
                                      
          
                                                            return StatefulBuilder(
                                                              builder:
                                                                  (context, setState) {
                                                                return AlertDialog(
                                          title: Text('Pay Now'),
                                          content:loading?Center(child: CircularProgressIndicator(),):SingleChildScrollView(child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
          
                        
                        Container(
                            width: 300,
                            child: TextField(
                              readOnly: true,
                              onChanged: (value) {},
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Phone No: ${AllDueCustomerInfo[index]["CustomerPhoneNo"]}',
          
                                hintText: 'Phone No: ${AllDueCustomerInfo[index]["CustomerPhoneNo"]}',
          
                                //  enabledBorder: OutlineInputBorder(
                                //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                //     ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Theme.of(context).primaryColor),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                ),
                              ),
                              // controller: PhoneNoController,
                            ),
                          ),
          
                                  
                             const SizedBox(
                                        height: 20,
                                      ),
          
          
                           
                        Container(
                            width: 300,
                            child: TextField(
                              readOnly: true,
                              onChanged: (value) {},
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Total Due: ${AllDueCustomerInfo[index]["DueAmount"]}',
          
                                hintText: 'Total Due: ${AllDueCustomerInfo[index]["DueAmount"]}',
          
                                //  enabledBorder: OutlineInputBorder(
                                //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                //     ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Theme.of(context).primaryColor),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                ),
                              ),
                              // controller: DueAmountController,
                            ),
                          ),
          
                                  
                             const SizedBox(
                                        height: 20,
                                      ),
          
          
               
             
                            Container(
                            width: 300,
                            child: TextField(
               
                              onChanged: (value) {},
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Pay Due',
          
                                hintText: 'Pay Due',
          
                                //  enabledBorder: OutlineInputBorder(
                                //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                //     ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Theme.of(context).primaryColor),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                ),
                              ),
                              controller: DueAmountPayController,
                            ),
                          ),
          
                                  
                             const SizedBox(
                                        height: 20,
                                      ),
          
          

          
                                  
                             const SizedBox(
                                        height: 20,
                                      ),
          
          

          
          
                                            ],
                                          ),),
                                          actions: [
                                            ElevatedButton(
                              
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('CANCEL'),
                                            ),
                                            ElevatedButton(
                               
                                  onPressed: () async{
          
                              setState((){
                                loading = true;
                              });
          
          
                          int DueAmountInt = (int.parse(AllDueCustomerInfo[index]["DueAmount"].toString())-int.parse(DueAmountPayController.text.trim().toString()));
          
          
                          final docUser = FirebaseFirestore.instance.collection("OldCustomerDuePay").doc(TrxID);
          
                          final jsonData = {
                              "TrxID":TrxID,
                              "CustomerName":AllDueCustomerInfo[index]["CustomerName"],
                              "CustomerPhoneNo":AllDueCustomerInfo[index]["CustomerPhoneNo"],
                              "DueAmount":(int.parse(AllDueCustomerInfo[index]["DueAmount"].toString())-int.parse(DueAmountPayController.text.trim().toString())).toString(),
                              "CustomerType":DueAmountInt<=0?"Paid":"Due",
                              "TotalCashIn":(int.parse(AllDueCustomerInfo[index]["TotalCashIn"].toString())+int.parse(DueAmountPayController.text.trim().toString())).toString(),
                              "DateTime":DateTime.now().toIso8601String(),
                              "Date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"
                          };
          
          
                        await docUser.set(jsonData).then((value) => setState(() async{
          


                          
                     final CustomerInfo = FirebaseFirestore.instance.collection("OldDueCustomer").doc(AllDueCustomerInfo[index]["CustomerID"]);
          
                          final UpdateData = {
                            

                              "DueAmount":(int.parse(AllDueCustomerInfo[index]["DueAmount"].toString())-int.parse(DueAmountPayController.text.trim().toString())).toString(),
                              "CustomerType":DueAmountInt<=0?"Paid":"Due",
                              "TotalCashIn":(int.parse(AllDueCustomerInfo[index]["TotalCashIn"].toString())+int.parse(DueAmountPayController.text.trim().toString())).toString(),
                          };
          
          
                        await CustomerInfo.update(UpdateData).then((value) => setState(() async{
          



          
          
          
                              try {
          
                                    var AdminMsg = "Dear Customer,Orthee Bajaj Mart এ ${DueAmountPayController.text.trim()} টাকা কিস্তি পরিশোধ করেছেন।";
          
          
          
                                  final response = await http
                                      .get(Uri.parse('https://api.greenweb.com.bd/api.php?token=1024519252916991043295858a1b3ac3cb09ae52385b1489dff95&to=${AllDueCustomerInfo[index]["CustomerPhoneNo"]}&message=${AdminMsg}'));
          
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


                        
                          setState((){
                                loading = false;
                              });

                          getData();

                          Navigator.pop(context);

          
          
                        })).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                                  content: const Text('Something Wrong!'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                )));



          
          
          
                             

                        
                          setState((){
                                loading = false;
                              });
          
          
                        })).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                                  content: const Text('Something Wrong!'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                )));
          
                                                // Navigator.pop(context);
                                              },
                                              child: Text('Receive'),
                                            ),
                                          ],
                                        );});});
          
          
          
           
                                        }, child: Text("Pay Now"))),
                      
                       ]))),
             ),
           ),
          ),
        ),
        

          );
      
         
  
  }
}



