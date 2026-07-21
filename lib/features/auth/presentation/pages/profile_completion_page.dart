import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class ProfileCompletionPage extends StatefulWidget {
  const ProfileCompletionPage({super.key});
  @override
  State<ProfileCompletionPage> createState() => _ProfileCompletionPageState();
}

class _ProfileCompletionPageState extends State<ProfileCompletionPage> {
  static const genders = ['Male', 'Female', 'Other', 'Prefer not to say'];
  static const departments = [
    'CSE',
    'Agriculture',
    'BBA',
    'Fisheries',
    'LLA',
    'ESDM',
    'NFS',
    'EEE',
    'Oceanography',
  ];
  final formKey = GlobalKey<FormState>();
  final fullName = TextEditingController();
  String? gender;
  String? department;

  @override
  void initState() {
    super.initState();
    final user = context.read<AuthBloc>().state.user;
    fullName.text = user?.displayName ?? '';
    gender = genders.contains(user?.gender) ? user?.gender : null;
    department = departments.contains(user?.department)
        ? user?.department
        : null;
  }

  @override
  void dispose() {
    fullName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Complete your profile')),
    body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.failure && state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error!)));
        }
      },
      child: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text(
              'Tell us about you',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            const Text(
              'These details are required for your organization profile.',
            ),
            const SizedBox(height: 24),
            _field(fullName, 'Full name'),
            const SizedBox(height: 14),
            DropdownButtonFormField<String>(
              initialValue: gender,
              decoration: const InputDecoration(
                labelText: 'Gender',
                hintText: 'Select your gender',
              ),
              items: genders
                  .map(
                    (value) =>
                        DropdownMenuItem(value: value, child: Text(value)),
                  )
                  .toList(),
              validator: (value) => value == null ? 'Gender is required' : null,
              onChanged: (value) => setState(() => gender = value),
            ),
            const SizedBox(height: 14),
            DropdownButtonFormField<String>(
              initialValue: department,
              decoration: const InputDecoration(
                labelText: 'Department',
                hintText: 'Select your department',
              ),
              items: departments
                  .map(
                    (value) =>
                        DropdownMenuItem(value: value, child: Text(value)),
                  )
                  .toList(),
              validator: (value) =>
                  value == null ? 'Department is required' : null,
              onChanged: (value) => setState(() => department = value),
            ),
            const SizedBox(height: 24),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) => FilledButton(
                onPressed: state.status == AuthStatus.loading
                    ? null
                    : () {
                        if (formKey.currentState?.validate() != true) return;
                        context.read<AuthBloc>().add(
                          AuthProfileSubmitted(
                            fullName: fullName.text,
                            gender: gender!,
                            department: department!,
                          ),
                        );
                      },
                child: state.status == AuthStatus.loading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  TextFormField _field(
    TextEditingController controller,
    String label, {
    String? hint,
  }) => TextFormField(
    controller: controller,
    textCapitalization: TextCapitalization.words,
    decoration: InputDecoration(labelText: label, hintText: hint),
    validator: (value) =>
        value?.trim().isEmpty == true ? '$label is required' : null,
  );
}
