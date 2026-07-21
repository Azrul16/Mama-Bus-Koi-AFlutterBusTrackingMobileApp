import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../domain/entities/institution.dart';
import '../bloc/institutions_cubit.dart';

class InstitutionSelectionPage extends StatelessWidget {
  const InstitutionSelectionPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Organizations'),
      actions: [
        IconButton(
          onPressed: () =>
              context.read<AuthBloc>().add(const AuthSignOutRequested()),
          icon: const Icon(Icons.logout),
        ),
      ],
    ),
    body: BlocBuilder<InstitutionsCubit, List<Institution>>(
      builder: (context, institutions) {
        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Find your organization',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 6),
            const Text(
              'Search a school, college, university, or create a new transport workspace.',
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => _createOrganization(context),
              icon: const Icon(Icons.add_business_outlined),
              label: const Text('Create organization'),
            ),
            const SizedBox(height: 20),
            if (institutions.isEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/illustrations/address.svg',
                        height: 140,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'No discoverable organizations yet.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ...institutions.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: const CircleAvatar(
                      child: Icon(Icons.school_outlined),
                    ),
                    title: Text(
                      item.shortName,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(item.name),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.read<AuthBloc>().add(
                      AuthInstitutionSelected(item.id),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );

  Future<void> _createOrganization(BuildContext context) async {
    final name = TextEditingController();
    final location = TextEditingController();
    var type = OrganizationType.school;
    final created = await showDialog<String>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Create organization'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: 'Organization name',
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<OrganizationType>(
                initialValue: type,
                decoration: const InputDecoration(labelText: 'Type'),
                items: OrganizationType.values
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => type = value ?? type),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: location,
                decoration: const InputDecoration(labelText: 'Location'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                if (name.text.trim().isEmpty) return;
                final user = context.read<AuthBloc>().state.user;
                if (user == null) return;
                final id = await context
                    .read<InstitutionsCubit>()
                    .createOrganization(
                      ownerId: user.uid,
                      name: name.text,
                      location: location.text,
                      type: type,
                    );
                if (context.mounted) Navigator.pop(context, id);
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
    name.dispose();
    location.dispose();
    if (created != null && context.mounted) {
      context.read<AuthBloc>().add(AuthInstitutionSelected(created));
    }
  }
}
