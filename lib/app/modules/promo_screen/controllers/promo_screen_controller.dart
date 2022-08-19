import 'package:esfresso/app/constants/itemList.dart';
import 'package:get/get.dart';

class PromoScreenController extends GetxController {
  //TODO: Implement PromoScreenController

  String value ="APPLY";
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  int inddex=0;
  bool apply =false; 
  couponApply(index){  
     inddex=index;
    if(apply==false ){
      apply =true;
       
      value="APPLIED";
    }else{
      apply=false;
      value="APPLY";
    }
update();
  }

}
