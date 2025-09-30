import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal.shade900),
      ),
      home: const MyHomePage(title: 'ID card'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  Color currentColor = Color(0xFF023020);
  String currentFont = 'Roboto';
  final List<String> fonts = [
  'Roboto',
  'Lato',
  'Oswald',
  'Poppins',
  'Montserrat',
  'Raleway',
  'Open Sans'
  ];
  
  @override
  void initState() {
    super.initState();
      currentColor = Color(0xFF023020);
      currentFont = 'Roboto';
  }
  
  void changeColor() {
  final rand = math.Random();
  setState(() {
    currentColor = Color(0xFF000000 + rand.nextInt(0xFFFFFF));
  });
}

  void changeFont(){
    setState(() {
      final random = math.Random();
        currentFont = fonts[random.nextInt(fonts.length)];
    });
  }

  TextStyle defaultTextStyle(double size, {FontWeight weight = FontWeight.normal, Color color = Colors.black}) {
  return GoogleFonts.getFont(
    currentFont,
    fontSize: size,
    fontWeight: weight,
    color: color
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: Stack(
        children: [
          Container(color: Colors.white),
          Container(height:300, color: currentColor),

          Center(
            child: Column(
              children: [

                Image(image: AssetImage('assets/iut.png'), width: 200, height: 200,),
                Text('ISLAMIC UNIVERSITY OF TECHNOLOGY', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Container(
                          width: 200, height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF023020),
                              width: 8),
                            ),
                            child: ClipRRect(child: Image.asset('assets/Tausif.JPG', fit:BoxFit.cover))
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Icon(Icons.vpn_key, color: Color(0xFF023020), size: 30),
                            SizedBox(width: 8),
                            Text('Student ID', style: 
                            defaultTextStyle(20, weight: FontWeight.normal))
                          ]
                        ),

                            Container(
                              width: 200,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: Color(0xFF023020),
                                border: Border.all(
                                  color: Color(0xFF023020),
                                  width: 2),
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 20, height: 20,
                                      decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle
                              ),                            ),
                                    SizedBox(width: 24),
                                    Text('210041253', style: 
                                    defaultTextStyle(20, weight: FontWeight.normal, color: Colors.white)),
                                ],)
                            ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            CircleAvatar(
                              backgroundColor: Color(0xFF023020), // Your desired background color
                              radius: 14, // Adjust size as needed
                              child: Icon(
                                Icons.person,
                                color: Colors.white, // Icon color
                                size: 22,            // Icon size
                              ),
                            ),
                            SizedBox(width: 8),
                            Text('Student Name', style: 
                            defaultTextStyle(20, weight:FontWeight.normal))
                          ]
                        ),

                        Text('Muhammad Tausif Ul Islam', style: defaultTextStyle(20, weight:FontWeight.bold)),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Icon(Icons.school, color: Color(0xFF023020), size: 30),
                            SizedBox(width: 8),
                            Text('Program B.Sc. in CSE', style: 
                            defaultTextStyle(20, weight:FontWeight.normal))
                          ]
                        ),
                        

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            CircleAvatar(
                              backgroundColor: Color(0xFF023020), 
                              radius: 14, // Adjust size as needed
                              child: Icon(
                                Icons.group,
                                color: Colors.white, // Icon color
                                size: 22,            // Icon size
                              ),
                            ),
                            SizedBox(width: 8),
                            SizedBox(width: 8),
                            Text('Department: CSE', style: 
                            defaultTextStyle(20, weight:FontWeight.normal))
                          ]
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Icon(Icons.location_on, color: Color(0xFF023020), size: 30),
                            SizedBox(width: 8),
                            Text('Bangladesh', style: 
                            defaultTextStyle(20, weight:FontWeight.normal))
                          ]
                        ),
                        ElevatedButton(onPressed: changeColor, child: Text('Change Color')),
                        SizedBox(height: 8),
                        ElevatedButton(onPressed: changeFont, child: Text('Change Font'))
                  ]
                ,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
