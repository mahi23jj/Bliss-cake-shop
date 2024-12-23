import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/methods/class.dart';
import 'package:coffee/page/detail.dart';
import 'package:flutter/material.dart';

class list extends StatefulWidget {
  const list({super.key});

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  //Color c = Color.fromRGBO(175, 143, 111, 1);
  Color c = Color.fromRGBO(56, 34, 8, 1);
  //  Color c = Color.fromARGB(255, 59, 26, 7);
  Color x = Color.fromRGBO(116, 81, 45, 1);
  Color w = Colors.white;

  List<coffee> cf = [
    coffee(img: 'asset/images/1.png', name: 'Espereto', prc: 4.10),
    coffee(img: 'asset/images/4.png', name: 'Cappuccino', prc: 7.30),
    coffee(img: 'asset/images/1.png', name: 'Latte', prc: 10.40),
    coffee(img: 'asset/images/4.png', name: 'Cortado', prc: 8.00)
  ];


  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz_outlined)),
            SizedBox(
              height: 40,
            ),
            Text(
              'How do you like your coffee?',
              style: TextStyle(fontSize: 24, color: w),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('use').doc('1').collection('favorites').snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(!snapshot.hasData){  
                    return Center(child: CircularProgressIndicator());
                  }
                 if(snapshot.hasData){
        
            List<DocumentSnapshot>docment=snapshot.data!.docs;
                  return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                      DocumentSnapshot doc = docment[index]
;                        return Column(
                          children: [
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [c, c]),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                          199, 255, 255, 255), // White shadow color
                                      spreadRadius: 2, // Spread radius
                                      blurRadius: 4, // Blur radius
                                      offset: Offset(0,
                                          2), // Shadow offset (vertical and horizontal)
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                       
                                        Image.asset(
                                         doc['img'],
                                          // cf[index].img,
                                          height: 80,
                                          width: 60,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              doc['name'],
                                              //cf[index].name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '\$${doc['price']}',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w200),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => detail(
                                                  id:doc.id ,
                                                  img: doc['img'],
                                                  prc: doc['price'],
                                                  name: doc['name'],
                                                ),
                                              ));
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      });
                } else {
                  return Text('no data');
                }
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
