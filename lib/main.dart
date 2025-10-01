import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
  bool generated = false;

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController programController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController countryController = TextEditingController();


  String studentID = '';
  String studentName = '';
  String program = '';
  String department = '';
  String country = '';

  XFile? selectedImage;
  final ImagePicker _picker = ImagePicker();


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

    idController = TextEditingController();
    nameController = TextEditingController();
    programController = TextEditingController();
    departmentController = TextEditingController();
    countryController = TextEditingController();


    studentID = '';
    studentName = '';
    program = '';
    department = '';
    country = '';
    selectedImage = null;

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

  void generateCard(){
    setState(() {
      generated = true;
      studentID = idController.text;
      studentName = nameController.text;
      program = programController.text;
      department = departmentController.text;
      country = countryController.text;
    });
  }

  Future<void> pickImage() async {
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    setState(() {
      selectedImage = image;
    });
  }
}

  @override
void dispose() {
  idController.dispose();
  nameController.dispose();
  programController.dispose();
  departmentController.dispose();
  countryController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: !generated ?
       
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: idController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Student ID'
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 8),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Student Name'
            ),
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: 8),
          TextField(
            controller: programController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Program'
            ),
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 8),
          TextField(
            controller: departmentController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Department'
            ),
            keyboardType: TextInputType.text,
          ), 
          SizedBox(height: 8),
          TextField(
            controller: countryController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Country'
            ),
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 8),
          ElevatedButton(onPressed: pickImage, child: Text("Pick Image")),
          SizedBox(height: 8),
          ElevatedButton(onPressed: generateCard, child: Text("Generate ID card")),
        ]),
      )


      :
      
      Stack(
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
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF023020),
                          width: 8
                        ),
                      ),
                      child: ClipRRect(
                        child: Image.network(selectedImage!.path, fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.vpn_key, color: Color(0xFF023020), size: 25),
                              SizedBox(width: 8),
                              Text('Student ID', style: defaultTextStyle(20, weight: FontWeight.normal)),
                            ],
                          ),

                          Container(
                            width: 200,
                            alignment: Alignment.center,
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
                                  margin: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(studentID, style: defaultTextStyle(20, weight: FontWeight.normal, color: Colors.white)),
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFF023020),
                                radius: 14,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text('Student Name', style: defaultTextStyle(20, weight: FontWeight.normal)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only( top: 1 ,bottom: 1),
                      child: Text(studentName, style: defaultTextStyle(20, weight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.school, color: Color(0xFF023020), size: 25),
                              SizedBox(width: 8),
                              Text('Program B.Sc. in $program', style: defaultTextStyle(16, weight: FontWeight.normal)),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFF023020),
                                radius: 16,
                                child: Icon(
                                  Icons.group,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text('Department $department', style: defaultTextStyle(20, weight: FontWeight.normal)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Color(0xFF023020), size: 25),
                              SizedBox(width: 8),
                              Text(country, style: defaultTextStyle(20, weight: FontWeight.normal)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(onPressed: changeColor, child: Text('Change Color')),
                    SizedBox(height: 4),
                    ElevatedButton(onPressed: changeFont, child: Text('Change Font')),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
