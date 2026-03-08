import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/ncf_app_bar.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Events', 'Testing', 'Counseling', 'General'];

  final List<_Announcement> _announcements = [
    _Announcement(title: 'Enrollment Guidance Schedule — 1st Semester',
        body: 'The Guidance Office will be conducting enrollment orientation for all incoming freshmen. Please bring your enrollment forms and proceed to the GTC office for pre-enrollment counseling.',
        date: 'February 10, 2025', category: 'Events', icon: Icons.event_rounded, color: const Color(0xFF2E7D32), isNew: true),
    _Announcement(title: 'Psychological Testing — 2nd Semester Schedule',
        body: 'All students required to undergo psychological testing this semester are advised to secure their testing slots at the GTC office. Testing will be conducted every Tuesday and Thursday.',
        date: 'January 28, 2025', category: 'Testing', icon: Icons.assignment_rounded, color: const Color(0xFF8B0000), isNew: true),
    _Announcement(title: 'Seminar: Mental Health Awareness Week',
        body: 'Join us for a week-long series of seminars and activities on mental health awareness. Open to all NCF students, faculty, and staff. Registration is free.',
        date: 'January 15, 2025', category: 'Events', icon: Icons.health_and_safety_rounded, color: const Color(0xFF388E3C), isNew: false),
    _Announcement(title: 'Counseling Drop-In Hours Update',
        body: 'Walk-in counseling hours have been extended. The guidance office is now open for walk-in sessions from 7:30 AM to 5:30 PM, Monday through Friday.',
        date: 'January 5, 2025', category: 'Counseling', icon: Icons.psychology_rounded, color: const Color(0xFF1565C0), isNew: false),
    _Announcement(title: 'Career Guidance Week — Save the Date',
        body: 'The GTC will be hosting Career Guidance Week in February. Activities include career fairs, aptitude testing, and employer talks. More details to follow.',
        date: 'December 20, 2024', category: 'Events', icon: Icons.work_rounded, color: const Color(0xFF00695C), isNew: false),
    _Announcement(title: 'Holiday Office Schedule',
        body: 'Please be advised that the Guidance and Testing Center office will follow a modified schedule during the holiday break. The office will be closed from December 24 to January 2.',
        date: 'December 10, 2024', category: 'General', icon: Icons.info_rounded, color: const Color(0xFF1B5E20), isNew: false),
  ];

  List<_Announcement> get _filtered => _selectedFilter == 'All'
      ? _announcements
      : _announcements.where((a) => a.category == _selectedFilter).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NcfAppBar(title: 'Announcements'),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filters.map((f) {
                  final isSelected = _selectedFilter == f;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(f),
                      selected: isSelected,
                      onSelected: (_) => setState(() => _selectedFilter = f),
                      backgroundColor: const Color(0xFF1E3D1E),
                      selectedColor: const Color(0xFF2E7D32),
                      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.white60, fontSize: 12),
                      checkmarkColor: Colors.white,
                      side: BorderSide(color: isSelected ? const Color(0xFF2E7D32) : Colors.white24),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('${_filtered.length} announcement${_filtered.length != 1 ? 's' : ''}',
                  style: const TextStyle(color: Colors.white54, fontSize: 12)),
            ),
          ),
          Expanded(
            child: _filtered.isEmpty
                ? const Center(child: Text('No announcements.', style: TextStyle(color: Colors.white54)))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filtered.length,
                    itemBuilder: (context, index) => _AnnouncementCard(announcement: _filtered[index]),
                  ),
          ),
        ],
      ),
    );
  }
}

class _AnnouncementCard extends StatefulWidget {
  final _Announcement announcement;
  const _AnnouncementCard({required this.announcement});

  @override
  State<_AnnouncementCard> createState() => _AnnouncementCardState();
}

class _AnnouncementCardState extends State<_AnnouncementCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final a = widget.announcement;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3D1E),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: a.color.withOpacity(0.4)),
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(color: a.color.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                    child: Icon(a.icon, color: a.color, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          if (a.isNew) Container(
                            margin: const EdgeInsets.only(right: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: const Color(0xFF2E7D32), borderRadius: BorderRadius.circular(4)),
                            child: const Text('NEW', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: a.color.withOpacity(0.15), borderRadius: BorderRadius.circular(4)),
                            child: Text(a.category, style: TextStyle(color: a.color, fontSize: 9)),
                          ),
                        ]),
                        const SizedBox(height: 5),
                        Text(a.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                        const SizedBox(height: 3),
                        Text(a.date, style: const TextStyle(color: Colors.white38, fontSize: 11)),
                      ],
                    ),
                  ),
                  Icon(_expanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded, color: Colors.white38),
                ],
              ),
            ),
          ),
          if (_expanded)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: Column(children: [
                const Divider(color: Colors.white12),
                const SizedBox(height: 6),
                Text(a.body, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.6)),
              ]),
            ),
        ],
      ),
    );
  }
}

class _Announcement {
  final String title, body, date, category;
  final IconData icon;
  final Color color;
  final bool isNew;
  const _Announcement({required this.title, required this.body, required this.date, required this.category, required this.icon, required this.color, required this.isNew});
}