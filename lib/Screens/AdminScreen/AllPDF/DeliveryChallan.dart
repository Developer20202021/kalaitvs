
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';








class DeliveryChallanPDFPreview extends StatefulWidget {


final List SalesData;

 const DeliveryChallanPDFPreview({super.key,  required this.SalesData});

  @override
  State<DeliveryChallanPDFPreview> createState() => _DeliveryChallanPDFPreviewState();
}

class _DeliveryChallanPDFPreviewState extends State<DeliveryChallanPDFPreview> {






@override
  void initState() {
    FlutterNativeSplash.remove();
    // TODO: implement initState
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      
      appBar: AppBar(
      
      
      systemOverlayStyle: SystemUiOverlayStyle(
            // Navigation bar
            statusBarColor: Colors.blueAccent, // Status bar
          ),
       
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Delivery Challan", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: PdfPreview(
        build: (context) => makePdf(widget.SalesData),
      ),
    );
  }
}



// makePdf(widget.StudentName,widget.StudentIDNo, widget.StudentPhoneNumber,widget.StudentCashIn,widget.StudentEmail,widget.CashInDate)








Future<Uint8List> makePdf(List SalesData) async {

final netImage = await networkImage('https://i.ibb.co/71Kw2KJ/tvs-logo-33710.png');

// final backImage = await networkImage('https://i.ibb.co/yfvj470/pngwing-com.png');












final pdf = pw.Document();

final garland = await rootBundle.loadString('lib/images/border_image.svg');
final swirls3 = await rootBundle.loadString('lib/images/swirls3.svg');
final swirls = await rootBundle.loadString('lib/images/swirls.svg');
final swirls1 = await rootBundle.loadString('lib/images/swirls1.svg');
final swirls2 = await rootBundle.loadString('lib/images/swirls2.svg');

// final ByteData image = await rootBundle.load('lib/images/pngwing.png');

// Uint8List imageData = (image).buffer.asUint8List();


final font = await rootBundle.load("lib/fonts/JosefinSans-BoldItalic.ttf");
final ttf = pw.Font.ttf(font);

final Banglafont = await rootBundle.load("lib/fonts/Siyam-Rupali-ANSI.ttf");
final Banglattf = pw.Font.ttf(Banglafont);


pdf.addPage(pw.Page(
  
  pageTheme: pw.PageTheme(
    pageFormat: PdfPageFormat.a4,
    theme: pw.ThemeData.withFont(base: pw.Font.ttf(await rootBundle.load("lib/fonts/Caladea-BoldItalic.ttf")),),
    buildBackground: (context)=>pw.FullPage(ignoreMargins: true,child: pw.Container(

       margin: const pw.EdgeInsets.all(10),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(
                  color: const PdfColor.fromInt(0xcc7722), width: 1),
            ),

      child:  pw.Container(

         margin: const pw.EdgeInsets.all(5),
              decoration: pw.BoxDecoration(
                
                border: pw.Border.all(
                    color: const PdfColor.fromInt(0xcc7722), width: 5),
              ),
              width: double.infinity,
              height: double.infinity,
              child: pw.Stack(
                alignment: pw.Alignment.center,
                children: [

           pw.Positioned(
                    bottom: 5,
                    left: 5,
                    child: pw.Transform(
                      transform: Matrix4.diagonal3Values(1, -1, 1),
                      adjustLayout: true,
                      child: pw.SvgImage(
                        svg: swirls3,
                        height: 160,
                      ),
                    ),
                  ),


                    pw.Positioned(
                    top: 5,
                    left: 5,
                    child: pw.SvgImage(
                      svg: swirls3,
                      height: 160,
                    ),
                  ),
                  pw.Positioned(
                    top: 5,
                    right: 5,
                    child: pw.Transform(
                      transform: Matrix4.diagonal3Values(-1, 1, 1),
                      adjustLayout: true,
                      child: pw.SvgImage(
                        svg: swirls3,
                        height: 160,
                      ),
                    ),
                  ),

                  pw.Positioned(
                    bottom: 5,
                    right: 5,
                    child: pw.Transform(
                      transform: Matrix4.diagonal3Values(-1, -1, 1),
                      adjustLayout: true,
                      child: pw.SvgImage(
                        svg: swirls3,
                        height: 160,
                      ),
                    ),
                  ),


                    //  pw.Image(netImage, height: 850, width: 550,dpi: 111.5 ),

                  
                  // pw.Container(
                  //       width: 1380.0,
                  //       height: 890.0,
                  //       child: pw.Image(pw.MemoryImage(imageData))
                  //   )


                ]
              )
      )
    ))
  ),
  
  // theme: pw.ThemeData.withFont(base: pw.Font.ttf(await rootBundle.load("lib/fonts/JosefinSans-BoldItalic.ttf")),),
  //     pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [

            pw.Row(
              
              mainAxisAlignment: pw.MainAxisAlignment.start,

              children: [

                pw.Padding(
                   padding: pw.EdgeInsets.only(left: 30,top: 30),
                  child: pw.Center(child:  pw.Image(netImage, height: 70, width: 70, ),),),

                pw.Padding(
                  padding: pw.EdgeInsets.only(left: 20, top: 20),
                  
                  child: pw.Column(children: [


                  pw.Text("KALAI TVS CENTER", style:pw.TextStyle(fontSize: 21, fontWeight: pw.FontWeight.bold, font: ttf)),
                  pw.Text("KvjvB wUwfGm ‡m›Uvi", style:pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold, font: Banglattf)),
                  pw.Center(child: pw.Text("Dealer: Uttara Motors Ltd.", style:pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, font: ttf)),),

                  pw.Center(child: pw.Text("Kalai, Joypurhat", style:pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold, font: ttf)),),

                   pw.SizedBox(height: 6),

                  pw.Center(child: pw.Text("Mobile: 01711414664, 01721608030, 01718148814", style:pw.TextStyle(fontSize: 9,  font: ttf)),),

                  pw.SizedBox(height: 6),
                  // pw.Center(child: pw.Text("EIIN: 122026", style:pw.TextStyle(fontSize: 11,  font: ttf)),),



                ]))




            ]),

            


             pw.SizedBox(
                      height: 10,
                      
                
              ),


              pw.Container(
                width: 650,
                 decoration: const pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.only(
                            topRight: pw.Radius.circular(10.0),
                            topLeft: pw.Radius.circular(10.0),
                            bottomLeft: pw.Radius.circular(10.0),
                            bottomRight: pw.Radius.circular(10.0)),
                        color: PdfColor.fromInt(0xcc7722),
                      ),
                
                
                
                child: pw.Center(child: pw.Padding(padding: pw.EdgeInsets.all(3), child: pw.Text("mKj c«Kvi g‡W‡ji evRvR ‡gvUi mvB‡Kj weµ‡qi wek¦¯— c«wZôvb", style: pw.TextStyle(fontSize: 7, color: PdfColors.white, font: Banglattf))))),


              // pw.Center(child:  pw.Image(netImage, height: 150, width: 250, ),),

              //    pw.SizedBox(
              //         height: 20,
                      
                
              // ),



              pw.SizedBox(
                      height: 30,
                      
                
              ),



              pw.Center(child: pw.Container(

                 decoration: const pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.only(
                            topRight: pw.Radius.circular(10.0),
                            topLeft: pw.Radius.circular(10.0),
                            bottomLeft: pw.Radius.circular(10.0),
                            bottomRight: pw.Radius.circular(10.0)),
                        color: PdfColor.fromInt(0xcc7722),
                      ),
                
                
                
                child: pw.Padding(padding: pw.EdgeInsets.all(10), child: pw.Text("DELIVERY CHALLAN", style: pw.TextStyle(fontSize: 14, color: PdfColors.white, font: ttf))))),



            pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [

                  pw.Text("File No:- ${SalesData[0]["BikeDeliveryNo"]}"),


                  pw.Text("Date:- ${SalesData[0]["BikeSaleDate"]}"),

              ]),
           




            pw.SizedBox(height: 20),





            
              pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Received with thanks from Mr/Messrs", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 300,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["CustomerName"].toString().toUpperCase()}", style: pw.TextStyle(fontSize: 14,))))

              ]),




              pw.SizedBox(height: 10),



              pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("S/O", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 470,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["CustomerFatherName"].toString().toUpperCase()}", style: pw.TextStyle(fontSize: 14,))))

              ]),




               pw.SizedBox(height: 10),



              pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Address", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 440,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["CustomerAddress"]}", style: pw.TextStyle(fontSize: 14,))))

              ]),




               pw.SizedBox(height: 10),



              pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Phone No", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 440,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["CustomerPhoneNumber"]}", style: pw.TextStyle(fontSize: 14,))))

              ]),




               pw.SizedBox(height: 10),



              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [


                pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Qty", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 300,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("01(One)", style: pw.TextStyle(fontSize: 14,))))

              ]),





               pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Colour", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 120,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["BikeColor"]}", style: pw.TextStyle(fontSize: 14,))))

              ]),


              ]),





               pw.SizedBox(height: 10),



              pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Description", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 430,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["BikeName"]}", style: pw.TextStyle(fontSize: 14,))))

              ]),




               pw.SizedBox(height: 10),



              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [


                pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Chassis No", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 200,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["BikeChassisNo"]}", style: pw.TextStyle(fontSize: 14,))))

              ]),





               pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Engine No", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 170,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["BikeEngineNo"]}", style: pw.TextStyle(fontSize: 14,))))

              ]),


              ]),





              pw.SizedBox(height: 10),



              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  
                  
                  
                  pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Bike Total Price", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 170,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["BikeSalePrice"]} tk", style: pw.TextStyle(fontSize: 14,))))

              ]),



              pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Weight", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 180,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["BikeLadenWeight"]}", style: pw.TextStyle(fontSize: 14,))))

              ]),
              
              
              
              ]),










              pw.SizedBox(height: 10),



              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [


                pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("DP/Cash In", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 200,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${(int.parse(SalesData[0]["BikeBillPay"].toString())+int.parse(SalesData[0]["Discount"].toString())).toString()} tk", style: pw.TextStyle(fontSize: 14,))))

              ]),





               pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Due", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 190,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["BikePaymentDue"]} tk", style: pw.TextStyle(fontSize: 14,))))

              ]),


              ]),




               pw.SizedBox(height: 10),



              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [


                pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Discount", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 200,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("", style: pw.TextStyle(fontSize: 14,))))

              ]),





               pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Condition", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 170,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["BikeConditionMonth"]} Day", style: pw.TextStyle(fontSize: 14,))))

              ]),


              ]),







                pw.SizedBox(height: 10),



              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [


              //   pw.Row(
                
              //   mainAxisAlignment: pw.MainAxisAlignment.start,
              //   children: [

              //     pw.Text("File No", style: pw.TextStyle(fontSize: 11,)),

              //     pw.SizedBox(width: 4),

              //     pw.Container(
                
              //   width: 200,
              //   decoration:  pw.BoxDecoration(
              //   border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
              //       child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["BikeDeliveryNo"]}", style: pw.TextStyle(fontSize: 14,))))

              // ]),





              //  pw.Row(
                
              //   mainAxisAlignment: pw.MainAxisAlignment.start,
              //   children: [

              //     pw.Text("Phone No", style: pw.TextStyle(fontSize: 11,)),

              //     pw.SizedBox(width: 4),

              //     pw.Container(
                
              //   width: 200,
              //   decoration:  pw.BoxDecoration(
              //   border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
              //       child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["CustomerPhoneNumber"]}", style: pw.TextStyle(fontSize: 14,))))

              // ]),


              ]),






              // pw.SizedBox(height: 10),



              // pw.Row(
                
              //   mainAxisAlignment: pw.MainAxisAlignment.start,
              //   children: [

              //     pw.Text("Discount", style: pw.TextStyle(fontSize: 11,)),

              //     pw.SizedBox(width: 4),

              //     pw.Container(
                
              //   width: 465,
              //   decoration:  pw.BoxDecoration(
              //   border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
              //       child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["Discount"]}", style: pw.TextStyle(fontSize: 14,))))

              // ]),



              
              pw.SizedBox(height: 10),



              // pw.Row(
                
              //   mainAxisAlignment: pw.MainAxisAlignment.start,
              //   children: [

              //     pw.Text("Date", style: pw.TextStyle(fontSize: 11,)),

              //     pw.SizedBox(width: 4),

              //     pw.Container(
                
              //   width: 465,
              //   decoration:  pw.BoxDecoration(
              //   border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
              //       child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("${SalesData[0]["BikeSaleDate"]}", style: pw.TextStyle(fontSize: 14,))))

              // ]),











              pw.SizedBox(
                      height: 20,    
                
              ),





            //  pw.Row(
              
            //   children: [


              
            //   pw.Container(

            //      decoration: const pw.BoxDecoration(
            //             borderRadius: pw.BorderRadius.only(
            //                 topRight: pw.Radius.circular(10.0),
            //                 topLeft: pw.Radius.circular(10.0),
            //                 bottomLeft: pw.Radius.circular(10.0),
            //                 bottomRight: pw.Radius.circular(10.0)),
            //             color: PdfColors.blue500,
            //           ),
                
                
                
            //     child: pw.Padding(padding: pw.EdgeInsets.all(10), child: pw.Text("Total Due", style: pw.TextStyle(fontSize: 14, color: PdfColors.white, font: ttf)))),

              

            //   pw.SizedBox(width: 5,),


            //    pw.Container(

            //      decoration: const pw.BoxDecoration(
            //             borderRadius: pw.BorderRadius.only(
            //                 topRight: pw.Radius.circular(10.0),
            //                 topLeft: pw.Radius.circular(10.0),
            //                 bottomLeft: pw.Radius.circular(10.0),
            //                 bottomRight: pw.Radius.circular(10.0)),
            //             color: PdfColors.blue500,
            //           ),
                
                
                
            //     child: pw.Padding(padding: pw.EdgeInsets.all(10), child: pw.Text("${(int.parse(SalesData[0]["BikePaymentDue"].toString())-int.parse(SalesData[0]["Discount"].toString()))}", style: pw.TextStyle(fontSize: 14, color: PdfColors.white, font: ttf)))),




            //  ]),
        
         







                 pw.SizedBox(
                      height: 70,
                      
                
              ),





            pw.Row(

              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              
              
              
              children: [

                  pw.Padding(padding: pw.EdgeInsets.only(left: 10,top: 30, right: 10),child: pw.Column(children: [

                    pw.Text("___________________________"),

                    pw.Text("DEPOSITED BY",style:pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, font: ttf)),


                  ]),),



             







                  pw.Padding(padding: pw.EdgeInsets.only(right: 10,top: 30),child: pw.Column(children: [

                    pw.Text("_____________________________"),

                    pw.Text("AUTHORISED SIGNATURE",style:pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, font: ttf)),


                  ]),),



              ]),







        ])); // Center
      }));



return pdf.save();
}