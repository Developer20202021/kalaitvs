import 'package:flutter/material.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Your Payment History", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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



                    ListTile(
                       shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ), 

                      title: Text("300 tk", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Text("complete"),
                      subtitle: Text("Date: 21/12/2023"),



                    ),


                    SizedBox(height: 14,),


                    
                    ListTile(
                       shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ), 

                      title: Text("300 tk", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Text("complete"),
                      subtitle: Text("Date: 21/12/2023"),



                    ),


                    SizedBox(height: 14,),

                    
                    ListTile(
                       shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ), 

                      title: Text("300 tk", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Text("complete"),
                      subtitle: Text("Date: 21/12/2023"),



                    ),


                    SizedBox(height: 14,),


                    
                    ListTile(
                       shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ), 

                      title: Text("300 tk", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Text("complete"),
                      subtitle: Text("Date: 21/12/2023"),



                    ),


                    SizedBox(height: 14,),


                    
                    ListTile(
                       shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ), 

                      title: Text("300 tk", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Text("complete"),
                      subtitle: Text("Date: 21/12/2023"),



                    ),


                    SizedBox(height: 14,),


                    
                    ListTile(
                       shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ), 

                      title: Text("300 tk", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Text("complete"),
                      subtitle: Text("Date: 21/12/2023"),



                    ),


                    SizedBox(height: 14,),


                    
                    ListTile(
                       shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ), 

                      title: Text("300 tk", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Text("complete"),
                      subtitle: Text("Date: 21/12/2023"),



                    ),


                    SizedBox(height: 14,),


                    
                    ListTile(
                       shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ), 

                      title: Text("300 tk", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Text("complete"),
                      subtitle: Text("Date: 21/12/2023"),



                    ),


                    SizedBox(height: 14,),


                    
                    ListTile(
                       shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ), 

                      title: Text("300 tk", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Text("complete"),
                      subtitle: Text("Date: 21/12/2023"),



                    ),


                    SizedBox(height: 14,),



                  ]))));
  }
}