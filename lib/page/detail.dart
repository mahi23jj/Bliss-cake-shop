// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';


// // ignore: must_be_immutable
// class detail extends StatefulWidget {
//   String id;
//   String img;
//   String name;
//   double prc;
//   detail({super.key,required this.id, required this.img, required this.prc, required this.name});

//   @override
//   State<detail> createState() => _detailState(id,img, prc, name);
// }

// class _detailState extends State<detail> {
//    String id;
//   String img;
//   String name;
//   double prc;
//   _detailState(this.id,this.img, this.prc, this.name);
//   //car elem=car();

// // void addToCart(String userId, String name, double quantity) {
// //   FirebaseFirestore.instance.collection('user').collection('carts').doc(userId).set({
// //     'items': FieldValue.arrayUnion([{
// //       'productId': name,
// //       'quantity': quantity,
// //     }])
// //   }, SetOptions(merge: true));
// // }
//   double vals = 1;
//   Future<void> addToCart(String itemId, String name, double price,String img) async {
//     //final User? user = FirebaseAuth.instance.currentUser;

//     final cartRef = FirebaseFirestore.instance
//         .collection('use')
//         .doc('1')
//         .collection('cart')
//         .doc(itemId);

//     await cartRef.set({
//       'name': name,
//       'price': price,
//       'img': img,
//     });
//   }

//   List<bool> ck = [false, false, false];
//   var size_val = 0;
// // Default is centimeters
//   int x = 2;

//   void v(x) {
//     for (var i = 0; i < 3; i++) {
//       if (i == x) {
//         size_val = i*5;
//         ck[i] = true;
//       }else{
//         ck[i] = false;
//       }
//       //ck[i] = (x == i); 
//       // Set to true if x equals i, else false
//     }

//     setState(() {}); // Trigger a rebuild of the UI
//   }

// // void setState(VoidCallback fn) { fn(); } void main() { test('v function should update size_val and ck correctly', () { 
// //   // Test case 1: x = 1
// //    v(1); expect(size_val, 5); expect(ck, [false, true, false]); // Test case 2: x = 2 
// //    v(2); expect(size_val, 10); expect(ck, [false, false, true]); // Test case 3: x = 0 
// //    v(0); expect(size_val, 0); expect(ck, [true, false, false]); });
// //     }












// void updatescroll(double newValue) {
//   setState(() {
//     // Check if the new value is greater than the current value
//     if (newValue > vals) {
//       vals = (vals + 1).clamp(1, 100); // Increment by 1, ensuring it doesn't exceed max
//     } else if (newValue < vals) {
//       vals = (vals - 1).clamp(1, 100); // Decrement by 1, ensuring it doesn't go below min
//     }
//   });
// }
//   int val = 0;
//   void inc() {
//     setState(() {
//       val = val + 1;
//     });
//   }

//   void dec() {
//     setState(() {
//       if (val != 0) {
//         val -= 1;
//       }
//     });
//   }

//   Color c = Color.fromRGBO(56, 34, 8, 1);
//   Color l = Color.fromRGBO(116, 81, 45, 1);
//   Color w = Colors.white;
// //  void del(int j){
// //   carts.delete(j);
// //   lode();
// //  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
//         child: Column(
//           children: [
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.start,
//             //   children: [
//             //     IconButton(onPressed:(){
//             //       Navigator.pop(context);
//             //     }, icon: Icon(Icons.arrow_back_ios)),
//             //   ],
//             // ),
//             Container(
//               height: 360,
//               // foregroundDecoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/c.jpg"), fit: BoxFit.cover)),

//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   image: DecorationImage(
//                       image: AssetImage(img), fit: BoxFit.cover)),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: Icon(
//                         Icons.arrow_back_ios,
//                         color: w,
//                       )),
//                   IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.favorite_border,
//                         color: w,
//                       ))
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(20),
//               height: MediaQuery.of(context).size.height * 0.6182,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30))),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Text(
//                       name,
//                       style: TextStyle(
//                           fontSize: 25,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w200),
//                     ),
//                   ),
//                   Center(
//                       child: Text(
//                     ' is is a cold one with checolate and mid rosted coffee',
//                     style: TextStyle(fontSize: 12),
//                   )),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             dec();
//                           },
//                           icon: Icon(
//                             Icons.minimize,
//                             color: const Color.fromARGB(255, 122, 59, 59),
//                           )),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         '${val}',
//                         style: TextStyle(
//                             fontSize: 30,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       IconButton(
//                           onPressed: () {
//                             inc();
//                           },
//                           icon: Icon(Icons.add,
//                               color: const Color.fromARGB(255, 122, 59, 59))),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     'Coffee Size',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             v(0);
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 100,
//                             decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                     colors: ck[0]
//                                         ? [c, c]
//                                         : [Colors.grey, Colors.grey],
//                                     begin: Alignment.topCenter,
//                                     end: Alignment.bottomCenter),
//                                 borderRadius: BorderRadius.circular(15),
//                                 color: Colors.grey),
//                             child: Center(
//                                 child: Text(
//                               'Small',
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: ck[0]
//                                       ? Colors.white
//                                       : Colors.brown.shade900),
//                             )),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             v(1);
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 100,
//                             decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                     colors: ck[1]
//                                         ? [c, c]
//                                         : [Colors.grey, Colors.grey],
//                                     begin: Alignment.topCenter,
//                                     end: Alignment.bottomCenter),
//                                 borderRadius: BorderRadius.circular(15),
//                                 color: Colors.grey),
//                             child: Center(
//                                 child: Text(
//                               'Medium',
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: ck[1]
//                                       ? Colors.white
//                                       : Colors.brown.shade900),
//                             )),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             v(2);
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 100,
//                             decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                     colors: ck[2]
//                                         ? [c, c]
//                                         : [Colors.grey, Colors.grey],
//                                     begin: Alignment.topCenter,
//                                     end: Alignment.bottomCenter),
//                                 borderRadius: BorderRadius.circular(15),
//                                 color: Colors.grey),
//                             child: Center(
//                                 child: Text(
//                               'Large',
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: ck[2]
//                                       ? Colors.white
//                                       : Colors.brown.shade900),
//                             )),
//                           ),
//                         )
//                       ]),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   // Text(
//                   //   'Temprature',
//                   //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   // ),
//                   // SizedBox(
//                   //   height: 15,
//                   // ),
//                   // Row(
//                   //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   //     children: [
//                   //       Container(
//                   //         height: 40,
//                   //         width: 100,
//                   //         decoration: BoxDecoration(
//                   //             gradient: LinearGradient(
//                   //                 colors: [c, Colors.transparent],
//                   //                 begin: Alignment.topCenter,
//                   //                 end: Alignment.bottomCenter),
//                   //             borderRadius: BorderRadius.circular(15),
//                   //             color: Colors.grey),
//                   //         child: Center(
//                   //             child: Text(
//                   //           'Hot',
//                   //           style: TextStyle(fontSize: 12),
//                   //         )),
//                   //       ),
//                   //       Container(
//                   //         height: 40,
//                   //         width: 100,
//                   //         decoration: BoxDecoration(
//                   //             gradient: LinearGradient(
//                   //                 colors: [c, Colors.transparent],
//                   //                 begin: Alignment.topCenter,
//                   //                 end: Alignment.bottomCenter),
//                   //             borderRadius: BorderRadius.circular(15),
//                   //             color: Colors.grey),
//                   //         child: Center(
//                   //             child: Text(
//                   //           'Cold',
//                   //           style: TextStyle(fontSize: 12),
//                   //         )),
//                   //       )
//                   //     ]),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     'Suger',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                    Text(
//                     '25% is 1 spoon & 50% is 2 spoon & 75% is 3 spoon & 100% is 4 spoon',
//                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Slider(
//                           divisions: 99,
//                           min: 1,
//                           max: 100,
//                           value: vals,
//                           onChanged: (vals) {
//                             updatescroll(vals);
//                           },
//                         ),
//                         Container(
//                           width: 100,
//                           height: 40,
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   colors: [c, Colors.transparent],
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter),
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(color: l, width: 2)),
//                           alignment: Alignment.center,
//                           child: Text(
//                             '${vals.toInt()} %',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         //  Container(
//                         //   height: 40,
//                         //   width: 100,
//                         //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey),
//                         //   child: Center(child: Text('Cold',style: TextStyle(fontSize: 12),)),
//                         // )
//                       ]),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 50),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: 100,
//                           height: 75,
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   colors: [c, Colors.transparent],
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter),
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(color: l, width: 2)),
//                           alignment: Alignment.center,
//                           child: Text(
//                             '${prc*val+size_val}',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             addToCart(id, name, prc,img);
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                 content: Text('${widget.name} added to cart')));
//                           },
//                           child: Container(
//                             width: 300,
//                             height: 75,
//                             decoration: BoxDecoration(
//                                 gradient: LinearGradient(colors: [l, l]),
//                                 borderRadius: BorderRadius.circular(10)),
//                             alignment: Alignment.center,
//                             child: Text(
//                               'Add to cart',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
// //         Row(
// //   children: [
// //     Container(
// //                           width: 100,
// //                           height: 75,
// //                           decoration: BoxDecoration(
// //                               gradient: LinearGradient(colors: [c,Colors.transparent],begin: Alignment.topCenter,end: Alignment.bottomCenter),
// //                               borderRadius: BorderRadius.circular(10),
// //                               border: Border.all(color: x,width: 2)

// //                               ),
// //                           alignment: Alignment.center,
// //                           child: Text(
// //                             '${prc*val}',
// //                             style: TextStyle(
// //                                 color: Colors.white, fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //         SizedBox(width: 15,),
// //     GestureDetector(
// //                         onTap: () {
// //                        addToCart('1', name, prc);
// //                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${widget.name} added to cart')));

// //                         },
// //                         child: Container(
// //                           width: 300,
// //                           height: 75,
// //                           decoration: BoxDecoration(
// //                               gradient: LinearGradient(colors: [x, x]),
// //                               borderRadius: BorderRadius.circular(10)),
// //                           alignment: Alignment.center,
// //                           child: Text(
// //                             'Add to cart',
// //                             style: TextStyle(
// //                                 color: Colors.white, fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //                         ),
// //   ],
// // )
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Widget inc(){
// //  return  Padding(
// //               padding: const EdgeInsets.only(bottom: 250,top: 50),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                    Image.asset(img,height: 300,width: 300,),
// //                     Text(
// //                  name,
// //                   style: TextStyle(fontSize: 45, color: w,fontWeight: FontWeight.w200),
// //                 ),
// //                 SizedBox(height: 5,),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                   IconButton(onPressed: (){
// //                     dec();
// //                   }, icon: Icon(Icons.minimize,color: const Color.fromARGB(255, 122, 59, 59),)),
// //                   SizedBox(width:5 ,),
// //                    Text(
// //                   '${val}',
// //                   style: TextStyle(fontSize: 45, color: w,fontWeight: FontWeight.bold),
// //                 ),
// //                 SizedBox(width:5 ,),
// //                 IconButton(onPressed: (){
// //                   inc();
// //                 }, icon: Icon(Icons.add,color: Colors.white,)),
// //                 ],),
// //               ],),
// //             );
// // }

// // Widget addto(){
// //  return Row(
// //   children: [
// //     Container(
// //                           width: 100,
// //                           height: 75,
// //                           decoration: BoxDecoration(
// //                               gradient: LinearGradient(colors: [c,Colors.transparent],begin: Alignment.topCenter,end: Alignment.bottomCenter),
// //                               borderRadius: BorderRadius.circular(10),
// //                               border: Border.all(color: x,width: 2)
                              
// //                               ),
// //                           alignment: Alignment.center,
// //                           child: Text(
// //                             '${prc*val}',
// //                             style: TextStyle(
// //                                 color: Colors.white, fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //         SizedBox(width: 15,),
// //     GestureDetector(
// //                         onTap: () {
// //                        addToCart('1', name, prc);
// //                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${widget.name} added to cart')));
                        
// //                         },
// //                         child: Container(
// //                           width: 300,
// //                           height: 75,
// //                           decoration: BoxDecoration(
// //                               gradient: LinearGradient(colors: [x, x]),
// //                               borderRadius: BorderRadius.circular(10)),
// //                           alignment: Alignment.center,
// //                           child: Text(
// //                             'Add to cart',
// //                             style: TextStyle(
// //                                 color: Colors.white, fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //                         ),
// //   ],
// // );
// // }
