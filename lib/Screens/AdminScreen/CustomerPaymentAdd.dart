import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomerPaymentAdd extends StatefulWidget {
  const CustomerPaymentAdd({super.key});

  @override
  State<CustomerPaymentAdd> createState() => _CustomerPaymentAddState();
}

class _CustomerPaymentAddState extends State<CustomerPaymentAdd> {
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();

    // date pick 

    void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      // TODO: implement your code here

      dynamic value = args.value;
      
      print(value);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: Icon(Icons.chevron_left)),
        title: const Text(
          "Customer Payment",
          style: TextStyle(color: Colors.black),
        ),
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
              // Lottie.network(
              //   'https://assets8.lottiefiles.com/packages/lf20_7Ht9wn.json',
              //   width: 700,
              //   height: 200,
              // ),
             
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Customer ID',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.purple : Colors.black),
                  hintText: 'Customer ID',
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
                maxLines: 20,
                minLines: 1,
                controller: myPassController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.purple : Colors.black),
                  hintText: 'Amount',
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
                maxLines: 20,
                minLines: 1,
                controller: myPassController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Customer Phone Number',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.purple : Colors.black),
                  hintText: 'Customer Phone Number',
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
                maxLines: 20,
                minLines: 1,
                controller: myPassController,
              ),
              SizedBox(
                height: 10,
              ),


              Container(
                child: Text("Pick Payment Date"),
              ),

               SizedBox(
                height: 10,
              ),




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
          ),
        ),
      ),
    );
  }
}