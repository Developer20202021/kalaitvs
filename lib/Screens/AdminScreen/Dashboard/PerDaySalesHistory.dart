import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';




class PerDaySalesHistory extends StatefulWidget {
  const PerDaySalesHistory({super.key});

  @override
  State<PerDaySalesHistory> createState() => _PerDaySalesHistoryState();
}

class _PerDaySalesHistoryState extends State<PerDaySalesHistory> {


  // এখানে Date দিয়ে Data fetch করতে হবে। 


     void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      // TODO: implement your code here

      dynamic value = args.value;
      
      print(value);
    }
 






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text(" Today Sales History", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
                child: SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                  todayHighlightColor: Colors.purple,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 150,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.purple),
                  ),
                ),
              )
        
        ],
      );
    });

        }, icon: Icon(Icons.date_range, color: Colors.purple,))

      ],
        
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