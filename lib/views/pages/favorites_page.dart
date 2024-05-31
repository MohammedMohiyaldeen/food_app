import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/app_colors.dart';

import 'package:food_delivery/models/product_model.dart';
class favpage extends StatefulWidget {
  const favpage({super.key});

  @override
  State<favpage> createState() => _favpageState();
}

class _favpageState extends State<favpage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: favproduct.length,
      itemBuilder: (_,index){
        final pro=favproduct[index];
        return Padding(padding:const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
        child:DecoratedBox(decoration: BoxDecoration(color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primary)
                    ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           Image.network(pro.imgUrl,width: 70,height: 100,),
        
          
          SizedBox(height: 100,width: 100,child: Center(child: Text(pro.category.name,style: TextStyle(fontSize: 20,color: AppColors.primary,fontWeight: FontWeight.bold),))),
          
           Column(children: [
            Text(pro.name, style:TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
             Text(pro.price.toString(),style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold),),
          
           ],)
          
          ],),
        ),
        ) ,
        );
      });
  }
}