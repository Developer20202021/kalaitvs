import 'package:flutter/material.dart';

class UploadBikeImage extends StatefulWidget {
  const UploadBikeImage({super.key});

  @override
  State<UploadBikeImage> createState() => _UploadBikeImageState();
}

class _UploadBikeImageState extends State<UploadBikeImage> {

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Upload Bike Image", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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



                    Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      width: 400,
                      height: 300,
                      child: Center(
                        child: IconButton(onPressed: (){

                        }, icon: Icon(Icons.upload, color: Colors.purple,)),
                      ),
                    ),


                    

                    


                    Center(
                      child: Container(width: 150, child:TextButton(onPressed: (){}, child: Text("Upload", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                       
                                backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
                              ),),),
                    )





                  


                  ]))),
                 
                  
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