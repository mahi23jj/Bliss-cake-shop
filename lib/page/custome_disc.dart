import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee/page/chat.dart';
import 'package:coffee/page/search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CakeOrderingPage extends StatefulWidget {
  @override
  _CakeOrderingPageState createState() => _CakeOrderingPageState();
}

class _CakeOrderingPageState extends State<CakeOrderingPage> {
  String? _selectedFlavor;
  String? _selectedDiary;
  String? _selectedSize;
  DateTime? _selectedDate;
  XFile? _customImage;
  final TextEditingController _customTextController = TextEditingController();
  final TextEditingController _additionalInfoController =
      TextEditingController();
  final TextEditingController _customSizeController = TextEditingController();

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _customImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize Your Cake'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Container(
              height: 360,
              // foregroundDecoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/c.jpg"), fit: BoxFit.cover)),

              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage('asset/images/irish.jpg'), fit: BoxFit.cover)),
              // child: Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     IconButton(
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //         icon: Icon(
              //           Icons.arrow_back_ios,
              //           color: w,
              //         )),
              //     IconButton(
              //         onPressed: () {},
              //         icon: Icon(
              //           Icons.favorite_border,
              //           color: w,
              //         ))
              //   ],
              // ),
            ),

              // AspectRatio(
              //   aspectRatio: 3 / 1,
              //   child: Image.asset('asset/images/irish.jpg', fit: BoxFit.cover),
              // ),
              SizedBox(height: 16),
              Column(
                children: [
                  Center(
                    child: Text(
                      'Delicious and customizable cakes for every occasion.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Center(
                    child: Text(
                        'Occasion - birthday',
                        style: TextStyle(fontSize: 16),
                      ),
                  ),
                ],
              ),

              SizedBox(height: 16),
               Text('Customize Your Cake',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Divider(),
              Text('Flavor',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: ['Chocolate', 'Vanilla', 'Strawberry', 'Coffee']
                    .map((option) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                         _selectedFlavor = option;
                        });
                    
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
                  color:_selectedFlavor == option
                      ? Colors.white
                      : Colors.black,
                ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Text('Diary',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: ['Fasting', 'Non-fasting'].map((option) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                        _selectedDiary = option;
                          
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
              SizedBox(height: 16),
              Text('Size',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                isExpanded: true,
                value: _selectedSize,
                hint: Text('Select Size'),
                items: ['1kg', '2kg', '3kg', '5kg', 'Custom']
                    .map((size) => DropdownMenuItem(
                          value: size,
                          child: Text(size),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSize = value;
                  });
                },
              ),
              if (_selectedSize == 'Custom')
                TextField(
                  controller: _customSizeController,
                  decoration:
                      InputDecoration(labelText: 'Enter custom size (kg)'),
                  keyboardType: TextInputType.number,
                ),
              SizedBox(height: 16),
              Text('Date for Delivery',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_selectedDate == null
                      ? 'No date selected'
                      : _selectedDate.toString().split(' ')[0]),
                  SizedBox(width: 16),
                  ElevatedButton(
                      onPressed: _pickDate, child: Text('Pick Date')),
                ],
              ),
              SizedBox(height: 16),
              Text('Customize Image Design',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: _pickImage, child: Text('Pick Image')),
                  SizedBox(width: 16),
                  if (_customImage != null) Text('Image Selected')
                ],
              ),
              SizedBox(height: 16),
              Text('Customize Text',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                controller: _customTextController,
                maxLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter custom text here'),
              ),
              SizedBox(height: 16),
              Text('Additional Info',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                controller: _additionalInfoController,
                maxLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Additional information'),
              ),
              SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add to cart logic goes here.
                  },
                  child: Text('Add to Cart'),
                ),
              ),
                TextButton(
                          onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Search(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                
                      var tween = Tween(begin: begin, end: end).chain(
                        CurveTween(curve: curve),
                      );
                
                      var offsetAnimation = animation.drive(tween);
                
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
                          },
                          child: Text(
                'contact saler',
                style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                        ),
                
                        
              ],
            ),
             
            ],
          ),
        ),
      ),
    );
  }
}

// adveritizing
  //  CarouselSlider(
  //             items: [
  //               GestureDetector(
  //                 onTap: () {
  //                   Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(receiverId:"User1" ,senderId:"User2",)));
  //                 },
  //                 child: Container(
  //                   margin: EdgeInsets.all(5.0),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                   ),
  //                   child: Text('Contact Seller', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //                 ),
  //               ),
  //             ],
  //             options: CarouselOptions(
  //               height: 200.0,
  //               autoPlay: true,
  //               enlargeCenterPage: true,
  //               aspectRatio: 16 / 9,
  //               autoPlayCurve: Curves.fastOutSlowIn,
  //               enableInfiniteScroll: true,
  //               autoPlayAnimationDuration: Duration(seconds: 1),
  //               viewportFraction: 0.8,
  //             ),
  //           ),