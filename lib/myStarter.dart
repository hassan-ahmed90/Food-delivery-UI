import 'package:flutter/material.dart';
import 'package:third_ui/home_page.dart';
class MyStarterScreen extends StatefulWidget {
  const MyStarterScreen({super.key});

  @override
  State<MyStarterScreen> createState() => _MyStarterScreenState();
}

class _MyStarterScreenState extends State<MyStarterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pizza.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ]
            )
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Taking Order for Faster Delivery',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white,
                ),),
                SizedBox(
                  height: 20,
                ),
                Text('See resturants nearby by'
                    ' \nadding location',style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  height: 1.4,

                ),),
                SizedBox(height: 100,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow,Colors.orange,
                      ]
                    )
                  ),
                  child: MaterialButton(
                    child: Center(child: Text('Start'),),
                      onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  }),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
