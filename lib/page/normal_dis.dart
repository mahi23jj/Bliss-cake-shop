import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/methods/class.dart';
import 'package:coffee/methods/shared.dart';
import 'package:coffee/page/cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';

class disc extends StatefulWidget {
  String id;
  String img;
  String name;
  double prc;
  disc(
      {super.key,
      required this.id,
      required this.img,
      required this.prc,
      required this.name});

  @override
  State<disc> createState() => _discState(id, img, prc, name);
}

class _discState extends State<disc> {
  String id;
  String img;
  String name;
  double prc;
  _discState(this.id, this.img, this.prc, this.name);
  //car elem=car();

// void addToCart(String userId, String name, double quantity) {
//   FirebaseFirestore.instance.collection('user').collection('carts').doc(userId).set({
//     'items': FieldValue.arrayUnion([{
//       'productId': name,
//       'quantity': quantity,
//     }])
//   }, SetOptions(merge: true));
// }
  double vals = 1;
  Future<void> addToCart(
      String itemId, String name, double price, String img) async {
    //final User? user = FirebaseAuth.instance.currentUser;

    final cartRef = FirebaseFirestore.instance
        .collection('use')
        .doc('1')
        .collection('cart')
        .doc(itemId);

    await cartRef.set({
      'name': name,
      'price': price,
      'img': img,
    });
  }

  List<bool> ck = [false, false, false];
  var size_val = 0;
// Default is centimeters
  int x = 2;

  void v(x) {
    for (var i = 0; i < 3; i++) {
      if (i == x) {
        size_val = i * 5;
        ck[i] = true;
      } else {
        ck[i] = false;
      }
      //ck[i] = (x == i);
      // Set to true if x equals i, else false
    }

    setState(() {}); // Trigger a rebuild of the UI
  }


  void updatescroll(double newValue) {
    setState(() {
      // Check if the new value is greater than the current value
      if (newValue > vals) {
        vals = (vals + 1)
            .clamp(1, 100); // Increment by 1, ensuring it doesn't exceed max
      } else if (newValue < vals) {
        vals = (vals - 1)
            .clamp(1, 100); // Decrement by 1, ensuring it doesn't go below min
      }
    });
  }

  int val = 0;
  void inc() {
    setState(() {
      val = val + 1;
    });
  }

  void dec() {
    setState(() {
      if (val != 0) {
        val -= 1;
      }
    });
  }

  Color c = Color.fromRGBO(56, 34, 8, 1);
  Color l = Color.fromRGBO(116, 81, 45, 1);
  Color w = Colors.white;
//  void del(int j){
//   carts.delete(j);
//   lode();
//  }
  String selectedFlavor = 'Chocolate';
  final List<String> flavors = ['Chocolate', 'Vanilla', 'Red Velvet'];
   int _rating = 0; // Initial rating value
     final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = []; // List to store comments

  void _addComment() {
    if (_commentController.text.trim().isNotEmpty) {
      setState(() {
        _comments.add(_commentController.text.trim());
      });
      _commentController.clear(); // Clear the text field after adding a comment
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     IconButton(onPressed:(){
            //       Navigator.pop(context);
            //     }, icon: Icon(Icons.arrow_back_ios)),
            //   ],
            // ),
            Container(
              height: 360,
              // foregroundDecoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/c.jpg"), fit: BoxFit.cover)),

              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.cover)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: w,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: w,
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.6182,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  Center(
                      child: Text(
                    ' is is a cold one with checolate and mid rosted coffee',
                    style: TextStyle(fontSize: 12),
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            dec();
                          },
                          icon: Icon(
                            Icons.minimize,
                            color: const Color.fromARGB(255, 122, 59, 59),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${val}',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {
                            inc();
                          },
                          icon: Icon(Icons.add,
                              color: const Color.fromARGB(255, 122, 59, 59))),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Flavor',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButton<String>(
                    value: selectedFlavor,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedFlavor = newValue!;
                      });
                    },
                    items:
                        flavors.map<DropdownMenuItem<String>>((String flavor) {
                      return DropdownMenuItem<String>(
                        value: flavor,
                        child: Text(flavor),
                      );
                    }).toList(),
                  ),
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Rate',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () {
            setState(() {
              _rating = index + 1; // Update the rating based on the star clicked
            });
          },
          icon: Icon(
            Icons.star,
            color: index < _rating ? Colors.yellow : Colors.grey, // Yellow for selected stars
            size: 40.0,
          ),
        );
      }),
    ),
                  ),
          Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          ElevatedButton(
            onPressed: _addComment,
            child: const Text('Post'),
          ),
        ],
      ),
    ),
const Divider(),
    
       
        
        
         SizedBox(
          height: 150,
           child: SingleChildScrollView(
            
            child: _comments.isEmpty
                ? const Center(
                    child: Text(
                      'No comments yet. Be the first to comment!',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    // Allow ListView to size itself
                    // physics: const NeverScrollableScrollPhysics(), // Disable internal scrolling
                    itemCount: _comments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            _comments[index][0].toUpperCase(),
                          ), // First letter as an avatar
                        ),
                        title: Text(_comments[index]),
                        subtitle: const Text('Just now'), // Placeholder timestamp
                      );
                    },
                  ),
                   ),
         ),
      
    
    
   
  ],
),

                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 75,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [c, Colors.transparent],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: l, width: 2)),
                          alignment: Alignment.center,
                          child: Text(
                            '${prc * val + size_val}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            addToCart(id, name, prc, img);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('${widget.name} added to cart')));
                          },
                          child: Container(
                            width: 300,
                            height: 75,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [l, l]),
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}

