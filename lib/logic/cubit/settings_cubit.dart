import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(const SettingsState(
            appNotification: false, emailNotifiacation: false));
  void toogleAppNotification(bool newValue) =>
      emit(state.copyWith(appNotification: newValue));

  void toogleEmailNotification(bool newValue) =>
      emit(state.copyWith(emailNotifiacation: newValue));
}
