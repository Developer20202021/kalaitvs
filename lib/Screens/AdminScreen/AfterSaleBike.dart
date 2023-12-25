import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tvs_app/Screens/AdminScreen/AllPDF/CashMemo.dart';
import 'package:tvs_app/Screens/CommonScreen/DeveloperAccess/DeveloperAccess.dart';


class AfterSaleBike extends StatefulWidget {


  final List SalesData;



  const AfterSaleBike({super.key, required this.SalesData});

  @override
  State<AfterSaleBike> createState() => _AfterSaleBikeState();
}

class _AfterSaleBikeState extends State<AfterSaleBike> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: ColorName().appColor),
        automaticallyImplyLeading: false,
        title: const Text("Get All Invoice",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [

            ListTile(
              leading: Icon(Icons.picture_as_pdf),
              title: Text("Certification PDF"),
              trailing: ElevatedButton(onPressed: (){

                // Navigator.push(context,
                //         MaterialPageRoute(builder: (context) =>  AfterSaleBike(SalesData: [saleData])));


              }, child: Text("Print")),

            ),


            SizedBox(height: 15,),

            ListTile(
              leading: Icon(Icons.picture_as_pdf),
              title: Text("Sales Invoice PDF"),
              trailing: ElevatedButton(onPressed: (){


              }, child: Text("Print")),

            ),

              SizedBox(height: 15,),


            ListTile(
              leading: Icon(Icons.picture_as_pdf),
              title: Text("Delivery Challan PDF"),
              trailing: ElevatedButton(onPressed: (){


              }, child: Text("Print")),

            ),



              SizedBox(height: 15,),


             ListTile(
              leading: Icon(Icons.picture_as_pdf),
              title: Text("Money Receipt PDF"),
              trailing: ElevatedButton(onPressed: (){

                 Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  CashMemoPDFView(SalesData: widget.SalesData)));


              }, child: Text("Print")),

            ),



          ],

        ),
      ) 
      
      
      );

  }
}