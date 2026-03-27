part of 'mainpage_bloc.dart';

abstract class MainpageEvent extends Equatable {
  const MainpageEvent();

  @override
  List<Object> get props => [];
}

// เปลี่ยนหน้าต่างเมนูการแสดงผล

class MainpageEventScreenSelect extends MainpageEvent {
  final int screenNo;
  const MainpageEventScreenSelect({required this.screenNo});
}

// Get ข้อมูล PM25 จาก เช็คฝุ่น
class MainpageEventGetPM25 extends MainpageEvent {}

// Get ข้อมูลสภาพอากาศ
class MainpageEventGetWeather extends MainpageEvent {}

// เริ่มขอสิทธิ์ + ดึงตำแหน่ง
class MainpageEventGetUserLocation extends MainpageEvent {}
