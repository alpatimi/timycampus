import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // =========================
    // UKURAN RESPONSIVE
    // =========================
    final cardMargin = screenWidth * 0.06;
    final cardPadding = screenWidth * 0.06;

    return Scaffold(
      body: Stack(
        children: [
          // =========================
          // BACKGROUND
          // =========================
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // =========================
          // CONTENT
          // =========================
          SafeArea(
            child: Column(
              children: [
                // =========================
                // LOGO
                // =========================
                const SizedBox(height: 75),

                Image.asset(
                  'assets/images/Logo.png',
                  width: screenWidth * 0.34,
                ),

                const SizedBox(height: 30),

                // =========================
                // WHITE CARD
                // =========================
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: cardMargin),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),

                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: cardPadding),

                      child: Column(
                        children: [
                          const SizedBox(height: 30),

                          // =========================
                          // TITLE
                          // =========================
                          ShaderMask(
                            shaderCallback: (bounds) {
                              return const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF4983F6),
                                  Color(0xFFC175F5),
                                  Color(0xFFFBACB7),
                                ],
                              ).createShader(
                                Rect.fromLTWH(
                                  0,
                                  0,
                                  bounds.width,
                                  bounds.height,
                                ),
                              );
                            },
                            child: Text(
                              'Get Started now',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          // =========================
                          // SUBTITLE
                          // =========================
                          Text(
                            'Create an account or login to explore our app',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w100,
                              fontSize: 12,
                              color: Color(0xFF6B7280),
                            ),
                          ),

                          const SizedBox(height: 28),

                          // =========================
                          // GOOGLE BUTTON
                          // =========================
                          SizedBox(
                            width: double.infinity,
                            height: screenWidth * 0.115,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                side: BorderSide(color: Colors.grey.shade200),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/google.png',
                                    width: screenWidth * 0.045,
                                    height: screenWidth * 0.045,
                                  ),

                                  const SizedBox(width: 12),

                                  Text(
                                    'Sign in with Google',
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 14),

                          // =========================
                          // FACEBOOK BUTTON
                          // =========================
                          SizedBox(
                            width: double.infinity,
                            height: screenWidth * 0.115,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                side: BorderSide(color: Colors.grey.shade200),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/facebook.png',
                                    width: screenWidth * 0.045,
                                    height: screenWidth * 0.045,
                                  ),

                                  const SizedBox(width: 12),

                                  Text(
                                    'Sign in with Facebook',
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 22),

                          // =========================
                          // OR
                          // =========================
                          Row(
                            children: [
                              Expanded(
                                child: Divider(color: Colors.grey.shade200),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Text(
                                  'Or',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.030,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Divider(color: Colors.grey.shade200),
                              ),
                            ],
                          ),

                          const SizedBox(height: 22),

                          // =========================
                          // EMAIL LABEL
                          // =========================
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w200,
                                fontSize: 16,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ),

                          const SizedBox(height: 7),

                          // =========================
                          // EMAIL FIELD
                          // =========================
                          SizedBox(
                            height: screenWidth * 0.115,
                            child: TextField(
                              style: TextStyle(fontSize: screenWidth * 0.035),
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                                hintStyle: TextStyle(
                                  fontSize: screenWidth * 0.030,
                                  color: Colors.grey.shade400,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                          // =========================
                          // PASSWORD LABEL
                          // =========================
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w200,
                                fontSize: 16,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ),

                          const SizedBox(height: 7),

                          // =========================
                          // PASSWORD FIELD
                          // =========================
                          SizedBox(
                            height: screenWidth * 0.115,
                            child: TextField(
                              obscureText: true,
                              style: TextStyle(fontSize: screenWidth * 0.035),
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(
                                  fontSize: screenWidth * 0.030,
                                  color: Colors.grey.shade400,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                suffixIcon: Icon(
                                  Icons.visibility_off_outlined,
                                  size: screenWidth * 0.050,
                                  color: Colors.grey.shade400,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // =========================
                          // REMEMBER + FORGOT
                          // =========================
                          Row(
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                  side: BorderSide(color: Colors.grey.shade500),
                                ),
                              ),

                              const SizedBox(width: 5),

                              Text(
                                'Remember me',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.027,
                                  color: Colors.grey.shade600,
                                ),
                              ),

                              const Spacer(),

                              Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.027,
                                  color: Colors.blue.shade600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // =========================
                          // LOGIN BUTTON
                          // =========================
                          SizedBox(
                            width: double.infinity,
                            height: screenWidth * 0.115,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3270E9),
                                elevation: 0,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                              ),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.032,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // =========================
                          // SIGN UP
                          // =========================
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),

                              const SizedBox(width: 5),

                              Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue.shade600,

                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
