import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/CreateNewCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerPaymentAdd.dart';
import 'package:tvs_app/Screens/AdminScreen/PaymentHistory.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tvs_app/Screens/AdminScreen/SearchByNID.dart';
import 'package:tvs_app/Screens/CommonScreen/SingleProductInfo.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

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
      backgroundColor: Colors.white,
      appBar:  AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Bikes", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title:  Text('${AllData[index]["BikeName"]}'),
                  subtitle: Text(
                    '${AllData[index]["BikeType"]}',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '${AllData[index]["BikeFeatures"]}',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
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
                  alignment: MainAxisAlignment.start,
                  children: [
                    
            TextButton(onPressed: () async{
      
      
                      
      
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewCustomer(BikeName: "${AllData[index]["BikeName"]}", BikeColor: " ", BikeModelName: " ", BikeSalePrice: "${AllData[index]["BikeSalePrice"]}",)));
      
                      }, child: Text("Sale", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                      
                                backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
                              ),),
      
      
      
      
                 
            TextButton(onPressed: () async{
      
      
        
      
                 
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleProductInfo(BikeID: "${AllData[index]["BikeID"]}")));
      
                },
                
                 child: Text("View", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
                        ),),
      
      
      
      
      
      
      
      
      
                        TextButton(onPressed: () {
      
      
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchByNID(BikeName: "${AllData[index]["BikeName"]}", BikeColor: " ", BikeModelName: " ", BikeSalePrice: "${AllData[index]["BikeSalePrice"]}",)));
      
      
      
      
                  
      
                },
                
                 child: Text("Previous Sale", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
                        ),),
      
      
      
      
      
                    
                    TextButton(onPressed: () async{
      
      
        
      
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewCustomer(BikeName: " ", BikeColor: " ", BikeModelName: " ", BikeSalePrice: "",)));
      
                },
                
                 child: Text("Delete", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                        ),),
                  ],
                ),
      
      
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
      
                    child:AllData[index]["BikeShowroomAvailableNumber"]=="0"? Text("Out of Stock"):Text("${AllData[index]["BikeShowroomAvailableNumber"]}  available"),
                       
                 decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 230, 250),
      
                  border: Border.all(
                            width: 2,
                            color: Colors.purple
                          ),
                  borderRadius: BorderRadius.circular(10)      
                 ),))
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
               
      
              
      
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





          

              