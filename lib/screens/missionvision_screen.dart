import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/ncf_app_bar.dart';

class MissionVisionScreen extends StatelessWidget {
  const MissionVisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NcfAppBar(title: 'Mission & Vision'),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _MVCard(
              gradient: const LinearGradient(colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)], begin: Alignment.topLeft, end: Alignment.bottomRight),
              icon: Icons.visibility_rounded, label: 'OUR VISION', title: 'Envisioning Excellence',
              content: 'To be the leading guidance and testing center that empowers every student of Naga College Foundation to achieve holistic development — intellectually, emotionally, and socially — preparing them to be competent, compassionate, and responsible members of society.',
            ),
            const SizedBox(height: 16),
            _MVCard(
              gradient: const LinearGradient(colors: [Color(0xFF00695C), Color(0xFF00897B)], begin: Alignment.topLeft, end: Alignment.bottomRight),
              icon: Icons.flag_rounded, label: 'OUR MISSION', title: 'Committed to Service',
              content: 'To provide quality, professional, and student-centered guidance and counseling services, psychological testing, and developmental programs that support the academic, career, and personal growth of NCF students — guided by the highest ethical and professional standards.',
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF1E3D1E),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF2E7D32).withOpacity(0.4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: const Color(0xFF8B0000).withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.checklist_rounded, color: Color(0xFFEF5350), size: 22),
                    ),
                    const SizedBox(width: 12),
                    const Text('Our Objectives', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
                  ]),
                  const SizedBox(height: 16),
                  ...[
                    'Provide individual and group counseling sessions to address academic, personal, and behavioral concerns.',
                    'Administer and interpret standardized psychological tests to support student development.',
                    'Offer career guidance and assessment to help students make informed educational and career decisions.',
                    'Conduct orientation programs, seminars, and workshops on mental health and life skills.',
                    'Collaborate with faculty, parents, and external agencies for the holistic welfare of students.',
                    'Maintain strict confidentiality and ethical standards in all guidance activities.',
                  ].asMap().entries.map((entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 24, height: 24,
                          decoration: const BoxDecoration(color: Color(0xFF2E7D32), shape: BoxShape.circle),
                          child: Center(child: Text('${entry.key + 1}',
                              style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
                        ),
                        const SizedBox(width: 12),
                        Expanded(child: Text(entry.value,
                            style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.5))),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _MVCard extends StatelessWidget {
  final LinearGradient gradient;
  final IconData icon;
  final String label;
  final String title;
  final String content;
  const _MVCard({required this.gradient, required this.icon, required this.label, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(icon, color: Colors.white70, size: 18),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Colors.white60, fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1.5)),
          ]),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Divider(color: Colors.white24),
          const SizedBox(height: 12),
          Text(content, style: const TextStyle(color: Colors.white, fontSize: 13.5, height: 1.7)),
        ],
      ),
    );
  }
}