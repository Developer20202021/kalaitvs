import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tvs_app/Screens/AdminScreen/SingleCustomerFile.dart';



class CustomerProfile extends StatefulWidget {


  final String CustomerNID;
  





  const CustomerProfile({super.key, required this.CustomerNID});

  @override
  State<CustomerProfile> createState() => _EditCustomerInfoState();
}

class _EditCustomerInfoState extends State<CustomerProfile> {









   // Firebase All Customer Data Load

List  AllData = [0];


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
     });

    print(AllData);
}


@override
  void initState() {
    // TODO: implement initState
    getData(widget.CustomerNID);
    super.initState();
  }




















  @override
  Widget build(BuildContext context) {




    List CustomerInfo = [

      <String, String>{

        "Name":"Mahadi Hasan",
        "FatherName": "Mosta Hasan",
        "MotherName": "Amena Khanam",
        "Address":"Joypurhat sadar, Joypurhat",
        "PhoneNumber":"01767298388",
        "NID":"24529525",
        "Email":"",
        "Guarantor1Name":"None",
        "Guarantor1PhoneNumber":"34239482374",
        "Guarantor1Adress":"komorgram",
        "Guarantor1NID":"23477434",
        "Guarantor2Name":"None",
        "Guarantor2PhoneNumber":"34239482374",
        "Guarantor2Adress":"komorgram",
        "Guarantor2NID":"23477434",
        "PurchasedProduct":"2",
      
      },


      {

          "customerFile":[


          {"FileName":"Nid File", "FileID":"2432", "FileUrl":""},
          {"FileName":"Nid File", "FileID":"2432", "FileUrl":""},
          {"FileName":"Nid File", "FileID":"2432", "FileUrl":""},
          {"FileName":"Nid File", "FileID":"2432", "FileUrl":""},
          {"FileName":"Nid File", "FileID":"2432", "FileUrl":""},
          {"FileName":"Nid File", "FileID":"2432", "FileUrl":""},
          {"FileName":"Nid File", "FileID":"2432", "FileUrl":""},
          {"FileName":"Nid File", "FileID":"2432", "FileUrl":""},
          {"FileName":"Nid File", "FileID":"2432", "FileUrl":""},
          {"FileName":"Nid File", "FileID":"2432", "FileUrl":""},
          {"FileName":"Nid File", "FileID":"2432", "FileUrl":""},
          {"FileName":"Nid File", "FileID":"2432", "FileUrl":""},




        ]


      }

    




    ];







  


 

    return  Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Customer Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
            
                    
                    Center(
                      child:  CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                          "https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png",
                        ),
                      ),
                    ),
            
             SizedBox(
                      height: 20,
                    ),


                Table(
                    border: TableBorder.all(color: Colors.purple, width: 1.5),
                    textBaseline: TextBaseline.ideographic,
                      children: [

                
                

                      TableRow(children: [
                                Text("Name", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerName"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),

                      TableRow(children: [
                                Text("Father Name", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerFatherName"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),

                      TableRow(children: [
                                Text("Mother Name", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerMotherName"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),

                      TableRow(children: [
                                Text("Email", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerEmail"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),


                       TableRow(children: [
                                Text("Address", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerAddress"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),
                        

                        TableRow(children: [
                                Text("Phone Number", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerPhoneNumber"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),
                        TableRow(children: [
                                Text("NID", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerNID"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),

                        
                        TableRow(children: [
                                Text("Guarantor1 Name", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerGuarantor1Name"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),
                        
                        TableRow(children: [
                                Text("Guarantor1 Address", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerGuarantor1Address"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),
                        
                        TableRow(children: [
                                Text("Guarantor1 Phone Number", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerGuarantor1PhoneNumber"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),
                        
                        TableRow(children: [
                                Text("Guarantor2 Name", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerGuarantor2Name"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),
                        TableRow(children: [
                                Text("Guarantor2 Address", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerGuarantor2Address"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),
                        TableRow(children: [
                                Text("Guarantor2 Phone Number", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerGuarantor2PhoneNumber"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),
                        TableRow(children: [
                                Text("Guarantor2 NID", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerGuarantor2NID"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),
                              

                         TableRow(children: [
                                Text("Customer Type", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                Text("${AllData[0]["CustomerType"]}", style: TextStyle(fontSize: 15.0),),
                              
                              ]),
                       
                        


                 

                    

                       
                  
                     
                      ],
                    ),








                    SizedBox(height: 15,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Container(width: 150, child:TextButton(onPressed: (){


                                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleCustomerFile(CustomerNID: widget.CustomerNID)));


                         





                        }, child: Text("All Files", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                         
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
              ),),),
                      ],
                    )




                   



            
            
            
            
            
                  ],
                ),
              ),
            ),
        
        floatingActionButton: FloatingActionButton(
      onPressed: (){

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
