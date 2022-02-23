const loginQuery = """
    query login(\$email: String!, \$password: String!) {
      login(
        email: \$email
        password: \$password
      ) {
        name
        accessToken
      }
    }
  """;

const signupMutation = """
    mutation signup(\$firstName: String!, \$lastName: String!, \$birthDate: DateTime!, \$email: String!, \$password: String!, \$passwordConfirmation: String!) {
      signup(
        firstName: \$firstName
        lastName: \$lastName
        email: \$email
        birthDate: \$birthDate
        password: \$password
        passwordConfirmation: \$passwordConfirmation
      ) {
        name
        accessToken
      }
    }
  """;
