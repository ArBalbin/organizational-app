import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/ncf_app_bar.dart';
import 'services_detail_screen.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ServiceItem> services = [
      ServiceItem(icon: Icons.psychology_rounded, title: 'Individual Counseling',
          description: 'One-on-one counseling sessions addressing personal, academic, behavioral, and emotional concerns in a confidential environment.',
          color: const Color(0xFF2E7D32),
          details: 'Walk-in or by appointment. Sessions are strictly confidential. Open to all enrolled students.'),
      ServiceItem(icon: Icons.groups_rounded, title: 'Group Counseling',
          description: 'Structured group sessions designed to help students deal with common issues in a supportive peer environment.',
          color: const Color(0xFF388E3C),
          details: 'Scheduled sessions per semester. Topics include stress management, relationships, and life skills.'),
      ServiceItem(icon: Icons.assignment_rounded, title: 'Psychological Testing',
          description: 'Standardized psychological assessments and aptitude tests administered by licensed psychometricians.',
          color: const Color(0xFF8B0000),
          details: 'Tests include IQ, personality, career aptitude, and academic readiness assessments.'),
      ServiceItem(icon: Icons.work_rounded, title: 'Career Guidance',
          description: 'Career orientation, assessment, and advising to help students make informed decisions about their academic and career path.',
          color: const Color(0xFF1565C0),
          details: 'Includes career interest inventories, occupational briefings, and job shadowing coordination.'),
      ServiceItem(icon: Icons.school_rounded, title: 'Academic Advising',
          description: 'Guidance and support for students struggling academically — developing study skills, time management, and learning strategies.',
          color: const Color(0xFF00695C),
          details: 'Referral system with faculty advisers. Includes intervention programs for at-risk students.'),
      ServiceItem(icon: Icons.health_and_safety_rounded, title: 'Mental Health Programs',
          description: 'Seminars, workshops, and activities promoting mental health awareness and emotional wellness among students and staff.',
          color: const Color(0xFF1B5E20),
          details: 'Includes mental health awareness week, peer support programs, and crisis intervention.'),
      ServiceItem(icon: Icons.family_restroom_rounded, title: 'Parent & Family Consultation',
          description: 'Consultation services for parents and guardians regarding students\' academic progress and behavioral concerns.',
          color: const Color(0xFF4E342E),
          details: 'By appointment only. Guidance counselors liaise between students, families, and the school.'),
    ];

    return Scaffold(
      appBar: NcfAppBar(title: 'Our Services'),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: services.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)]),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(children: [
                const Icon(Icons.medical_services_rounded, color: Colors.white, size: 28),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Our Services', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('${services.length} services available', style: const TextStyle(color: Colors.white70, fontSize: 12)),
                ])),
              ]),
            );
          }
          final s = services[index - 1];
          return _ServiceCard(service: s);
        },
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServiceItem service;
  const _ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ServicesDetailScreen(service: service))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E3D1E),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: service.color.withOpacity(0.4)),
        ),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: service.color.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
            child: Icon(service.icon, color: service.color, size: 26),
          ),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(service.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 4),
            Text(service.description, style: const TextStyle(color: Colors.white60, fontSize: 12, height: 1.4),
                maxLines: 2, overflow: TextOverflow.ellipsis),
          ])),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white30, size: 14),
        ]),
      ),
    );
  }
}

class ServiceItem {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final String details;
  const ServiceItem({required this.icon, required this.title, required this.description, required this.color, required this.details});
}