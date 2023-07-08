abstract class SignUpEvents{
  const SignUpEvents();
}

class UserNameEvents extends SignUpEvents{
  // For any Variable that Final constructor should have const
 final String userName;
  const UserNameEvents(this.userName);
}

class EmailEvents extends SignUpEvents{
  // For any Variable that Final constructor should have const
 final String email;
  const EmailEvents(this.email);
}

class PasswordEvents extends SignUpEvents{
  // For any Variable that Final constructor should have const
 final String password;
  const PasswordEvents(this.password);
}

class RePasswordEvents extends SignUpEvents{
  // For any Variable that Final constructor should have const
 final String rePassword;
  const RePasswordEvents(this.rePassword);
}