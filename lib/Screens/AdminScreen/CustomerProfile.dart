import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/AllAdmin.dart';
import 'package:tvs_app/Screens/AdminScreen/AllCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerInvoice.dart';
import 'package:tvs_app/Screens/AdminScreen/EditPreviousCustomerInfo.dart';
import 'package:tvs_app/Screens/AdminScreen/HomeScreen.dart';
import 'package:tvs_app/Screens/AdminScreen/SingleCustomerFile.dart';
import 'package:tvs_app/Screens/CommonScreen/ProductScreen.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CustomerProfile extends StatefulWidget {


  final String CustomerNID;
  





  const CustomerProfile({super.key, required this.CustomerNID});

  @override
  State<CustomerProfile> createState() => _EditCustomerInfoState();
}

class _EditCustomerInfoState extends State<CustomerProfile> {


bool loading = true;







   // Firebase All Customer Data Load

List  AllData = [];


  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('customer');

Future<void> getData(String CustomerNID) async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();


    Query query = _collectionRef.where("CustomerNID", isEqualTo: CustomerNID);
    QuerySnapshot querySnapshot = await query.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();

     setState(() {
       AllData = querySnapshot.docs.map((doc) => doc.data()).toList();

      //  loading = false;
        getSaleData();
     });

    print(AllData);
}














  // Firebase All Customer Data Load

List  AllSaleData = [];
var BikeSaleDataLoad = "";



Future<void> getSaleData() async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();
  // setState(() {
  //   loading = true;
  // });


  CollectionReference _collectionBikeSaleRef =
    FirebaseFirestore.instance.collection('BikeSaleInfo');

    Query BikeSaleDataQuery = _collectionBikeSaleRef.where("CustomerNID", isEqualTo: widget.CustomerNID);
    QuerySnapshot BikeSaleDataQuerySnapshot = await BikeSaleDataQuery.get();

    // Get data from docs and convert map to List
     AllSaleData = BikeSaleDataQuerySnapshot.docs.map((doc) => doc.data()).toList();

       if (AllSaleData.length == 0) {
      setState(() {
        BikeSaleDataLoad = "0";
      });
       
     } else {

      setState(() {
      
       AllSaleData = BikeSaleDataQuerySnapshot.docs.map((doc) => doc.data()).toList();
       loading = false;
     });
       
     }

    print(AllSaleData);
}


















@override
  void initState() {
    // TODO: implement initState
    
    getData(widget.CustomerNID);

    // getSaleData();
    super.initState();
  }



  Future refresh() async{


    setState(() {
            loading = true;
            
           getData(widget.CustomerNID);
          //  getSaleData();

    });

  }
















  @override
  Widget build(BuildContext context) {




    


 

    return  Scaffold(
      backgroundColor: Colors.white,


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
                onPressed: () async{



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
                  size: 35,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {

     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductScreen(indexNumber: "2",)));


                },
                icon: const Icon(
                  Icons.electric_bike_outlined,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {


                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllAdmin(indexNumber: "3",)));




                },
                icon: const Icon(
                  Icons.admin_panel_settings_outlined,
                  color: Colors.white,
                  size: 35,
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
                  size: 35,
                ),
              ),
            ],
          ),),
      ),
      
      appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Customer Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
      
                child: loading?Center(
          child: LoadingAnimationWidget.discreteCircle(
            color: const Color(0xFF1A1A3F),
            secondRingColor: Theme.of(context).primaryColor,
            thirdRingColor: Colors.white,
            size: 100,
          ),
        ):Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              
                      
                      Center(
                        child:  CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                            "${AllData[0]["CustomerImageUrl"]}",
                          ),
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
                                      child: Text("Name", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                    )),
                                  
                                  
                                  Container(
                                    
                                    
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${AllData[0]["CustomerName"].toString().capitalize()}", style: TextStyle(fontSize: 15.0),),
                                    )),
                                
                                ]),
      
      
      
      
                        TableRow(
                          
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          children: [
                                  Container(
                                    
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Father Name", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                    )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerFatherName"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
      
      
      
      
                        TableRow(decoration: BoxDecoration(color: Colors.grey[200]),children: [
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Mother Name", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerMotherName"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
      
                        TableRow(decoration: BoxDecoration(color: Colors.grey[200]),children: [
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Email", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerEmail"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
      
      
                         TableRow(decoration: BoxDecoration(color: Colors.grey[200]),children: [
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Address", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerAddress"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
                          
      
                          TableRow(decoration: BoxDecoration(color: Colors.grey[200]),children: [
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Phone Number", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerPhoneNumber"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
      
      
      
                          TableRow(decoration: BoxDecoration(color: Colors.grey[200]),children: [
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("NID", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerNID"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
      
                          
                          TableRow(decoration: BoxDecoration(color: Colors.grey[200]),children: [
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Guarantor1 Name", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerGuarantor1Name"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
                          
                          TableRow(children: [
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Guarantor1 Address", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerGuarantor1Address"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
                          
                          TableRow(decoration: BoxDecoration(color: Colors.grey[200]),children: [
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Guarantor1 Phone Number", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerGuarantor1PhoneNumber"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
                          
                          TableRow(decoration: BoxDecoration(color: Colors.grey[200]),children: [
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Guarantor2 Name", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerGuarantor2Name"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
                          TableRow(decoration: BoxDecoration(color: Colors.grey[200]),children: [
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Guarantor2 Address", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerGuarantor2Address"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
                          TableRow(decoration: BoxDecoration(color: Colors.grey[200]),children: [
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Guarantor2 Phone Number", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerGuarantor2PhoneNumber"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
                          TableRow(decoration: BoxDecoration(color: Colors.grey[200]),children: [
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Guarantor2 NID", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerGuarantor2NID"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
                                
      
                           TableRow(decoration: BoxDecoration(color: Colors.grey[200]),children: [
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Customer Type", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  )),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${AllData[0]["CustomerType"]}", style: TextStyle(fontSize: 15.0),),
                                  )),
                                
                                ]),
                         
                          
      
      
                   
      
                      
      
                         
                    
                       
                        ],
                      ),


                    SizedBox(height: 15,),




                    for(int i = 0; i<AllSaleData.length; i++)

                     BikeSaleDataLoad == "0" ?Text("No Data Available"):Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Container(
                       
                 decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 230, 250),
      
                  border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor
                          ),
                  borderRadius: BorderRadius.circular(10)      
                 ),
      
                    
                    child: ListTile(
                      
                   
                        
                              title: Text("${AllSaleData[i]["BikeName"]}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                              trailing: 
                                  PopupMenuButton(
                                    onSelected: (value) {
                                      // your logic
                                    },
                                    itemBuilder: (BuildContext bc) {
                                      return  [
                                        PopupMenuItem(
                                          onTap: () {

                                       
      
      
                                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfPreviewPage(CustomerName: AllData[0]["CustomerName"].toString().capitalize(), CustomerNID: AllData[0]["CustomerNID"], CustomerPhoneNumber: AllData[0]["CustomerPhoneNumber"], CustomerFileNo: AllSaleData[i]["BikeDeliveryNo"], CustomerAddress: AllData[0]["CustomerAddress"], BikeName: AllSaleData[i]["BikeName"], BikeEngineNo: AllSaleData[i]["BikeEngineNo"], BikeChassisNo: AllSaleData[i]["BikeChassisNo"], BikeSalePrice: AllSaleData[i]["BikeSalePrice"], BikeCashInAmount: AllSaleData[i]["BikeBillPay"], BikePaymentDue: AllSaleData[i]["BikePaymentDue"], BikeColor: AllSaleData[i]["BikeColor"], BikeCondition: AllSaleData[i]["BikeConditionMonth"])));
      
      
                               
      
      
      
      
      
      
                                            
                                          },
                                          child: Text("Print"),
                                          value: '/hello',
                                        ),
                                        PopupMenuItem(
                                          onTap: ()async {

                                      try {

                                              CollectionReference _collectionRef =
                                                FirebaseFirestore.instance.collection('BikeSaleInfo');
                                                    _collectionRef.doc(AllSaleData[i]["SaleID"]).delete().then(
                                            (doc) => setState((){


                                          AwesomeDialog(
                                            showCloseIcon: true,

                                            btnOkOnPress: () {
                                              Navigator.pop(context);
                                            },
                                        
                                            context: context,
                                            dialogType: DialogType.success,
                                            animType: AnimType.rightSlide,
                                            body: SingleChildScrollView(
                                              child: Text("Delete Successfull"))).show();




                                            }),
                                            onError: (e) => print("Error updating document $e"),
                                          );
                                        
                                      } catch (e) {


                                        AwesomeDialog(
                                            showCloseIcon: true,

                                            btnOkOnPress: () {
                                              Navigator.pop(context);
                                            },
                                        
                                            context: context,
                                            dialogType: DialogType.success,
                                            animType: AnimType.rightSlide,
                                            body: SingleChildScrollView(
                                              child: Text("${e}"))).show();
                                        
                                      }
                                            
                                          },
                                          child: Text("Delete"),
                                          value: '/about',
                                        ),
                                     
                                      ];
                                    },
                                  ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("NID:${AllSaleData[i]["CustomerNID"]}"),
                                  Text("Name:${AllSaleData[i]["CustomerName"]}"),
                                  Text("Phone Number:${AllSaleData[i]["CustomerPhoneNumber"]}"),
                  
                                  Text("Date: ${AllSaleData[i]["BikeSaleDate"]}"),

                                   Text("Eng No: ${AllSaleData[i]["BikeEngineNo"]}"),
                                   Text("Chassis No: ${AllSaleData[i]["BikeChassisNo"]}"),

                                   Text("DeliveryNo: ${AllSaleData[i]["BikeDeliveryNo"]}"),

                                   Text("Sale Price: ${AllSaleData[i]["BikeSalePrice"]}"),
                                  //  BikeConditionMonth
// BikeDeliveryNo
                                   Text("Condition: ${AllSaleData[i]["BikeConditionMonth"]} month"),

                                   Text("Color: ${AllSaleData[i]["BikeColor"]}"),


                                   Text("Cash In: ${AllSaleData[i]["BikeBillPay"]} "),
                                ],
                              ),
                        
                        
                        
                            ),
                  ),
                ),




      
      
      
      
      
      
      
      
                      SizedBox(height: 15,),
      
      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
      
                          Container(width: 150, child:TextButton(onPressed: (){
      
      
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleCustomerFile(CustomerNID: widget.CustomerNID)));
      
      
                           
      
      
      
      
      
                          }, child: Text("All Files", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                           
                  backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
                ),),),
                        ],
                      )
      
      
      
      
                     
      
      
      
              
              
              
              
              
                    ],
                  ),
                ),
              ),
      ),
        
        floatingActionButton: FloatingActionButton(
      onPressed: (){




          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditPreviousCustomer(CustomerNID: AllData[0]["CustomerNID"] , CustomerAddress:  AllData[0]["CustomerAddress"], CustomerName: AllData[0]["CustomerName"] , CustomerPhoneNumber: AllData[0]["CustomerPhoneNumber"]  , CustomerEmail: AllData[0]["CustomerEmail"] , CustomerFatherName: AllData[0]["CustomerFatherName"] , CustomerMotherName:  AllData[0]["CustomerMotherName"], CustomerGuarantor1Name:  AllData[0]["CustomerGuarantor1Name"], CustomerGuarantor1PhoneNumber:  AllData[0]["CustomerGuarantor1PhoneNumber"], CustomerGuarantor1Address:  AllData[0]["CustomerGuarantor1Address"], CustomerGuarantor2Name:  AllData[0]["CustomerGuarantor2Name"], CustomerGuarantor2PhoneNumber:  AllData[0]["CustomerGuarantor2PhoneNumber"], CustomerGuarantor2NID:  AllData[0]["CustomerGuarantor2NID"], CustomerGuarantor2Address: AllData[0]["CustomerGuarantor2Address"] , CustomerGuarantor1NID: AllData[0]["CustomerGuarantor1NID"])),
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
