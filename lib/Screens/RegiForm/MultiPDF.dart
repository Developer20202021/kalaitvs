// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as p;
// import 'package:printing/printing.dart';
// class MyProfile extends StatefulWidget {

// final List BikesData;
// const MyProfile({super.key, required this.BikesData});

//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }

// class _MyProfileState extends State<MyProfile> {

// var Banglattf;



// Future getFontData () async{

//   final Banglafont = await rootBundle.load("lib/fonts/Siyam-Rupali-ANSI.ttf");
//  Banglattf = p.Font.ttf(Banglafont);


// }




// initState() {




//   FlutterNativeSplash.remove();
//   super.initState();
// }

// @override
// Widget build(BuildContext context) {

  
// return Scaffold(
//   appBar: AppBar(
//     title: const Text('My Profile'),
//   ),
//   body: Center(
//     child: ElevatedButton(
//       onPressed: () async {
//         //List of pdf widgets
//         List<p.Widget> widgets = [];

//         //Profile image
//         final image = p.ClipOval(
//           child: p.Image(
//             await imageFromAssetBundle('lib/images/bajaj_logo.png'),
//             fit: p.BoxFit.cover,
//             width: 300,
//             height: 300,
//           ),
//         );

//         //container for profile image decoration
//         final container = p.Center(
//           child: p.Container(
//             child: image,
//             padding: const p.EdgeInsets.all(5),
//             decoration: p.BoxDecoration(
//               shape: p.BoxShape.circle,
//               border: p.Border.all(
//                 color: PdfColors.blue,
//                 width: 10,
//               ),
//             ),
//           ),
//         );
        
//         //add decorated image container to widgets list
//         widgets.add(container);
//         widgets.add(p.SizedBox(height: 20));//some space beneath image



//             final table = p.Table(
//                       border: p.TableBorder.all(color: PdfColors.green200),
//                       children: [



//                       p.TableRow(
//                         decoration: p.BoxDecoration(color: PdfColors.grey100),
//                           children: [
//                             p.Padding(
//                               child: p.Text("SL.", style:p.TextStyle(fontSize: 11, fontWeight: p.FontWeight.bold, font: Banglattf, color: PdfColor.fromInt(0x000000))),
//                               padding: p.EdgeInsets.all(4),
//                             ),

//                             p.Padding(
//                               child: p.Text("Bike Name", style:p.TextStyle(fontSize: 11, fontWeight: p.FontWeight.bold, font: Banglattf, color: PdfColor.fromInt(0x000000))),
//                               padding: p.EdgeInsets.all(4),
//                             ),


//                               p.Padding(
//                               child: p.Text("Stock Amount", style:p.TextStyle(fontSize: 11, fontWeight: p.FontWeight.bold, font: Banglattf, color: PdfColor.fromInt(0x000000))),
//                               padding: p.EdgeInsets.all(4),
//                             ),



//                           ],
//                         ),



                    
                    
//                     for(int x =0; x<widget.BikesData.length; x++)

//                        p.TableRow(
//                         decoration: p.BoxDecoration(color: PdfColors.grey100),
//                           children: [

//                              p.Padding(
//                               child: p.Text("${x+1}", style:p.TextStyle(fontSize: 11, fontWeight: p.FontWeight.bold,font: Banglattf,  color: PdfColor.fromInt(0x000000))),
//                               padding: p.EdgeInsets.all(4),
//                             ),



//                             p.Padding(
//                               child: p.Text("${widget.BikesData[x]["BikeName"]}", style:p.TextStyle(fontSize: 11, fontWeight: p.FontWeight.bold,  color: PdfColor.fromInt(0x000000))),
//                               padding: p.EdgeInsets.all(4),
//                             ),


//                               p.Padding(
//                               child: p.Text("${widget.BikesData[x]["BikeShowroomAvailableNumber"]}", style:p.TextStyle(fontSize: 11, fontWeight: p.FontWeight.bold, color: PdfColor.fromInt(0x000000))),
//                               padding: p.EdgeInsets.all(4),
//                             ),



//                           ],
//                         ),


//           ]);


      

//       widgets.add(table);


//         for (int i = 0; i < 4; i++) {
//           widgets.add(
//             p.Text(
//               'Heading',
//               style: p.TextStyle(
//                 fontSize: 25,
//                 fontWeight: p.FontWeight.bold,
//               ),
//             ),
//           );
//           widgets.add(p.SizedBox(height: 5));
//           widgets.add(
//             p.Text(
//               'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed accumsan augue, ut tincidunt lectus. Vestibulum venenatis euismod eros suscipit rhoncus. Sed vulputate congue turpis ut cursus. Proin sollicitudin nulla vel nisi vulputate sagittis. Morbi neque mauris, auctor id posuere eu, egestas porttitor justo. Donec tempus egestas lorem in convallis. Quisque fermentum, augue ut facilisis pretium, risus dolor viverra est, ac consequat tellus risus vitae sapien. ',
//               style: const p.TextStyle(color: PdfColors.grey),
//             ),
//           );
//           widgets.add(p.SizedBox(height: 10));
//         }

//         //pdf document
//         final pdf = p.Document();

//         pdf.addPage(
//           p.MultiPage(

//   pageTheme: p.PageTheme(
//     pageFormat: PdfPageFormat.a4,
//     theme: p.ThemeData.withFont(base: p.Font.ttf(await rootBundle.load("lib/fonts/Caladea-BoldItalic.ttf")),),
//     buildBackground: (context)=>p.FullPage(ignoreMargins: true,child: p.Container(

//        margin: const p.EdgeInsets.all(10),
//            decoration: p.BoxDecoration(
                
//                 border: p.Border(bottom: p.BorderSide(
//                   color: PdfColors.green,
//                   width: 1, style: p.BorderStyle.dashed,), left:  p.BorderSide(color: PdfColors.green,width: 1, style: p.BorderStyle.dashed,),top:  p.BorderSide(color: PdfColors.green,width: 1, style: p.BorderStyle.dashed,),right:  p.BorderSide(color: PdfColors.green,width: 1, style: p.BorderStyle.dashed,),)
//               ),

//       child:  p.Container(

//          margin: const p.EdgeInsets.all(5),
//               decoration: p.BoxDecoration(
                
//                 border: p.Border(bottom: p.BorderSide(color: PdfColors.green,width: 1, style: p.BorderStyle.dashed,), left:  p.BorderSide(color: PdfColors.green,width: 1, style: p.BorderStyle.dashed,),top:  p.BorderSide(color: PdfColors.green,width: 1, style: p.BorderStyle.dashed,),right:  p.BorderSide(color: PdfColors.green,width: 1, style: p.BorderStyle.dashed,),)
//               ),
//               width: double.infinity,
//               height: double.infinity,
//               child: p.Stack(
//                 alignment: p.Alignment.center,
//                 children: [


//                 ]
//               )
//       )
//     ))
//   ),
            
//             // pageFormat: PdfPageFormat.a4,
//             build: (context) => widgets,//here goes the widgets list
//           ),
//         );
//         Printing.layoutPdf(
//           onLayout: (PdfPageFormat format) async => pdf.save(),
//         );
//       },
//       child: const Text('Print'),
//     ),
//   ),
// );
// }
// }