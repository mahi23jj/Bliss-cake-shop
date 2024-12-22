// import 'package:flutter/material.dart';
// // import 'package:chapasdk/chapasdk.dart';
//  import 'package:stripe_payment/stripe_payment.dart';

// class PaymentScreen extends StatefulWidget {
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   // Replace with your actual public key from Chapa
//   // final String chapaPublicKey = 'CHAPUBK_TEST-xCZA8lT6qIDmBw9b8qjyfdxF9UpBeaB2';

//     Future<void> processPayment() async {
//      // Create a card
//      var card = CreditCard(
//        number: '4242424242424242',
//        expMonth: 12,
//        expYear: 23,
//        cvc: '123',
//      );

//      // Create a payment method
//      try {
//        final paymentMethod = await StripePayment.createPaymentMethod(
//          PaymentMethodRequest(card: card),
//        );

//        // Here you can send paymentMethod.id to your server for processing
//        print("Payment Method ID: ${paymentMethod.id}");
//      } catch (error) {
//        print("Error creating payment method: $error");
//      }
//    }
   

   


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Chapa Payment')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: processPayment,
//           child: Text('Pay with Chapa'),
//         ),
//       ),
//     );
//   }
// }
