import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      children: [
        Card(
          //margin: EdgeInsets.only(top: 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('email: alaamu@gmail.com'),
                SizedBox(height: 20,),
                Text('ID:123456789'),

              ],
            ),
          ),
        ),
        SizedBox(height: 60,),
        Text(
          'Transfer Information',
          style: GoogleFonts.crimsonText(
              color: Color(0xFFa35c6e),
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w200,
              fontSize: 20
          ),
        ),
        SizedBox(height: 20,),
        DataTable(
          columnSpacing: 28,
            columns: [
              DataColumn(
                label: Text('ID'),
              ),
              DataColumn(
                label: Text('Balance'),
              ),
              DataColumn(
                label: Text('Category'),
              ),
              DataColumn(
                label: Text('Time'),
              ),
              DataColumn(
                label: Text('Date'),
              ),
            ],
            rows: [

              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('200')),
                DataCell(Text('Al_Azher UNI..')),
                DataCell(Text(' 6:30 pm')),
                DataCell(Text('16_6_2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('500')),
                DataCell(Text('Paltel')),
                DataCell(Text(' 7:00 pm')),
                DataCell(Text('20_7_2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('3')),
                DataCell(Text('100')),
                DataCell(Text('Al_Azher UNI..')),
                DataCell(Text(' 1:30 Am')),
                DataCell(Text('21_6_2023')),
              ]),
            ])
      ],
    );
  }
}
// CircleAvatar(
// backgroundImage: AssetImage('images/pers.jpg'),
// radius: 50,
// ),