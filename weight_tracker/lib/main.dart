import 'package:flutter/material.dart';
import 'dart:math';
import 'package:weight_tracker/models/weight_save.dart';
import 'package:weight_tracker/common_widgets/weight_list_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( primarySwatch: Colors.green,  ),
      home: HomePage(title: 'Weight Tracker'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeightSave> weightSaves = new List();

  void _addWeightSave() {
    setState(() {
      //  update state in response to  floating button
      //  onPressed: => _addWeightSave()
      weightSaves.add(new WeightSave(
        new DateTime.now(),new Random().nextInt(100).toDouble()
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: weightSaves.map((WeightSave weightSave){
            //calculating difference
            double difference = weightSaves.first == weightSave ? 0.0 : weightSave.weight - 
              weightSaves[weightSaves.indexOf(weightSave) - 1].weight;
            return new WeightListItem(weightSave, difference);
          }).toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addWeightSave,
        tooltip: 'Add new weight entry',
        child: new Icon(Icons.add),
      ),
    );
  }
}