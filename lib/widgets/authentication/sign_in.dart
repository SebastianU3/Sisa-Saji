import 'package:flutter/material.dart';

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

  void _toggleVisibility(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void onSubmit() {}

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
                onPressed: () {},
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
                  onTap: () {
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
