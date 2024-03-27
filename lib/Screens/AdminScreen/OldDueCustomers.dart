import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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
  TextEditingController CommentController = TextEditingController();
  TextEditingController CustomerPhoneNoController = TextEditingController();



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





Future<void> getByPhoneNoData(String CustomerPhoneNo) async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();

    setState((){
      loading = true;
    });

  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('OldDueCustomer');

        Query query = _collectionRef.where("CustomerPhoneNo", isEqualTo: CustomerPhoneNo);


    QuerySnapshot querySnapshot = await query.get();

    // Get data from docs and convert map to List
     AllDueCustomerInfo = querySnapshot.docs.map((doc) => doc.data()).toList();

    

     if (AllDueCustomerInfo.isNotEmpty) {

      AllDueCustomerInfo.clear();

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
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   
          children: [
            Text("Old Due Customer",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),

               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   Container(
                      width: 300,
                      height: 50,
                      child: TextField(
                       
                        onChanged: (value) {},
                        keyboardType: TextInputType.multiline,
                                 
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Search By Phone No',
                   
                          hintText: 'Search By Phone No',
                   
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
                        controller: CustomerPhoneNoController,
                      ),
                    ),

                    ElevatedButton(onPressed: (){


                      getByPhoneNoData(CustomerPhoneNoController.text.trim());

                    }, child: Text("Search"))
                 ],
               ),
          ],
        ),
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
                 DataColumn2(
                   label: Text('File No'),
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
                   label: Text('Total Cash In'),
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
                         DataCell(Text(AllDueCustomerInfo[index]["FileNo"].toString())),
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerName"].toString().toUpperCase())),
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerPhoneNo"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerAddress"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerFatherName"].toString().toUpperCase())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerMotherName"].toString().toUpperCase())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["BikeSalePrice"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["DueAmount"].toString())),

                         DataCell(Text(AllDueCustomerInfo[index]["TotalCashIn"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["EngineNo"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["ChassisNo"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["SaleDate"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerType"].toString())),
           
                         DataCell(Text("Edit")),
           
                        //  DataCell(Text("Pay")),
           
                         DataCell(AllDueCustomerInfo[index]["CustomerType"]=="Paid"?Text(""):ElevatedButton(onPressed: (){
          
          
          
                                          showDialog(
                                                          context: context,
                                                          builder: (context) {
          
                                                         
                                      
          
                                         return StatefulBuilder(
                                                 builder:
                                             (context, setState) {
                                                                return AlertDialog(
                                          title: Text('SEND SMS'),
                                          
                                          content:SingleChildScrollView(child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children:[



                                       
                                       
                                        Container(
                                          width: 400,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                       
                                            children: [
                                          

                                    Text("Dear Customer, KALAI TVS CENTER এ নিয়মিত  কিস্তি পরিশোধ করুন।আপনার বকেয়া ${AllDueCustomerInfo[index]["DueAmount"]}"),


                               
                                          
                                          
                                      ElevatedButton(onPressed: () async{


                           String msgTxt = "Dear Customer, KALAI TVS CENTER এ নিয়মিত  কিস্তি পরিশোধ করুন।আপনার বকেয়া ${AllDueCustomerInfo[index]["DueAmount"]}";
                                      
                            final response = await http
                                .get(Uri.parse('https://api.greenweb.com.bd/api.php?token=1024519252916991043295858a1b3ac3cb09ae52385b1489dff95&to=${AllDueCustomerInfo[index]["CustomerPhoneNo"]}&message=${msgTxt}'));

                                    // Navigator.pop(context);

                            if (response.statusCode == 200) {
                              // If the server did return a 200 OK response,
                              // then parse the JSON.
                          Navigator.pop(context);

                                final snackBar = SnackBar(
                                        
                                        elevation: 0,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                        titleFontSize: 12,
                                        title: 'successfull',
                                        message: 'Hey Thank You. Good Job',

                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                        contentType: ContentType.success,
                                                ),
                                            );

                    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
                            
                            } else {

                      Navigator.pop(context);

                                final snackBar = SnackBar(
                                        
                                        elevation: 0,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                        titleFontSize: 12,
                                        title: 'Network Problem or Balance is very low',
                                        message: 'Network Problem or Balance is very low',

                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                        contentType: ContentType.failure,
                                                ),
                                            );

                    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
                              // If the server did not return a 200 OK response,
                              // then throw an exception.
                              throw Exception('Failed to load album');
                            }



                                                          }, child: Text("Send")),

                                          ],),
                                        )





                                            ])));});});}, child: Text("Send"),)),








           
                         DataCell(ElevatedButton(onPressed: (){
          
          
          
                                          showDialog(
                                                          context: context,
                                                          builder: (context) {
          
                                                         
                                      
          
                                                            return StatefulBuilder(
                                                              builder:
                                                                  (context, setState) {
                                                                return AlertDialog(
                                          title: Text('Comments'),
                                          
                                          content:SingleChildScrollView(child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children:[

                                            Text("${AllDueCustomerInfo[index]["Comment"]}", style: TextStyle(overflow: TextOverflow.clip, ),),


                                       
                                       
                                        Container(
                                          width: 400,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                       
                                            children: [
                                          
                                          
                                                                            
                                                         SizedBox(
                                                            height: 10,
                                                          ),
                                          
                                          
                                                           TextField(
                                                              keyboardType: TextInputType.multiline,
                                                              maxLines: 5,
                                                            decoration: InputDecoration(
                                                                border: OutlineInputBorder(),
                                                                labelText: 'New Comment Add',
                                          
                                                                hintText: 'New Comment Add',
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
                                                            controller: CommentController,
                                                          ),
                                          
                                          
                                          
                                                          ElevatedButton(onPressed: () async{
                                          
                                          
                                                               final docUser = FirebaseFirestore.instance.collection("OldDueCustomer").doc(AllDueCustomerInfo[index]["CustomerID"]);
                                          
                                                                // var productID = docUser.doc().id;
                                                               
                                          
                                                                final jsonData ={
                                          
                                                                    "Comment":CommentController.text.trim()
                                                            
                                                                };
                                          
                                          
                                                              await docUser.update(jsonData).then((value) =>setState((){
                                          
                                                                Navigator.pop(context);


                                                                getData();
                                          
                                          
                                                                
                                                                          final snackBar = SnackBar(
                                          
                                          elevation: 0,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                          titleFontSize: 12,
                                          title: 'Update successfull',
                                          message: 'Hey Thank You. Good Job',
                                          
                                                                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                          contentType: ContentType.success,
                                                  ),
                                              );
                                          
                                                              ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
                                          
                                          
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
                                          
                                          
                                          
                                          
                                                          }, child: Text("Update")),
                                          
                                          
                                          
                                          
                                          
                                          ],),
                                        )





                                            ])));});});}, child: Text("View"),)
                                            
                                            
                                            
                                             ),








           
                     DataCell(AllDueCustomerInfo[index]["CustomerType"]=="Paid"?Text(""):ElevatedButton(onPressed: (){
          
          
          
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
                              "FileNo":AllDueCustomerInfo[index]["FileNo"],
                              "CustomerPhoneNo":AllDueCustomerInfo[index]["CustomerPhoneNo"],
                              "DueAmount":(int.parse(AllDueCustomerInfo[index]["DueAmount"].toString())-int.parse(DueAmountPayController.text.trim().toString())).toString(),
                              "CustomerType":DueAmountInt<=0?"Paid":"Due",
                              "TotalCashIn":(int.parse(AllDueCustomerInfo[index]["TotalCashIn"].toString())+int.parse(DueAmountPayController.text.trim().toString())).toString(),
                              "CashIn":DueAmountPayController.text.trim(),
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
          
                                    var AdminMsg = "Dear Customer,KALAI TVS CENTER এ ${DueAmountPayController.text.trim()} টাকা কিস্তি পরিশোধ করেছেন।";
          
          
          
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



