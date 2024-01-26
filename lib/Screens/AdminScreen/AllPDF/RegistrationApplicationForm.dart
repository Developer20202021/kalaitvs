
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';








class RegistrationApplicationFormPDF extends StatefulWidget {


final List SalesData;

 const RegistrationApplicationFormPDF({super.key,  required this.SalesData});

  @override
  State<RegistrationApplicationFormPDF> createState() => _RegistrationApplicationFormPDFState();
}

class _RegistrationApplicationFormPDFState extends State<RegistrationApplicationFormPDF> {






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
        title: const Text("Registration Application Form", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
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

final netImage = await networkImage('https://i.ibb.co/mqRKMyy/pngwing-com-4.png');

final backImage = await networkImage('https://i.ibb.co/0f26g8Z/pngwing-com-6.png');


// https://i.ibb.co/0f26g8Z/pngwing-com-6.png


// https://i.ibb.co/kmsjjWz/pngwing-com-1.png








final pdf = pw.Document();

final garland = await rootBundle.loadString('lib/images/border_image.svg');
final swirls3 = await rootBundle.loadString('lib/images/swirls3.svg');
final swirls = await rootBundle.loadString('lib/images/swirls.svg');
final swirls1 = await rootBundle.loadString('lib/images/swirls1.svg');
final swirls2 = await rootBundle.loadString('lib/images/swirls2.svg');

// final ByteData image = await rootBundle.load('lib/images/pngwing.png');

// Uint8List imageData = (image).buffer.asUint8List();


final font = await rootBundle.load("lib/fonts/Bungee-Regular.ttf");
final ttf = pw.Font.ttf(font);

final Banglafont = await rootBundle.load("lib/fonts/Siyam-Rupali-ANSI.ttf");
final Banglattf = pw.Font.ttf(Banglafont);


pdf.addPage(pw.Page(
  
  pageTheme: pw.PageTheme(
    pageFormat: PdfPageFormat.a4,
    theme: pw.ThemeData.withFont(base: pw.Font.ttf(await rootBundle.load("lib/fonts/Caladea-BoldItalic.ttf")),),
    buildBackground: (context)=>pw.FullPage(ignoreMargins: true,child: pw.Container(

       margin: const pw.EdgeInsets.all(7),
            decoration: pw.BoxDecoration(
              // border: pw.Border.all(
              //     color: const PdfColor.fromInt(0xf44336), width: 1),
            ),

      child:  pw.Container(

         margin: const pw.EdgeInsets.all(5),
              decoration: pw.BoxDecoration(
                
                // border: pw.Border.all(
                //     color: const PdfColor.fromInt(0xf44336), width: 5),
              ),
              width: double.infinity,
              height: double.infinity,
              child: pw.Stack(
                alignment: pw.Alignment.center,
                children: [

          //  pw.Positioned(
          //           bottom: 5,
          //           left: 5,
          //           child: pw.Transform(
          //             transform: Matrix4.diagonal3Values(1, -1, 1),
          //             adjustLayout: true,
          //             child: pw.SvgImage(
          //               svg: swirls3,
          //               height: 160,
          //             ),
          //           ),
          //         ),


          //           pw.Positioned(
          //           top: 5,
          //           left: 5,
          //           child: pw.SvgImage(
          //             svg: swirls3,
          //             height: 160,
          //           ),
          //         ),
          //         pw.Positioned(
          //           top: 5,
          //           right: 5,
          //           child: pw.Transform(
          //             transform: Matrix4.diagonal3Values(-1, 1, 1),
          //             adjustLayout: true,
          //             child: pw.SvgImage(
          //               svg: swirls3,
          //               height: 160,
          //             ),
          //           ),
          //         ),

          //         pw.Positioned(
          //           bottom: 5,
          //           right: 5,
          //           child: pw.Transform(
          //             transform: Matrix4.diagonal3Values(-1, -1, 1),
          //             adjustLayout: true,
          //             child: pw.SvgImage(
          //               svg: swirls3,
          //               height: 160,
          //             ),
          //           ),
          //         ),


                    //  pw.Image(backImage, height: 950, width: 550,),

                  
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
  
  // theme: pw.ThemeData.withFont(base: pw.Font.ttf(await rootBundle.load("lib/fonts/Bungee-Regular.ttf")),),
  //     pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [

            pw.Row(
              
              mainAxisAlignment: pw.MainAxisAlignment.start,

              children: [

                // pw.Padding(
                //    padding: pw.EdgeInsets.only(left: 30,top: 30),
                //   child: pw.Center(child:  pw.Image(netImage, height: 70, width: 70, ),),),

                pw.Padding(
                  padding: pw.EdgeInsets.only(left: 0,),
                  
                  child: pw.Column(children: [

                  pw.Text("FORM OF APPLICATION FOR THE REGISTRATION OF MOTOR VEHICLE", style:pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold,  color: PdfColor.fromInt(0x000000))),


                  pw.Text("To be filled in by the office", style:pw.TextStyle(fontSize: 11,   color: PdfColor.fromInt(0x000000))),


                  pw.Text("Section-1", style:pw.TextStyle(fontSize: 12,  fontWeight: pw.FontWeight.bold, color: PdfColor.fromInt(0x000000))),
    

                ]))




            ]),



            // pw.Row(

            //   mainAxisAlignment: pw.MainAxisAlignment.end,
            //   // crossAxisAlignment: pw.CrossAxisAlignment.start,
            //   crossAxisAlignment: pw.CrossAxisAlignment.end,
                  
            //       children: [



            //         pw.Container(
            //           width: 80,
            //           height: 70,
            //             decoration:  pw.BoxDecoration(
            //             border: pw.Border(bottom: pw.BorderSide(width: 1,), left:  pw.BorderSide(width: 1, ),top:  pw.BorderSide(width: 1, ),right:  pw.BorderSide(width: 1,),)),
                      
            //           child: pw.Padding(padding:pw.EdgeInsets.only(
            //             top: 15,right:7,
            //             bottom:7, left: 7),child: pw.Center(child: pw.Text("Stamp Size Color Photograph", style:pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: PdfColor.fromInt(0x000000))))))
            //     ]),

            


            //  pw.SizedBox(height: 30,),


             
        pw.Table(
              
          columnWidths: {
            0: pw.FixedColumnWidth(200),
            1: pw.FlexColumnWidth(300),
            2: pw.FlexColumnWidth(300),
           
          },
              
              children: [


                pw.TableRow(
                
                  children: [

               pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Regn No : ", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Date :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

              
               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Prev. Regn. No. (If any) :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

                ]),


            


            pw.TableRow(
                
                  children: [

               pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Issue No :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Date :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

              
               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Issue by :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

                ]),



                
            pw.TableRow(
                
                  children: [

               pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Diary No :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Date :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

              
               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Received by :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

                ]),

              



              pw.TableRow(
                
                  children: [

               pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Customer ID :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("District : ", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

              
               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Vehicle ID :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

                ]),






                
              pw.TableRow(
                
                  children: [

               pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Veh. Description :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

              
               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Call non date :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

                ]),




            

                            
              pw.TableRow(
                
                  children: [

               pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Refusal date : ", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Refusal Code :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

              
               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Refused by :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

                ]),


            


           pw.TableRow(
                
                  children: [

               pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("P.O./Bank : ", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

              
               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Index :", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

                ]),


            
        
                pw.TableRow(
                
                  children: [

               pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Remarks (if any)", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

              
               pw.Padding(
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Index No.", style:pw.TextStyle(fontSize: 7,  color: PdfColor.fromInt(0x000000))),),

                ]),




             ]),



             pw.SizedBox(height: 7,),


        ])); // Center
      }));



return pdf.save();
}