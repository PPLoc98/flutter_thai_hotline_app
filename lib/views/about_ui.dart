import 'package:flutter/material.dart';

class AboutUI extends StatelessWidget {
  const AboutUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ส่วนของ AppBar()
      appBar: AppBar(
        backgroundColor: Color(0xFF243A59),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,
              color: Colors.white), // รูปไอคอน (เช่น ปุ่มย้อนกลับ)
          onPressed: () {
            // ใส่คำสั่งเมื่อกดปุ่มตรงนี้ เช่น ย้อนกลับ หรือเปิด Side Menu
            Navigator.pop(context);
          },
        ),
        title: Text(
          'สายด่วน THAILAND',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ผู้จัดทำ',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.028,
                color: Color(0xFF243A59),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // มหาลัย
            Container(
              //กำหนดความกว่้างของ Container
              width: MediaQuery.of(context).size.width * 0.9,
              // 1. กำหนดระยะห่างจากขอบด้านใน (Padding) เพื่อไม่ให้เนื้อหาชิดกรอบเกินไป
              padding: EdgeInsets.all(20.0),
              // 2. ใช้ BoxDecoration เพื่อสร้างกรอบ
              decoration: BoxDecoration(
                color: Colors.white, // สีพื้นหลังของกรอบ
                borderRadius: BorderRadius.circular(16.0), // ความโค้งของมุมกรอบ
                // สไตล์การ์ดใช้ boxShadow:
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12, // สีเงาจางๆ
                    blurRadius: 10, // ความฟุ้งของเงา
                    spreadRadius: 1, // การกระจายตัวของเงา
                    offset: Offset(0, 4), // ทิศทางของเงา (แกน X, แกน Y)
                  ),
                ],
              ),
              //ส่วนภาพและข้อควสาม        
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // ให้กรอบสูงพอดีกับเนื้อหาด้านใน
                crossAxisAlignment:
                    CrossAxisAlignment.center, // จัดให้อยู่กึ่งกลางกรอบ
                children: [
                  Image.asset(
                    'assets/images/aboutme/saulogo.png',
                    color: Color(0xFF243A59),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'มหาวิทยาลัยเอเชียอาคเนย์',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      color: Color(0xFF243A59),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            //img me
            Image.asset(
              'assets/images/aboutme/me.png',
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            //ข้อมูลส่วนตัว
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // start เพื่อจัดชิดซ้าย
                children: [
                  _buildInfoRow(
                      Icons.assignment_ind, 'รหัสนักศึกษา', '6819H10005'),
                  _buildInfoRow(Icons.person, 'ชื่อ-นามสกุล', 'Sunita Saetang'),
                  _buildInfoRow(Icons.email, 'อีเมล', 'pung10005@gmail.com'),
                  _buildInfoRow(
                      Icons.school, 'สาขาวิชา', 'วิศวกรรมคอมพิวเตอร์'),
                  _buildInfoRow(Icons.business, 'คณะ', 'วิศวกรรมศาสตร์',
                      isLast: true), // แถวสุดท้ายเผื่อที่ว่างด้านล่าง
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

// Widget จัดรูปแบบข้อมูลส่วนตัว
Widget _buildInfoRow(IconData icon, String title, String subtitle,
    {bool isLast = false}) {
  return Padding(
    padding: EdgeInsets.only(
        bottom: isLast ? 0.0 : 16.0), // ถ้ายาวสุดท้ายไม่ต้องเว้นระยะด้านล่าง
    child: Row(
      crossAxisAlignment:
          CrossAxisAlignment.start, // ให้ไอคอนและข้อความอิงจากขอบบน
      children: [
        Icon(icon, color: Color(0xFF243A59), size: 28), // ไอคอนสีเทาอมฟ้า
        SizedBox(width: 16), // ระยะห่างระหว่างไอคอนกับข้อความ
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // ข้อความชิดซ้าย
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold, // หัวข้อตัวหนา
                  color: Color(0xFF243A59),
                ),
              ),
              SizedBox(height: 2), // ระยะห่างระหว่างบรรทัดข้อความนิดหน่อย
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF243A59), // รายละเอียดสีอ่อนลง
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
