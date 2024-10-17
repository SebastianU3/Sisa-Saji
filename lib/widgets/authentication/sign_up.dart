import 'package:flutter/material.dart';

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

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
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
                  onTap: () {
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
