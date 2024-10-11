import 'package:flutter/material.dart';
import 'responsive.dart';
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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Your BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.amberAccent;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700),),

                SizedBox(height: 11,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in Kg'),
                      prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your height in Ft'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter your height in inches'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    //BMI Calculation
                    var iWt =  int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = iFt*12 + iInch;

                    var tCm = tInch*2.54;
                    var tM =tCm/100;

                    var bmi = iWt/(tM*tM);
                    var msg;

                    if(bmi>25){
                      msg = "You are OverWeight";
                      bgColor = Colors.redAccent;
                    }
                    else if(bmi<18){
                      msg = "You are UnderWeight";
                      bgColor = Colors.deepOrangeAccent;
                    }
                    else{
                      msg = "You are Healthy";
                      bgColor = Colors.greenAccent;
                    }


                    setState(() {
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                    });
                  }
                  else{
                    setState(() {
                      result = "Please fill required fields";
                    });
                  }
                }, child: Text('Calculate')),

                SizedBox(height: 11,),

                Text(result,style: TextStyle(fontSize: 18),),

              ],
            ),
          ),
        ),
      )
    );
  }
}
