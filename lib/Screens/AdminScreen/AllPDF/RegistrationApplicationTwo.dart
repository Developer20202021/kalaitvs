
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';








class RegistrationApplicationFormTwo extends StatefulWidget {


final List SalesData;

 const RegistrationApplicationFormTwo({super.key,  required this.SalesData});

  @override
  State<RegistrationApplicationFormTwo> createState() => _RegistrationApplicationFormTwoState();
}

class _RegistrationApplicationFormTwoState extends State<RegistrationApplicationFormTwo> {






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
        title: const Text("Registration Application Form Two", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
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

                ]
              )
      )
    ))
  ),
  

      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [









     
             pw.Row(
              
              mainAxisAlignment: pw.MainAxisAlignment.start,

              children: [


                pw.Padding(
                  padding: pw.EdgeInsets.only(left: 200,),
                  
                  child: pw.Column(children: [

                  pw.Text("Section V", style:pw.TextStyle(fontSize: 10,   color: PdfColor.fromInt(0x000000))),

                ]))

            ]),



            pw.SizedBox(height: 7,),


        





           pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("39. Hire purchase/hypothecation information :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),]),


          
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("      The vehicle is subject to hire purchase/hypothecation with :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),]),


        
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              
              
              pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("        a) Name :                                                                                                                                 b) Date :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),

                ]),


        
                  pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              
              
              pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("          Address :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),

                ]),
            




            

            pw.SizedBox(height: 7,),


        





           pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("40. Insurance information :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),]),


        
                  pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              
              
              pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("        a) Policy no :                                                                b) Type of policy :                                                       c) Insurer's name & address :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),

                ]),





       pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              
              
              pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("        b) Date of expiry :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),

                ]),



        

                    

            pw.SizedBox(height: 7,),


        





           pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("41. Joint owner information :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),]),



          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              
              
              pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("        a) Name :                                                                                                 b) Name :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),

                ]),



          

          
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              
              
              pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("        Father/Husband :                                                                                                  Father/Husband :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),

                ]),



          

          
             pw.SizedBox(height: 14,),


     
             pw.Row(
              
              mainAxisAlignment: pw.MainAxisAlignment.start,

              children: [


                pw.Padding(
                  padding: pw.EdgeInsets.only(left: 190,),
                  
                  child: pw.Column(children: [

                  // pw.Text("To be filled in by the Owner", style:pw.TextStyle(fontSize: 10,   color: PdfColor.fromInt(0x000000))),


                  pw.Text("Section VI", style:pw.TextStyle(fontSize: 12,  fontWeight: pw.FontWeight.bold, color: PdfColor.fromInt(0x000000))),

                  pw.Text("(Declaration, Certificates and documents)", style:pw.TextStyle(fontSize: 10,   color: PdfColor.fromInt(0x000000))),
                ]))

            ]),




      

                 pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("42. Declaration by owner :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),]),


            

         pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Column(
                  
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [

              pw.Text("            a) I  the  undersigned  do   hereby  declare  that to  the  best  of  my  knowledge and belief, the information given and the", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),



               pw.Text("                documents enclosed (as per list attached) are true. I also declare that in case the papers/documents and information", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),


                pw.Text("               furnished are found to be incorrect at any later stage, I shall be liable for legal action.", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),

                ]),),]),





      pw.SizedBox(height: 20,),

         
         pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [



               pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Date :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),
              
              
              
              pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Column(
                  

                  children: [

              pw.Text("Signature of owner", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),



               pw.Text("Seal", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),


                ]),)
                
                
                ,]),


          
                    
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Encl : List of documents", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),]),



        

                         pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("43. Registered dealer's certificate :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),]),


            

         pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Column(
                  
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [

              pw.Text("                I  the  undersigned  do  hereby  certify  that the   vehicle  in   question  has  been  sold  by  me/my  firm   and  the   ownership", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),



               pw.Text("                documents attached with the application for registration are true. The information/specifications pertaining to the vehicle", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),


                pw.Text("               are correct and the vehicle complies with all the requirements of the registration.", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),

                ]),),]),


            
            
      pw.SizedBox(height: 20,),

         
         pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [



               pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Date :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),
              
              
              
              pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Column(
                  

                  children: [

              pw.Text("Signature of owner", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),



               pw.Text("Seal", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),


                ]),)
                
                
                ,]),


          
                    
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Encl : List of documents", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),]),


          


                                   pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("44. certificate by the Inspector of Motor Vehicles :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),]),


            

         pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Column(
                  
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [

            
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [

                  pw.Text("            Certificate that the particulars pertaining to the owner and the vehicle (Chassis No.", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),



                pw.Container(
                width: 120,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dotted))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 1, left: 30),child: pw.Text("${SalesData[0]["ChassisNo"]}", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))))),

                  pw.Text("Engine", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),

              ]),





               pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [

                  pw.Text("           No", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),

                pw.Container(
                
                width: 147,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dotted))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 1, left: 30),child: pw.Text("${SalesData[0]["EngineNo"]}", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))))),

                  pw.Text(") given in the application match with the ownership documents attached to this", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),

              ]),

              



              //  pw.Text("             No...................................................) given in the application match with the ownership documents attached to this", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),


                pw.Text("          application.  It  is  further  certified  that  the  vehicle  complies  with  the  registration  requirements specified  in  the  MV  Act", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),


                pw.Text("          and the Rules and/or Regulations made thereunder and the vehicle is not mechanically defective. The necessary documents/", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),

                pw.Text("          papers are available as per list enclosed.", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),

                ]),),]),


            
            
      pw.SizedBox(height: 20,),

         
         pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [



               pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Date :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),
              
              
              
              pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Column(
                  

                  children: [

              pw.Text("Signature of Inspector of Motor Vehicles", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),



               pw.Text("Official Seal", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),


                ]),)
                
                
                ,]),


          
                    
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Encl : List of documents", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),]),


        
             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("45. Registration Status :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),]),


      
                  
      pw.SizedBox(height: 20,),

         
         pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [



               pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("Registration allowed/not allowed", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),
              
              
              
              pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Column(
                  

                  children: [

              pw.Text("Signature of Registering Authority", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),



               pw.Text("Seal", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),


                ]),)
                
                
                ,]),


        

             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Text("46. Fees and Tax Accounts :", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),),]),


        


         pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Column(
                  
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [

              pw.Text("                Necessary  fees  and  taxes  amounting  to  taka....................................................................................................................has  been  paid  to", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),






                pw.Text("               PO/Bank.....................................................................vide vouchers and receipts enclosed.", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),



                ]),),]),

      



            pw.SizedBox(height: 20,),

         
         pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [



               pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Column(
                  

                  children: [

              pw.Text("Signature of owner", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),



               pw.Text("of his representative", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),


                ]),),
              
              
              
              pw.Padding(
                
                padding: pw.EdgeInsets.only(top: 6),
                child: pw.Column(
                  

                  children: [

              // pw.Text("Signature of Inspector of Motor Vehicles", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),



               pw.Text("Signature of dealing assistant", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),


                ]),)
                
                
                ,]),



          // pw.SizedBox(height: 10,),

          pw.Center(child: pw.Text("Counter signature by the registering authority.", style:pw.TextStyle(fontSize: 8,  color: PdfColor.fromInt(0x000000))),)







        ])); // Center
      }));



return pdf.save();
}