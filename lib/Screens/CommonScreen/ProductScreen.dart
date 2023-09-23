import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tvs_app/Screens/AdminScreen/CreateNewCustomer.dart';
import 'package:tvs_app/Screens/AdminScreen/CustomerPaymentAdd.dart';
import 'package:tvs_app/Screens/AdminScreen/PaymentHistory.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Bikes", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 35,),
        itemBuilder: (BuildContext context, int index) {
          return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_drop_down_circle),
                title: const Text('Card title 1'),
                subtitle: Text(
                  'Secondary Text',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
           
            //  Image.network("https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmlrZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),






              CarouselSlider(
              items: [
                  
                //1st Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmlrZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  
                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmlrZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  
                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmlrZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  
                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmlrZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  
                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmlrZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
  
          ],
              
            //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
          ),












             ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  
          TextButton(onPressed: () async{


                    

                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewCustomer(BikeName: " ", BikeColor: " ", BikeModelName: " ", BikeSalePrice: "",)));

                    }, child: Text("Sale", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                    
                              backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
                            ),),




               
          TextButton(onPressed: () async{


      

                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewCustomer(BikeName: " ", BikeColor: " ", BikeModelName: " ", BikeSalePrice: "",)));

              },
              
               child: Text("View", style: TextStyle(color: Colors.white),), style: ButtonStyle(
              
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
                      ),),


                      TextButton(onPressed: () async{


      

                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewCustomer(BikeName: " ", BikeColor: " ", BikeModelName: " ", BikeSalePrice: "",)));

              },
              
               child: Text("Previous Sale", style: TextStyle(color: Colors.white),), style: ButtonStyle(
              
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
                      ),),





                  
                  TextButton(onPressed: () async{


      

                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewCustomer(BikeName: " ", BikeColor: " ", BikeModelName: " ", BikeSalePrice: "",)));

              },
              
               child: Text("Delete", style: TextStyle(color: Colors.white),), style: ButtonStyle(
              
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                      ),),
                ],
              ),













             

            

            ],
          ),
          );
        },
        itemCount: 25,
      ),
    );
  }
}

void doNothing(BuildContext context) {}

void EveryPaymentHistory(BuildContext context){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentHistory()));
}





void CustomerAddPayment(BuildContext context){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerPaymentAdd()));
}




// ListTile(
              
//                  leading: CircleAvatar(
//         backgroundColor: Colors.pink,
//         child: Text("S"),
//       ),

//       subtitle: Text('Bike Model'),
//       trailing:   TextButton(onPressed: () async{


      

//          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewCustomer(BikeName: " ", BikeColor: " ", BikeModelName: " ", BikeSalePrice: "",)));

//       }, child: Text("Sale", style: TextStyle(color: Colors.white),), style: ButtonStyle(
       
//                 backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
//               ),),
              
//               title: Text('Bike Name', style: TextStyle(
//                 fontWeight: FontWeight.bold
//               ),))





          

              