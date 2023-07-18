import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/category.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? _selectedId;
  int _counter=0;
  late TextEditingController _numberTextController;
  List<Category> _categories= <Category>[
    Category(id: 1, name:'Al_Azhar University'),
    Category(id: 2, name:'Paltel'),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _numberTextController= TextEditingController();
  }
  @override
  void dispose() {
    _numberTextController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
      children: [
        Card(
          margin: EdgeInsets.only(top: 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          shadowColor: Color(0xFFa35c6e),
          child: Container(
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1),
                    colors:
                    <Color>[
                      Color(0xffe9abb1),
                      Color(0xffa35c6e),
                      Color(0xff1a364e),
                    ]
                )
            ) ,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 20,10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text('Your Balance',
                    style: GoogleFonts.crimsonText(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('\$500',
                    style: GoogleFonts.crimsonText(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 50,),
        Text('Enter Balance Amounte',
          style: GoogleFonts.crimsonText(
              color: Color(0xff1a364e),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: (){
              setState(() {
                ++_counter;
              });
            },
            child: Icon(Icons.add, ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff1a364e),
              minimumSize: Size(0, 40),
            ),
            ),
            ),
            Expanded(child:
            Text(
              "\$ ${_counter.toString()}",
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xffa35c6e),
              ),
            )),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    --_counter;
                  });
                  ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1a364e)
                  );
                },
                child: Icon(Icons.minimize, ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1a364e),
                  minimumSize: Size(0, 40),
                ),
              ),
            ),

          ],
        ),
        SizedBox(height: 30,),
        Text(
          'Select Category ',
          style: GoogleFonts.crimsonText(
              color: Color(0xff1a364e),
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
        ),
        SizedBox(height: 5,),
        DropdownButton<String>(
          isExpanded: true,
          hint: Text(' Categories'),
          //  icon: Icon(Icons.fa),
          onChanged: (String? value){
            if(value!=null){
              setState(() {
                _selectedId =value;
                // if(_selectedId= Category(id: 1, name: 'Al_Azhar University').toString()) {
                //}
              });
            }
          },
          value: _selectedId,
          items: _categories.map((Category category) => DropdownMenuItem<String>(
            child:Text(category.name),
            value: category.id.toString(),
          )
          ).toList(),
        ),
        SizedBox(height: 50,),
        ElevatedButton(
          onPressed: (){},
          child:Text(
            'SEND',
            style: GoogleFonts.crimsonText(
                color: Colors.white,
                fontWeight: FontWeight.w200,
                fontSize: 20
            ),
          ) ,
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF162a40),
              minimumSize: Size(50, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10),
                    topStart: Radius.circular(10),
                  )
              )
          ),
        ),
      ],
    );
  }


}
