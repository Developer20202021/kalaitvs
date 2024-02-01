import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/UploadBikeImage.dart';
import 'package:tvs_app/Screens/CommonScreen/ProductScreen.dart';





class EditProduct extends StatefulWidget {

  final BikeID;



  const EditProduct({super.key, required this.BikeID});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {



bool loading = true;

 
  
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
  TextEditingController RPMController = TextEditingController();
  TextEditingController HorsePowerController = TextEditingController();
  TextEditingController YearOfManufactureController = TextEditingController();
  TextEditingController SeatingCapacityController = TextEditingController();










var DataLoad = "";

 



// Firebase All Customer Data Load

List  AllData = [{
                       "BikeName":" ",
                        "BikeType":" ",
                        "BikeABS":" ",
                        "BikeBatteryRating":" ",
                        "BikeBrakeFluid":" ",
                        "BikeBrakeFront":" ",
                        "BikeBrakeRear":" ",
                        "BikeBuyingPrice":" ",
                        "BikeCoolingSystem":" ",
                        "ColorAvailable":" ",
                        "BikeEngineCapacity":" ",
                        "BikeFeatures":" ",
                        "BikeFrame":" ",
                        "BikeFrontSuspension":' ',
                        "BikeFuelSupplySystem":" ",
                        "BikeFuelTankCapacity":" ",
                        "BikeFuelsupplysystem":" ",
                        "BikeGearBox":" ",
                        "BikeGroundClearance":" ",
                        "BikeHeadlamp":" ",
                        "BikeHeight":" ",
                        "BikeKerbWeight":" ",
                        "BikeLength": " ",
                        "BikeMaxSpeed":" ",
                        "BikeMaximumPower": " ",
                        "BikeMaximumTorque":" ",
                        "BikeMuffler":" ",
                        "BikePowertoWeightRation":" ",


                        //

                        
                        "BikeRearSuspension":" ",
                        "BikeSaddleHeight":" ",
                        "BikeSalePrice":" ",
                        "BikeShowroomAvailableNumber":" ",
                        "BikeTailLamp":" ",
                        "BikeTyreFront":" ",
                        "BikeTyreRear":" ",
                        "BikeValvePerCylinder":" ",
                        "BikeWheelBase":" ",
                        "BikeWidth":" ",
                        "BikeID":" ",
                        "RPM":" ",
                        "HorsePower":" ",
                        "YearOfManufacture":" ",
                        "SeatingCapacity":" ",
}];


  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('product');

Future<void> getData() async {
    // Get docs from collection reference
     Query query = _collectionRef.where("BikeID", isEqualTo: widget.BikeID);
    QuerySnapshot querySnapshot = await query.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
     if (AllData.length == 0) {
      setState(() {
        DataLoad = "0";
        loading = false;
      });
       
     } else {

      setState(() {
     
      AllData = querySnapshot.docs.map((doc) => doc.data()).toList();

      setState(() {
        loading = false;
      });



// Future.delayed(const Duration(milliseconds: 1500), () {

// // Here you can write your code

//   setState(() {
//     // Here you can write your code for open new view
//     loading = false;
//   });

// });

     });
       
     }
     

    print(AllData);
}





@override
  void initState() {
    // TODO: implement initState
  
    getData();



    
    super.initState();
  }












  

  


  @override
  Widget build(BuildContext context) {

    FocusNode myFocusNode = new FocusNode();

    




BikeTypeController.text = AllData[0]["BikeType"];
BikeEngineCapacityController.text = AllData[0]["BikeEngineCapacity"];
BikeMaximumPowerController.text = AllData[0]["BikeMaximumPower"];
BikeMaximumTorqueController.text=AllData[0]["BikeMaximumTorque"];
BikeFuelSupplySystemController.text= AllData[0]["BikeFuelSupplySystem"];
BikeFuelSupplySystemController.text=AllData[0]["BikeFuelSupplySystem"];
BikeValvePerCylinderController.text=AllData[0]["BikeValvePerCylinder"];
BikePowertoWeightRationController.text=AllData[0]["BikePowertoWeightRation"];
BikeCoolingSystemController.text=AllData[0]["BikeCoolingSystem"];
BikeMufflerController.text=AllData[0]["BikeMuffler"];
BikeGearBoxController.text=AllData[0]["BikeGearBox"];
BikeRearSuspensionController.text=AllData[0]["BikeRearSuspension"];
BikeFrameController.text=AllData[0]["BikeFrame"];
BikeFrontSuspensionController.text=AllData[0]["BikeFrontSuspension"];
BikeMaxSpeedController.text=AllData[0]["BikeMaxSpeed"];
BikeBatteryRatingController.text=AllData[0]["BikeBatteryRating"];
BikeTailLampController.text=AllData[0]["BikeTailLamp"];
BikeTyreFrontController.text=AllData[0]["BikeTyreFront"];
BikeHeadlampController.text=AllData[0]["BikeHeadlamp"];
BikeTyreRearController.text=AllData[0]["BikeTyreRear"];
BikeABSController.text=AllData[0]["BikeABS"];
BikeBrakeFluidController.text=AllData[0]["BikeBrakeFluid"];
BikeBrakeFrontController.text=AllData[0]["BikeBrakeFront"];
BikeBrakeRearController.text=AllData[0]["BikeBrakeRear"];
BikeFuelTankCapacityController.text=AllData[0]["BikeFuelTankCapacity"];
BikeGroundClearanceController.text=AllData[0]["BikeGroundClearance"];
BikeHeightController.text=AllData[0]["BikeHeight"];
BikeLengthController.text=AllData[0]["BikeLength"];
BikeWidthController.text=AllData[0]["BikeWidth"];
BikeKerbWeightController.text=AllData[0]["BikeKerbWeight"];
BikeSaddleHeightController.text=AllData[0]["BikeSaddleHeight"];
BikeWheelBaseController.text=AllData[0]["BikeWheelBase"];
BikeFeaturesController.text=AllData[0]["BikeFeatures"];
BikeShowroomAvailableNumberController.text=AllData[0]["BikeShowroomAvailableNumber"];
BikeBuyingPriceController.text = AllData[0]["BikeBuyingPrice"];
BikeSalePriceController.text = AllData[0]["BikeSalePrice"];
BikeNameController.text = AllData[0]["BikeName"];
ColorAvailableController.text = AllData[0]["ColorAvailable"];
RPMController.text = AllData[0]["RPM"];
HorsePowerController.text = AllData[0]["HorsePower"];
YearOfManufactureController.text = AllData[0]["YearOfManufacture"];
SeatingCapacityController.text = AllData[0]["SeatingCapacity"];





// Future.delayed(const Duration(milliseconds: 1500), () {

// // Here you can write your code

//   setState(() {
//     // Here you can write your code for open new view
//     loading = false;
//   });

// });


















 

    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Edit Bike",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: loading?Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: const Color(0xFF1A1A3F),
          secondRingColor: Theme.of(context).primaryColor,
          thirdRingColor: Colors.white,
          size: 100,
        ),
      ):DataLoad == "0"? Center(child: Text("No Data Available")):SingleChildScrollView(
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
                      labelText: 'RPM',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'RPM',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: RPMController,
                ),
              
                SizedBox(
                  height: 10,
                ),


                 TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'HorsePower',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'HorsePower',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: HorsePowerController,
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



                
                TextField(
  
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Year of Manufacture',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Year of Manufacture',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: YearOfManufactureController,
                ),
              
                SizedBox(
                  height: 10,
                ),


                                TextField(
  
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Seating Capacity',
                       labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.green: Colors.black
              ),
                      hintText: 'Seating Capacity',
                      //  enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                      
                      
                      ),
                  controller: SeatingCapacityController,
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
                    Container(width: 150, child:TextButton(onPressed: () async{







                        Future uploadBike() async{

                     final docUser = FirebaseFirestore.instance.collection("product").doc(widget.BikeID);

                      // var productID = docUser.doc().id;
                     

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
                        "RPM":RPMController.text.trim(),
                        "HorsePower":HorsePowerController.text.trim(),
                        "YearOfManufacture":YearOfManufactureController.text.trim(),
                        "SeatingCapacity":SeatingCapacityController.text.trim(),
                     

                  
                      };


                    await docUser.update(jsonData).then((value) =>setState((){


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ProductScreen(indexNumber: "2",)),
                      );




                    })).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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





                    }, child: Text("Edit Product", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                     
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






// Future EditProductInfo(String CustomerName, CustomerNID, CustomerAddress, CustomerPhoneNumber) async{

//   final docUser = FirebaseFirestore.instance.collection("Bikes");

//   final jsonData ={
//     "CustomerName":CustomerName,
//     "CustomerNID":CustomerNID,
//     "CustomerAddress":CustomerAddress,
//     "CustomerPhoneNumber":CustomerPhoneNumber
//   };


//  await docUser.doc(CustomerNID).set(jsonData);



// }