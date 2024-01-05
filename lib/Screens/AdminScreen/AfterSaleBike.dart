import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tvs_app/Screens/AdminScreen/AllPDF/CashMemo.dart';
import 'package:tvs_app/Screens/AdminScreen/AllPDF/Certifications.dart';
import 'package:tvs_app/Screens/AdminScreen/AllPDF/DeliveryChallan.dart';
import 'package:tvs_app/Screens/AdminScreen/AllPDF/OfficeDeliveryChallan.dart';
import 'package:tvs_app/Screens/CommonScreen/DeveloperAccess/DeveloperAccess.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:tvs_app/Screens/DeveloperFolder/InternetChecker.dart';


class AfterSaleBike extends StatefulWidget {


  final List SalesData;



  const AfterSaleBike({super.key, required this.SalesData});

  @override
  State<AfterSaleBike> createState() => _AfterSaleBikeState();
}

class _AfterSaleBikeState extends State<AfterSaleBike> {






// Internet Connection Checker

bool online = true;
Future getInternetValue() async{

bool onlineData =await getInternetConnectionChecker().getInternetConnection() ;

setState(() {
  online = onlineData;
  
});


}




@override
  void initState() {

    var period = const Duration(seconds:1);
    Timer.periodic(period,(arg) {
                  getInternetValue();
    });
    // TODO: implement initState

    super.initState();
  }




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
      online==false?Center(child: Text("No Internet Connection", style: TextStyle(fontSize: 24, color: Colors.red),)):SingleChildScrollView(
        child: Padding(
           padding:  EdgeInsets.only(left:kIsWeb?205:5, right: kIsWeb?205:5, bottom: 9),
          child: Column(
            children: [
        
              ListTile(
                leading: Icon(Icons.picture_as_pdf),
                title: Text("Certification PDF"),
                trailing: ElevatedButton(onPressed: (){
        
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  CertificationPDFPreview(SalesData: widget.SalesData)));
        
        
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
                title: Text("Normal Delivery Challan PDF"),
                trailing: ElevatedButton(onPressed: (){
        
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  DeliveryChallanPDFPreview(SalesData: widget.SalesData)));
        
        
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




              ListTile(
                leading: Icon(Icons.picture_as_pdf),
                title: Text("Official Delivery Chalan"),
                trailing: ElevatedButton(onPressed: (){
        
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  OfficeDeliveryChallanPDFPreview(SalesData: widget.SalesData)));
        
        
                }, child: Text("Print")),
        
              ),
        
        
        
            ],
        
          ),
        ),
      ) 
      
      
      );

  }
}