import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController userHeightFeet = TextEditingController();
  TextEditingController userHeightInch = TextEditingController();
  TextEditingController userWeight = TextEditingController();
  String result="";
  String statusResult="";
  var colorValue=Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI",style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.orange)),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: colorValue,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          margin: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Center(child: Text(result,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                Center(child: Text(statusResult,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                SizedBox(height: 25,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: userHeightFeet,
                  decoration: InputDecoration(
                    hintText: "Enter Your Height In Feet",
                    suffixIcon: Icon(Icons.height,color: Colors.teal,size: 30,),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.orange,width: 2)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width:2,color: Colors.teal)
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: userHeightInch,
                  decoration: InputDecoration(
                    hintText: "Enter Your Height In Inch",
                    suffixIcon: Icon(Icons.line_weight,color: Colors.teal,size: 28,),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.orange,width: 2)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width:2,color: Colors.teal)
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: userWeight,
                  decoration: InputDecoration(
                    hintText: "Enter Your Weight In Kg",
                    suffixIcon: Icon(Icons.line_weight,color: Colors.teal,size: 28,),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.orange,width: 2)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width:2,color: Colors.teal)
                    ),
                  ),
                ),
               SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:Colors.orange,
                      foregroundColor: Colors.white,
                      shadowColor: Colors.orange.shade100,
                    padding: EdgeInsets.symmetric(vertical: 17,horizontal: 40),
                  ),
                    onPressed: (){
                      double feetHeight = double.parse(userHeightFeet.text);
                      double inchHeight = double.parse(userHeightInch.text);
                      double userweight =double.parse(userWeight.text);
                      double heightInInches = (feetHeight*12)+inchHeight;
                      double heightInMeter = (heightInInches*0.0254);
                      double userBmi = (userweight/(heightInMeter*heightInMeter));
                      userHeightFeet.clear();
                      userHeightInch.clear();
                      userWeight.clear();
                      String status="";
                      if(userBmi <= 18.4){
                        colorValue = Colors.yellow.shade100;
                        status="Underweight";
                      }else if(userBmi>=18.5 && userBmi<=24.9){
                        colorValue = Colors.green.shade100;
                        status="Normal";
                      }else if(userBmi>=25 && userBmi<=39.9){
                        colorValue = Colors.orange.shade100;
                        status="Overweight";
                      }else{
                        colorValue = Colors.red.shade100;
                        status="Obese";
                      }
                      setState(() {
                        result="Your BMI Is ${userBmi.toStringAsFixed(4)}";
                        statusResult="You Are ${status}";
                      });
                    },
                    child: Text("Calculate",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
