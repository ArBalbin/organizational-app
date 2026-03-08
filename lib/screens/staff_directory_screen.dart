import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/ncf_app_bar.dart';

class StaffDirectoryScreen extends StatefulWidget {
  const StaffDirectoryScreen({super.key});

  @override
  State<StaffDirectoryScreen> createState() => _StaffDirectoryScreenState();
}

class _StaffDirectoryScreenState extends State<StaffDirectoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  String _selectedDept = 'All';

  final List<String> _depts = ['All', 'Head', 'BED', 'College', 'Student Assistant'];

  final List<_StaffMember> _staff = [
    _StaffMember(
      nickname: 'Ma\'am Kai',
      name: 'Kathyne Erika S. Castillo, MAED, RGC',
      position: 'Head, Guidance & Testing Center',
      email: 'kecastillo@ncf.edu.ph',
      department: 'Head',
      avatar: 'KAI',
      avatarColor: const Color(0xFF6A0DAD),
    ),
    _StaffMember(
      nickname: 'Ma\'am Alex',
      name: 'Sophia Alexandra T. Benemerito',
      position: 'Coordinator / Guidance Associate – BED Senior High School',
      email: 'sabenemeritto@ncf.edu.ph',
      department: 'BED',
      avatar: 'SAB',
      avatarColor: const Color(0xFF1565C0),
    ),
    _StaffMember(
      nickname: 'Ma\'am Mhirl',
      name: 'Mhirlyn D. Bolima, RPM, LPT',
      position: 'BED Psychometrician',
      email: 'mbolima@ncf.edu.ph',
      department: 'BED',
      avatar: 'MDB',
      avatarColor: const Color(0xFF2E7D32),
    ),
    _StaffMember(
      nickname: 'Ma\'am Jen',
      name: 'Jeannery D. Anagao, RPM',
      position: 'BED Psychometrician',
      email: 'jdanagao@ncf.edu.ph',
      department: 'BED',
      avatar: 'JDA',
      avatarColor: const Color(0xFF2E7D32),
    ),
    _StaffMember(
      nickname: 'Ma\'am Roselle',
      name: 'Roselle B. Ruelo',
      position: 'BED Guidance Associate – Grade School',
      email: 'rbruelo@ncf.edu.ph',
      department: 'BED',
      avatar: 'RBR',
      avatarColor: const Color(0xFF388E3C),
    ),
    _StaffMember(
      nickname: 'Sir Nico',
      name: 'Juanico Gabriel T. Guerrero',
      position: 'BED Guidance Associate – Junior High School',
      email: 'jguerrero@ncf.edu.ph',
      department: 'BED',
      avatar: 'JGG',
      avatarColor: const Color(0xFF1565C0),
    ),
    _StaffMember(
      nickname: 'Ma\'am Ali',
      name: 'Alliah C. De Los Reyes',
      position: 'BED Guidance Associate – Junior High School',
      email: 'adelosreyes@ncf.edu.ph',
      department: 'BED',
      avatar: 'ACD',
      avatarColor: const Color(0xFF388E3C),
    ),
    _StaffMember(
      nickname: 'Ma\'am Juls',
      name: 'Julie Lou B. Savilla',
      position: 'BED Guidance Associate – Senior High School',
      email: 'jsavilla@ncf.edu.ph',
      department: 'BED',
      avatar: 'JLB',
      avatarColor: const Color(0xFF388E3C),
    ),
    _StaffMember(
      nickname: 'Ma\'am Alex',
      name: 'Alexis Xyra D. Prado, RPM',
      position: 'College Guidance Associate – Engineering, Business & Management',
      email: 'axprado@ncf.edu.ph',
      department: 'College',
      avatar: 'AXP',
      avatarColor: const Color(0xFF00695C),
    ),
    _StaffMember(
      nickname: 'Ma\'am Cess',
      name: 'Princess Mourvie D. Regalado',
      position: 'College Guidance Associate – Criminal Justice Education',
      email: 'pmregalado@ncf.edu.ph',
      department: 'College',
      avatar: 'PMR',
      avatarColor: const Color(0xFF00695C),
    ),
    _StaffMember(
      nickname: 'Ma\'am Lea',
      name: 'Lea Mae A. Cielo',
      position: 'College Guidance Associate – Criminal Justice Education',
      email: 'lcielo@ncf.edu.ph',
      department: 'College',
      avatar: 'LMA',
      avatarColor: const Color(0xFF00695C),
    ),
    _StaffMember(
      nickname: 'Ma\'am Jo',
      name: 'Joanabel T. Peña',
      position: 'College Guidance Associate – Business & Management',
      email: 'janna@ncf.edu.ph',
      department: 'College',
      avatar: 'JTP',
      avatarColor: const Color(0xFF00695C),
    ),
    _StaffMember(
      nickname: 'Sir Neil',
      name: 'Neil Andrew S. Formalejo, RPM',
      position: 'College Guidance Associate – Teacher Education, Arts & Sciences',
      email: 'naformalejo@ncf.edu.ph',
      department: 'College',
      avatar: 'NAS',
      avatarColor: const Color(0xFF1565C0),
    ),
    _StaffMember(
      nickname: 'Ma\'am Leslie',
      name: 'Leslie Ann E. Ramos',
      position: 'College Guidance Associate – Health Sciences',
      email: 'leramos@ncf.edu.ph',
      department: 'College',
      avatar: 'LAE',
      avatarColor: const Color(0xFF00695C),
    ),
    _StaffMember(
      nickname: 'Ma\'am Kath',
      name: 'Kathleen Ethel P. Javar',
      position: 'College Guidance Associate – Accountancy, Finance & Computer Studies',
      email: 'kejavar@ncf.edu.ph',
      department: 'College',
      avatar: 'KEJ',
      avatarColor: const Color(0xFF00695C),
    ),
  ];

  List<_StaffMember> get _filtered {
    return _staff.where((s) {
      final matchQuery = _query.isEmpty ||
          s.nickname.toLowerCase().contains(_query.toLowerCase()) ||
          s.name.toLowerCase().contains(_query.toLowerCase()) ||
          s.position.toLowerCase().contains(_query.toLowerCase());
      final matchDept = _selectedDept == 'All' || s.department == _selectedDept;
      return matchQuery && matchDept;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NcfAppBar(title: 'Staff Directory'),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          // Search
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: TextField(
              controller: _searchController,
              onChanged: (val) => setState(() => _query = val),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search by name or position...',
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.white54),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _query = '');
                        })
                    : null,
              ),
            ),
          ),

          // Department Filter
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _depts.map((d) {
                  final isSelected = _selectedDept == d;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(d),
                      selected: isSelected,
                      onSelected: (_) => setState(() => _selectedDept = d),
                      backgroundColor: const Color(0xFF1E3D1E),
                      selectedColor: const Color(0xFF2E7D32),
                      labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.white60, fontSize: 12),
                      checkmarkColor: Colors.white,
                      side: BorderSide(
                          color: isSelected ? const Color(0xFF2E7D32) : Colors.white24),
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
              child: Text(
                '${_filtered.length} staff member${_filtered.length != 1 ? 's' : ''}',
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),
          ),

          // List
          Expanded(
            child: _filtered.isEmpty
                ? const Center(
                    child: Text('No staff found.', style: TextStyle(color: Colors.white54)))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filtered.length,
                    itemBuilder: (context, index) =>
                        _StaffCard(staff: _filtered[index]),
                  ),
          ),
        ],
      ),
    );
  }
}

class _StaffCard extends StatelessWidget {
  final _StaffMember staff;
  const _StaffCard({required this.staff});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3D1E),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: staff.avatarColor.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: staff.avatarColor, shape: BoxShape.circle),
            child: Center(
              child: Text(staff.avatar,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(staff.nickname,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: staff.avatarColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(staff.department,
                          style: TextStyle(color: staff.avatarColor, fontSize: 10)),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(staff.name,
                    style: const TextStyle(
                        color: Colors.white60, fontSize: 11, fontStyle: FontStyle.italic)),
                const SizedBox(height: 3),
                Text(staff.position,
                    style: const TextStyle(color: Colors.white70, fontSize: 11),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Row(children: [
                  const Icon(Icons.email_rounded, size: 11, color: Colors.white38),
                  const SizedBox(width: 4),
                  Text(staff.email,
                      style: const TextStyle(color: Colors.white54, fontSize: 10)),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StaffMember {
  final String nickname;
  final String name;
  final String position;
  final String email;
  final String department;
  final String avatar;
  final Color avatarColor;

  const _StaffMember({
    required this.nickname,
    required this.name,
    required this.position,
    required this.email,
    required this.department,
    required this.avatar,
    required this.avatarColor,
  });
}