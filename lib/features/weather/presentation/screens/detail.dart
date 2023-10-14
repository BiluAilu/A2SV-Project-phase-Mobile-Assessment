import 'package:flutter/material.dart';
import 'package:weather/core/utils/colors.dart';
import 'package:weather/core/utils/platform.dart';


class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return     Scaffold(
        backgroundColor: main_background,
        appBar: AppBar(
          backgroundColor: main_background,
          centerTitle: true,
          title:  Text('New Mexico',style: TextStyle(color: texts_color),),
           elevation: 0,
              leading:IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed:() =>Navigator.pop(context),) ,
    
        ),
        body: Container(
          padding: EdgeInsets.only(),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: screen_size(context).height*0.3,
                  child: Image.asset('assets/images/cloud_and_sun.jpg')),
              ),
               Container(
                padding: EdgeInsets.only(left:20,right: 20,top: 20),
                child: Text("Rainy",style: TextStyle(fontSize: 35,color: texts_color2),)),
               Container(
                padding: EdgeInsets.only(left:20,right: 20,top: 20),
                 child: Text('20°',style: TextStyle(fontSize: 30,color: texts_color,fontWeight: FontWeight.bold
                 ),),
               ),

               Expanded(child: Container(
                  decoration: BoxDecoration(
    borderRadius: decoration1,
    color:texts_color,
  ),
               ))

            ],
          ),
        ),
      );
  
  }
}