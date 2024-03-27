import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';








class PerDayBikeSalePDFPreview extends StatefulWidget {


final List BikesData;
// final String TotalBikes;

 const PerDayBikeSalePDFPreview({super.key,  required this.BikesData});

  @override
  State<PerDayBikeSalePDFPreview> createState() => _PerDayBikeSalePDFPreviewState();
}

class _PerDayBikeSalePDFPreviewState extends State<PerDayBikeSalePDFPreview> {






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
        title: const Text("বাইক বিক্রয়ের তথ্য", style: TextStyle(fontFamily: "Josefin Sans", fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: PdfPreview(
        build: (context) => makePdf(widget.BikesData),
      ),
    );
  }
}



// makePdf(widget.StudentName,widget.StudentIDNo, widget.StudentPhoneNumber,widget.StudentCashIn,widget.StudentEmail,widget.CashInDate)








Future<Uint8List> makePdf(List BikesData) async {

final netImage = await networkImage('https://i.ibb.co/71Kw2KJ/tvs-logo-33710.png');

final backImage = await networkImage('https://i.ibb.co/kmsjjWz/pngwing-com-1.png');












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
                
                border: pw.Border(bottom: pw.BorderSide(
                  color: PdfColors.green,
                  width: 1, style: pw.BorderStyle.dashed,), left:  pw.BorderSide(color: PdfColors.green,width: 1, style: pw.BorderStyle.dashed,),top:  pw.BorderSide(color: PdfColors.green,width: 1, style: pw.BorderStyle.dashed,),right:  pw.BorderSide(color: PdfColors.green,width: 1, style: pw.BorderStyle.dashed,),)
              ),

      child:  pw.Container(

         margin: const pw.EdgeInsets.all(5),
              decoration: pw.BoxDecoration(
                
                border: pw.Border(bottom: pw.BorderSide(color: PdfColors.green,width: 1, style: pw.BorderStyle.dashed,), left:  pw.BorderSide(color: PdfColors.green,width: 1, style: pw.BorderStyle.dashed,),top:  pw.BorderSide(color: PdfColors.green,width: 1, style: pw.BorderStyle.dashed,),right:  pw.BorderSide(color: PdfColors.green,width: 1, style: pw.BorderStyle.dashed,),)
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


                  pw.Text("KALAI TVS CENTER", style:pw.TextStyle(fontSize: 21, fontWeight: pw.FontWeight.bold, font: ttf, color: PdfColor.fromInt(0x000000))),
                  pw.Text("KvjvB wUwfGm ‡m›Uvi", style:pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold, font: Banglattf, color: PdfColor.fromInt(0x000000))),
                  pw.Center(child: pw.Text("Dealer: Uttara Motors Ltd.", style:pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, font: ttf, color: PdfColor.fromInt(0x000000))),),

                  pw.Center(child: pw.Text("Kalai, Joypurhat", style:pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold, font: ttf, color: PdfColor.fromInt(0x000000))),),

                   pw.SizedBox(height: 6),

                  pw.Center(child: pw.Text("Mobile: 01711414664, 01721608030, 01718148814", style:pw.TextStyle(fontSize: 10,  font: ttf, color: PdfColor.fromInt(0x000000))),),

                  pw.SizedBox(height: 6),
                  // pw.Center(child: pw.Text("EIIN: 122026", style:pw.TextStyle(fontSize: 11,  font: ttf)),),



                ]))




            ]),

            


             pw.SizedBox(
                      height: 20,
                      
                
              ),


              pw.Center(child:pw.Container(

                        width: 250,
                        decoration:  pw.BoxDecoration(
                        border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed,), left:  pw.BorderSide(width: 1, style: pw.BorderStyle.dashed,),top:  pw.BorderSide(width: 1, style: pw.BorderStyle.dashed,),right:  pw.BorderSide(width: 1, style: pw.BorderStyle.dashed,),)),
                
                
                child: pw.Center(child: pw.Text("evBK weµ‡qi Z_¨", style:pw.TextStyle(fontSize: 20,  font: Banglattf, color: PdfColor.fromInt(0x000000))))) ),


          pw.SizedBox(
                      height: 10,
              ),



                 pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    // crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [

                      pw.Text("ZvwiLt", style:pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, font: Banglattf, color: PdfColor.fromInt(0x000000))),

                      pw.Container(

                        width: 100,
                        decoration:  pw.BoxDecoration(
                        border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                        
                        child: pw.Padding(
                          padding:pw.EdgeInsets.only(bottom: 5, left: 30),
                          child: pw.Text("${BikesData[0]["Date"]}", style:pw.TextStyle(fontSize: 11, font: Banglattf,  color: PdfColor.fromInt(0x000000)))))
                  ]),


              pw.SizedBox(
                      height: 30,
              ),






              // pw.SizedBox(height: 36),


           










             pw.Table(
                      border: pw.TableBorder.all(color: PdfColors.green200),
                      children: [



                      pw.TableRow(
                        decoration: pw.BoxDecoration(color: PdfColors.grey100),
                          children: [
                            pw.Padding(
                              child: pw.Text("µt", style:pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold, font: Banglattf, color: PdfColor.fromInt(0x000000))),
                              padding: pw.EdgeInsets.all(4),
                            ),

                            pw.Padding(
                              child: pw.Text("evB‡Ki bvg", style:pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold, font: Banglattf, color: PdfColor.fromInt(0x000000))),
                              padding: pw.EdgeInsets.all(4),
                            ),


                              pw.Padding(
                              child: pw.Text("msL¨v", style:pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold, font: Banglattf, color: PdfColor.fromInt(0x000000))),
                              padding: pw.EdgeInsets.all(4),
                            ),



                          ],
                        ),



                    
                    
                    for(int x =0; x<BikesData.length; x++)

                       pw.TableRow(
                        decoration: pw.BoxDecoration(color: PdfColors.grey100),
                          children: [

                             pw.Padding(
                              child: pw.Text("${x+1}", style:pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold,font: Banglattf,  color: PdfColor.fromInt(0x000000))),
                              padding: pw.EdgeInsets.all(4),
                            ),



                            pw.Padding(
                              child: pw.Text("${BikesData[x]["BikeName"]}", style:pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold,  color: PdfColor.fromInt(0x000000))),
                              padding: pw.EdgeInsets.all(4),
                            ),


                              pw.Padding(
                              child: pw.Text("${BikesData[x]["SaleNumber"]}", style:pw.TextStyle(fontSize: 11,font: Banglattf, fontWeight: pw.FontWeight.bold, color: PdfColor.fromInt(0x000000))),
                              padding: pw.EdgeInsets.all(4),
                            ),



                          ],
                        ),


          ]),



// pw.SizedBox(height: 16),


//             // Name Chnage Fee Box
//           pw.Padding(
//             padding:pw.EdgeInsets.only(bottom: 5, left: 280),
//             child:  pw.Column(
//               mainAxisAlignment: pw.MainAxisAlignment.end,
//               // crossAxisAlignment: pw.CrossAxisAlignment.end,
//               children: [

//                 pw.Row(

//               mainAxisAlignment: pw.MainAxisAlignment.start,
//               // crossAxisAlignment: pw.CrossAxisAlignment.start,
                  
//                   children: [

//                     pw.Text("‡gvU", style:pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold, font: Banglattf, color: PdfColor.fromInt(0x000000))),

//                     pw.SizedBox(width: 5),

//                     pw.Container(
//                       width: 100,
//                         decoration:  pw.BoxDecoration(
//                         border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed,), left:  pw.BorderSide(width: 1, style: pw.BorderStyle.dashed,),top:  pw.BorderSide(width: 1, style: pw.BorderStyle.dashed,),right:  pw.BorderSide(width: 1, style: pw.BorderStyle.dashed,),)),
                      
//                       child: pw.Padding(padding:pw.EdgeInsets.only(
//                         top: 10,right:10,
//                         bottom:10, left: 10),child: pw.Text("${CreditTotalAmount} wU", style:pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, font: Banglattf, color: PdfColor.fromInt(0x000000)))))
//                 ])

//             ]),),



                 pw.SizedBox(
                      height: 70,
                      
                
              ),





            pw.Row(

              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              
              
              
              children: [

                  pw.Padding(padding: pw.EdgeInsets.only(left: 10,top: 30, right: 10),child: pw.Column(children: [

                    pw.Text("___________________________"),

                    pw.Text("¯^v¶i",style:pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, font: Banglattf)),


                  ]),),

              ]),

        ])); // Center
      }));



return pdf.save();
}