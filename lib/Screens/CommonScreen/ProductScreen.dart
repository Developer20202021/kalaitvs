import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/AllAdmin.dart';
import 'package:tvs_app/Screens/AdminScreen/AllCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/CreateNewCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerPaymentAdd.dart';
import 'package:tvs_app/Screens/AdminScreen/Dashboard/PreviousBikeSell.dart';
import 'package:tvs_app/Screens/AdminScreen/HomeScreen.dart';
import 'package:tvs_app/Screens/AdminScreen/PaymentHistory.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tvs_app/Screens/AdminScreen/SearchByNID.dart';
import 'package:tvs_app/Screens/CommonScreen/SingleProductInfo.dart';


class ProductScreen extends StatefulWidget {

  final indexNumber;



  const ProductScreen({super.key, required this.indexNumber});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {



bool loading = true;


  // Firebase All Customer Data Load

List  AllData = [0];


  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('product');

Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
     setState(() {
     
       AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
      loading = false;
     });

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
      appBar:  AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
       automaticallyImplyLeading: false,
        title: const Text("Bikes", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
      ): RefreshIndicator(
        onRefresh: refresh,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 35,),
          itemBuilder: (BuildContext context, int index) {
            return Card(
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
                Text(
                  '${AllData[index]["BikeFeatures"]}',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                  
                ),
             
         
      
      
      
      
      
      
                CarouselSlider(
                items: [
                    
                  //1st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage("${AllData[index]["BikeImageUrl"]}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    
                  //2nd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage("${AllData[index]["BikeImageUrl"]}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    
                  //3rd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage("${AllData[index]["BikeImageUrl"]}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    
                  //4th Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage("${AllData[index]["BikeImageUrl"]}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    
                  //5th Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage("${AllData[index]["BikeImageUrl"]}"),
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
      
      
      
      
      
      
      
      
      
      
      
      
               ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    
            
            
            // BikeShowroomAvailableNumber
            AllData[index]["BikeShowroomAvailableNumber"]=="0"?

            Text(""):
            
            TextButton(onPressed: () async{
      
      
                      
      
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewCustomer(BikeName: "${AllData[index]["BikeName"]}", BikeColor: "${AllData[index]["ColorAvailable"]}", BikeModelName: " ", BikeSalePrice: "${AllData[index]["BikeSalePrice"]}",)));
      
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





          

              