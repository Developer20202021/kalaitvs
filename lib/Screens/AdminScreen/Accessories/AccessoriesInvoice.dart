import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';







class AccessoriesInvoice extends StatefulWidget {



  final CustomerPhoneNumber;
  final AccessoriesName;
  final AccessoriesSalePrice;
  final AccessoriesID;
  final SaleDate;
  final CustomerID;
  








 
  const AccessoriesInvoice({Key? key,   required this.CustomerPhoneNumber, required this.AccessoriesID, required this.AccessoriesName, required this.AccessoriesSalePrice, required this.CustomerID, required this.SaleDate }) : super(key: key);

  @override
  State<AccessoriesInvoice> createState() => _AccessoriesInvoiceState();
}

class _AccessoriesInvoiceState extends State<AccessoriesInvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Invoice", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: PdfPreview(
        build: (context) => makePdf(widget.CustomerID, widget.CustomerPhoneNumber, widget.AccessoriesName, widget.AccessoriesSalePrice, widget.AccessoriesID, widget.SaleDate)
      ),
    );
  }
}














Future<Uint8List> makePdf( CustomerID, CustomerPhoneNumber, AccessoriesName, AccessoriesSalePrice,AccessoriesID,SaleDate) async {


final pdf = pw.Document();


pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [


             pw.SizedBox(
                      height: 100,
                      
                
              ),






                  pw.Row(
                    
                     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [



                          pw.Column(
                              children: [
                              
                                pw.Text("Customer ID:${CustomerID}", style: const pw.TextStyle(fontSize: 13)),

                                  pw.SizedBox(
                                            height: 5,
                                           
                                    ),
                            
                                pw.Text("Customer Phone No:${CustomerPhoneNumber}", style: const pw.TextStyle(fontSize: 13)),
                                  pw.SizedBox(
                                            height: 5,
                                           
                                    ),
                                
                              


                                 
                                
                              ],
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                            ),









                             pw.Column(
                              children: [
                             

                                pw.Text("Date:${SaleDate}", style: const pw.TextStyle(fontSize: 13)),
                                
                              ],
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                            ),


                    
                        
                        
                        
                        ]
                  
                  
                  ),


              
              
             pw.SizedBox(
                      height: 5,
                      
                
              ),





            

                pw.Table(
                      border: pw.TableBorder.all(color: PdfColors.black),
                      children: [


                      // The first row just contains a phrase 'INVOICE FOR PAYMENT'
                        pw.TableRow(
                          children: [
                            pw.Padding(
                              child: pw.Text(
                                'MONEY RECEIPT',
                                style: pw.Theme.of(context).header4,
                                textAlign: pw.TextAlign.center,
                              ),
                              padding: pw.EdgeInsets.all(20),
                            ),
                          ],
                        ),


                    



                      pw.TableRow(
                          children: [
                            pw.Padding(
                              child: pw.Text(
                                'Accessories Name',
                                style: pw.Theme.of(context).header4,
                                textAlign: pw.TextAlign.center,
                              ),
                              padding: pw.EdgeInsets.all(20),
                            ),


                              pw.Padding(
                              child: pw.Text(
                                '${AccessoriesName}',
                                style: pw.Theme.of(context).header4,
                                textAlign: pw.TextAlign.center,
                              ),
                              padding: pw.EdgeInsets.all(20),
                            ),




                          ],
                        ),



                        pw.TableRow(
                          children: [
                            pw.Padding(
                              child: pw.Text(
                                'Accessories ID',
                                style: pw.Theme.of(context).header4,
                                textAlign: pw.TextAlign.center,
                              ),
                              padding: pw.EdgeInsets.all(20),
                            ),


                              pw.Padding(
                              child: pw.Text(
                                '${AccessoriesID}',
                                style: pw.Theme.of(context).header4,
                                textAlign: pw.TextAlign.center,
                              ),
                              padding: pw.EdgeInsets.all(20),
                            ),




                          ],
                        ),








                         pw.TableRow(
                          children: [
                            pw.Padding(
                              child: pw.Text(
                                'Accessories Sale Price',
                                style: pw.Theme.of(context).header4,
                                textAlign: pw.TextAlign.center,
                              ),
                              padding: pw.EdgeInsets.all(20),
                            ),


                              pw.Padding(
                              child: pw.Text(
                                '${AccessoriesSalePrice} tk',
                                style: pw.Theme.of(context).header4,
                                textAlign: pw.TextAlign.center,
                              ),
                              padding: pw.EdgeInsets.all(20),
                            ),




                          ],
                        ),



                      







                      















          ]),




              pw.SizedBox(
                      height: 100,
                      
                
              ),



            pw.Row(

              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              
              
              
              children: [

                  pw.Column(children: [

                    pw.Text("___________________________"),

                    pw.Text("Customer Signature"),


                  ])



              ]),







        ])); // Center
      }));


return pdf.save();
}