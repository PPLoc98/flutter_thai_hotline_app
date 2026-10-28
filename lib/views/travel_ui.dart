import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/data/hotline_data.dart';
import 'package:url_launcher/url_launcher.dart';

class TravelUI extends StatefulWidget {
  const TravelUI({super.key});

  @override
  State<TravelUI> createState() => _TravelUIState();
}

class _TravelUIState extends State<TravelUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ส่วนของ body
      body: Center(
        child: Column(
          children: [
            // 1. ส่วนแบนเนอร์ด้านบน
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.asset(
                'assets/images/travel/travel_0.png',
                fit: BoxFit.cover,
              ),
            ),

            // 2. ส่วนของ ListView แสดงข้อมูลเบอร์โทร (สร้างเป็นการ์ด)
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16.0), // เพิ่มขอบรอบๆ ListView
                itemCount: travelHotlines
                    .length, // ชื่อตัวแปร List ข้อมูล
                itemBuilder: (context, index) {
                  // ดึงข้อมูลแต่ละแถวมาเก็บในตัวแปร item เพื่อให้เรียกใช้ง่ายขึ้น
                  final item = travelHotlines[index];

                  return Container(
                    margin:
                        EdgeInsets.only(bottom: 12.0), // ระยะห่างระหว่างการ์ด
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // กรอบรูปไอคอนด้านซ้าย
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              item.icon, // นำข้อมูลใน Model มาใช้
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),

                        // ข้อความ (ชื่อและเบอร์โทร) ตรงกลาง
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name, // ชื่อสายด่วน
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                item.number, // เบอร์โทรศัพท์
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // ปุ่มโทรศัพท์ด้านขวา
                        InkWell(
                          onTap: () async {
                            // 1. ดึงเบอร์มาลบขีด (-) และช่องว่างออกให้เหลือแค่ตัวเลข
                            final String cleanNumber =
                                item.number.replaceAll(RegExp(r'[^0-9]'), '');

                            // 2. แปลงเป็นรูปแบบ URL สำหรับโทรศัพท์ (tel:)
                            final Uri url = Uri.parse('tel:$cleanNumber');

                            // 3. สั่งให้เปิดแอปโทรศัพท์เพื่อโทรออก
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              debugPrint('ไม่สามารถเปิดแอปโทรศัพท์ได้');
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Color(0xFF4A90E2), // สีฟ้า
                              shape: BoxShape.circle, // รูปทรงวงกลม
                            ),
                            child: Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
