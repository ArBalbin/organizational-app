import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/ncf_app_bar.dart';

class OrganizationalChartScreen extends StatelessWidget {
  const OrganizationalChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NcfAppBar(title: 'Organizational Chart'),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Column(
                children: [
                  Icon(Icons.account_tree_rounded, color: Colors.white, size: 32),
                  SizedBox(height: 8),
                  Text('NCF Guidance & Testing Center',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  Text('Organizational Structure',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Head
            _OrgNode(
              title: 'Head, Guidance & Testing Center',
              name: 'Ma\'am Kai',
              fullName: 'Kathyne Erika S. Castillo, MAED, RGC',
              email: 'kecastillo@ncf.edu.ph',
              color: const Color(0xFF6A0DAD),
              isTop: true,
            ),

            _ConnectorLine(),

            // Row 1: Alex + Mhirl
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _OrgNode(
                  title: 'Coordinator / Guidance Associate\nBED Senior High School',
                  name: 'Ma\'am Alex',
                  fullName: 'Sophia Alexandra T. Benemerito',
                  email: 'sabenemeritto@ncf.edu.ph',
                  color: const Color(0xFF1565C0),
                )),
                const SizedBox(width: 8),
                Expanded(child: _OrgNode(
                  title: 'BED Psychometrician',
                  name: 'Ma\'am Mhirl',
                  fullName: 'Mhirlyn D. Bolima, RPM, LPT',
                  email: 'mbolima@ncf.edu.ph',
                  color: const Color(0xFF2E7D32),
                )),
              ],
            ),
            const SizedBox(height: 8),

            // Row 2: Jen + Alex
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _OrgNode(
                  title: 'BED Psychometrician',
                  name: 'Ma\'am Jen',
                  fullName: 'Jeannery D. Anagao, RPM',
                  email: 'jdanagao@ncf.edu.ph',
                  color: const Color(0xFF2E7D32),
                )),
                const SizedBox(width: 8),
                Expanded(child: _OrgNode(
                  title: 'College Guidance Associate\nCollege of Engineering, Business & Management',
                  name: 'Ma\'am Alex',
                  fullName: 'Alexis Xyra D. Prado, RPM',
                  email: 'axprado@ncf.edu.ph',
                  color: const Color(0xFF00695C),
                )),
              ],
            ),
            const SizedBox(height: 8),

            // Row 3: Cess + Lea
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _OrgNode(
                  title: 'College Guidance Associate\nCollege of Criminal Justice Education',
                  name: 'Ma\'am Cess',
                  fullName: 'Princess Mourvie D. Regalado',
                  email: 'pmregalado@ncf.edu.ph',
                  color: const Color(0xFF00695C),
                )),
                const SizedBox(width: 8),
                Expanded(child: _OrgNode(
                  title: 'College Guidance Associate\nCollege of Criminal Justice Education',
                  name: 'Ma\'am Lea',
                  fullName: 'Lea Mae A. Cielo',
                  email: 'lcielo@ncf.edu.ph',
                  color: const Color(0xFF00695C),
                )),
              ],
            ),
            const SizedBox(height: 8),

            // Row 4: Jo + Neil
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _OrgNode(
                  title: 'College Guidance Associate\nCollege of Business & Management',
                  name: 'Ma\'am Jo',
                  fullName: 'Joanabel T. Peña',
                  email: 'janna@ncf.edu.ph',
                  color: const Color(0xFF00695C),
                )),
                const SizedBox(width: 8),
                Expanded(child: _OrgNode(
                  title: 'College Guidance Associate\nCollege of Teacher Education, Arts & Sciences',
                  name: 'Sir Neil',
                  fullName: 'Neil Andrew S. Formalejo, RPM',
                  email: 'naformalejo@ncf.edu.ph',
                  color: const Color(0xFF1565C0),
                )),
              ],
            ),
            const SizedBox(height: 8),

            // Row 5: Leslie + Kath
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _OrgNode(
                  title: 'College Guidance Associate\nCollege of Health Sciences',
                  name: 'Ma\'am Leslie',
                  fullName: 'Leslie Ann E. Ramos',
                  email: 'leramos@ncf.edu.ph',
                  color: const Color(0xFF00695C),
                )),
                const SizedBox(width: 8),
                Expanded(child: _OrgNode(
                  title: 'College Guidance Associate\nCollege of Accountancy and Finance, Computer Studies',
                  name: 'Ma\'am Kath',
                  fullName: 'Kathleen Ethel P. Javar',
                  email: 'kejavar@ncf.edu.ph',
                  color: const Color(0xFF00695C),
                )),
              ],
            ),
            const SizedBox(height: 8),

            // Row 6: Roselle + Nico
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _OrgNode(
                  title: 'BED Guidance Associate\nBED Grade School',
                  name: 'Ma\'am Roselle',
                  fullName: 'Roselle B. Ruelo',
                  email: 'rbruelo@ncf.edu.ph',
                  color: const Color(0xFF2E7D32),
                )),
                const SizedBox(width: 8),
                Expanded(child: _OrgNode(
                  title: 'BED Guidance Associate\nBED Junior High School',
                  name: 'Sir Nico',
                  fullName: 'Juanico Gabriel T. Guerrero',
                  email: 'jguerrero@ncf.edu.ph',
                  color: const Color(0xFF1565C0),
                )),
              ],
            ),
            const SizedBox(height: 8),

            // Row 7: Ali + Juls
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _OrgNode(
                  title: 'BED Guidance Associate\nBED Junior High School',
                  name: 'Ma\'am Ali',
                  fullName: 'Alliah C. De Los Reyes',
                  email: 'adelosreyes@ncf.edu.ph',
                  color: const Color(0xFF2E7D32),
                )),
                const SizedBox(width: 8),
                Expanded(child: _OrgNode(
                  title: 'BED Guidance Associate\nBED Senior High School',
                  name: 'Ma\'am Juls',
                  fullName: 'Julie Lou B. Savilla',
                  email: 'jsavilla@ncf.edu.ph',
                  color: const Color(0xFF2E7D32),
                )),
              ],
            ),

            const SizedBox(height: 20),

            // Contact info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF1E3D1E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF2E7D32).withOpacity(0.4)),
              ),
              child: const Column(
                children: [
                  Row(children: [
                    Icon(Icons.email_rounded, color: Color(0xFF4CAF50), size: 16),
                    SizedBox(width: 8),
                    Text('gtc@ncf.edu.ph', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ]),
                  SizedBox(height: 6),
                  Row(children: [
                    Icon(Icons.facebook_rounded, color: Color(0xFF4CAF50), size: 16),
                    SizedBox(width: 8),
                    Text('www.facebook.com/ncfgtc', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ]),
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

class _OrgNode extends StatelessWidget {
  final String title;
  final String name;
  final String fullName;
  final String email;
  final Color color;
  final bool isTop;

  const _OrgNode({
    required this.title,
    required this.name,
    required this.fullName,
    required this.email,
    required this.color,
    this.isTop = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isTop ? 14 : 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.4), blurRadius: 6, offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Icon(
            isTop ? Icons.manage_accounts_rounded : Icons.person_rounded,
            color: Colors.white,
            size: isTop ? 28 : 20,
          ),
          const SizedBox(height: 4),
          Text(name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: isTop ? 14 : 12,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(height: 2),
          Text(fullName,
              style: const TextStyle(color: Colors.white, fontSize: 9, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center),
          const SizedBox(height: 3),
          Text(title,
              style: const TextStyle(color: Colors.white70, fontSize: 9),
              textAlign: TextAlign.center),
          const SizedBox(height: 3),
          Text(email,
              style: const TextStyle(color: Colors.white54, fontSize: 8),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _ConnectorLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 20,
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: Colors.white24,
    );
  }
}