import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/page/detail.dart';
import 'package:flutter/material.dart';


class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

    TextEditingController controller = TextEditingController();
   Widget searchbar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      decoration: BoxDecoration(
        color:  Colors.grey.withOpacity(0.2), // Set the container color to gray
        borderRadius: BorderRadius.circular(15), // Add rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
             Icons.search, // Use the correct icon name
              color: Colors.white,
              size: 24,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      
      hintText: "Search",
      hintStyle: TextStyle(color: Colors.white),
      border: InputBorder.none,
    ),
    controller: controller,
    onChanged: (value) {
      setState(() {
        
      });
    },
    //focusNode: focusNode,
    


 ),


              ),
            ),
          
          ],
        ),
      ),
    ),
  );
}  
Color c = Color.fromRGBO(56, 34, 8, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: c,
    appBar: AppBar(
      backgroundColor: c,
      leading: IconButton(onPressed: () {
        Navigator.pop(context);
      
    },icon: Icon(Icons.arrow_back),),
    title: searchbar(),
    centerTitle: true,
    ),
    body:   Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('coffee').where('name',isEqualTo: controller.text).snapshots(),
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
                                              '\$${doc['prc']}',
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
                                                  id: doc.id,
                                                  img: doc['img'],
                                                  prc: doc['prc'],
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
    );
}
}