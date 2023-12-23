import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SalesPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SalesPage({Key? key}) : super(key: key);
 
  @override
  SalesPageState createState() => SalesPageState();
}
 
class SalesPageState extends State<SalesPage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  double myValue = 1412;


     void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      // TODO: implement your code here

      dynamic value = args.value;
      
      print(value);
    }
 
  @override
  void initState() {
    data = [
      _ChartData('Jan', 1112),
      _ChartData('Feb', 1115),
      _ChartData('Mar', 1130),
      _ChartData('Apr', 116.4),
      _ChartData('May', 1114),
      _ChartData('Jun', 1114),
      _ChartData('Jul', 1141),
      _ChartData('Aug', 1141),
      _ChartData('Sep', 14),
      _ChartData('Oct', 114),
      _ChartData('Nov', 143),
      _ChartData('Dec', 143),


    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:  AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        
        iconTheme: IconThemeData(color: Colors.purple),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),

        title: const Text("Your Sales", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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


      
        body: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: myValue, interval: 1000),
            tooltipBehavior: _tooltip,
            series: <ChartSeries<_ChartData, String>>[
              ColumnSeries<_ChartData, String>(
                 borderRadius: BorderRadius.all(Radius.circular(5)),
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  name: 'Gold',
                  color: Colors.purple)
            ]));
  }
}
 
class _ChartData {
  _ChartData(this.x, this.y);
 
  final String x;
  final double y;
}




