import 'package:flutter/material.dart';
import 'service_screen.dart';

class ServicesDetailScreen extends StatelessWidget {
  final ServiceItem service;
  const ServicesDetailScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: service.color,
        leading: Builder(
          builder: (ctx) => Row(children: [
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => Navigator.pop(ctx),
              child: Container(
                width: 36, height: 36,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: ClipOval(
                  child: Image.asset('assets/logo.png', fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.school, color: Color(0xFF1B5E20), size: 22)),
                ),
              ),
            ),
          ]),
        ),
        leadingWidth: 56,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('NCF Guidance & Testing Center',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
            Text(service.title, style: const TextStyle(fontSize: 10, color: Colors.white70),
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [service.color.withOpacity(0.9), service.color],
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(children: [
                Icon(service.icon, color: Colors.white, size: 48),
                const SizedBox(height: 12),
                Text(service.title,
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ]),
            ),
            const SizedBox(height: 20),
            _DetailSection(icon: Icons.description_rounded, title: 'Overview',
                content: service.description, color: service.color),
            const SizedBox(height: 12),
            _DetailSection(icon: Icons.info_rounded, title: 'Additional Information',
                content: service.details, color: service.color),
            const SizedBox(height: 12),
            _DetailSection(icon: Icons.schedule_rounded, title: 'Availability',
                content: 'Monday to Friday, 8:00 AM – 5:00 PM\nNo appointment needed for walk-in inquiries.\nFor scheduled consultations, please contact the office in advance.',
                color: service.color),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/contact', (route) => false),
                icon: const Icon(Icons.contact_mail_rounded),
                label: const Text('Inquire About This Service'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: service.color,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _DetailSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final Color color;
  const _DetailSection({required this.icon, required this.title, required this.content, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3D1E),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
          ]),
          const SizedBox(height: 10),
          Text(content, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.6)),
        ],
      ),
    );
  }
}