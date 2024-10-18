import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//TODO: Add Logic Validation and Register to Supabase

class SignUp extends StatefulWidget {
  const SignUp({super.key, required this.onAuthStateChange});

  final void Function(bool value) onAuthStateChange;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _form = GlobalKey<FormState>();

  bool _rememberMe = false;
  bool _obscureText = true;
  bool _isAuthenticating = false;

  //User Property Variable
  String _emailAddress = '';
  String _phoneNumber = '';
  String _username = '';
  String _password = '';

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _formSubmit() async {
    print('submit');
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }

    _form.currentState!.save();

    print(
        'Email : $_emailAddress \n Password : $_password \n phone: $_phoneNumber \n username: $_username');
    try {
      setState(() {
        _isAuthenticating = true;
      });
      await Supabase.instance.client.auth
          .signUp(email: _emailAddress, password: _password);
      print('Success');
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
                  Icons.person,
                  size: 32,
                ),
                labelText: 'username',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(46),
                ),
              ),
              autocorrect: false,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    value.length <= 5) {
                  return 'Username should be more than 5 characters';
                }
                return null;
              },
              onSaved: (newValue) {
                _username = newValue!;
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
                  Icons.phone,
                  size: 32,
                ),
                labelText: '+62 0000000000',
                prefixText: '+62 ',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(46),
                ),
              ),
              autocorrect: false,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.trim().isEmpty || value.length < 8) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
              onSaved: (newValue) {
                _phoneNumber = '';
                if (newValue!.startsWith('0')) {
                  newValue = newValue.replaceRange(0, 1, '');
                }
                _phoneNumber = '+62 $newValue';
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
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
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
                onPressed: _isAuthenticating ? null : () => _formSubmit(),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 183, 77),
                ),
                child: const Text(
                  'Register',
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
                  'Already Have an Account?  ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: _isAuthenticating
                      ? null
                      : () {
                          widget.onAuthStateChange(true);
                        },
                  child: const Text(
                    'Login',
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
