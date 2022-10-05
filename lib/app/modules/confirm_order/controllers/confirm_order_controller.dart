
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ConfirmOrderController extends GetxController {
  //TODO: Implement ConfirmOrderController
final _razorpay = Razorpay();
  @override
  void onInit() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
_razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
_razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response){
    print(response);
    // verifySignature(
    //   signature: response.signature,
    //   paymentId:response.paymentId,
    //   orderId:response.orderId.
    // );
  }
  void _handlePaymentError(PaymentFailureResponse response){
    print(response);

    Get.snackbar(response.message??"", "");
  }

  void _handleExternalWallet(ExternalWalletResponse response){
    print(response);

    Get.snackbar(response.walletName??"", "");

  }

//   void createOrder(){
//   final order= {
//     // "id": "order_DBJOWzybf0sJbb",
//     "entity": "order",
//     "amount": 100,
//     "amount_paid": 0,
//     "amount_due": 50000,
//     "currency": "INR",
//     "receipt": "rcptid_11",
//     "status": "created",
//     "attempts": 0,
//     "notes": [],
//     "created_at": 1566986570
// };

//   }
var options = {
  'key': 'rzp_test_9fw79Jg8mf9TG9',
  'amount': 5000, 
  'name': 'Acme Corp.',
  'description': 'Fine T-Shirt',
  'timeout': 60, 
  'prefill': {
    'contact': '9123456789',
    'email': 'gaurav.kumar@example.com'
  }
};

void option(){
  try {
    _razorpay.open(options);
  } catch (e) {
    debugPrint(e.toString());
    
  }
}
}
