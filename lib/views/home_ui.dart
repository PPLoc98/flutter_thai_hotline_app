import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/views/about_ui.dart';
import 'package:flutter_thai_hotline_app/views/bank_ui.dart';
import 'package:flutter_thai_hotline_app/views/emg_ui.dart';
import 'package:flutter_thai_hotline_app/views/pub_ui.dart';
import 'package:flutter_thai_hotline_app/views/travel_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
// สร้างตัวแปรเก็บ index ของรายการที่เลือก
  int _currentIndex = 0;
  //สร้างตัวแปรเก็บสีปุ่ม
  final List<Color> _navBarColors = [
    Color(0xFF4A90E2), // หน้า 1 การเดินทาง (สีน้ำเงิน)
    Color(0xFFFF6B6B), // หน้า 2 แจ้งเหตุฉุกเฉิน (สีแดง)
    Color(0xFF2A9D8F), // หน้า 3 ธนาคาร (สีเขียว)
    Color(0xFF8B5CF6), // หน้า 4 สาธารณูปโภค (สีส้ม)
  ];

  // สร้างตัวแปรแบบ List คือ ตัวแปร 1 ตัวเก็บได้มากกว่า 1 ข้อมูลเหมือน Array
  List subViewShow = [
    TravelUI(),
    EmgUI(),
    BankUI(),
    PubUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // สีพื้นหลังของ Scaffold
      backgroundColor: Colors.white,
      // ส่วนของ AppBar()
      appBar: AppBar(
        backgroundColor: _navBarColors[_currentIndex],
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,
              color: Colors.white), // รูปไอคอน (เช่น ปุ่มย้อนกลับ)
          onPressed: () {
            // ใส่คำสั่งเมื่อกดปุ่มตรงนี้ เช่น ย้อนกลับ หรือเปิด Side Menu
            Navigator.pop(context);
          },
        ),*/
        title: Text(
          'สายด่วน THAILAND',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline,
                color: Colors.white),
            onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUI()));
            },
          ),
        ],
      ),
      // ส่วนของ BottomNavigationBar()
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          //*** โค้ดอะไรก็ตามที่มีผลต่อการแสดงผลบนหน้าจอ
          setState(() {
            _currentIndex = value;
          });
        },
        unselectedItemColor: Colors.grey[600], // สีปุ่มที่ไม่ถูกเลือกตั้งให้เป็นเทา
        showUnselectedLabels: true, // แสดงหัวข้อทั้งหมด
        currentIndex: _currentIndex,
        selectedItemColor: _navBarColors[_currentIndex], // สีปุ่มที่ถูกเลือก
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_car,
            ),
            label: 'การเดินทาง',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emergency,
            ),
            label: 'แจ้งเหตุฉุกเฉิน',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance,
            ),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt_long,
            ),
            label: 'สาธารญูปโภค',
          ),
        ],
      ),
      // ส่วนของ body()
      body: subViewShow[_currentIndex],
    );
  }
}
