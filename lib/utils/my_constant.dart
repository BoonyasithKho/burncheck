import 'package:burncheck/utils/my_asset.dart';
import 'package:burncheck/widgets/show_svg.dart';
import 'package:flutter/material.dart';

class MyConstant {
  static String appName = 'BurnCheck';
  static String appVersion = '2.0.35';

  // => Color ============================================
  // => Background
  static Color bgRed = const Color(0xffAE3D1F);
  static Color bgWhite = const Color(0xffFFFFFF);
  static Color bgLightGrey1 = Color(0xffF4F4F4);
  static Color bgLightGrey2 = const Color(0xffF1F1F1);
  static Color bgLightGrey3 = const Color(0xffFFECE7);

  // => Text Color
  static const textBlack = Color(0xff000000);
  static const textWhite = Color(0xffFFFFFF);
  static const textDarkGrey = Color(0xff757575);
  static const textLightGrey = Color(0xffF0E7E3);
  static const textRed = Color(0xffA93F1E);

  // => Market Color
  static const marketRed = Color(0xffC80000);
  static const marketLightGrey1 = Color(0xffF7DCD9);
  static const marketLightGrey2 = Color(0xffD9F7E9);
  static const marketGreen = Color(0xff00C86B);

  // => Action Color
  static const actionActive = Color(0xffDC3400);
  static const actionDisable = Color(0xff666666);

  // => Decorate Color
  static const border = Color(0xffAE3D1F);

  // => Item Menu ========================================
  // Bottombar Menu Items
  static List<Map<String, dynamic>> bottomBarMenuItems = [
    {"id": 0, "title": "หน้าหลัก", "icon": Icon(Icons.home_outlined)},
    {"id": 1, "title": "ตลาด", "icon": Icon(Icons.storefront_outlined)},
    {"id": 2, "title": "จัดการเผา", "icon": Icon(Icons.bakery_dining_rounded)},
    {
      "id": 3,
      "title": "การแจ้งเตือน",
      "icon": Icon(Icons.notifications_none_rounded),
    },
    {"id": 4, "title": "ฉัน", "icon": Icon(Icons.person_outline_rounded)},
  ];

  // Home Menu Items
  static List<Map<String, dynamic>> homeMenuItems = [
    {
      "id": 0,
      "title": "ตรวจสอบผล",
      "icon": ShowSVG(pathFile: MyAsset.homeIcon_1),
    },
    {
      "id": 1,
      "title": "รายงานผล",
      "icon": ShowSVG(pathFile: MyAsset.homeIcon_2),
    },
    {
      "id": 2,
      "title": "ทบทวนสิทธิ์",
      "icon": ShowSVG(pathFile: MyAsset.homeIcon_3),
    },
    {
      "id": 3,
      "title": "แผนที่คำขอ",
      "icon": ShowSVG(pathFile: MyAsset.homeIcon_4),
    },
  ];

  // Profile&Setting Menu Items
  static List<Map<String, dynamic>> generalMenuItems = [
    {
      "id": 0,
      "title": "บัญชีของฉัน",
      "subtitle": "เปลี่ยนแปลงบัญชีของคุณ",
      "icon": Icon(Icons.person),
      "url": '',
    },
    {
      "id": 1,
      "title": "เปลี่ยนรหัสผ่าน",
      "subtitle": "เปลี่ยนแปลงรหัสผ่านของคุณ",
      "icon": Icon(Icons.lock_outline),
      "url": '',
    },
  ];
  static List<Map<String, dynamic>> announcementMenuItems = [
    {
      "id": 0,
      "title": "ประกาศที่ชื่นชอบ",
      "subtitle": "รายการประกาศที่ชื่นชอบ",
      "icon": Icon(Icons.favorite),
      "url": '',
    },
    {
      "id": 1,
      "title": "ประกาศของฉัน",
      "subtitle": "รายการประกาศของฉัน",
      "icon": Icon(Icons.mark_chat_unread_outlined),
      "url": '',
    },
  ];
  static List<Map<String, dynamic>> bookingMenuItems = [
    {
      "id": 0,
      "title": "การจองของฉัน",
      "subtitle": "รายการจองของฉัน",
      "icon": Icon(Icons.bookmark_border_rounded),
      "url": '',
    },
    {
      "id": 1,
      "title": "ประกาศที่มีการจอง",
      "subtitle": "รายการที่มีการจองของฉัน",
      "icon": Icon(Icons.bookmark_border_rounded),
      "url": '',
    },
  ];
  static List<Map<String, dynamic>> contactMenuItems = [
    {
      "id": 0,
      "title": "ช่วยเหลือ / ติดต่อเรา",
      "subtitle": "ติดต่อเราหรือขอความช่วยเหลือ",
      "icon": Icon(Icons.call),
      "url": '',
    },
    {
      "id": 1,
      "title": "เกี่ยวกับแอปพลิเคชัน",
      "subtitle": "เวอร์ชั่น $appVersion",
      "icon": Icon(Icons.info_outline),
      "url": '',
    },
  ];
}
