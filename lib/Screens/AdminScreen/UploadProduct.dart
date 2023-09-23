import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tvs_app/Screens/AdminScreen/UploadBikeImage.dart';




class UploadProduct extends StatefulWidget {
  const UploadProduct({super.key});

  @override
  State<UploadProduct> createState() => _UploadProductState();
}

class _UploadProductState extends State<UploadProduct> {
  TextEditingController myEmailController = TextEditingController();
  TextEditingController BikeTypeController = TextEditingController();
  TextEditingController BikeEngineCapacityController = TextEditingController();
  TextEditingController BikeMaximumPowerController = TextEditingController();
  TextEditingController BikeMaximumTorqueController = TextEditingController();
  TextEditingController BikeFuelSupplySystemController = TextEditingController();
  TextEditingController BikeFuelsupplysystemController = TextEditingController();
  TextEditingController BikeValvePerCylinderController = TextEditingController();
  TextEditingController BikePowertoWeightRationController = TextEditingController();
  TextEditingController BikeCoolingSystemController = TextEditingController();
  TextEditingController BikeMufflerController = TextEditingController();
  TextEditingController BikeGearBoxController = TextEditingController();
  TextEditingController BikeRearSuspensionController = TextEditingController();
  TextEditingController BikeFrameController = TextEditingController();
  TextEditingController BikeFrontSuspensionController = TextEditingController();
  TextEditingController BikeMaxSpeedController = TextEditingController();
  TextEditingController myPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    FocusNode myFocusNode = new FocusNode();
 

    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Upload Bike",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        child: Container(
      
          child:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                
              
              
              SizedBox(
                  height: 20,
                ),
              
           
              Text("ENGINE & PERFORMANCE", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      
          SizedBox(
                  height: 20,
                ),
              
                TextField(
                  focusNode: myFocusNode,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Type',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Type',
              
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
                      labelText: 'Engine Capacity',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Engine Capacity',
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
                      labelText: 'Maximum Power',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Maximum Power',
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
                      labelText: 'Maximum Torque',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Maximum Torque',
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
                      labelText: 'Fuel supply system',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Fuel supply system',
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
                      labelText: 'valve per cylinder',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'valve per cylinder',
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
                      labelText: 'Power to Weight Ration',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Power to weight Ratio',
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
                      labelText: 'Cooling System',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Cooling system',
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
                      labelText: 'Muffler',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Muffler',
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
                      labelText: 'Gear Box',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Gear Box',
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
                      labelText: 'Rear Suspension',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Rear Suspension',
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
                      labelText: 'Frame',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Frame',
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
                      labelText: 'Max Speed',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Max Speed',
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
              
           
              Text("CHASSIS, SUSPENSION & ELECTRICAL", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      
          SizedBox(
                  height: 20,
                ),
      
      
      
      
                
                  TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Frame',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Frame',
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
                      labelText: 'Front Suspension',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Front Suspension',
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
                      labelText: 'Rear Suspension',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Rear Suspension',
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
                      labelText: 'Battery Rating',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Battery rating',
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
                      labelText: 'Headlamp',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Headlamp',
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
                      labelText: 'Tail Lamp',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Tail Lamp',
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
              
           
              Text("WHEEL, TYRE & BRAKE", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      
      
      
              
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tyre Front',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Tyre Front',
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
                      labelText: 'Tyre Rear',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Tail Rear',
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
                      labelText: 'ABS',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'ABS',
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
                      labelText: 'Brake Fluid',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Brake Fluid',
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
                      labelText: 'Brake Front',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Brake Front',
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
                      labelText: 'Brake Rear',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Brake Rear',
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
              
           
              Text("DIMENSIONS, WEIGHT & FUEL TANK CAPACITY", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      
      
              
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Fuel Tank Capacity',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Fuel Tank Capacity',
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
                      labelText: 'Ground Clearance',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Ground Clearance',
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
                      labelText: 'Height',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Height',
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
                      labelText: 'Length',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Length',
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
                      labelText: 'Width',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Width',
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
                      labelText: 'Kerb Weight',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Kerb Weight',
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
                      labelText: 'Saddle Height',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Saddle Height',
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
                      labelText: 'WheelBase',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'WheelBase',
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
              
           
              Text("FEATURES", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      
      
              
                
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Features',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Features',
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
              
           
              Text("How many bike add in this time?", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
      
            
                 TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Number',
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
                    keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Per Bike Buying price',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Per Bike Buying price',
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
                    keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Per Bike Sale price',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Per Bike Sale price',
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

             MaterialPageRoute(builder: (context) => const UploadBikeImage()),
                      );





                    }, child: Text("Upload Product", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                     
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
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






Future UploadProductInfo(String CustomerName, CustomerNID, CustomerAddress, CustomerPhoneNumber) async{

  final docUser = FirebaseFirestore.instance.collection("Bikes");

  final jsonData ={
    "CustomerName":CustomerName,
    "CustomerNID":CustomerNID,
    "CustomerAddress":CustomerAddress,
    "CustomerPhoneNumber":CustomerPhoneNumber
  };


 await docUser.doc(CustomerNID).set(jsonData);



}