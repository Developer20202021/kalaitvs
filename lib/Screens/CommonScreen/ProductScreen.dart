import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/AllAdmin.dart';
import 'package:tvs_app/Screens/AdminScreen/AllCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/AllPDF/NowBikeStockPDF.dart';
import 'package:tvs_app/Screens/AdminScreen/CreateNewCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerPaymentAdd.dart';
import 'package:tvs_app/Screens/AdminScreen/Dashboard/PreviousBikeSell.dart';
import 'package:tvs_app/Screens/AdminScreen/HomeScreen.dart';
import 'package:tvs_app/Screens/AdminScreen/PaymentHistory.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tvs_app/Screens/AdminScreen/SearchByNID.dart';
import 'package:tvs_app/Screens/CommonScreen/DeveloperAccess/DeveloperAccess.dart';
import 'package:tvs_app/Screens/CommonScreen/SingleProductInfo.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';


class ProductScreen extends StatefulWidget {

  final indexNumber;



  const ProductScreen({super.key, required this.indexNumber});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  TextEditingController customerNIDController = TextEditingController();

bool loading = true;

bool online = true;


int TotalBikeStock=0;


  // Firebase All Customer Data Load

List  AllData = [0];

List AllBikeNamePopUpList=[]; 


  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('product');

Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();

     
     if (AllData.isEmpty) {
       
     } else {

      for (var i = 0; i <AllData.length; i++) {

        var getEveryBikeStock = AllData[i]["BikeShowroomAvailableNumber"];

        int getEveryBikeStockInt = int.parse(getEveryBikeStock.toString());

        TotalBikeStock = TotalBikeStock + getEveryBikeStockInt;
        
      }

      
      
       
     }


     setState(() {
      AllBikeNamePopUpList = querySnapshot.docs.map((doc) => doc.data()).toList();
     
      AllData = querySnapshot.docs.map((doc) => doc.data()).toList();

      loading = false;

      // getPerDaySalesData();
     });



    print(AllData);
}





// List todaySalesData =[];

// List getSalesData =[];



// Future getPerDaySalesData() async{


//   for (var i = 0; i < AllData.length; i++) {


//       CollectionReference _SingleBikeDataRef =
//     FirebaseFirestore.instance.collection("BikeSaleInfo");

//     Query SingleBikeDataquery = _SingleBikeDataRef.where("BikeID", isEqualTo: AllData[i]["BikeID"]).where("BikeSaleDate", isEqualTo: "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");
//     QuerySnapshot BikeImagequerySnapshot = await SingleBikeDataquery.get();

//     // Get data from docs and convert map to List
//      getSalesData = BikeImagequerySnapshot.docs.map((doc) => doc.data()).toList();

//      setState(() {
//        getSalesData = BikeImagequerySnapshot.docs.map((doc) => doc.data()).toList();
//      });

//      if (getSalesData.isEmpty) {

//       setState(() {
//         todaySalesData.insert(todaySalesData.length, {"BikeName":AllData[i]["BikeName"], "SaleNumber":"0"});
//       });
       
//      } else {


//       setState(() {
//         todaySalesData.insert(todaySalesData.length, {"BikeName":AllData[i]["BikeName"], "SaleNumber":getSalesData.length.toString()});
//       });


       
//      }

//      setState(() {
//       loading = false;
//     });


    
//   }



// print(todaySalesData);

// }


















List  SingleBikeData = [];




Future<void> getSingleBikeData(String BikeID) async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();
    setState(() {
      loading = true;
    });
  CollectionReference _SingleBikeDataRef =
    FirebaseFirestore.instance.collection("product");

    Query SingleBikeDataquery = _SingleBikeDataRef.where("BikeID", isEqualTo: BikeID);
    QuerySnapshot BikeImagequerySnapshot = await SingleBikeDataquery.get();

    // Get data from docs and convert map to List
     AllData = BikeImagequerySnapshot.docs.map((doc) => doc.data()).toList();

     setState(() {
       AllData = BikeImagequerySnapshot.docs.map((doc) => doc.data()).toList();
     });

     setState(() {
      loading = false;
    });

    print(AllData);
}




// internet 

Future getConnection() async{

  final connectivityResult = await (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.mobile) {
  print("mobile");
  setState(() {
    online = true;
  });
} else if (connectivityResult == ConnectivityResult.wifi) {
   //print("wifi");
     setState(() {
    online = true;
  });
  // I am connected to a wifi network.
} else if (connectivityResult == ConnectivityResult.ethernet) {
   print("Ethernet");
     setState(() {
    online = true;
  });
  // I am connected to a ethernet network.
} else if (connectivityResult == ConnectivityResult.vpn) {
   print("vpn");

  setState(() {
    online = true;
  });
  // I am connected to a vpn network.
  // Note for iOS and macOS:
  // There is no separate network interface type for [vpn].
  // It returns [other] on any device (also simulator)
} else if (connectivityResult == ConnectivityResult.bluetooth) {
   print("bluetooth");
  setState(() {
    online = true;
  });
  // I am connected to a bluetooth.
} else if (connectivityResult == ConnectivityResult.other) {
   print("other");
  setState(() {
    online = true;
  });
  // I am connected to a network which is not in the above mentioned networks.
} else if (connectivityResult == ConnectivityResult.none) {
   print("none");

    setState(() {
    online = false;
  });
   
  // I am not connected to any network.
}
}






@override
  void initState() {

    var period = const Duration(seconds:1);
    Timer.periodic(period,(arg) {
                  getConnection();
    });



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



        // getting the size of the window
   var height = MediaQuery.of(context).size.height; 
    var width = MediaQuery.of(context).size.width; 
  





    return Scaffold(

      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(left:kIsWeb?205:5, right: kIsWeb?205:5, bottom: 9),
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
                onPressed: () {

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
                  size: 25,
                ),
              ),




              widget.indexNumber == "2"?
              IconButton(
                enableFeedback: false,
                onPressed: () {



                },
                icon: const Icon(
                  Icons.electric_bike_sharp,
                  color: Colors.white,
                  size: 55,
                  fill: 1.0,
                ),
              ): IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: const Icon(
                  Icons.electric_bike,
                  color: Colors.white,
                  size: 25,
                ),
              ),









              IconButton(
                enableFeedback: false,
                onPressed: () {

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllAdmin(indexNumber: "3")));



                },
                icon: const Icon(
                  Icons.admin_panel_settings_outlined,
                  color: Colors.white,
                  size: 25,
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
                  size: 25,
                ),
              ),
            ],
          ),),
      ),
        
         
    
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(onPressed: (){

        Navigator.push(
                        context,MaterialPageRoute(builder: (context) => NowBikeStockPDFPreview(BikesData: AllData, TotalBikes: TotalBikeStock.toString())),
                      );

      }, child: Text("Print"),),


      appBar:  AppBar(

      systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: ColorName().appColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
       automaticallyImplyLeading: false,
        title:  Text("Bikes (${TotalBikeStock.toString()})", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
      
          }, itemBuilder: (BuildContext bc) {
            return  [


              for(int i = 0; i<AllBikeNamePopUpList.length; i++)

                PopupMenuItem(
                child: Text("${AllBikeNamePopUpList[i]["BikeName"]}(${AllBikeNamePopUpList[i]["BikeShowroomAvailableNumber"]})", overflow: TextOverflow.visible,style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () async{

                  getSingleBikeData(AllBikeNamePopUpList[i]["BikeID"]);
                  
                },
              ),





            ];
          })



        ],




        
      ),
      body: loading?Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: const Color(0xFF1A1A3F),
          secondRingColor: Theme.of(context).primaryColor,
          thirdRingColor: Colors.white,
          size: 100,
        ),
      ):online==false?Center(child: Text("No Internet Connection", style: TextStyle(fontSize: 24, color: Colors.red),)): RefreshIndicator(
        onRefresh: refresh,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 35,),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(left:kIsWeb?205:5, right: kIsWeb?205:5,),
              child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.electric_bike_rounded),
                    title:  Text('${AllData[index]["BikeName"]}',style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,)),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // BikeSalePrice
                      
                       
                        Text(
                          '${AllData[index]["BikeType"]}',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)
                        
                        ),
            
                         Text(
                          'Color: ${AllData[index]["ColorAvailable"]}',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)
                         
                        ),
                      ],
                    ),
                  ),
              
               
                     
                  
                  
                  
                  
                  
                  
                  CarouselSlider(
                  items: [
                      
                      for(int i=0; i<AllData[index]["AllBikeImage"].length; i++)
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(5),
                                                      child: Image.network(
                                                        "${AllData[index]["AllBikeImage"][i]}",
                                                        // width: 150,
                                                        // height: 50,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                ),
                    
              ],
                  
                //Slider Container properties
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
              ),
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      
              
              
              // BikeShowroomAvailableNumber
              AllData[index]["BikeShowroomAvailableNumber"]=="0"?
            
              Text(""):
              
              TextButton(onPressed: () async{


                showDialog(
                      context: context,
                      builder: (context) {


                        String ChangeSelected = "";

                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                    title: Text('Enter Customer NID'),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [

                      TextField(
                        onChanged: (value) {
                          setState((){
                            ChangeSelected = value;
                          });
                        },

                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer NID',
                          hintText: 'Enter Customer NID',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: customerNIDController,
                    ),

                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                       
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('CANCEL'),
                      ),
                    ChangeSelected.isEmpty?Text(""):ElevatedButton(
                        
                        onPressed: () {

                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewCustomer(BikeName: "${AllData[index]["BikeName"]}", BikeColor: "${AllData[index]["ColorAvailable"]}", BikeModelName: "${AllData[index]["BikeName"]}", BikeSalePrice: "${AllData[index]["BikeSalePrice"]}", BikeId: '${AllData[index]["BikeID"]}', BikeBuyingPrice: '${AllData[index]["BikeBuyingPrice"]}', CustomerNID: customerNIDController.text.trim(),)));


                        },
                        child: Text('Sale'),
                      ),
                    ],
                  );});});




                  
                  
                        
                  
                         
                  
                        }, child: Text("Sale", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                        
                                  backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
                                ),),
                  
                  
                  
                  
                   
              TextButton(onPressed: () async{
                  
                  
                    
                  
                   
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleProductInfo(BikeID: "${AllData[index]["BikeID"]}")));
                  
                  },
                  
                   child: Text("View", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                  
                            backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
                          ),),
            
            
                    
                     TextButton(onPressed: () async{
                  
                  
                    // ${AllData[index]["BikeName"]}
                  
                   
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PreviousBikeSell(BikeName: "${AllData[index]["BikeName"]}", BikeColor: "${AllData[index]["ColorAvailable"]}",)));
                  
                  },
                  
                   child: Text("Previous sales", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                  
                            backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
                          ),),
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                        
                  
                  
                  
                  
                      
                      TextButton(onPressed: () async{
            
            
                       showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
              title: Center(child: Text('Warning Message')),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children : <Widget>[
                  Expanded(
                    child: Text(
                      "Are you sure?? You want to delete this product",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
            
                      ),
                    ),
                  )
                ],
              ),
              actions: <Widget>[
                TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                     
                        final collection = FirebaseFirestore.instance.collection('product');
                      collection 
                      .doc('${AllData[index]["BikeID"]}') // <-- Doc ID to be deleted. 
                      .delete() // <-- Delete
                      .then((_) =>  setState(() {
                  
                                getData();
                                Navigator.of(context).pop();
            
                          }))
                      .catchError((error) => print('Delete failed: $error'));
                    })
              ],
                      );
                    },
                  );
                  
                  
                    
               
                  
                  },
                  
                   child: Text("Delete", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                  
                            backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                          ),),
                    ],
                  ),
                  
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                  
                          child:AllData[index]["BikeShowroomAvailableNumber"]=="0"? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Out of Stock"),
                          ):Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${AllData[index]["BikeShowroomAvailableNumber"]}  available"),
                          ),
                             
                       decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                  
                        border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).primaryColor
                                ),
                        borderRadius: BorderRadius.circular(10)      
                       ),)),
            
            
            
            
            
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                  
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Price: ${AllData[index]["BikeSalePrice"]}৳"),
                          ),
                             
                       decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                  
                        border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).primaryColor
                                ),
                        borderRadius: BorderRadius.circular(10)      
                       ),)),
            
            
            
            
            
            
            
            
                    ],
                  )
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                 
                  
                
                  
                ],
              ),
              ),
            );
          },
          itemCount: AllData.length,
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}

void EveryPaymentHistory(BuildContext context){
  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentHistory()));
}





void CustomerAddPayment(BuildContext context){
  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerPaymentAdd()));
}




// ListTile(
              
//                  leading: CircleAvatar(
//         backgroundColor: Colors.pink,
//         child: Text("S"),
//       ),

//       subtitle: Text('Bike Model'),
//       trailing:   TextButton(onPressed: () async{


      

//          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewCustomer(BikeName: " ", BikeColor: " ", BikeModelName: " ", BikeSalePrice: "",)));

//       }, child: Text("Sale", style: TextStyle(color: Colors.white),), style: ButtonStyle(
       
//                 backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
//               ),),
              
//               title: Text('Bike Name', style: TextStyle(
//                 fontWeight: FontWeight.bold
//               ),))





          

              