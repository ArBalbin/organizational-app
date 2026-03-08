import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_QuickAccessItem> quickItems = [
      _QuickAccessItem(icon: Icons.people_rounded, label: 'Staff Directory', route: '/staff', color: const Color(0xFF42A5F5)),
      _QuickAccessItem(icon: Icons.medical_services_rounded, label: 'Services', route: '/services', color: const Color(0xFF66BB6A)),
      _QuickAccessItem(icon: Icons.campaign_rounded, label: 'Announcements', route: '/announcements', color: const Color(0xFFEF5350)),
      _QuickAccessItem(icon: Icons.quiz_rounded, label: 'FAQ', route: '/faq', color: const Color(0xFF26C6DA)),
      _QuickAccessItem(icon: Icons.account_tree_rounded, label: 'Org Chart', route: '/org-chart', color: const Color(0xFF9CCC65)),
      _QuickAccessItem(icon: Icons.contact_mail_rounded, label: 'Contact Us', route: '/contact', color: const Color(0xFFAB47BC)),
    ];

    return Scaffold(
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            // ── Hamburger menu button in the upper-left ──
            leading: Builder(
              builder: (ctx) => IconButton(
                icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 28),
                onPressed: () => Scaffold.of(ctx).openDrawer(),
                tooltip: 'Open menu',
              ),
            ),
            leadingWidth: 56,
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('NCF Guidance & Testing Center',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
                Text('Home', style: TextStyle(fontSize: 10, color: Colors.white70)),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1B5E20), Color(0xFF2E7D32), Color(0xFF388E3C)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      width: 110, height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                      ),
                      child: ClipOval(
                        child: Image.asset('assets/logo.png', fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.school, size: 60, color: Color(0xFF1B5E20))),
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text('Guidance and Testing Center',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                    const SizedBox(height: 4),
                    Text('Naga College Foundation',
                        style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white30),
                      ),
                      child: const Text('Guiding, Testing, Growing',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Welcome Banner
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFF2E7D32).withOpacity(0.3), const Color(0xFF1B5E20).withOpacity(0.2)],
                ),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF2E7D32).withOpacity(0.4)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.waving_hand_rounded, color: Color(0xFF4CAF50), size: 28),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        SizedBox(height: 4),
                        Text('Explore the services, staff, and resources of the NCF Guidance & Testing Center.',
                            style: TextStyle(fontSize: 12, color: Colors.white70)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Quick Access
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Quick Access',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _QuickAccessCard(item: quickItems[index]),
                childCount: quickItems.length,
              ),
            ),
          ),

          // Announcements Preview
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent Announcements',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/announcements'),
                    child: const Text('See All', style: TextStyle(color: Color(0xFF4CAF50))),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final announcements = [
                  ['Enrollment Guidance Schedule', 'Feb 10, 2025', Icons.event_rounded],
                  ['Psychological Testing — 2nd Semester', 'Jan 28, 2025', Icons.assignment_rounded],
                  ['Seminar: Mental Health Awareness', 'Jan 15, 2025', Icons.health_and_safety_rounded],
                ];
                final a = announcements[index];
                return Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E3D1E),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2E7D32).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(a[2] as IconData, color: const Color(0xFF4CAF50), size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(a[0] as String, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                            const SizedBox(height: 3),
                            Text(a[1] as String, style: const TextStyle(color: Colors.white54, fontSize: 11)),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white38),
                    ],
                  ),
                );
              },
              childCount: 3,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class _QuickAccessCard extends StatelessWidget {
  final _QuickAccessItem item;
  const _QuickAccessCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, item.route),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E3D1E),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: item.color.withOpacity(0.6)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              // ── Brighter icon background (opacity bumped from 0.15 → 0.30) ──
              decoration: BoxDecoration(color: item.color.withOpacity(0.30), shape: BoxShape.circle),
              child: Icon(item.icon, color: item.color, size: 28),
            ),
            const SizedBox(height: 8),
            Text(item.label,
                style: const TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _QuickAccessItem {
  final IconData icon;
  final String label;
  final String route;
  final Color color;
  const _QuickAccessItem({required this.icon, required this.label, required this.route, required this.color});
}