import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerPaymentAdd.dart';
import 'package:tvs_app/Screens/AdminScreen/PaymentHistory.dart';
import 'package:tvs_app/Screens/CommonScreen/SingleProductInfo.dart';


class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Bikes", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        actions: [


         PopupMenuButton(onSelected: (value) {
            // your logic
            setState(() {
              // selectedItem = value.toString();
              print(value);
            });
            print(value);
            Navigator.pushNamed(context, value.toString());
          }, itemBuilder: (BuildContext bc) {
            return const [
              PopupMenuItem(
                child: Text("Hello"),
                value: '/hello',
              ),
              PopupMenuItem(
                child: Text("About"),
                value: '/about',
              ),
              PopupMenuItem(
                child: Text("Contact"),
                value: '/contact',
              )
            ];
          })



        ],
        
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
                  label: 'View',
                ),
              ],
            ),

            // The end action pane is the one at the right or the bottom side.
            endActionPane: const ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
                  onPressed: CustomerAddPayment,
                  backgroundColor: Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.payment,
                  label: 'Previous Sale',
                ),
                SlidableAction(
                  onPressed: EveryPaymentHistory,
                  backgroundColor: Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  icon: Icons.save,
                  label: 'Edit',
                ),
              ],
            ),

            // The child of the Slidable is what the user sees when the
            // component is not dragged.
            child:  ListTile(
              
                 leading: CircleAvatar(
        backgroundColor: Colors.purple,
        child: Text("S"),
      ),

      subtitle: Text('Bike Available: 2'),
      trailing: TextButton(onPressed: () {


      

        //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleProductInfo()));



      }, child: Text("View", style: TextStyle(color: Colors.white),), style: ButtonStyle(
       
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
              ),),


              
              
              title: Text('Bike Name', style: TextStyle(
                fontWeight: FontWeight.bold
              ),)),
          );
        },
        itemCount: 25,
      ),
    );
  }
}

void doNothing(BuildContext context) {

  //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleProductInfo()));

}

void EveryPaymentHistory(BuildContext context){
  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentHistory()));
}





void CustomerAddPayment(BuildContext context){
  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerPaymentAdd()));
}