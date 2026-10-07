import 'package:flutter/material.dart';
import 'package:workshopfinal_1_148/model/carbon_record.dart';

import 'emission_form_tab.dart';
import 'emission_display_tab.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _currentIndex = 0;
  
  final List<CarbonRecord> _records = [
    CarbonRecord(
      id: '1',
      costCenterId: 'CC-ENG-04',
      emissionSource: 'การใช้ไฟฟ้า (Electricity)',
      auditorEmail: 'auditor.eng@ecocarbon.com',
      tco2e: 125.5,
      budget: 500000,
    ),
    CarbonRecord(
      id: '2',
      costCenterId: 'CC-LOG-01',
      emissionSource: 'ยานพาหนะและขนส่ง (Logistics)',
      auditorEmail: 'auditor.log@ecocarbon.com',
      tco2e: 88.2,
      budget: 350000,
    ),
  ];

  void _addRecord(CarbonRecord record) {
    setState(() {
      _records.add(record);
      _currentIndex = 1; // สลับไปหน้า Display อัตโนมัติ
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('บันทึกข้อมูลคาร์บอนสำเร็จ!')),
    );
  }

  void _updateRecord(CarbonRecord updatedRecord) {
    setState(() {
      final index = _records.indexWhere((r) => r.id == updatedRecord.id);
      if (index != -1) {
        _records[index] = updatedRecord;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('อัปเดตข้อมูลเรียบร้อยแล้ว')),
    );
  }

  void _deleteRecord(String id) {
    setState(() {
      _records.removeWhere((r) => r.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      EmissionFormTab(onSubmit: _addRecord),
      EmissionDisplayTab(
        records: _records,
        onEdit: _updateRecord,
        onDelete: _deleteRecord,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.eco, color: Colors.green, size: 24),
            ),
            const SizedBox(width: 10),
            const Text('EcoCarbon Tracker', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.green.shade700,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_note),
            label: 'บันทึกข้อมูล (Form)',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'มอนิเตอร์ (Display)',
          ),
        ],
      ),
    );
  }
}