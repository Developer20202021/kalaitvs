import 'package:flutter/material.dart';
import 'package:tvs_app/Screens/AdminScreen/EditCustomerInfo.dart';

class SingleCustomer extends StatefulWidget {


  final CustomerNID;
  final CustomerAddress;
  final CustomerName;
  final CustomerPhoneNumber;
  final BikeColor;
  final BikeModelName;
  final BikeName;
  final BikeSalePrice;
  final CustomerType;




  const SingleCustomer({super.key, required this.BikeName, required this.BikeModelName, required this.BikeColor, required this.BikeSalePrice, required this.CustomerNID, required this.CustomerPhoneNumber, required this.CustomerAddress, required this.CustomerName, required this.CustomerType});

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

                      title: Text("Name: ${widget.CustomerName}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: widget.CustomerType=="Paid"?TextButton(onPressed: (){


            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  EditCustomerInfo(CustomerNID: widget.CustomerNID, CustomerAddress: widget.CustomerAddress, CustomerName: widget.CustomerName, CustomerPhoneNumber: widget.CustomerPhoneNumber, BikeColor: widget.BikeColor,BikeModelName: widget.BikeModelName,BikeName: widget.BikeName,BikeSalePrice: widget.BikeSalePrice,)),
                      );



      }, child: Text("Sale", style: TextStyle(color: Colors.white),), style: ButtonStyle(
       
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
              ),):Text("${widget.CustomerType}"),
                      subtitle: Text("NID:${widget.CustomerNID} Phone Number:${widget.CustomerPhoneNumber}"),



                    ),


                    


                    SizedBox(height: 14,),



                  ]))));
  }
}