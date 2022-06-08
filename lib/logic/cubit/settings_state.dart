part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  @override
  List<Object> get props => [];

  final bool appNotification;
  final bool emailNotifiacation;

  const SettingsState(
      {required this.appNotification, required this.emailNotifiacation});

  SettingsState copyWith({
    bool? appNotification,
    bool? emailNotifiacation,
  }) {
    return SettingsState(
      appNotification: appNotification ?? this.appNotification,
      emailNotifiacation: emailNotifiacation ?? this.emailNotifiacation,
    );
  }
}
