import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentRoute =
        ModalRoute.of(context)?.settings.name ?? '/home';

    return Drawer(
      backgroundColor: const Color(0xFF0D2B0D),
      child: Column(
        children: [
          // ── Profile Banner ──
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/drawer_banner.png'),
                fit: BoxFit.cover,
                onError: _bannerFallback,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.70),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.fromLTRB(20, 48, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Profile avatar
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.5),
                      color: const Color(0xFF1B5E20),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                            Icons.school, color: Colors.white, size: 34),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'NCF Guidance Center',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Naga College Foundation',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ── Nav Items ──
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _DrawerItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  route: '/home',
                  currentRoute: currentRoute,
                ),
                _DrawerItem(
                  icon: Icons.info_rounded,
                  label: 'About Us',
                  route: '/about',
                  currentRoute: currentRoute,
                ),
                _DrawerItem(
                  icon: Icons.flag_rounded,
                  label: 'Mission & Vision',
                  route: '/mission-vision',
                  currentRoute: currentRoute,
                ),
                _DrawerItem(
                  icon: Icons.account_tree_rounded,
                  label: 'Org Chart',
                  route: '/org-chart',
                  currentRoute: currentRoute,
                ),
                _DrawerItem(
                  icon: Icons.people_rounded,
                  label: 'Staff Directory',
                  route: '/staff',
                  currentRoute: currentRoute,
                ),
                _DrawerItem(
                  icon: Icons.medical_services_rounded,
                  label: 'Services',
                  route: '/services',
                  currentRoute: currentRoute,
                ),
                _DrawerItem(
                  icon: Icons.campaign_rounded,
                  label: 'Announcements',
                  route: '/announcements',
                  currentRoute: currentRoute,
                ),
                _DrawerItem(
                  icon: Icons.quiz_rounded,
                  label: 'FAQ',
                  route: '/faq',
                  currentRoute: currentRoute,
                ),
                _DrawerItem(
                  icon: Icons.contact_mail_rounded,
                  label: 'Contact Us',
                  route: '/contact',
                  currentRoute: currentRoute,
                ),
              ],
            ),
          ),

          // ── Footer ──
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              '© 2025 NCF Guidance & Testing Center',
              style: TextStyle(color: Colors.white24, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// Fallback for missing banner image — won't crash
void _bannerFallback(Object error, StackTrace? stackTrace) {}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  final String currentRoute;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.currentRoute,
  });

  bool get _isActive => currentRoute == route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context); // close drawer
            if (!_isActive) {
              Navigator.pushReplacementNamed(context, route);
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: _isActive
                  ? const Color(0xFF2E7D32)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: _isActive ? Colors.white : Colors.white70,
                  size: 22,
                ),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: TextStyle(
                    color: _isActive ? Colors.white : Colors.white70,
                    fontSize: 15,
                    fontWeight: _isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}