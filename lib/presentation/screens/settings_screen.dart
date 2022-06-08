import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/logic/cubit/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        SnackBar snackBar = SnackBar(
            duration: const Duration(milliseconds: 700),
            content: Text("App " +
                state.appNotification.toString().toUpperCase() +
                " " +
                ", Email " +
                state.emailNotifiacation.toString().toUpperCase()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Column(
            children: [
              SwitchListTile(
                  title: const Text('App Notifications'),
                  value: state.appNotification,
                  onChanged: (value) {
                    BlocProvider.of<SettingsCubit>(context)
                        .toogleAppNotification(value);
                  }),
              SwitchListTile(
                  title: const Text('Email Notifications'),
                  value: state.emailNotifiacation,
                  onChanged: (value) {
                    BlocProvider.of<SettingsCubit>(context)
                        .toogleEmailNotification(value);
                  })
            ],
          );
        },
      ),
    ));
  }
}
