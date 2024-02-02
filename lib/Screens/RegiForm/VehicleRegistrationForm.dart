import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tvs_app/Screens/AdminScreen/AllPDF/OwnerParticularReg.dart';
import 'package:tvs_app/Screens/RegiForm/AllRegistrationForm.dart';





class VehicleRegistrationForm extends StatefulWidget {

  final List SaleInfo;

  
  const VehicleRegistrationForm({super.key, required this.SaleInfo});

  @override
  State<VehicleRegistrationForm> createState() => _VehicleRegistrationFormState();
}

class _VehicleRegistrationFormState extends State<VehicleRegistrationForm> {


  TextEditingController NameController = TextEditingController();
  TextEditingController FatherNameController = TextEditingController();
  TextEditingController MotherNameController = TextEditingController();
  TextEditingController HusbandNameController = TextEditingController();
  TextEditingController PresentAddressController = TextEditingController();
  TextEditingController PermanentAddressController = TextEditingController();
  TextEditingController SEXController = TextEditingController();
  TextEditingController CellPhoneNoController = TextEditingController();
  TextEditingController NationalityController = TextEditingController();
  TextEditingController DateOfBirthController = TextEditingController();
  TextEditingController NIDNoController = TextEditingController();
  TextEditingController eTINNoController = TextEditingController();
  TextEditingController GuardianNameController = TextEditingController();
  TextEditingController VehicleRegistrationNoController = TextEditingController();
  TextEditingController YearOfMFGOfVehicleController = TextEditingController();
  TextEditingController PrevRegistrationNoController = TextEditingController();
  TextEditingController BankNameforFeeTaxDepositController = TextEditingController();
  TextEditingController POBankController = TextEditingController();
  TextEditingController JointOwnerController = TextEditingController();
  TextEditingController HireController = TextEditingController();
  TextEditingController HirePurchaseController = TextEditingController();
  TextEditingController OwnerTypeController = TextEditingController();
  TextEditingController VehicleorTrailerController = TextEditingController();
  TextEditingController PrevRegnNoController = TextEditingController();
  TextEditingController ClassofvehicleController = TextEditingController();
  TextEditingController MakersnameController = TextEditingController();
  TextEditingController TypeofbodyController = TextEditingController();
  TextEditingController MakersCountryController = TextEditingController();
  TextEditingController ColorController = TextEditingController();
  TextEditingController YearofmanufactureController = TextEditingController();
  TextEditingController NumberofcylindersController = TextEditingController();
  TextEditingController ChassisnumberController = TextEditingController();
  TextEditingController EnginenumberController = TextEditingController();
  TextEditingController FuelusedController = TextEditingController();
  TextEditingController HorsepowerController = TextEditingController();
  TextEditingController RPMController = TextEditingController();
  TextEditingController CubiccapacityController = TextEditingController();
  TextEditingController SeatsController = TextEditingController();
  TextEditingController NoofStandeeController = TextEditingController();
  TextEditingController WheelbaseController = TextEditingController();
  TextEditingController UnladenweightController = TextEditingController();
  TextEditingController ladentrainweightController = TextEditingController();







  bool loading = false;


  void getSaleData(){

    print(widget.SaleInfo);
  }



  @override
  void initState() {
    // TODO: implement initState




      getSaleData();


    super.initState();
  }







   

  @override
  Widget build(BuildContext context) {


    NameController.text = widget.SaleInfo[0]["CustomerName"];
    FatherNameController.text = widget.SaleInfo[0]["CustomerFatherName"];
    MotherNameController.text = widget.SaleInfo[0]["CustomerMotherName"];
    NIDNoController.text = widget.SaleInfo[0]["CustomerNID"];
    PresentAddressController.text = widget.SaleInfo[0]["CustomerAddress"];
    PermanentAddressController.text = widget.SaleInfo[0]["CustomerAddress"];
    CellPhoneNoController.text = widget.SaleInfo[0]["CustomerPhoneNumber"];
    YearOfMFGOfVehicleController.text = widget.SaleInfo[0]["YearOfManufacture"];
    VehicleorTrailerController.text = widget.SaleInfo[0]["BikeName"];
    ClassofvehicleController.text = widget.SaleInfo[0]["ClassOfVehicle"];
    MakersnameController.text = widget.SaleInfo[0]["MakersName"];
    MakersCountryController.text = "INDIA";
    ColorController.text = widget.SaleInfo[0]["BikeColor"];
    YearofmanufactureController.text = widget.SaleInfo[0]["YearOfManufacture"];
    NumberofcylindersController.text = widget.SaleInfo[0]["BikeValvePerCylinder"];
    ChassisnumberController.text = widget.SaleInfo[0]["BikeChassisNo"];
    EnginenumberController.text = widget.SaleInfo[0]["BikeEngineNo"];
    HorsepowerController.text = widget.SaleInfo[0]["HorsePower"];
    RPMController.text = widget.SaleInfo[0]["RPM"];
    SeatsController.text = widget.SaleInfo[0]["SeatingCapacity"];
    WheelbaseController.text = widget.SaleInfo[0]["BikeWheelBase"];
    ladentrainweightController.text = widget.SaleInfo[0]["BikeLadenWeight"];





    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("OWNERS PARTICULARS/SPECIMEN SIGNATURE",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),),
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
      ):SingleChildScrollView(

        child:  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name(BLOCK LETTER)',
            
                          hintText: 'Name(BLOCK LETTER)',
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
                      controller: NameController,
                    ),

                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Fathers Name',
            
                          hintText: 'Fathers Name',
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
                      controller: FatherNameController,
                    ),


                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mothers Name',
            
                          hintText: 'Mothers Name',
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
                      controller: MotherNameController,
                    ),


                     SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Husbands Name',
            
                          hintText: 'Husbands Name',
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
                      controller: HusbandNameController,
                    ),

                     SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Present Address',
            
                          hintText: 'Present Address',
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
                      controller: PresentAddressController,
                    ),


                     SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Permanent Address',
            
                          hintText: 'Permanent Address',
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
                      controller: PermanentAddressController,
                    ),


                     SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'SEX',
            
                          hintText: 'SEX',
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
                      controller: SEXController,
                    ),


                     SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Cell Phone No',
            
                          hintText: 'Cell Phone No',
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
                      controller: CellPhoneNoController,
                    ),


                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nationality',
            
                          hintText: 'Nationality',
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
                      controller: NationalityController,
                    ),


                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Date Of Birth',
            
                          hintText: 'Date Of Birth',
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
                      controller: DateOfBirthController,
                    ),




                     SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'NID No',
            
                          hintText: 'NID No',
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
                      controller: NIDNoController,
                    ),


                     SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'e-TIN No',
            
                          hintText: 'e-TIN No',
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
                      controller: eTINNoController,
                    ),



                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Guardian Name',
            
                          hintText: 'Guardian Name',
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
                      controller: GuardianNameController,
                    ),


                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Vehicle Registration No',
            
                          hintText: 'Vehicle Registration No',
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
                      controller: VehicleRegistrationNoController,
                    ),


                    //  SizedBox(height: 20,),


                    // TextField(
                    //   
                    //   decoration: InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       labelText: 'Engine No',
            
                    //       hintText: 'Engine No',
                    //       //  enabledBorder: OutlineInputBorder(
                    //       //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                    //       //   ),
                    //         focusedBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                    //         ),
                    //         errorBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                    //         ),
                          
                          
                    //       ),
                    //   controller: EngineNoController,
                    // ),


                    // SizedBox(height: 20,),


                    // TextField(
                    //   
                    //   decoration: InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       labelText: 'Chassis No',
            
                    //       hintText: 'Chassis No',
                    //       //  enabledBorder: OutlineInputBorder(
                    //       //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                    //       //   ),
                    //         focusedBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                    //         ),
                    //         errorBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                    //         ),
                          
                          
                    //       ),
                    //   controller: ChassisNoController,
                    // ),



                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Year Of MFG Of Vehicle',
            
                          hintText: 'Year Of MFG Of Vehicle',
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
                      controller: YearOfMFGOfVehicleController,
                    ),


                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Prev Registration No',
            
                          hintText: 'Prev Registration No',
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
                      controller: PrevRegistrationNoController,
                    ),



                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Bank Name for Fee/Tax Deposit',
            
                          hintText: 'Bank Name for Fee/Tax Deposit',
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
                      controller: BankNameforFeeTaxDepositController,
                    ),


              
                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'PO/Bank',
            
                          hintText: 'PO/Bank',
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
                      controller: POBankController,
                    ),


              
               SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Joint Owner',
            
                          hintText: 'Joint Owner',
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
                      controller: JointOwnerController,
                    ),


              
                             SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Owner Type',
            
                          hintText: 'Owner Type',
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
                      controller: OwnerTypeController,
                    ),


              
                   SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Hire',
            
                          hintText: ' Hire',
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
                      controller:  HireController,
                    ),

              

                                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Hire purchase ',
            
                          hintText: ' Hire purchase ',
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
                      controller:   HirePurchaseController,
                    ),


              
                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Vehicle or trailer',
            
                          hintText: ' Vehicle or trailer',
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
                      controller:    VehicleorTrailerController,
                    ),

              
                            
                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Prev. Regn. No. (if any)',
            
                          hintText: ' Prev. Regn. No. (if any)',
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
                      controller:PrevRegnNoController,
                    ),


                

                                            
                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Class of vehicle ',
            
                          hintText: ' Class of vehicle',
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
                      controller: ClassofvehicleController,
                    ),


          

                              SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Makers name ',
            
                          hintText: ' Makers name ',
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
                      controller:  MakersnameController,
                    ),


                

                
                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Type of body ',
            
                          hintText: ' Type of body ',
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
                      controller:   TypeofbodyController,
                    ),

                

                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Makers Country',
            
                          hintText: 'Makers Country',
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
                      controller:   MakersCountryController,
                    ),


                

                                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Color (cabin/body) ',
            
                          hintText: 'Color (cabin/body) ',
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
                      controller:   ColorController,
                    ),


                
                
                                    SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Year of manufacture',
            
                          hintText: ' Year of manufacture',
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
                      controller:    YearofmanufactureController,
                    ),


                
                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Number of cylinders',
            
                          hintText: 'Number of cylinders',
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
                      controller:    NumberofcylindersController,
                    ),



                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Chassis number',
            
                          hintText: ' Chassis number',
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
                      controller:     ChassisnumberController,
                    ),




                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Engine number',
            
                          hintText: ' Engine number',
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
                      controller:      EnginenumberController,
                    ),



                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Fuel used',
            
                          hintText: ' Fuel used ',
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
                      controller: FuelusedController,
                    ),
                


                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Horse power ',
            
                          hintText: 'Horse power',
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
                      controller: HorsepowerController,
                    ),



                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'RPM',
            
                          hintText: 'RPM',
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
                      controller:  RPMController,
                    ),




                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Cubic capacity',
            
                          hintText: 'Cubic capacity',
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
                      controller:   CubiccapacityController,
                    ),


                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Seats (incl. driver)',
            
                          hintText: 'Seats (incl. driver)',
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
                      controller:   SeatsController,
                    ),



                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' No. of Standee',
            
                          hintText: ' No. of Standee',
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
                      controller:    NoofStandeeController,
                    ),


                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Wheel base',
            
                          hintText: ' Wheel base',
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
                      controller:     WheelbaseController,
                    ),



                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Unladen weight (kg) ',
            
                          hintText: ' Unladen weight (kg) ',
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
                      controller:      UnladenweightController,
                    ),



                 SizedBox(height: 20,),


                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Maximum laden/train weight (kg) ',
            
                          hintText: ' Maximum laden/train weight (kg) ',
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
                      controller:      ladentrainweightController,
                    ),

              SizedBox(height: 10,),



                OutlinedButton(
                  onPressed: () {

                    List AllSaleData =[{
                      "CustomerName":NameController.text.trim(),
                      "CustomerFatherName":FatherNameController.text.trim(),
                      "CustomerMotherName":MotherNameController.text.trim(),
                      "HusbandName":HusbandNameController.text.trim(),
                      "PresentAddress":PresentAddressController.text.trim(),
                      "PermanentAddress":PermanentAddressController.text.trim(),
                      "Sex":SEXController.text.trim(),
                      "CellPhoneNo":CellPhoneNoController.text.trim(),
                      "Nationality":NationalityController.text.trim(),
                      "DateOfBirth":DateOfBirthController.text.trim(),
                      "NIDNo":NIDNoController.text.trim(),
                      "ETINNo":eTINNoController.text.trim(),
                      "GuardianName":GuardianNameController.text.trim(),
                      "VehicleRegistrationNo":VehicleRegistrationNoController.text.trim(),
                      "EngineNo":EnginenumberController.text.trim(),
                      "ChassisNo":ChassisnumberController.text.trim(),
                      "YearOfMFG":YearOfMFGOfVehicleController.text.trim(),
                      "PreviousReg":PrevRegistrationNoController.text.trim(),
                      "BankNameForFee":BankNameforFeeTaxDepositController.text.trim(),
                      "POBank":POBankController.text.trim(),
                      "JointOwner":JointOwnerController.text.trim(),
                      "OwnerType":OwnerTypeController.text.trim(),
                      "Hire":HireController.text.trim(),
                      "Hirepurchase":HirePurchaseController.text.trim(),
                      "VehicleorTrailer":VehicleorTrailerController.text.trim(),
                      "PrevRegnNo":PrevRegnNoController.text.trim(),
                      "Classofvehicle":ClassofvehicleController.text.trim(),
                      "Makersname":MakersnameController.text.trim(),
                      "Typeofbody":TypeofbodyController.text.trim(),
                      "MakersCountry":MakersCountryController.text.trim(),
                      "Color":ColorController.text.trim(),
                      "Yearofmanufacture":YearofmanufactureController.text.trim(),
                      "Numberofcylinders":NumberofcylindersController.text.trim(),
                      "Fuelused":FuelusedController.text.trim(),
                      "Horsepower":HorsepowerController.text.trim(),
                      "RPM":RPMController.text.trim(),
                      "Cubiccapacity":CubiccapacityController.text.trim(),
                      "Seats":SeatsController.text.trim(),
                      "NoofStandee":NoofStandeeController.text.trim(),
                      "Wheelbase":WheelbaseController.text.trim(),
                      "Unladenweight":UnladenweightController.text.trim(),
                      "ladentrainweight":ladentrainweightController.text.trim(),
                      
                      
                    }];



                    Navigator.push(
                        context,MaterialPageRoute(builder: (context) => AllRegistrationForm(SalesData: AllSaleData)),
                      );
                      

                  },
                  child: Text("Print"),
                )

                    
              
         
           
                    
            ],
          ),
        ),
        ),
      
      
    );
  }
}



