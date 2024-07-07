import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<String> countryList = [
  'United States',
  'United Kingdom',
  'Canada',
  'Australia',
  'New Zealand',
  'Ireland',
  'China',
  'Japan',
  'India',
  'South Africa',
  'Singapore',
  'Germany',
  'France',
  'Italy',
  'Spain',
  'Russia',
  'Brazil',
  'Mexico',
  'South Korea',
  'Ukraine',
  'Netherlands',
  'Sweden',
  'Switzerland',
  'Poland',
  'Turkey',
  'Egypt',
  'Israel',
  'Saudi Arabia',
  'United Arab Emirates',
  'Thailand'
];

class SignUpViewModel extends StateNotifier<SignUpState>{
  SignUpViewModel(super.state);

  //SignUpViewModel() : super(SignUpState());

  List<String> get countries => countryList;

  void selectCountry(String country){
    state = state.copyWith(selectedCountry: country);
  }
}

class SignUpState {
  final String? selectedCountry;

  SignUpState({this.selectedCountry});

  SignUpState copyWith({String? selectedCountry}) {
    return SignUpState(
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }
}

final signUpProvider = StateNotifierProvider<SignUpViewModel, SignUpState>((ref) {
  return SignUpViewModel(SignUpState());
});


