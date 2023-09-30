import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerPaymentAdd.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerProfile.dart';
import 'package:tvs_app/Screens/AdminScreen/Dashboard/SendSMSToDueCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/PaymentHistory.dart';


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
      backgroundColor: Colors.white,
      appBar:  AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
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
          secondRingColor: const Color(0xFFEA3799),
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
                dismissible: DismissiblePane(onDismissed: () {}),
      
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
                    onPressed: (context) => CustomerAddPayment(context,AllData[index]["CustomerNID"] ,AllData[index]["CustomerPhoneNumber"], AllData[index]["BikePaymentDue"]  ),
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
          backgroundColor: Colors.pink,
          child: Text("S"),
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
         
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
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








 void CustomerAddPayment(BuildContext context, String CustomerNID, String CustomerPhoneNumber, String BikePaymentDue){


  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerPaymentAdd(CustomerNID: CustomerNID, CustomerPhoneNumber: CustomerPhoneNumber, BikePaymentDue: BikePaymentDue,)));
}