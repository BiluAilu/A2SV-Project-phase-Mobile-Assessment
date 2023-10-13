import 'package:flutter/material.dart';

class GetStated extends StatelessWidget {
  const GetStated({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
       decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0xFF3C2DB9), // #3C2DB9 in hex
                Color(0xFF211772), // #211772 in hex
              ],
              stops: [0.0109, 1.0129], // Corresponding stops for the colors
            ),
          ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    SizedBox(height: 20,),
    Center(
      child: Container(
        height: MediaQuery.of(context).size.height*0.3,
        width: MediaQuery.of(context).size.width*0.8,
         decoration: const BoxDecoration(
              gradient: RadialGradient(
                // center: Alignment(0.5, 0.5),
                radius: 0.5,
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(255, 255, 255, 0.0001),
                ],
                stops: [0.0, 1.0],
              ),
            ),
          child: Image.asset('assets/images/cloud.png'),
      ),
    ),
    Text("Weather",style: TextStyle(fontSize: 44,color: Color.fromRGBO(255, 186, 37, 1.0)),),
    Text("Forecast App.",style: TextStyle(fontSize: 42,color: Colors.white),),
    Text('t\'s the newest weather app. It has a bunch of features and that includes most of the ones that every weather app has.',style: TextStyle(fontSize: 12,color: Colors.white),maxLines: null,),
  ]),

    );
  }
}