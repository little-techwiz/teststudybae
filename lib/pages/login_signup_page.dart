import 'package:flutter/material.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({Key? key}) : super(key: key); // Added key parameter

  @override
  LoginSignupPageState createState() => LoginSignupPageState(); // Removed underscore to make it public
}

class LoginSignupPageState extends State<LoginSignupPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? 'Login' : 'Sign-up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            if (isLogin) ..._buildLoginForm(),
            if (!isLogin) ..._buildSignupForm(),
            const  SizedBox(height: 220),
            _buildSocialLoginButtons(),
            _buildToggleLink(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildLoginForm() {
    return [
      const TextField(
        decoration: InputDecoration(labelText: 'Email Address'),
      ),
      const TextField(
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            // Implement forgot password
          },
          child: const Text('Forgot Password?'),
        ),
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          // Implement login logic
          Navigator.pushNamed(context, '/home');
        },
        child: const Text('Login'),
      ),
    ];
  }

  List<Widget> _buildSignupForm() {
    return [
      const TextField(
        decoration: InputDecoration(labelText: 'Full Name'),
      ),
      const TextField(
        decoration: InputDecoration(labelText: 'Email Address'),
      ),
      const TextField(
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
      ),
      const TextField(
        decoration: InputDecoration(labelText: 'Confirm Password'),
        obscureText: true,
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          // Implement sign-up logic
          Navigator.pushNamed(context, '/home'); //to be removed so that login login can be implemented
        },
        child: const Text('Sign-up'),
      ),
    ];
  }

  Widget _buildSocialLoginButtons() {
    return Column(
      children: <Widget>[
        ElevatedButton.icon(
          onPressed: () {
            // Implement Google login
          },
          icon: const Icon(Icons.login),
          label: const Text('Sign in with Google'),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Implement Facebook login
          },
          icon: const Icon(Icons.login),
          label: const Text('Sign in with Facebook'),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Implement Github login
          },
          icon: const Icon(Icons.login),
          label: const Text('Sign in with Github'),
        ),
      ],
    );
  }

  Widget _buildToggleLink() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin
          ? "Don't have an account? Sign up here!"
          : "Already have an account? Login here!"),
    );
  }
}
