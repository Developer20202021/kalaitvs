import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tvs_app/Screens/AdminScreen/UploadBikeImage.dart';
import 'package:uuid/uuid.dart';




class UploadProduct extends StatefulWidget {
  const UploadProduct({super.key});

  @override
  State<UploadProduct> createState() => _UploadProductState();
}

class _UploadProductState extends State<UploadProduct> {

  var uuid = Uuid();
 
  
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
  TextEditingController BikeBatteryRatingController = TextEditingController();
  TextEditingController BikeTailLampController = TextEditingController();
  TextEditingController BikeTyreFrontController = TextEditingController();
  TextEditingController BikeHeadlampController = TextEditingController();
  TextEditingController BikeTyreRearController = TextEditingController();
  TextEditingController BikeABSController = TextEditingController();
  TextEditingController BikeBrakeFluidController = TextEditingController();
  TextEditingController BikeBrakeFrontController = TextEditingController();
  TextEditingController BikeBrakeRearController = TextEditingController();
  TextEditingController BikeFuelTankCapacityController = TextEditingController();
  TextEditingController BikeGroundClearanceController = TextEditingController();
  TextEditingController BikeHeightController = TextEditingController();
  TextEditingController BikeLengthController = TextEditingController();
  TextEditingController BikeWidthController = TextEditingController();
  TextEditingController BikeKerbWeightController = TextEditingController();
  TextEditingController BikeSaddleHeightController = TextEditingController();
  TextEditingController BikeWheelBaseController = TextEditingController();
  TextEditingController BikeFeaturesController = TextEditingController();
  TextEditingController BikeShowroomAvailableNumberController = TextEditingController();
  TextEditingController BikeBuyingPriceController = TextEditingController();
  TextEditingController BikeSalePriceController = TextEditingController();
  TextEditingController BikeNameController = TextEditingController();
  TextEditingController ColorAvailableController = TextEditingController();
  

  


  @override
  Widget build(BuildContext context) {

    FocusNode myFocusNode = new FocusNode();

     var bikeid = uuid.v4();
 

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



                TextField(
                 
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Bike Name',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Bike Name',
              
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
                  controller: BikeNameController,
                ),
              
              
              
              
                SizedBox(
                  height: 20,
                ),
              
              
              
           
              Text("ENGINE & PERFORMANCE", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      
          SizedBox(
                  height: 20,
                ),
              
                TextField(
                 
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
                  controller: BikeTypeController,
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
                  controller: BikeEngineCapacityController,
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
                  controller: BikeMaximumPowerController,
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
                  controller: BikeMaximumTorqueController,
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
                  controller: BikeFuelSupplySystemController,
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
                  controller: BikeValvePerCylinderController,
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
                  controller: BikePowertoWeightRationController,
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
                  controller: BikeCoolingSystemController,
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
                  controller:BikeMufflerController,
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
                  controller: BikeGearBoxController,
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
                  controller: BikeRearSuspensionController,
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
                  controller: BikeFrameController,
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
                  controller: BikeMaxSpeedController,
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
                  controller: BikeFrontSuspensionController,
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
                  controller: BikeBatteryRatingController,
                ),
              
                SizedBox(
                  height: 10,
                ),
      
      
                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Head lamp',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Head lamp',
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
                  controller: BikeHeadlampController,
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
                  controller: BikeTailLampController,
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
                  controller: BikeTyreFrontController,
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
                      hintText: 'Tyre Rear',
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
                  controller: BikeTyreRearController,
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
                  controller: BikeABSController,
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
                  controller: BikeBrakeFluidController,
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
                  controller: BikeBrakeFrontController,
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
                  controller: BikeBrakeRearController,
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
                  controller: BikeFuelTankCapacityController,
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
                  controller: BikeGroundClearanceController,
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
                  controller: BikeHeightController,
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
                  controller: BikeLengthController,
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
                  controller: BikeWidthController,
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
                  controller: BikeKerbWeightController,
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
                  controller: BikeSaddleHeightController,
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
                  controller: BikeWheelBaseController,
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
                  controller: BikeFeaturesController,
                ),
              
                SizedBox(
                  height: 10,
                ),



                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Color Available',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Color Available',
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
                  controller: ColorAvailableController,
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
                  controller: BikeShowroomAvailableNumberController,
                ),
              
                SizedBox(
                  height: 10,
                ),



                   TextField(
                    keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Per Bike Buying Price',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.purple: Colors.black
              ),
                      hintText: 'Per Bike Buying Price',
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
                  controller: BikeBuyingPriceController,
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
                  controller: BikeSalePriceController,
                ),
              
                SizedBox(
                  height: 10,
                ),



                
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
              
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 150, child:TextButton(onPressed: (){







                        Future uploadBike() async{

                      final docUser = FirebaseFirestore.instance.collection("product");

                      // var productID = docUser.doc().id;
                      print("___________________________________________________________________________________________________${bikeid}");

                      final jsonData ={
                        "BikeName":BikeNameController.text,
                        "BikeType":BikeTypeController.text,
                        "BikeABS":BikeABSController.text,
                        "BikeBatteryRating":BikeBatteryRatingController.text,
                        "BikeBrakeFluid":BikeBrakeFluidController.text,
                        "BikeBrakeFront":BikeBrakeFrontController.text,
                        "BikeBrakeRear":BikeBrakeRearController.text,
                        "BikeBuyingPrice":BikeBuyingPriceController.text,
                        "BikeCoolingSystem":BikeCoolingSystemController.text,
                        "ColorAvailable":ColorAvailableController.text,
                        "BikeEngineCapacity":BikeEngineCapacityController.text,
                        "BikeFeatures":BikeFeaturesController.text,
                        "BikeFrame":BikeFrameController.text,
                        "BikeFrontSuspension":BikeFrontSuspensionController.text,
                        "BikeFuelSupplySystem":BikeFuelSupplySystemController.text,
                        "BikeFuelTankCapacity":BikeFuelTankCapacityController.text,
                        "BikeFuelsupplysystem":BikeFuelSupplySystemController.text,
                        "BikeGearBox":BikeGearBoxController.text,
                        "BikeGroundClearance":BikeGroundClearanceController.text,
                        "BikeHeadlamp":BikeHeadlampController.text,
                        "BikeHeight":BikeHeightController.text,
                        "BikeKerbWeight":BikeKerbWeightController.text,
                        "BikeLength":BikeLengthController.text,
                        "BikeMaxSpeed":BikeMaxSpeedController.text,
                        "BikeMaximumPower":BikeMaximumPowerController.text,
                        "BikeMaximumTorque":BikeMaximumTorqueController.text,
                        "BikeMuffler":BikeMufflerController.text,
                        "BikePowertoWeightRation":BikePowertoWeightRationController.text,


                        //

                        
                        "BikeRearSuspension":BikeRearSuspensionController.text,
                        "BikeSaddleHeight":BikeSaddleHeightController.text,
                        "BikeSalePrice":BikeSalePriceController.text,
                        "BikeShowroomAvailableNumber":BikeShowroomAvailableNumberController.text,
                        "BikeTailLamp":BikeTailLampController.text,
                        "BikeTyreFront":BikeTyreFrontController.text,
                        "BikeTyreRear":BikeTyreRearController.text,
                        "BikeValvePerCylinder":BikeValvePerCylinderController.text,
                        "BikeWheelBase":BikeWheelBaseController.text,
                        "BikeWidth":BikeWidthController.text,
                        "BikeID":bikeid

                  
                      };


                    await docUser.doc(bikeid).set(jsonData).then((value) =>               Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  UploadBikeImage(BikeName: BikeNameController.text, BikeID:bikeid)),
                      )).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                              content: const Text('Something Wrong!'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            )));



                    }










                              uploadBike();

















            //                 Navigator.push(
            //             context,

            //  MaterialPageRoute(builder: (context) => const UploadBikeImage()),
            //           );





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