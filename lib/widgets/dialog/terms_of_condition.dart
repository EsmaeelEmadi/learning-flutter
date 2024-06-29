import 'package:flutter/material.dart';

class TermOfConditionDialogBuilder extends StatefulWidget {
  const TermOfConditionDialogBuilder({super.key});

  @override
  State<TermOfConditionDialogBuilder> createState() =>
      _TermOfConditionDialogBuilderState();
}

class _TermOfConditionDialogBuilderState
    extends State<TermOfConditionDialogBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Terms of Service",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "1. Acceptance of Terms",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'By accessing and using the RentEase platform ("Service"), you agree to comply with and be bound by the following terms and conditions ("Terms of Service"). Please review these terms carefully. If you do not agree with any of these terms, you are prohibited from using or accessing this site.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                // -- -- -- --
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "2. Description of Service",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'RentEase provides an online platform that connects property owners ("Hosts") with individuals seeking to rent properties ("Renters"). The Service includes property listings, booking, and payment processing.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                // -- -- -- --
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "3. Eligibility",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'You must be at least 18 years old to use the Service. By using the Service, you represent and warrant that you meet this age requirement.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                // -- -- -- --
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "4. User Accounts",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                                text: '• Account Creation:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            TextSpan(
                              text:
                                  ' To access certain features of the Service, you must register for an account. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                              text: '• Account Security:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            TextSpan(
                              text:
                                  ' You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to notify RentEase immediately of any unauthorized use of your account.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // -- -- -- --
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "5. Property Listings",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                                text: '• Listing Accuracy:',
                                style: TextStyle(fontSize: 16)),
                            TextSpan(
                              text:
                                  '  Hosts are responsible for ensuring that their property listings are accurate, up-to-date, and complete. RentEase is not responsible for any inaccuracies in property listings.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                              text: '• Account Security:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            TextSpan(
                              text:
                                  ' You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to notify RentEase immediately of any unauthorized use of your account.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
