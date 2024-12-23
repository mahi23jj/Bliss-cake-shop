import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class cart extends StatefulWidget {
  cart({
    super.key,
  });

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  Color c = Color.fromRGBO(56, 34, 8, 1);
  Color x = Color.fromRGBO(116, 81, 45, 1);
  Color w = Colors.white;

  @override
  void initState() {
    super.initState();
  }

  // Stream<List<CartItem>> getCartItems(String userId) {
  //   return FirebaseFirestore.instance
  //       .collection('use')
  //       .doc(userId)
  //       .collection('cart')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) => CartItem.fromMap(doc.data())).toList();
  //   });
  // }

  //List<bool> _expandedItems = [false];



  Future<void> _removeItemFromCart(String userId, String itemId) async {
    final cartRef = FirebaseFirestore.instance

        .collection('use')
        .doc(userId)
        .collection('cart')
        .doc(itemId);
    await cartRef.delete();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c,
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: TextStyle(fontSize: 24, color: w),
        ),
        centerTitle: true,
        backgroundColor: c,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('use')
                          .doc('1')
                          .collection('cart').
                          snapshots(),
                      builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }
                        if (!snapshot.hasData ) {
                          return Center(child: Text('No items in cart'));
                        }
                      List<DocumentSnapshot> docment = snapshot.data!.docs;
                        return ListView.builder(
                            itemCount: docment.length,
                            itemBuilder: (context, index) {
                                // Ensure the index is within bounds
             
                              var d = docment[index];

                              return GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   _expandedItems[index] =
                                  //       !_expandedItems[index];
                                  // });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                // Expanded or collapsed height
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 5,
                                          offset: Offset(0, 2)),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                            gradient:
                                                LinearGradient(colors: [c, c]),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(
                                                    199,
                                                    255,
                                                    255,
                                                    255), // White shadow color
                                                spreadRadius:
                                                    2, // Spread radius
                                                blurRadius: 4, // Blur radius
                                                offset: Offset(0,
                                                    2), // Shadow offset (vertical and horizontal)
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    d['img'],
                                                    height: 80,
                                                    width: 30,
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        d['name'],

                                                        // cof[index].name,
                                                        //  cof[index].name,

                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Qty: 02 | ',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200),
                                                          ),
                                                          Text(
                                                            '\$ ${d['price']}',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200),
                                                          ),
                                                        ],
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          _removeItemFromCart('1', d.id);
                                                        },
                                                        child: Text(
                                                          'Remove',
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w200),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      // if (_expandedItems[index]) ...[
                                      //   SizedBox(height: 10),
                                      //   Text(
                                      //     'it is good',
                                      //     style: TextStyle(
                                      //         fontSize: 12,
                                      //         color: Colors.black54),
                                      //   ),
                                      // ],
                                    ],
                                  ),
                                ),
                              );
                            });
                      })
                  // }
                  //),
                  ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w200),
                      ),
                      Text(
                        '16.00 bir',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w200),
                      ),
                      Text(
                        '1.00 bir',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub Total',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w200),
                      ),
                      Text(
                        '17.00 bir',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  // Text(
                  //   'Total',
                  //   style: TextStyle(
                  //       color: Colors.white, fontWeight: FontWeight.w200),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Order Type',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.height * 0.23,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [w, w],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                          child: Center(
                              child: Text(
                            'Delivery',
                            style: TextStyle(fontSize: 12),
                          )),
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.height * 0.23,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [w, w],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                          child: Center(
                              child: Text(
                            'Pickup',
                            style: TextStyle(fontSize: 12),
                          )),
                        )
                      ]),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(),));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.7,
                    height: 60,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [x, x]),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      'Cheak out ',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
