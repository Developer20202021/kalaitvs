import 'package:flutter/material.dart';

class UploadCustomerInfo extends StatefulWidget {
  const UploadCustomerInfo({super.key});

  @override
  State<UploadCustomerInfo> createState() => _UploadCustomerInfoState();
}

class _UploadCustomerInfoState extends State<UploadCustomerInfo> {

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Upload Customer File", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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

                      title: Text("File Name", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Text("Done"),
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
                    


                  ]))),
                    floatingActionButton: FloatingActionButton(
                    onPressed: (){
                      showAlertDialog(context);
                    },
                    tooltip: 'Upload',
                    child: const Icon(Icons.upload_file_outlined),
                  ),
                  
                  );
  }
}


showAlertDialog(BuildContext context) {

    TextEditingController myEmailController = TextEditingController();
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {},
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Choose File"),
    content: Column(
      children: [
        IconButton(onPressed: (){

        }, icon: Icon(Icons.file_upload_outlined)),

          TextField(
               
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter File Name',
                           labelStyle: TextStyle(
                  ),
                          hintText: 'Enter File Name',
            
                          //  enabledBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //     ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.purple),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                              ),
                          
                          
                          ),
                      controller: myEmailController,
                    ),
            
            
      ],
    ),

    



    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}