import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var conclusion = "";
  var bgcolor;

  var bmiResult = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('welcome')),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('BMI Calculator', style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue
                ),),
                SizedBox(height: 25,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your wight in kgs'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in feet'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in inches'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inchController.text.toString();


                  if(wt != ""  &&  ft != "" && inch != ""){
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iinch = int.parse(inch);
                    //calculation for bmi
                    var tinch = (ift * 12) + iinch;
                    var tcm = tinch * 2.54;

                    var met = tcm/100;

                    var totalresult = iwt / (met * met);
                    if(totalresult < 18.5){
                      conclusion = "You are underweight";
                      bgcolor = Colors.red.shade200;
                    }else if(totalresult > 25){
                      conclusion = "You are overweight";
                      bgcolor = Colors.orange.shade200;
                    }else{
                      conclusion = "Your are Healthy";
                      bgcolor = Colors.green.shade200;
                    }
                    setState(() {
                      bmiResult = 'BMI Result : ${totalresult.toStringAsFixed(2)}';

                    });
                  }else{
                    setState(() {
                      bmiResult = "please fill all input fields";
                    });
                  }


                }, child: Text('calculate')),
                SizedBox(height: 15,),

                SizedBox(height: 20,),
                Text(bmiResult, style: TextStyle(fontSize: 16),),
                SizedBox(height : 18),
                Text(conclusion, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),


      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: (){
            wtController.clear();
            ftController.clear();
            inchController.clear();
            bgcolor= Colors.white;
            bmiResult = "";
            conclusion = "";
            setState(() {

            });
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
