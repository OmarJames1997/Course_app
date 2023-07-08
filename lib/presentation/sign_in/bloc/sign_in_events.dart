
// Has Event Classes that are triggered to the Events From UI
abstract class SignInEvents{

  const SignInEvents();
}

class EmailEvent extends SignInEvents{
  final String email;

  EmailEvent(this.email);
}
class PasswordEvent extends SignInEvents{
  final String password;

  PasswordEvent(this.password);
}

class LoadingEvent extends SignInEvents{}

//
class ResetSignInEvent extends SignInEvents{}

// handle all the Errors while logging in - called in the on FireBaseAuth-SignInController file
class SignInErrorEvent extends SignInEvents{
  final String errorMessage;

  SignInErrorEvent(this.errorMessage);
}


