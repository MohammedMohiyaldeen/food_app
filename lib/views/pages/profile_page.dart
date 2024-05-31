import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';

class profpage extends StatelessWidget {
  const profpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Icon(CupertinoIcons.profile_circled,size: 200,color: AppColors.primary,))
          ,SizedBox(height: 10,),
          Center(child: Text("Mohammed Mohyialdin",style: TextStyle(fontSize: 30),)),
          SizedBox(height: 20,),
          Row(children: [Icon(Icons.phone,color: AppColors.grey,weight: 1000,),SizedBox(width: 15,),Text("Phone ",style: TextStyle(color: AppColors.grey,fontWeight: FontWeight.bold),)],),
          SizedBox(height: 10,),
          DecoratedBox(decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: Colors.white),
          child: SizedBox(height: 40,width: MediaQuery.of(context).size.width,child: Center(child: Text("0532359443",style: TextStyle(color: AppColors.black,fontWeight: FontWeight.bold),)))),
         SizedBox(height: 20,),
          Row(children: [Icon(Icons.comment,color: AppColors.grey,weight: 1000,),SizedBox(width: 15,),Text("Bio ",style: TextStyle(color: AppColors.grey,fontWeight: FontWeight.bold),)],),
          SizedBox(height: 10,),
          DecoratedBox(decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: Colors.white),
          child: SizedBox(height: 40,width: MediaQuery.of(context).size.width,child: Center(child: Text("Student ",style: TextStyle(color: AppColors.black,fontWeight: FontWeight.bold),)))),
         
        ],
      ),
    );
  }
}