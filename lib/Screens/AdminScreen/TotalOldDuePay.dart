import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:tvs_app/Screens/AdminScreen/AllPDF/OldDueCashMemo.dart';
import 'package:tvs_app/Screens/AdminScreen/SingleCustomer.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:uuid/uuid.dart';



class TotalOldDuePay extends StatefulWidget {




  const TotalOldDuePay({super.key,});

  @override
  State<TotalOldDuePay> createState() => _TotalOldDuePayState();
}

class _TotalOldDuePayState extends State<TotalOldDuePay> {

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
    FirebaseFirestore.instance.collection('OldCustomerDuePay');


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
    FirebaseFirestore.instance.collection('OldCustomerDuePay');

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
            Text("পরিশোধিত বকেয়া",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),

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
                   label: Text('Cash In'),
                 ),

                 DataColumn(
                   label: Text('Total Cash In'),
                 ),

                 DataColumn(
                   label: Text('Due Amount'),
                 ),

                 DataColumn(
                   label: Text('Customer Type'),
                 ),

                 DataColumn(
                   label: Text('Date'),
                 ),
                 DataColumn(
                   label: Text('Print'),
                 ),

          
           
               ],
               rows: List<DataRow>.generate(
                   AllDueCustomerInfo.length,
                   (index) => DataRow(cells: [
                         DataCell(Text('${index+1}')),
                         DataCell(Text(AllDueCustomerInfo[index]["FileNo"].toString())),
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerName"].toString().toUpperCase())),
                         DataCell(Text(AllDueCustomerInfo[index]["CustomerPhoneNo"].toString())),

                        DataCell(Text(AllDueCustomerInfo[index]["Cash In"].toString())),

                        

                         DataCell(Text(AllDueCustomerInfo[index]["TotalCashIn"].toString())),


                          DataCell(Text(AllDueCustomerInfo[index]["DueAmount"].toString())),
           

                         DataCell(Text(AllDueCustomerInfo[index]["CustomerType"].toString())),
           
                         DataCell(Text(AllDueCustomerInfo[index]["Date"].toString())),


                         DataCell(ElevatedButton(onPressed: (){


                                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => OldDueCashMemoPDF(SalesData: [AllDueCustomerInfo[index]])));



                         }, child: Text("Print"))),

                      
                       ]))),
             ),
           ),
          ),
        ),
        

          );
      
         
  
  }
}
