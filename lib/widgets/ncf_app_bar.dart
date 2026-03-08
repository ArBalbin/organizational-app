import 'package:flutter/material.dart';

class NcfAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const NcfAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF1B5E20),
      elevation: 0,
      leading: Builder(
        builder: (ctx) => IconButton(
          icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 26),
          onPressed: () => Scaffold.of(ctx).openDrawer(),
          tooltip: 'Open menu',
        ),
      ),
      title: _TitleRow(screenName: title),
      actions: actions,
    );
  }

  /// Use this as the `title:` inside a SliverAppBar
  static Widget sliverTitle(String screenName) => _TitleRow(screenName: screenName);
}

class _TitleRow extends StatelessWidget {
  final String screenName;
  const _TitleRow({required this.screenName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Logo circle ──
        Container(
          width: 34,
          height: 34,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.school, color: Color(0xFF1B5E20), size: 20),
            ),
          ),
        ),
        const SizedBox(width: 10),
        // ── Text beside the logo ──
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'NCF Guidance & Testing Center',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.2,
              ),
            ),
            Text(
              screenName,
              style: const TextStyle(fontSize: 10, color: Colors.white70),
            ),
          ],
        ),
      ],
    );
  }
}