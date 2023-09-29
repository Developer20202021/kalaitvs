import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:tvs_app/Screens/AdminScreen/AllAdmin.dart';
import 'package:tvs_app/Screens/AdminScreen/AllCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerPaymentAdd.dart';
import 'package:tvs_app/Screens/AdminScreen/Dashboard/PerDayDuePaymentAddHistory.dart';
import 'package:tvs_app/Screens/AdminScreen/Dashboard/PerDaySalesHistory.dart';
import 'package:tvs_app/Screens/AdminScreen/MakeAdmin.dart';
import 'package:tvs_app/Screens/AdminScreen/PerDayDueCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/UploadProduct.dart';
import 'package:tvs_app/Screens/CommonScreen/ProductScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {








   // Firebase All Customer Data Load

List  AllDueCustomerData = [0];




Future<void> getDueCustomerData() async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();

  CollectionReference _collectionDueCustomerRef =
    FirebaseFirestore.instance.collection('customer');
    Query DueCustomerquery = _collectionDueCustomerRef.where("CustomerType", isEqualTo: "Due");
    QuerySnapshot DueCustomerquerySnapshot = await DueCustomerquery.get();

    // Get data from docs and convert map to List
     AllDueCustomerData = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();

     setState(() {
       AllDueCustomerData = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();
     });

    // print(AllData);
}





 // Firebase All Customer Data Load

List  AllPaidCustomerData = [0];




Future<void> getPaidCustomerData() async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();

  CollectionReference _collectionPaidCustomerRef =
    FirebaseFirestore.instance.collection('customer');
    Query PaidCustomerquery = _collectionPaidCustomerRef.where("CustomerType", isEqualTo: "Paid");
    QuerySnapshot PaidCustomerquerySnapshot = await PaidCustomerquery.get();

    // Get data from docs and convert map to List
     AllPaidCustomerData = PaidCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();

     setState(() {
       AllPaidCustomerData = PaidCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();
     });

    // print(AllData);
}



















  var PaymentDate = "${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}";


    
  // Firebase All Customer Data Load

List  AllData = [0];
    int moneyAdd = 0;

  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('DuePaymentAddInfo');

Future<void> getData(String paymentDate) async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();


    Query query = _collectionRef.where("PaymentDate", isEqualTo: paymentDate);
    QuerySnapshot querySnapshot = await query.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();


     moneyAdd = 0;

     for (var i = 0; i < AllData.length; i++) {

       var money = AllData[i]["Amount"];
      int moneyInt = int.parse(money);

      

      setState(() {
        moneyAdd = moneyAdd + moneyInt;
      });
       
     }

     print(moneyAdd);

     setState(() {
       AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
     });

    print(AllData);
}


@override
  void initState() {
    // TODO: implement initState
    getPaidCustomerData();
    getDueCustomerData();
    getData(PaymentDate);
    super.initState();
  }




















  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
       
        title: const Text("Dashboard", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        actions: [



          PopupMenuButton(
          onSelected: (value) {
            // your logic
          },
          itemBuilder: (BuildContext context) {
            return  [



              PopupMenuItem(
                onTap: (){


                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductScreen()));




                },
                child: Row(
                  children: [
                    Icon(Icons.electric_bike),
                    SizedBox(width: 5,),
                    Text("All Bikes"),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
                
                padding: EdgeInsets.all(18.0),
              ),





               PopupMenuItem(
                onTap: (){


                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllCustomer()));




                },
                child: Row(
                  children: [
                    Icon(Icons.person_4),
                    SizedBox(width: 5,),
                    Text("All Customers"),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
                
                padding: EdgeInsets.all(18.0),
              ),






              
               PopupMenuItem(
                onTap: (){


                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PerDayDuePaymentAddHistory()));


                },
                child: Row(
                  children: [
                    Icon(Icons.payment),
                    SizedBox(width: 5,),
                    Text("Due Add History"),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
                
                padding: EdgeInsets.all(18.0),
              ),







              
               PopupMenuItem(
                onTap: (){


                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PerDayDueCustomer()));




                },
                child: Row(
                  children: [
                    Icon(Icons.person_4),
                    SizedBox(width: 5,),
                    Text("Today Due Customers"),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
                
                padding: EdgeInsets.all(18.0),
              ),





              
                 PopupMenuItem(
                onTap: (){


                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PerDaySalesHistory()));




                },
                child: Row(
                  children: [
                    Icon(Icons.sell),
                    SizedBox(width: 5,),
                    Text("Today Sales History"),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
                
                padding: EdgeInsets.all(18.0),
              ),





                  PopupMenuItem(
                onTap: (){


                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => UploadProduct()));




                },
                child: Row(
                  children: [
                    Icon(Icons.upload),
                    SizedBox(width: 5,),
                    Text("Upload Bike"),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
                
                padding: EdgeInsets.all(18.0),
              ),
              

              


              

              


              



                PopupMenuItem(
                onTap: (){


                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllAdmin()));




                },
                child: Row(
                  children: [
                    Icon(Icons.admin_panel_settings),
                    SizedBox(width: 5,),
                    Text("All Admin"),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
                
                padding: EdgeInsets.all(18.0),
              ),
              



          PopupMenuItem(
                onTap: (){


                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MakeAdmin()));




                },
                child: Row(
                  children: [
                    Icon(Icons.admin_panel_settings),
                    SizedBox(width: 5,),
                    Text("Make Admin"),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
                
                padding: EdgeInsets.all(18.0),
              ),
              



               PopupMenuItem(
                onTap: (){


                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MakeAdmin()));




                },
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 5,),
                    Text("Settings"),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
                
                padding: EdgeInsets.all(18.0),
              ),
              




              






              

              






              
             
            ];
          },
        )
                ],
        
      ),
      body: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                height: 160,
                child: Center(
                  child: Text("Total Paid Customers: ${AllPaidCustomerData.length.toString()}", style: TextStyle(

                    fontSize: 20,
                  ),),


                ),
                     
               decoration: BoxDecoration(
                color: const Color.fromARGB(255, 250, 230, 250),

                border: Border.all(
                          width: 2,
                          color: Color.fromARGB(255, 250, 230, 250)
                        ),
                borderRadius: BorderRadius.circular(10)      
               ),)),


               SizedBox(
                height: 10,
               ),






               
                   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                height: 160,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Text("Total Due Customers: ${AllDueCustomerData.length.toString()}", style: TextStyle(
                  
                          fontSize: 20,
                          color: Colors.white
                        ),),
                  
                  


                  SizedBox(
                height: 17,
               ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                                          
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            
                            
                            children: [
                                          
                                          
                                        Container(width: 100, child:TextButton(onPressed: (){


                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PerDayDueCustomer()));





                                        }, child: Text("View", style: TextStyle(color: Colors.purple),), style: ButtonStyle(
                             
                                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                                      ),),),
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                            ],),
                        )
                      ],
                    ),
                  ),


                ),
                     
               decoration: BoxDecoration(
                color: Color.fromARGB(255, 170, 69, 247),

                border: Border.all(
                          width: 2,
                          color: Color.fromARGB(255, 170, 69, 247)
                        ),
                borderRadius: BorderRadius.circular(10)      
               ),)),


               SizedBox(
                height: 10,
               ),





               
                   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                height: 160,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Text("Today Due Payment Add: ${moneyAdd.toString()}৳", style: TextStyle(
                  
                          fontSize: 20,
                          color:Colors.white
                         
                        ),),
                  
                  
                  
                  
                  
                  
                  
                  
                  
                           SizedBox(
                                  height: 17,
                                 ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                                            
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              
                              
                              children: [
                                            
                                            
                                          Container(width: 100, child:TextButton(onPressed: (){



                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PerDayDuePaymentAddHistory()));







                                          }, child: Text("View", style: TextStyle(color: Color.fromARGB(255, 242,133,0)),), style: ButtonStyle(
                               
                                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                                        ),),),
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                              ],),
                          )
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                      ],
                    ),
                  ),


                ),
                     
               decoration: BoxDecoration(
                color: Color.fromARGB(255, 242,133,0),

                border: Border.all(
                          width: 2,
                          color: Color.fromARGB(255, 242,133,0)
                        ),
                borderRadius: BorderRadius.circular(10)      
               ),)),


               SizedBox(
                height: 10,
               ),

















                  ]))));
  }
}














class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            InkWell(
              onTap: () {
                
              },
              child: Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry A')),
              ),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[200],
              child: const Center(child: Text('Entry B')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[300],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ),
    );
  }
}
