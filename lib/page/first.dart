import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/methods/class.dart';
import 'package:coffee/methods/shared.dart';
import 'package:coffee/navigation.dart';
import 'package:coffee/page/cart.dart';
import 'package:coffee/page/detail.dart';
import 'package:coffee/page/list.dart';
import 'package:coffee/page/normal_dis.dart';
import 'package:coffee/page/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _HomeState();
}

class _HomeState extends State<first> {
  Color c = Color.fromRGBO(56, 34, 8, 1);
  Color w = Colors.white;

  Widget plate(String img, String name, double prc) {
    return Container(
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.brown.shade700),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: w,
                    ))
              ],
            ),
            Center(
              child: SizedBox(
                height: 80,
                child: Stack(
                  children: [
                    Image.asset(img),
                  ],
                ),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                  color: w, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${prc}',
                  style: TextStyle(color: w, fontSize: 20),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.circle_notifications,
                      color: w,
                    ))
              ],
            )
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: c,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appbar(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Container(
        height:50 ,
        width: 150,
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(color:Colors.brown.shade700, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: TextButton(onPressed: () {
            
          }, child: Text('Normal cake ', style: TextStyle(color: w, fontSize: 10, fontWeight: FontWeight.bold),))
        ),

      ),

        Container(
        height:50 ,
        width: 150,
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(color: Colors.brown.shade700, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: TextButton(onPressed: () {
  
          }, child: Text('Custome cake ', style: TextStyle(color: w, fontSize: 10, fontWeight: FontWeight.bold),))
        ),
      ),
                ],
              ),
                SizedBox(
                height: 20,
              ),

             Container(
                  height: MediaQuery.of(context).size.height * 2,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('coffee')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasData) {
                          List<DocumentSnapshot> docment = snapshot.data!.docs;
                          return  GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemBuilder: (context, index) {
                                var doc = docment[index];
                                return GestureDetector(
                                  onTap: () {
                                       Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => disc(
                          id:doc.id,
                          img: doc['img'],
                          prc: doc['prc'],
                          name:  doc['name'],
                        ),
                      ));
                                  },
                                  child: plate(
                                    doc['img'],
                                    doc['name'],
                                    doc['prc'],
                                  ),
                                );
                              },
                              itemCount: docment.length,
                              physics: NeverScrollableScrollPhysics(),
                            );
                        
                        } else {
                          return Text('no data');
                        }
                      }),
                ),
              
            ],
          ),
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
        height:50 ,
        width: 50,
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(color:Colors.brown.shade700, borderRadius: BorderRadius.circular(10)),
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

