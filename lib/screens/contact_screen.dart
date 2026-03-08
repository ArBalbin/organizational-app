import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/ncf_app_bar.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _submitted = false;

  void _submit() {
    if (_formKey.currentState!.validate()) setState(() => _submitted = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NcfAppBar(title: 'Contact Us'),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ── Centered Logo Banner ──
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
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
              child: Column(
                children: [
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
                  const SizedBox(height: 12),
                  const Text('Contact Us',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('NCF Guidance & Testing Center',
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Row(children: [
              Expanded(child: _ContactInfoTile(icon: Icons.location_on_rounded, label: 'Address',
                  value: 'NCF Campus,\nNaga City, Camarines Sur', color: const Color(0xFF2E7D32))),
              const SizedBox(width: 10),
              Expanded(child: _ContactInfoTile(icon: Icons.phone_rounded, label: 'Phone',
                  value: '(054) 000-0000', color: const Color(0xFF388E3C))),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: _ContactInfoTile(icon: Icons.email_rounded, label: 'Email',
                  value: 'gtc@ncf.edu.ph', color: const Color(0xFF00695C))),
              const SizedBox(width: 10),
              Expanded(child: _ContactInfoTile(icon: Icons.schedule_rounded, label: 'Hours',
                  value: 'Mon–Fri\n8:00 AM – 5:00 PM', color: const Color(0xFF1B5E20))),
            ]),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E3D1E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF2E7D32).withOpacity(0.4)),
              ),
              child: Row(children: [
                const Icon(Icons.facebook_rounded, color: Color(0xFF4CAF50), size: 22),
                const SizedBox(width: 10),
                const Text('www.facebook.com/ncfgtc',
                    style: TextStyle(color: Colors.white70, fontSize: 13)),
              ]),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF1E3D1E),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF2E7D32).withOpacity(0.4)),
              ),
              child: _submitted
                  ? _SuccessMessage(onReset: () {
                      setState(() {
                        _submitted = false;
                        _nameController.clear();
                        _emailController.clear();
                        _subjectController.clear();
                        _messageController.clear();
                      });
                    })
                  : Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(children: [
                            Icon(Icons.send_rounded, color: Color(0xFF4CAF50), size: 20),
                            SizedBox(width: 8),
                            Text('Send Us a Message',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                          ]),
                          const SizedBox(height: 16),
                          _FormField(controller: _nameController, label: 'Full Name',
                              hint: 'Enter your full name', icon: Icons.person_rounded,
                              validator: (v) => v == null || v.isEmpty ? 'Please enter your name' : null),
                          const SizedBox(height: 12),
                          _FormField(controller: _emailController, label: 'Email Address',
                              hint: 'Enter your email', icon: Icons.email_rounded,
                              keyboardType: TextInputType.emailAddress,
                              validator: (v) => v == null || !v.contains('@') ? 'Please enter a valid email' : null),
                          const SizedBox(height: 12),
                          _FormField(controller: _subjectController, label: 'Subject',
                              hint: 'What is this about?', icon: Icons.subject_rounded,
                              validator: (v) => v == null || v.isEmpty ? 'Please enter a subject' : null),
                          const SizedBox(height: 12),
                          _FormField(controller: _messageController, label: 'Message',
                              hint: 'Type your message here...', icon: Icons.message_rounded,
                              maxLines: 5,
                              validator: (v) => v == null || v.isEmpty ? 'Please enter your message' : null),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: _submit,
                              icon: const Icon(Icons.send_rounded),
                              label: const Text('Send Message'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2E7D32),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                        ],
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

class _ContactInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  const _ContactInfoTile({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3D1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11, fontWeight: FontWeight.w500)),
        const SizedBox(height: 3),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 12, height: 1.4)),
      ]),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label, hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;
  const _FormField({required this.controller, required this.label, required this.hint,
      required this.icon, this.keyboardType, this.maxLines = 1, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label, hintText: hint,
        prefixIcon: Icon(icon, color: Colors.white54, size: 18),
      ),
    );
  }
}

class _SuccessMessage extends StatelessWidget {
  final VoidCallback onReset;
  const _SuccessMessage({required this.onReset});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 16),
      const Icon(Icons.check_circle_rounded, color: Color(0xFF4CAF50), size: 60),
      const SizedBox(height: 16),
      const Text('Message Sent!',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      const SizedBox(height: 8),
      const Text('Thank you for reaching out. We will get back to you as soon as possible.',
          style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5), textAlign: TextAlign.center),
      const SizedBox(height: 20),
      TextButton.icon(
        onPressed: onReset,
        icon: const Icon(Icons.refresh_rounded, color: Color(0xFF4CAF50)),
        label: const Text('Send Another Message', style: TextStyle(color: Color(0xFF4CAF50))),
      ),
      const SizedBox(height: 8),
    ]);
  }
}