import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tvs_app/Screens/AdminScreen/Accessories/AccessoriesSaleToCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerPaymentAdd.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerProfile.dart';

import 'package:tvs_app/Screens/AdminScreen/PaymentHistory.dart';


class AccessoriesScreen extends StatefulWidget {
  const AccessoriesScreen({super.key});

  @override
  State<AccessoriesScreen> createState() => _AccessoriesScreenState();
}

class _AccessoriesScreenState extends State<AccessoriesScreen> {

bool loading = false;

var DataLoad = "";
int moneyAdd =0;
var totalAccessoriesScreen = "";

   // Firebase All Customer Data Load

List  AllData = [];


  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('accessoriesinfo');

Future<void> getData() async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();


    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();


       if (AllData.length == 0) {
      setState(() {
        DataLoad = "0";
        loading = false;
      });
       
     } else {


          //  for (var i = 0; i < AllData.length; i++) {

          //       var money = AllData[i]["BikePaymentDue"];
          //       int moneyInt = int.parse(money);

      

          //             setState(() {
          //               totalAccessoriesScreen = AllData.length.toString();
          //               moneyAdd = moneyAdd + moneyInt;
          //               AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
          //             });

       
          //         }



          setState(() {
               AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
               loading = false;
          });




     }


    print(AllData);
}









@override
  void initState() {
    // TODO: implement initState
    getData();
   
    super.initState();
  }





 Future refresh() async{


    setState(() {
      
  getData();

    });




  }













  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Accessories", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,


        
      ),
      body: DataLoad == "0"? Center(child: Text("No Data Available")):RefreshIndicator(
        onRefresh: refresh,
        child: GridView.builder(
                itemCount: AllData.length,
                
                itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor)
                  ),
                  height: 330,

                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [


                        //Image Container 

                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                                width: 130.0,
                                height: 130.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Image.network(
                                  "${AllData[index]["ImageLink"]}",
                                  height: 130.0,
                                  width: 130.0,
                                ),
                              ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(left: 18,top: 2, right: 3),
                          child: Text("${AllData[index]["AccessoriesName"].toString().capitalize()}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), overflow: TextOverflow.clip,),
                        ),

                        

                        Padding(
                          padding: const EdgeInsets.only(left: 18,top: 2),
                          child: Text("${AllData[index]["AccessoriesAvailableNumber"]} available", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                        ),

                      

                        Padding(
                          padding: const EdgeInsets.only(left: 18,top: 2),
                          child: Text("Price: ${AllData[index]["AccessoriesSalePrice"]}৳", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                        ),


                        





                AllData[index]["AccessoriesAvailableNumber"]=="0"?Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Out Of Stock"),
                  ),
                ):        

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(width: 100, child:TextButton(onPressed: (){
                              
                         Navigator.push(
                      context,
                              
                             MaterialPageRoute(builder: (context) => AccessoriesSaleToCustomer(AccessoriesID: AllData[index]["AccessoriesID"], AccessoriesName: AllData[index]["AccessoriesName"], AccessoriesSalePrice: AllData[index]["AccessoriesSalePrice"], AccessoriesAvailableNumber: AllData[index]["AccessoriesAvailableNumber"])),
                    );
                              
                              
                              
                              
                  }, child: Text("Sale", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                       
                          backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
                        ),),),
                ),











                    ],





                  ),



                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                  mainAxisExtent: 330,
                ),
              ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}











void AccessoriesScreenPageToCustomerProfile(BuildContext context, String CustomerNID){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerProfile(CustomerNID: CustomerNID)));
}





void EveryPaymentHistory(BuildContext context, String CustomerNID, String CustomerPhoneNumber){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentHistory(CustomerNID: CustomerNID, CustomerPhoneNumber: CustomerPhoneNumber)));
}








 void CustomerAddPayment(BuildContext context, String CustomerNID, String CustomerPhoneNumber, String BikePaymentDue){


  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerPaymentAdd(CustomerNID: CustomerNID, CustomerPhoneNumber: CustomerPhoneNumber, BikePaymentDue: BikePaymentDue,)));
}