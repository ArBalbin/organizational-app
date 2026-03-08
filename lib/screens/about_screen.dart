import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/ncf_app_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NcfAppBar(title: 'About Us'),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ── Hero Banner ──
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1B5E20), Color(0xFF2E7D32), Color(0xFF388E3C)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: const Color(0xFF1B5E20).withOpacity(0.5), blurRadius: 12, offset: const Offset(0, 6)),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo left
                  Container(
                    width: 80, height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 10, offset: const Offset(0, 4))],
                    ),
                    child: ClipOval(
                      child: Image.asset('assets/logo.png', fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.school, size: 44, color: Color(0xFF1B5E20))),
                    ),
                  ),
                  const SizedBox(width: 18),
                  // Text beside logo
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Guidance and Testing Center',
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, height: 1.3)),
                        SizedBox(height: 4),
                        Text('Naga College Foundation',
                            style: TextStyle(color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _InfoCard(
              icon: Icons.info_rounded,
              title: 'Who We Are',
              color: const Color(0xFF42A5F5),
              content: 'The Guidance and Testing Center of Naga College Foundation is dedicated to providing comprehensive guidance services, psychological testing, and counseling support to all NCF students and staff. We aim to foster personal, academic, and career development through professional and compassionate service.',
            ),
            const SizedBox(height: 12),
            _InfoCard(
              icon: Icons.history_edu_rounded,
              title: 'Our History',
              color: const Color(0xFF66BB6A),
              content: 'Established as an integral part of Naga College Foundation, the Guidance and Testing Center has grown alongside the institution in its commitment to student welfare. Over the years, we have expanded our services to meet the evolving needs of our student community, building a legacy of care and excellence.',
            ),
            const SizedBox(height: 12),
            _InfoCard(
              icon: Icons.star_rounded,
              title: 'Our Commitment',
              color: const Color(0xFF26C6DA),
              content: 'We are committed to maintaining the highest standards of professional guidance and psychological services. Our team of licensed counselors and psychometricians work together to create a safe, supportive, and empowering environment for every student who walks through our doors.',
            ),
            const SizedBox(height: 12),

            // ── Core Values ──
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF1E3D1E),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF4CAF50).withOpacity(0.5)),
                boxShadow: [
                  BoxShadow(color: const Color(0xFF1B5E20).withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B0000).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.favorite_rounded, color: Color(0xFFEF5350), size: 20),
                    ),
                    const SizedBox(width: 10),
                    const Text('Core Values',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  ]),
                  const SizedBox(height: 16),
                  ...[
                    ['Integrity', 'We uphold honesty and ethical standards in all our services.', Color(0xFF42A5F5)],
                    ['Compassion', 'We listen and care for every individual\'s well-being.', Color(0xFFEF5350)],
                    ['Excellence', 'We strive for the highest quality in guidance and testing.', Color(0xFF66BB6A)],
                    ['Respect', 'We honor the dignity and privacy of every student.', Color(0xFF26C6DA)],
                    ['Empowerment', 'We help students discover their fullest potential.', Color(0xFFAB47BC)],
                  ].map((v) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          width: 10, height: 10,
                          decoration: BoxDecoration(color: v[2] as Color, shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '${v[0]}: ',
                                style: TextStyle(color: v[2] as Color, fontWeight: FontWeight.w700, fontSize: 13),
                              ),
                              TextSpan(
                                text: v[1] as String,
                                style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
                              ),
                            ]),
                          ),
                        ),
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

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final Color color;
  const _InfoCard({required this.icon, required this.title, required this.content, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3D1E),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
          ]),
          const SizedBox(height: 12),
          Text(content, style: const TextStyle(color: Colors.white70, fontSize: 13.5, height: 1.6)),
        ],
      ),
    );
  }
}