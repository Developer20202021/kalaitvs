import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tvs_app/Screens/AdminScreen/AllPDF/CreditPDF.dart';
import 'package:tvs_app/Screens/AdminScreen/AllPDF/NameChangeFrom.dart';




class PerDayNameChangeHistory extends StatefulWidget {
  const PerDayNameChangeHistory({super.key});

  @override
  State<PerDayNameChangeHistory> createState() => _PerDayNameChangeHistoryState();
}

class _PerDayNameChangeHistoryState extends State<PerDayNameChangeHistory> {


  // এখানে Date দিয়ে Data fetch করতে হবে। 

  bool loading = true;

  var VisiblePaymentMonth = "${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}";
  


     void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      // TODO: implement your code here

      setState(() {
        loading = true;
      });

          if (args.value is PickerDateRange) {

            try {
          final DateTime rangeStartDate = args.value.startDate;
          var adminSetDay = rangeStartDate.day;
          var adminSetMonth = rangeStartDate.month;
          var adminSetYear = rangeStartDate.year;

          var paymentMonth = "${adminSetDay}/${adminSetMonth}/${adminSetYear}";

          VisiblePaymentMonth = paymentMonth;

          print("${adminSetDay}/${adminSetMonth}/${adminSetYear}");


          getData(paymentMonth);





          final DateTime rangeEndDate = args.value.endDate;
              
            } catch (e) {
              
            }
         
        } else if (args.value is DateTime) {
          final DateTime selectedDate = args.value;
          print(selectedDate);
        } else if (args.value is List<DateTime>) {
          final List<DateTime> selectedDates = args.value;
          print(selectedDates);
        } else {
          final List<PickerDateRange> selectedRanges = args.value;
          print(selectedRanges);
        }




      
      
    }



 var PaymentMonth = "${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}";


   var DataLoad = ""; 
  // Firebase All Customer Data Load

List  AllData = [];
    int moneyAdd = 0;

  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('OwnerShipChange');

Future<void> getData(String paymentDate) async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();


    Query query = _collectionRef.where("PaymentDate", isEqualTo: paymentDate);
    QuerySnapshot querySnapshot = await query.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();


     moneyAdd = 0;




     if (AllData.length == 0) {
       setState(() {
      
        DataLoad = "0";
        loading = false;
      });
       
     } else {

      setState(() {
        DataLoad = "";
        
      });

      for (var i = 0; i < AllData.length; i++) {

       var money = AllData[i]["FeeAmount"];
      int moneyInt = int.parse(money);

      

      setState(() {
        moneyAdd = moneyAdd + moneyInt;
        AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
        loading = false;
      });
       
     }

     print(moneyAdd);
       
     }

    print(AllData);
}


@override
  void initState() {
     
    // TODO: implement initState
    getData(PaymentMonth);
     
    super.initState();
  }

 


   Future refresh() async{


    setState(() {
      
         getData(PaymentMonth);
         

    });

  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton:AllData.isNotEmpty? FloatingActionButton(onPressed: (){
        
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreditPdfPreview(CreditData:  AllData, TotalCreditAmount: moneyAdd.toString(),)));

      }, child: Text("Print"),): FloatingActionButton(onPressed: (){
        
//  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DebitPDFPreview(CreditData:  AllData, TotalCreditAmount: moneyAdd.toString(),)));

      }, child: Text("No Data"),),
      
      appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title:  Text("${VisiblePaymentMonth} তারিখের নাম পরিবর্তন ফি গ্রহন", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16,fontFamily: "Josefin Sans"),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
         actions: [
        IconButton(onPressed: (){


          showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Container(
            
            color:Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${VisiblePaymentMonth} তারিখে ${moneyAdd}৳ টাকা নাম পরিবর্তন ফি গ্রহন করেছেন।", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: "Josefin Sans"),overflow: TextOverflow.ellipsis,),
            ),),


            SizedBox(height: 10,),


          Container(
                child: SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                  todayHighlightColor: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
          
        
        ],
      );
    });

        }, icon: Icon(Icons.date_range, color: Theme.of(context).primaryColor,))

      ],
        
      ),
      body:loading?Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: const Color(0xFF1A1A3F),
          secondRingColor: Theme.of(context).primaryColor,
          thirdRingColor: Colors.white,
          size: 100,
        ),
      ):DataLoad == "0"? Center(child: Text("No Data Available")): RefreshIndicator(
        onRefresh: refresh,
        child: ListView.separated(
              itemCount: AllData.length,
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
              itemBuilder: (BuildContext context, int index) {
      
                    //  DateTime paymentDateTime = (AllData[index]["PaymentDateTime"] as Timestamp).toDate();
      
      
                return   Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                             shape: RoundedRectangleBorder(
                    side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                      
                            title: Text("নাম পরিবর্তন ফি:${AllData[index]["FeeAmount"]}৳", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Josefin Sans"),),
                            trailing: ElevatedButton(onPressed: (){


                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => NameChangePDFView(NameChangeData:[AllData[index]])));


                            }, child: Text("Print")),
                         
                            subtitle: Column(
      
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
      
                                Text("New Customer Name: ${AllData[index]["NewCustomerName"]}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,),),


                                Text("New Customer Phone: ${AllData[index]["NewCustomerPhoneNumber"]}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,),),
      
                                Text("Date: ${AllData[index]["PaymentDate"]}"),
                              
                           
                              ],
                            ),
                      
                      
                      
                          ),
                );
              },
            ),
      ));
  }
}