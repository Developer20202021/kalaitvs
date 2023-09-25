import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tvs_app/Screens/AdminScreen/SingleCustomerFileView.dart';

class SingleCustomerFile extends StatefulWidget {

  final CustomerNID;
  




  const SingleCustomerFile({super.key, required this.CustomerNID});

  @override
  State<SingleCustomerFile> createState() => _SingleCustomerFileState();
}

class _SingleCustomerFileState extends State<SingleCustomerFile> {


  // Firebase All Customer Data Load

List  AllData = [0];


  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('CustomerFileInfo');

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


    









    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title:  Text("${widget.CustomerNID} File Info", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: ListView.separated(
            itemCount: AllData.length,
            separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 25,),
            itemBuilder: (BuildContext context, int index) {

              // DateTime paymentDateTime = (AllData[index]["PaymentDateTime"] as Timestamp).toDate();


              return   Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                           shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ), 
                    
                          title: Text("${AllData[index]["FileName"]}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),),

                          trailing: Container(width: 150, child:TextButton(onPressed: (){


                                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleCustomerFileView(FileUrl: AllData[index]["CustomerFileUrl"])));


                         





                        }, child: Text("View", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                         
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
              ),),),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("${AllData[index]["BikeName"]}"),

                              Text("NID:${AllData[index]["CustomerNID"]}"),

                              Text("Date: ${AllData[index]["FileUploadDateTime"]}"),
                            ],
                          ),
                    
                    
                    
                        ),
              );
            },
          ));
  }
}






    