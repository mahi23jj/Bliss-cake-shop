
// import 'package:flutter/material.dart';

// void _shows(BuildContext ctx) {
  
//     showModalBottomSheet(
//       elevation: 10,
//       context: ctx,
//       builder: (ctx) => Container(
//         // width: 300,
//         height: 500,
//         color: Colors.white54,
//         alignment: Alignment.center,
//         child: Column(
//           children: [
//               Text(
//                     'Diary',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                 children: ['Fasting', 'Non-fasting'].map((option) {
//                   return Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                         if (_selecteDiary == option) {
//               _selecteDiary = null; // Deselect by setting to null
//             } else {
//               _selecteDiary = option; // Select the tapped option
//             }
                          
//                         });
//                         // Handle diary option selection
//                       },
//                       child: Container(
//                         margin: EdgeInsets.all(4.0),
//                         padding: EdgeInsets.symmetric(vertical: 10.0),
//                         decoration: BoxDecoration(
                          
//                             color: _selecteDiary == option
//                     ? Colors.brown
//                     : Colors.grey[200],
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         alignment: Alignment.center,
//                         child: Text(option,
//                         style: TextStyle(
//                   color: _selecteDiary == option
//                       ? Colors.white
//                       : Colors.black,
//                 ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),

//                Text(
//                     'occation',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                 children: ['Birthday', ' Graduation', 'Wedding',' Others'].map((option) {
//                   return Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           if (_selecteoccation == option) {
//                             _selecteoccation = null;
                            
//                           }else{
//                         _selecteoccation = option;

//                           }
                          
//                         });
//                         // Handle diary option selection
//                       },
//                       child: Container(
//                         margin: EdgeInsets.all(4.0),
//                         padding: EdgeInsets.symmetric(vertical: 10.0),
//                         decoration: BoxDecoration(
                          
//                             color: _selecteoccation == option
//                     ? Colors.brown
//                     : Colors.grey[200],
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         alignment: Alignment.center,
//                         child: Text(option,
//                         style: TextStyle(
//                   color: _selecteoccation == option
//                       ? Colors.white
//                       : Colors.black,
//                 ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//                Text(
//                     'Price range',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                 children: ['1k', '1k-2k', '2k-3k', '>3k'].map((option) {
//                   return Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                         if ( _selectePrice == option) {
//                           _selectePrice = null;
//                         }else{
//                           _selectePrice = option;
//                         }
                       
                          
//                         });
//                         // Handle diary option selection
//                       },
//                       child: Container(
//                         margin: EdgeInsets.all(4.0),
//                         padding: EdgeInsets.symmetric(vertical: 10.0),
//                         decoration: BoxDecoration(
                          
//                             color: _selectePrice == option
//                     ? Colors.brown
//                     : Colors.grey[200],
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         alignment: Alignment.center,
//                         child: Text(option,
//                         style: TextStyle(
//                   color: _selectePrice == option
//                       ? Colors.white
//                       : Colors.black,
//                 ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//                Text(
//                     'customer rating',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                 children: ['5 star', '4 star', '3 star', '2 star','1 star'].map((option) {
//                   return Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                         if(_selecterating == option){
//                           _selecterating = null;
//                         }else{
//                           _selecterating = option;
//                         }
//                         });
//                         // Handle diary option selection
//                       },
//                       child: Container(
//                         margin: EdgeInsets.all(4.0),
//                         padding: EdgeInsets.symmetric(vertical: 10.0),
//                         decoration: BoxDecoration(
                          
//                             color: _selecterating == option
//                     ? Colors.brown
//                     : Colors.grey[200],
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         alignment: Alignment.center,
//                         child: Text(option,
//                         style: TextStyle(
//                   color: _selecterating == option
//                       ? Colors.white
//                       : Colors.black,
//                 ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
             
                       
              
//         ],),
//       ),
//     );
//   }
  
