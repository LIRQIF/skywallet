import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class MyInputPage extends StatefulWidget {
  const MyInputPage({Key key}) : super(key: key);

  @override
  _MyInputPageState createState() => _MyInputPageState();
}

class _MyInputPageState extends State<MyInputPage> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ''; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Keuangan'),
      ),
      body: PageView(
        children: [
          _buildPemasukanPage(),
          _buildPengeluaranPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Catatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Artikel',
          ),
        ],
      ),
    );
  }

  Widget _buildPemasukanPage() {
    return ListView(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Input Pemasukan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.category_outlined),
              labelText: 'Kategori',
            ),
          ),
        ),
        Container(
          child: TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.money),
              labelText: 'Jumlah Pemasukan',
            ),
          ),
        ),
        Container(
          child: TextField(
            controller: dateInput,
            //editing controller of this TextField
            decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today), //icon of text field
                labelText: "Enter Date" //label text of field
                ),
            readOnly: true, // when true user cannot edit text
            onTap: () async {
              //when click we have to show the datepicker
              await _selectDate(context);
            },
          ),
        ),
        Container(
          child: ElevatedButton(onPressed: () {}, child: Text('Simpan')),
        )
      ],
    );
  }

  Widget _buildPengeluaranPage() {
    return ListView(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Input Pengeluaran',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.category_outlined),
              labelText: 'Kategori',
            ),
          ),
        ),
        Container(
          child: TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.money),
              labelText: 'Jumlah Pengeluaran',
            ),
          ),
        ),
        Container(
          child: TextField(
            controller: dateInput,
            //editing controller of this TextField
            decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today), //icon of text field
                labelText: "Enter Date" //label text of field
                ),
            readOnly: true, // when true user cannot edit text
            onTap: () async {
              //when click we have to show the datepicker
              await _selectDate(context);
            },
          ),
        ),
        Container(
          child: ElevatedButton(onPressed: () {}, child: Text('Simpan')),
        )
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      setState(() {
        dateInput.text = formattedDate; //set output date to TextField value.
      });
    } else {
      print('Date is not selected');
    }
  }
}
