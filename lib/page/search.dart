import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/page/detail.dart';
import 'package:coffee/page/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

    TextEditingController controller = TextEditingController();
    String? _selectedFlavor;
  String? _selectedDiary;
    String? _selectedPrice;
      String? _selectedrating;
        String? _selecteoccation;
  String? _selecteDiary;
    String? _selectePrice;
      String? _selecterating;
  String? _selectedSize;
  int _selectedcategory = -1;
  bool _apply=false;
    
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




  void _show(BuildContext ctx) {
  
    showModalBottomSheet(
      elevation: 10,
      context: ctx,
      builder: (ctx) => Container(
        // width: 300,
        height: 500,
        color: Colors.white54,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                      'Diary',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                  children: ['Fasting', 'Non-fasting'].map((option) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if ( _selectedDiary == option) {
                                _selectedDiary =null;
                          _selectedcategory=-1;
                            }else{
                                _selectedDiary = option;
                          _selectedcategory=['Fasting', 'Non-fasting'].indexOf(option);
                            }
                            
                          });
                          // Handle diary option selection
                        },
                        child: Container(
                          margin: EdgeInsets.all(4.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            
                              color: _selectedDiary == option
                      ? Colors.brown
                      : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: Alignment.center,
                          child: Text(option,
                          style: TextStyle(
                    color: _selectedDiary == option
                        ? Colors.white
                        : Colors.black,
                  ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
          
                 Text(
                      'Flavor',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                  children: ['Chocolate', 'Vanilla', 'Strawberry', 'Coffee'].map((option) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                          _selectedFlavor = option;
                            
                          });
                          // Handle diary option selection
                        },
                        child: Container(
                          margin: EdgeInsets.all(4.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            
                              color: _selectedFlavor == option
                      ? Colors.brown
                      : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: Alignment.center,
                          child: Text(option,
                          style: TextStyle(
                    color: _selectedFlavor == option
                        ? Colors.white
                        : Colors.black,
                  ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                 Text(
                      'Price range',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                       Row(
                  children: ['1k', '1k-2k', '2k-3k', '>3k'].map((option) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                          _selectedrating = option;
                            
                          });
                          // Handle diary option selection
                        },
                        child: Container(
                          margin: EdgeInsets.all(4.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            
                              color: _selectedrating == option
                      ? Colors.brown
                      : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: Alignment.center,
                          child: Text(option,
                          style: TextStyle(
                    color: _selectedrating == option
                        ? Colors.white
                        : Colors.black,
                  ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                    
                 Text(
                      'customer rating',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                  children: ['5 star', '4 star', '3 star', '2 star','1 star'].map((option) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                        if ( _selectedrating == option) {
                          _selectedrating = null;
                        } else{ _selectedrating = option;}
                            
                          });
                          // Handle diary option selection
                        },
                        child: Container(
                          margin: EdgeInsets.all(4.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            
                              color: _selectedrating == option
                      ? Colors.brown
                      : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: Alignment.center,
                          child: Text(option,
                          style: TextStyle(
                    color: _selectedrating == option
                        ? Colors.white
                        : Colors.black,
                  ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
               

               Row(
                 children: [
                   ElevatedButton(onPressed: (){
                      Navigator.pop(ctx);
                    setState(() {
                      _apply=true;
                    });
                   }, child: Text('Apply')),
                     ElevatedButton(onPressed: (){
                       Navigator.pop(ctx);
                       setState(() {
                      _apply=false;
                        _selectedPrice = '';   // Reset the selected price
      _selectedFlavor = '';  // Reset the selected flavor
      _selectedrating = '';  // Reset the selected rating
      _selectedDiary = '';   // Reset the selected diary
      _selectedcategory = -1;
                      
                       });
                   }, child: Text('cancel')),
                 ],
               )
                         
                
          ],),
        ),
      ),
    );
  }

  void _shows(BuildContext ctx) {
  
    showModalBottomSheet(
      elevation: 10,
      context: ctx,
      builder: (ctx) => Container(
        // width: 300,
        height: 500,
        color: Colors.white54,
        alignment: Alignment.center,
        child: Column(
          children: [
              Text(
                    'Diary',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                children: ['Fasting', 'Non-fasting'].map((option) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                        if (_selecteDiary == option) {
              _selecteDiary = null; // Deselect by setting to null
            } else {
              _selecteDiary = option; // Select the tapped option
            }
                          
                        });
                        // Handle diary option selection
                      },
                      child: Container(
                        margin: EdgeInsets.all(4.0),
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          
                            color: _selecteDiary == option
                    ? Colors.brown
                    : Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(option,
                        style: TextStyle(
                  color: _selecteDiary == option
                      ? Colors.white
                      : Colors.black,
                ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

               Text(
                    'occation',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                children: ['Birthday', ' Graduation', 'Wedding',' Others'].map((option) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selecteoccation == option) {
                            _selecteoccation = null;
                            
                          }else{
                        _selecteoccation = option;

                          }
                          
                        });
                        // Handle diary option selection
                      },
                      child: Container(
                        margin: EdgeInsets.all(4.0),
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          
                            color: _selecteoccation == option
                    ? Colors.brown
                    : Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(option,
                        style: TextStyle(
                  color: _selecteoccation == option
                      ? Colors.white
                      : Colors.black,
                ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
               Text(
                    'Price range',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                children: ['1k', '1k-2k', '2k-3k', '>3k'].map((option) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                        if ( _selectePrice == option) {
                          _selectePrice = null;
                        }else{
                          _selectePrice = option;
                        }
                       
                          
                        });
                        // Handle diary option selection
                      },
                      child: Container(
                        margin: EdgeInsets.all(4.0),
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          
                            color: _selectePrice == option
                    ? Colors.brown
                    : Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(option,
                        style: TextStyle(
                  color: _selectePrice == option
                      ? Colors.white
                      : Colors.black,
                ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
               Text(
                    'customer rating',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                children: ['5 star', '4 star', '3 star', '2 star','1 star'].map((option) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                        if(_selecterating == option){
                          _selecterating = null;
                        }else{
                          _selecterating = option;
                        }
                        });
                        // Handle diary option selection
                      },
                      child: Container(
                        margin: EdgeInsets.all(4.0),
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          
                            color: _selecterating == option
                    ? Colors.brown
                    : Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(option,
                        style: TextStyle(
                  color: _selecterating == option
                      ? Colors.white
                      : Colors.black,
                ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
             
                       
              
        ],),
      ),
    );
  }
  String normalOption = 'Normal';
 String customOption = 'Custom';

void _handleMenuSelection(BuildContext context, String choice) {
  final actions = {
    normalOption: () => _show(context),
    customOption: () => _shows(context),
  };

  if (actions.containsKey(choice)) {
    actions[choice]!();
  } else {
    print('Unknown choice: $choice');
  }
}



 Stream<List<DocumentSnapshot>> getCoffeeData() {
  return FirebaseFirestore.instance.collection('coffee').snapshots().map(
        (snapshot) => snapshot.docs,
      );
}

List<DocumentSnapshot> filterDocuments(
  List<DocumentSnapshot> docs, {     // Search by name
  int? category,      // Filter by category
  String? flavor,     // Filter by flavor
  String? price,      // Filter by price
}) {
  return docs.where((doc) {
    bool matchesCategory = category == null || doc['catagory'] == category;
    bool matchesFlavor = flavor == null || doc['flavor'] == flavor;
    bool matchesPrice = true;

    if (price != null) {
      final docPrice = doc['price'];
      if (price == '1k') {
        matchesPrice = docPrice == 1000;
      } else if (price == '1k-2k') {
        matchesPrice = docPrice >= 1000 && docPrice <= 2000;
      } else if (price == '2k-3k') {
        matchesPrice = docPrice >= 2000 && docPrice <= 3000;
      } else if (price == '>3k') {
        matchesPrice = docPrice > 3000;
      }
    }

    return matchesCategory && matchesFlavor && matchesPrice;
  }).toList();
}


List<DocumentSnapshot> filterByCategory(List<DocumentSnapshot> docs, String category) {
  return docs.where((doc) => doc['name'].toLowerCase().contains(category.toLowerCase())).toList();
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
    actions: [
    
       PopupMenuButton<String>(
            onSelected: (String choice) {
              _handleMenuSelection(context, choice);
            },
            itemBuilder: (BuildContext context) {
              return {'Normal', 'Custom', }
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: Icon(Icons.tune), // Three dots icon
          ),
      ],
    centerTitle: true,
    ),
    body:   Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: StreamBuilder(
                stream: getCoffeeData(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){  
                    return Center(child: CircularProgressIndicator());
                  }
                 if(snapshot.hasData){
         List<DocumentSnapshot> docment=snapshot.data!;
            
                   if (_apply==true) {
                   docment = filterDocuments(
          snapshot.data!,
          // Searching by name (from controller)
          category: _selectedcategory,  // Use your selected category variable
          flavor: _selectedFlavor,      // Use your selected flavor variable
          price: _selectedPrice,        // Use your selected price variable
        );    
                   }else if(_apply==false){
                    if (controller.text.isNotEmpty) {
                    docment=filterByCategory(snapshot.data!, controller.text);
                    }
                   }
                  
                  return ListView.builder(
                      itemCount: docment.length,
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
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) => detail(
                                          //         id: doc.id,
                                          //         img: doc['img'],
                                          //         prc: doc['prc'],
                                          //         name: doc['name'],
                                          //       ),
                                          //     ));
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