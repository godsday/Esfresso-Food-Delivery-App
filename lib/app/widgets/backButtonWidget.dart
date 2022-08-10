import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonCust extends StatelessWidget {
  const BackButtonCust({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
       
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
              )
            ],
                  
            //image: DecorationImage(image: AssetImage(foodItemController.datas['image']))
          ),
          child: Icon(Icons.arrow_back_ios,size: 18,),
        ),
      );
  }
}
