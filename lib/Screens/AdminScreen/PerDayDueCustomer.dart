import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/AllAdmin.dart';
import 'package:tvs_app/Screens/AdminScreen/AllCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerPaymentAdd.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerProfile.dart';
import 'package:tvs_app/Screens/AdminScreen/Dashboard/SendSMSToDueCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/HomeScreen.dart';
import 'package:tvs_app/Screens/AdminScreen/PaymentHistory.dart';
import 'package:tvs_app/Screens/CommonScreen/ProductScreen.dart';


class PerDayDueCustomer extends StatefulWidget {
  const PerDayDueCustomer({super.key});

  @override
  State<PerDayDueCustomer> createState() => _PerDayDueCustomerState();
}

class _PerDayDueCustomerState extends State<PerDayDueCustomer> {



   // Firebase All Customer Data Load
var DataLoad = "";
List  AllData = [];
bool loading = true;


  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('customer');

Future<void> getData() async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();


    Query query = _collectionRef.where("CustomerType", isEqualTo: "Due").where("DuePaymentGivingDay", isEqualTo: DateTime.now().day.toString());
    QuerySnapshot querySnapshot = await query.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();

      if (AllData.length == 0) {
      setState(() {
        loading = false;
        DataLoad = "0";
      });
       
     } else {

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
                  size: 35,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {

     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductScreen(indexNumber: "2",)));


                },
                icon: const Icon(
                  Icons.electric_bike_outlined,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {


                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllAdmin(indexNumber: "3",)));




                },
                icon: const Icon(
                  Icons.admin_panel_settings_outlined,
                  color: Colors.white,
                  size: 35,
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
                  size: 35,
                ),
              ),
            ],
          ),),
      ),

      backgroundColor: Colors.white,
      appBar:  AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Per Day Due Customers", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
      ):DataLoad == "0"? Center(child: Text("No Data Available")): RefreshIndicator(
        onRefresh: refresh,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(0),
      
              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),
      
                // A pane can dismiss the Slidable.
         
      
                // All actions are defined in the children parameter.
                children:  [
                  // A SlidableAction can have an icon and/or a label.
               
                  SlidableAction(
                    onPressed: (context) => PerDayDueCustomerPageToCustomerProfile(context,AllData[index]["CustomerNID"]),
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.info,
                    label: 'All Info',
                  ),
                ],
              ),
      
              // The end action pane is the one at the right or the bottom side.
              endActionPane:  ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    flex: 2,
                    onPressed: (context) => CustomerAddPayment(context,AllData[index]["CustomerNID"] ,AllData[index]["CustomerPhoneNumber"], AllData[index]["BikePaymentDue"],AllData[index]["CustomerName"]),
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.payment,
                    label: 'Add Payment',
                  ),
                  SlidableAction(
                    onPressed: (Context) => EveryPaymentHistory(context,AllData[index]["CustomerNID"] ,AllData[index]["CustomerPhoneNumber"] ),
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Payment History',
                  ),
                ],
              ),
      
              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child:  ListTile(
                
                   leading: CircleAvatar(
          backgroundColor:  Theme.of(context).primaryColor,
          child: Text("${AllData[index]["CustomerName"][0]}",style: TextStyle(color: Colors.white)),
        ),
      
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NID:${AllData[index]["CustomerNID"]}'),
            Text('${AllData[index]["CustomerType"]}'),
            Text('Day:${AllData[index]["DuePaymentGivingDay"]}'),
          ],
        ),
        trailing: TextButton(onPressed: () {
      
      
        
      
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendSMSToDueCustomer(CustomerNID: AllData[index]["CustomerNID"], CustomerPhoneNumber: AllData[index]["CustomerPhoneNumber"], BikePaymentDue: AllData[index]["BikePaymentDue"],BikeDuePaymentGivingDay: AllData[index]["DuePaymentGivingDay"],)));
      
      
      
      
      
      
        }, child: Text("Send Message", style: TextStyle(color: Colors.white),), style: ButtonStyle(
         
                  backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
                ),),
                
                title: Text('${AllData[index]["CustomerName"]}', style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)),
            );
          },
          itemCount: AllData.length,
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}











void PerDayDueCustomerPageToCustomerProfile(BuildContext context, String CustomerNID){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerProfile(CustomerNID: CustomerNID)));
}





void EveryPaymentHistory(BuildContext context, String CustomerNID, String CustomerPhoneNumber){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentHistory(CustomerNID: CustomerNID, CustomerPhoneNumber: CustomerPhoneNumber)));
}








 void CustomerAddPayment(BuildContext context, String CustomerNID, String CustomerPhoneNumber, String BikePaymentDue, String CustomerName){


  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerPaymentAdd(CustomerNID: CustomerNID, CustomerPhoneNumber: CustomerPhoneNumber, BikePaymentDue: BikePaymentDue,CustomerName: CustomerName,)));
}