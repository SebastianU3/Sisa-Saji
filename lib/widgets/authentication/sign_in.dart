import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//TODO: Added Logic Validation and Login to Supabase

class SignIn extends StatefulWidget {
  const SignIn({super.key, required this.onAuthStateChange});

  final void Function(bool value) onAuthStateChange;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _form = GlobalKey<FormState>();

  bool _rememberMe = false;
  bool _obscureText = true;
  bool _isAuthenticating = false;

  String _emailAddress = '';
  String _password = '';

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onSubmit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }

    _form.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });
      await Supabase.instance.client.auth
          .signInWithPassword(email: _emailAddress, password: _password);
    } catch (err) {
      print(err);
    }
    setState(() {
      _isAuthenticating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.zero,
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  size: 32,
                ),
                labelText: 'example@mail.com',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(46),
                ),
              ),
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    !value.contains('@') ||
                    !value.contains('.')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (newValue) {
                _emailAddress = newValue!;
              },
            ),
            const SizedBox(
              //spacing
              height: 5,
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.zero,
                prefixIcon: const Icon(
                  Icons.lock,
                  size: 32,
                ),
                suffixIcon: IconButton(
                  icon: Icon(_obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  onPressed: _toggleVisibility,
                  iconSize: 25,
                ),
                labelText: 'password',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(46),
                ),
              ),
              autocorrect: false,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _obscureText,
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    value.length <= 5) {
                  return 'Password should be more than 5 characters';
                }
                return null;
              },
              onSaved: (newValue) {
                _password = newValue!;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Remember Me',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: _isAuthenticating ? null : () => _onSubmit(),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 183, 77),
                ),
                child: const Text(
                  'Log in',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              //spacing
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t Have Account?  ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: _isAuthenticating
                      ? null
                      : () {
                          widget.onAuthStateChange(false);
                        },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 183, 77),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
