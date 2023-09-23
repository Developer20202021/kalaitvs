import 'package:flutter/material.dart';
import 'package:tvs_app/Screens/AdminScreen/EditCustomerInfo.dart';

class SingleCustomer extends StatefulWidget {
  const SingleCustomer({super.key});

  @override
  State<SingleCustomer> createState() => _SingleCustomerState();
}

class _SingleCustomerState extends State<SingleCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Previous Customer", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                    ListTile(
                       shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ), 

                      title: Text("Name: Mahadi Hasan", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: TextButton(onPressed: (){


                        // back 
                        
        //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditCustomerInfo(CustomerNID: "343",)));



      }, child: Text("Sale", style: TextStyle(color: Colors.white),), style: ButtonStyle(
       
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
              ),),
                      subtitle: Text("NID:84238443 Phone Number:42352452545"),



                    ),


                    


                    SizedBox(height: 14,),



                  ]))));
  }
}