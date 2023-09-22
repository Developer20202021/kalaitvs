import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerPaymentAdd.dart';
import 'package:tvs_app/Screens/AdminScreen/EditCustomerInfo.dart';
import 'package:tvs_app/Screens/AdminScreen/PaymentHistory.dart';


class ProductScreenToAllCustomer extends StatefulWidget {
  const ProductScreenToAllCustomer({super.key});

  @override
  State<ProductScreenToAllCustomer> createState() => _ProductScreenToAllCustomerState();
}

class _ProductScreenToAllCustomerState extends State<ProductScreenToAllCustomer> {
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
             
              ],
            ),

            // The end action pane is the one at the right or the bottom side.
            endActionPane: const ActionPane(
              motion: ScrollMotion(),
              children: [
              
              ],
            ),

            // The child of the Slidable is what the user sees when the
            // component is not dragged.
            child:  ListTile(
              
                 leading: CircleAvatar(
        backgroundColor: Colors.pink,
        child: Text("S"),
      ),

      subtitle: Text('NID:89089'),
      trailing: TextButton(onPressed: (){


         Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditCustomerInfo()));



      }, child: Text("Get", style: TextStyle(color: Colors.white),), style: ButtonStyle(
       
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
              ),),
              
              title: Text('Mahadi Hasan', style: TextStyle(
                fontWeight: FontWeight.bold
              ),)),
          );
        },
        itemCount: 25,
      ),
    );
  }
}

void doNothing(BuildContext context) {}

// void EveryPaymentHistory(BuildContext context){
//   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentHistory()));
// }





// void CustomerAddPayment(BuildContext context){
//   Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerPaymentAdd()));
// }