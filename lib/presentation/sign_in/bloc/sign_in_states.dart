class SignInStates{
    final String email;
    final String  password;

    //Storage for any triggered states
    // States objects below

    SignInStates({this.email='',  this.password=''});

    SignInStates copyWith({String? email,String? password,}){

         // This will send the value from the user to firebase if no value will take an empty String
        // Also Grabs the value and copy it and send back a new object
      return SignInStates(email: email??this.email, password: password??this.password);
    }
}

class SignInLoadingState extends SignInStates {}
// To reset all States after Logging out
class ResetSignInStateState extends SignInStates {}
class SignInSuccessState extends SignInStates {}
class SignInErrorState extends SignInStates {
    final String errorMessage;

    SignInErrorState({required this.errorMessage});
}

