import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/page/favotite_button.dart';
import 'package:coffee/page/normal_dis.dart';
import 'package:coffee/page/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _listState();
}

class _listState extends State<first> {
  Color c = Color.fromRGBO(56, 34, 8, 1);
  Color w = Colors.white;

  Stream<List<DocumentSnapshot>> getCoffeeData() {
    return FirebaseFirestore.instance.collection('coffee').snapshots().map(
          (snapshot) => snapshot.docs,
        );
  }

  List<DocumentSnapshot> filterByCategory(
      List<DocumentSnapshot> docs, int category) {
    return docs.where((doc) => doc['catagory'] == category).toList();
  }

  Future<void> addToFav(
      String itemId, String name, double price, String img) async {
    try {
      final favRef = FirebaseFirestore.instance
          .collection('users') // Changed 'use' to 'users' for clarity
          .doc('1') // Replace with dynamic user ID if applicable
          .collection('fav')
          .doc(itemId);

      await favRef.set({
        'name': name,
        'price': price,
        'img': img,
      });
    } catch (error) {
      // Handle error (e.g., log or display a message)
      print("Error adding to favorites: $error");
    }
  }

  Future<void> removeFromFav(String itemId) async {
    try {
      final favRef = FirebaseFirestore.instance
          .collection('users') // Changed 'use' to 'users' for clarity
          .doc('1') // Replace with dynamic user ID if applicable
          .collection('fav')
          .doc(itemId);

      await favRef.delete();
    } catch (error) {
      // Handle error (e.g., log or display a message)
      print("Error removing from favorites: $error");
    }
  }

  Widget cards(String id, String img, String name, double prc) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                    top: 8,
                    right: 8,
                    child: FavoriteButton(
                        itemId: id, name: name, price: prc, img: img)),
              ],
            )),
            SizedBox(height: 4),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${prc.toStringAsFixed(1)}',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          // Add to cart logic
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(content: Text('${product["name"]} added to cart')),
                          // );
                        },
                      ),
                      // IconButton(
                      //   icon: Icon(Icons.favorite_border),
                      //   onPressed: () {
                      //     // Add to favorites logic
                      //     // ScaffoldMessenger.of(context).showSnackBar(
                      //     //   SnackBar(content: Text('${product["name"]} added to favorites')),
                      //     // );
                      //   },
                      // ),
                    ],
                  )
                ],
              ),
            ),
            // SizedBox(height: 4),

            // Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      backgroundColor: c,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbar(),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    provider.updateCategory(0);
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: provider.category == 0
                            ? const Color.fromARGB(255, 194, 137, 119)
                            : Colors.brown.shade700,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Fasting',
                      style: TextStyle(
                          color: w, fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    provider.updateCategory(1);
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: provider.category == 1
                            ? const Color.fromARGB(255, 194, 137, 119)
                            : Colors.brown.shade700,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Non-Fasting',
                      style: TextStyle(
                          color: w, fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    provider.updateCategory(2);
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: provider.category == 2
                            ? const Color.fromARGB(255, 194, 137, 119)
                            : Colors.brown.shade700,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Custome',
                      style: TextStyle(
                          color: w, fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: StreamBuilder<List<DocumentSnapshot>>(
                  stream: getCoffeeData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> docment =
                          filterByCategory(snapshot.data!, provider.category);
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: docment.length,
                              itemBuilder: (context, index) {
                                var doc = docment[index];
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => disc(

                                                id: doc.id,
                                                img: doc['img'],
                                                prc: doc['prc'],
                                                name: doc['name'],
                                                falvor: doc['flavor'] ,
                                                ),
                                          ));
                                    },
                                    child: cards(doc.id, doc['img'],
                                        doc['name'], doc['prc']));
                              }));
                    } else {
                      return Text('no data');
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}

Widget appbar() {
  return Row(
    children: [
      // Search
      Expanded(
        child: Container(
          height: 50,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Filter Icon
      Container(
        height: 50,
        width: 50,
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: Colors.brown.shade700,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: IconButton(
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
            onPressed: () {
              // Add your filter action here
            },
          ),
        ),
      ),
    ],
  );
}

Widget catagorys(v, ck, w) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GestureDetector(
        onTap: () {
          v(0);
        },
        child: Container(
          height: 50,
          width: 100,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: ck[0]
                  ? const Color.fromARGB(255, 194, 137, 119)
                  : Colors.brown.shade700,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            'Fasting',
            style:
                TextStyle(color: w, fontSize: 10, fontWeight: FontWeight.bold),
          )),
        ),
      ),
      GestureDetector(
        onTap: () {
          v(1);
        },
        child: Container(
          height: 50,
          width: 100,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: ck[1]
                  ? const Color.fromARGB(255, 194, 137, 119)
                  : Colors.brown.shade700,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            'Non-Fasting',
            style:
                TextStyle(color: w, fontSize: 10, fontWeight: FontWeight.bold),
          )),
        ),
      ),
      GestureDetector(
        onTap: () {
          v(2);
        },
        child: Container(
          height: 50,
          width: 100,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: ck[2]
                  ? const Color.fromARGB(255, 194, 137, 119)
                  : Colors.brown.shade700,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            'Custome',
            style:
                TextStyle(color: w, fontSize: 10, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    ],
  );
  //   SizedBox(
  //   height: 20,
  // );
}



//  Widget plate(String img, String name, double prc) {
//     return Container(
//         width: 200,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.brown.shade700),
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.favorite_border,
//                       color: w,
//                     ))
//               ],
//             ),
//             Center(
//               child: SizedBox(
//                 height: 80,
//                 child: Stack(
//                   children: [
//                     Image.asset(img),
//                   ],
//                 ),
//               ),
//             ),
//             Text(
//               name,
//               style: TextStyle(
//                   color: w, fontSize: 15, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '${prc}',
//                   style: TextStyle(color: w, fontSize: 20),
//                 ),
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.circle_notifications,
//                       color: w,
//                     ))
//               ],
//             )
//           ]),
//         ));
//   }