import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';

class PlatformAdminPage extends StatelessWidget {
  const PlatformAdminPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Mama Bus Koi Platform'),
      actions: [
        IconButton(
          tooltip: 'Sign out',
          onPressed: () =>
              context.read<AuthBloc>().add(const AuthSignOutRequested()),
          icon: const Icon(Icons.logout),
        ),
      ],
    ),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        Text(
          'Platform Console',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 8),
        Text('Operate the SaaS without entering a customer workspace.'),
        SizedBox(height: 24),
        _PlatformArea(
          icon: Icons.apartment_outlined,
          title: 'Organizations',
          subtitle: 'Review, suspend, reactivate, and manage owners',
        ),
        _PlatformArea(
          icon: Icons.people_outline,
          title: 'Users & usage',
          subtitle: 'Inspect platform adoption and active tracking usage',
        ),
        _PlatformArea(
          icon: Icons.support_agent_outlined,
          title: 'Support',
          subtitle: 'Handle tenant support and operational incidents',
        ),
        _PlatformArea(
          icon: Icons.settings_outlined,
          title: 'Platform settings',
          subtitle: 'Manage defaults without changing tenant-owned data',
        ),
      ],
    ),
  );
}

class _PlatformArea extends StatelessWidget {
  const _PlatformArea({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final IconData icon;
  final String title, subtitle;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: ListTile(
      contentPadding: const EdgeInsets.all(16),
      leading: CircleAvatar(child: Icon(icon)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    ),
  );
}
