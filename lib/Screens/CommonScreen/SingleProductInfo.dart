import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/EditProductInfo.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class SingleProductInfo extends StatefulWidget {


  final BikeID;




  const SingleProductInfo({super.key, required this.BikeID});

  @override
  State<SingleProductInfo> createState() => _EditCustomerInfoState();
}

class _EditCustomerInfoState extends State<SingleProductInfo> {




bool loading = true;

var DataLoad = "";




  

   // Firebase Single Bike Data Load

List  AllData = [];


  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('product');

Future<void> getData(String BikeID) async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();


    Query query = _collectionRef.where("BikeID", isEqualTo: BikeID);
    QuerySnapshot querySnapshot = await query.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();

     
     

      if (AllData.length==0) {
        setState(() {
          DataLoad = "0";
          loading = false;
        });
      }
      else{


         setState(() {


          AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
          loading = false;

        });



     
       
       
       
       }
   

    print(AllData);
}










   // Firebase Bike Image Data Load

List  AllBikeImageData = [];




Future<void> getBikeImageData(String BikeID) async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();
  CollectionReference _BikeImageRef =
    FirebaseFirestore.instance.collection("BikeImage");

    Query BikeImagequery = _BikeImageRef.where("BikeID", isEqualTo: BikeID);
    QuerySnapshot BikeImagequerySnapshot = await BikeImagequery.get();

    // Get data from docs and convert map to List
     AllBikeImageData = BikeImagequerySnapshot.docs.map((doc) => doc.data()).toList();

     setState(() {
       AllBikeImageData = BikeImagequerySnapshot.docs.map((doc) => doc.data()).toList();
     });

    print(AllBikeImageData);
}








@override
  void initState() {
    // TODO: implement initState
    getData(widget.BikeID);
    getBikeImageData(widget.BikeID);
    super.initState();
  }


























  @override
  Widget build(BuildContext context) {



    






  


 

    return  Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        
   systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Bike Info", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(

              child: loading? Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Center(
                      child: LoadingAnimationWidget.discreteCircle(
          color: const Color(0xFF1A1A3F),
          secondRingColor: Theme.of(context).primaryColor,
          thirdRingColor: Colors.white,
          size: 100,
        ),
                    ),
              ): DataLoad == "0"? Center(child: Text("No Data Available")):Padding(
                padding: EdgeInsets.only(left:kIsWeb?205:5, right: kIsWeb?205:5,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            
                    
            CarouselSlider(
                  items: [
                      
                      for(int x=0; x<AllData[0]["AllBikeImage"].length; x++)
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(5),
                                                      child: Image.network(
                                                        "${AllData[0]["AllBikeImage"][x]}",
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


            
             SizedBox(
                      height: 20,
                    ),


                Table(
                    border: TableBorder(
                     horizontalInside:
                BorderSide(color: Colors.white, width: 10.0)),
                    textBaseline: TextBaseline.ideographic,
                    
                      children: [



          
                      
                 TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Name", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeName"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),





                                 
                 TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Type", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeType"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),





                         TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike ABS", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeABS"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),




                        
                         TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Battery Rating", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeBatteryRating"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),




                        
                        
                         TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Brake Fluid", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeBrakeFluid"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),



                                
                         TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Brake Front", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeBrakeFront"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),



                                 
                         TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Brake Rear", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeBrakeRear"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),



                                       
                        



                         TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Cooling System", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeCoolingSystem"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),



                         TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Engine Capacity", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeEngineCapacity"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),




                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Features", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeFeatures"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),



                        
                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Frame", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeFrame"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),




                           
                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Front Suspension", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeFrontSuspension"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),









                           
                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Fuel Supply System", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeFuelSupplySystem"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),





                            
                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Fuel Tank Capacity", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeFuelTankCapacity"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),



                        
                            
                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Gear Box", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeGearBox"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),



                          
                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Ground Clearance", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeGroundClearance"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),



                         TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Head lamp", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeHeadlamp"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),


                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Height", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeHeight"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),



                        
                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Kerb Weight", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                         
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeKerbWeight"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),



                        
                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Length", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeLength"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),







                        
                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike MaxSpeed", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeMaxSpeed"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),



                        
                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Maximum Power", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeMaximumPower"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),



                           
                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Maximum Torque", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeMaximumTorque"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),


                            
                          TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Muffler", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeMuffler"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),



                             TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Power to Weight Ration", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikePowertoWeightRation"]}", overflow: TextOverflow.clip,),
                            )),
                      
                        
                        ]),







                         TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Rear Suspension", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeRearSuspension"]}", overflow: TextOverflow.clip,),
                            )),
                      
                        
                        ]),



                        
                         TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Saddle Height", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeSaddleHeight"]}", overflow: TextOverflow.clip,),
                            )),
                      
                        
                        ]),



                    
                     TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Buying Price", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeBuyingPrice"]}",overflow: TextOverflow.clip),
                            )),
                      
                        
                        ]),




                                TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Sale Price", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeSalePrice"]}", overflow: TextOverflow.clip,),
                            )),
                      
                        
                        ]),


                                    TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Showroom Available Number", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeShowroomAvailableNumber"]}", overflow: TextOverflow.clip,),
                            )),
                      
                        
                        ]),



                              TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Tail Lamp", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeTailLamp"]}", overflow: TextOverflow.clip,),
                            )),
                      
                        
                        ]),







                            TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Tyre Front", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeTyreFront"]}", overflow: TextOverflow.clip,),
                            )),
                      
                        
                        ]),





                            TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Tyre Rear", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeTyreRear"]}", overflow: TextOverflow.clip,),
                            )),
                      
                        
                        ]),


      TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Valve Per Cylinder", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeValvePerCylinder"]}", overflow: TextOverflow.clip,),
                            )),
                      
                        
                        ]),




              TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Wheel Base", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeWheelBase"]}", overflow: TextOverflow.clip,),
                            )),
                      
                        
                        ]),






            TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Width", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["BikeWidth"]}", overflow: TextOverflow.clip,),
                            )),
                      
                        
                        ]),






                         TableRow(

                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [

                          Container(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Bike Color", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip),
                            )),


                              Container(
                            
                           
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AllData[0]["ColorAvailable"]}", overflow: TextOverflow.clip,),
                            )),
                      
                        
                        ]),
















































































                 





                 





                 

                    




                      

                       
                  
                     
                      ],
                    ),




                    SizedBox(height: 50,),

                   


            
            
            
            
            
                  ],
                ),
              ),
            ),
        
        floatingActionButton: DataLoad == "0"?FloatingActionButton(onPressed: (){


        
      }):FloatingActionButton(
      onPressed: (){


        

                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  EditProduct(BikeID: "${AllData[0]["BikeID"]}")),
                      );








      },
        tooltip: 'Edit',
        child: const Icon(Icons.edit),
      ), 
      
    );
  }
}



class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.purple;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
