part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class LogOutState extends SettingsState {}

class TermsSuccessState extends SettingsState {}
class TermsErrorState extends SettingsState {}
