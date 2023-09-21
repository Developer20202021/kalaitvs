import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tvs_app/Screens/CommonScreen/LogInScreen.dart';


class EditCustomerInfo extends StatefulWidget {
  const EditCustomerInfo({super.key});

  @override
  State<EditCustomerInfo> createState() => _EditCustomerInfoState();
}

class _EditCustomerInfoState extends State<EditCustomerInfo> {
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    FocusNode myFocusNode = new FocusNode();

    bool value = false;


 

    return  Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Edit Customer Account", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
            
            
                    TextField(
                      focusNode: myFocusNode,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Name',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer Name',
            
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
            
            
            
            
                 


                      SizedBox(
                      height: 20,
                    ),
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Father Name',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer Father Name',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: myPassController,
                    ),


                    
            
            
            

             SizedBox(
                      height: 20,
                    ),
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Mother Name',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer Mother Name',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: myPassController,
                    ),


                         SizedBox(
                      height: 20,
                    ),
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Address',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer Address',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: myPassController,
                    ),
            
                    SizedBox(
                      height: 10,
                    ),



                    SizedBox(
                      height: 20,
                    ),
            
            
            
                    TextField(
                      focusNode: myFocusNode,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Phone Number',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer Phone Number',
            
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
            
            
            
            
                    SizedBox(
                      height: 20,
                    ),
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Email',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer Email',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: myPassController,
                    ),
            
                    SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer NID',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Customer NID',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: myPassController,
                    ),


                    
                     SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: [

                           Checkbox(
                          value: value,
                          onChanged: ( value) {
                            setState(() {
                              value = value;
                            });
                          },
                        ), 


                         SizedBox(
                      width: 10,
                            ),




                           Flexible(child: Text("Your customer purchase your product using condition?", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),




                    ],),





                    // guarantor


                     SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor1 Name',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 Name',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: myPassController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),


                        SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor1 Phone Number',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 Phone Number',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: myPassController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),



                        SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor1 NID',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 NID',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: myPassController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),




    SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor1 Address',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 Address',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: myPassController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),
                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor2 Name',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor2 Name',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: myPassController,
                    ),


                        SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor2 Phone Number',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor2 Phone Number',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: myPassController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),



    SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor2 NID',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 NID',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: myPassController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),

            
            

                SizedBox(
                      height: 10,
                    ),


                  
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Guarantor2 Address',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.purple: Colors.black
                  ),
                          hintText: 'Enter Guarantor1 Address',
                          //  enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                          //   ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                          
                          
                          ),
                      controller: myPassController,
                    ),


            
            

                   
                  SizedBox(
                      height: 10,
                    ),

                   










            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 150, child:TextButton(onPressed: (){

                            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LogInScreen()),
                      );





                        }, child: Text("Save", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                         
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
        tooltip: 'Upload Customer Image',
        child: const Icon(Icons.upload_outlined),
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
