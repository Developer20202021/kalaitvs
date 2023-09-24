import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path/path.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerPaymentAdd.dart';
import 'package:tvs_app/Screens/AdminScreen/PaymentHistory.dart';


class AllCustomer extends StatefulWidget {
  const AllCustomer({super.key});

  @override
  State<AllCustomer> createState() => _AllCustomerState();
}

class _AllCustomerState extends State<AllCustomer> {



 



// Firebase All Customer Data Load

List  AllData = [0];


  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('customer');

Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
     setState(() {
       AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
     });

    print(AllData);
}





@override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }









  @override
  Widget build(BuildContext context) {




   




    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Customers", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: ListView.separated(
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
              children: const [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: doNothing,
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
                  onPressed: (context) => CustomerAddPayment(context,AllData[index]["CustomerNID"] ,AllData[index]["CustomerPhoneNumber"]  ),
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

      subtitle:  Text('NID:${AllData[index]["CustomerNID"]}'),
      trailing: Text("Due"),
              
              title: Text("${AllData[index]["CustomerName"]}", style: TextStyle(
                fontWeight: FontWeight.bold
              ),)),
          );
        },
        itemCount: AllData.length,
      ),
    );
  }
}

void doNothing(BuildContext context) {}





void EveryPaymentHistory(BuildContext context, String CustomerNID, String CustomerPhoneNumber){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentHistory(CustomerNID: CustomerNID, CustomerPhoneNumber: CustomerPhoneNumber)));
}








 void CustomerAddPayment(BuildContext context, String CustomerNID, String CustomerPhoneNumber){

    print("Done ${CustomerNID}");
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerPaymentAdd(CustomerNID: CustomerNID, CustomerPhoneNumber: CustomerPhoneNumber)));
}