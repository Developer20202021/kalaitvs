import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:tvs_app/Screens/AdminScreen/SingleCustomer.dart';




class SearchByNID extends StatefulWidget {



final BikeName;
final BikeColor;
final BikeModelName;
final BikeSalePrice;




  const SearchByNID({super.key, required this.BikeName, required this.BikeColor, required this.BikeModelName, required this.BikeSalePrice});

  @override
  State<SearchByNID> createState() => _SearchByNIDState();
}

class _SearchByNIDState extends State<SearchByNID> {
  TextEditingController CustomerNIDController = TextEditingController();
  TextEditingController CustomerPhoneNumberController = TextEditingController();


  bool nidFound = true;



  
   // Firebase All Customer Data Load

List  AllData = [];


  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('customer');

Future<void> getData(context) async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();


    Query query = _collectionRef.where("CustomerNID", isEqualTo: CustomerNIDController.text);
    QuerySnapshot querySnapshot = await query.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();

     int AllDataLength = AllData.length;

     print(AllDataLength);

     if (AllDataLength == 0) {

      setState(() {
        nidFound = false;
        print("No Customer Found");

        CustomerNIDController.clear();
        CustomerPhoneNumberController.clear();
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      });
       
     } else {

           Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleCustomer(BikeName: widget.BikeName, BikeModelName: widget.BikeModelName, BikeColor: widget.BikeColor, BikeSalePrice: widget.BikeSalePrice, CustomerNID: AllData[0]["CustomerNID"], CustomerPhoneNumber: AllData[0]["CustomerPhoneNumber"], CustomerAddress: AllData[0]["CustomerAddress"], CustomerName: AllData[0]["CustomerName"], CustomerType: AllData[0]["CustomerType"],)));

       
     }


     setState(() {
       AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
     });

    print(AllData);
}


@override
  void initState() {
    // TODO: implement initState
    // getData(widget.CustomerNID);
    super.initState();
  }

















  @override
  Widget build(BuildContext context) {

    
 

    return Scaffold(
      
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Search Customer",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: Container(

        child:  CustomPaint(
          painter: CurvePainter(),

     
              
            
            
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                  nidFound? Text(""):  Center(
                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                    
                    
                                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.close, color: Colors.red,),
                          Text("No Data Found !!!"),
                        ],
                      ),
                                      ),
                       
                                   decoration: BoxDecoration(
                                    color: Colors.red[100],
                    
                                    border: Border.all(
                            width: 2,
                            color: Colors.white

                            
                          ),
                                    borderRadius: BorderRadius.circular(10)      
                                   ),)),
                    ),

            
                    
                    // Center(
                    //   child: Lottie.asset(
                    //   'lib/images/animation_lk8fkoa8.json',
                    //     fit: BoxFit.cover,
                    //     width: 200,
                    //     height: 200
                    //   ),
                    // ),
            
            SizedBox(
                      height: 5,
                    ),
            
            
            
                    TextField(
                      keyboardType: TextInputType.number,
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter NID',
                
                          hintText: 'Enter Your NID',
            
                          //  enabledBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //     ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                              ),
                          
                          
                          ),
                      controller: CustomerNIDController,
                    ),
            
            
            
            
                    SizedBox(
                      height: 5,
                    ),
            
            
            
            
            
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Phone Number',
                         
                          hintText: 'Enter Your Phone Number',
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
                      controller: CustomerPhoneNumberController,
                    ),
            
                    SizedBox(
                      height: 5,
                    ),
            
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 150, child:TextButton(onPressed: () async{



                          getData(context);


                     





                        }, child: Text("Search", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                         
                backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
              ),),),








                      ],
                    )
            
            
            
                  ],
                ),
              ),
            ),
        ),
      
      
    );
  }
}



class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xf08f00ff);
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
