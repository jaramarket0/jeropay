import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(""" 
            Effective Date: February 15, 2025
        Last Updated: July 26, 2025
        
        Welcome to JeroPay! By using our app, you agree to be bound by these Terms and Conditions. Please read them carefully before proceeding. If you do not agree, you should discontinue use immediately.
        
        
        
        1. Eligibility
        
        You must be at least 18 years old and legally capable of entering into binding contracts under Nigerian law. By using JeroPay, you confirm that all information you provide is accurate and up to date.
        
        
        2. Services Offered
        
        JeroPay provides Value-Added Services (VAS) and payment solutions, including airtime, data, cable subscriptions, electricity bills, bulk SMS, education PINs, hotel and travel bookings, and other digital services within Nigeria. All services are subject to availability.
        
        3. User Account Responsibilities
        
        You are responsible for maintaining the confidentiality of your account credentials and for all activities conducted under your account. Any suspicious activity should be reported immediately to info@jeropay.com.ng or 07013715767.
        
        
        4. Prohibited Conduct
        
        You agree not to:
        
        Engage in fraudulent or illegal activities.
        
        Use JeroPay for spamming, hacking, or spreading harmful content.
        
        Misrepresent your identity or payment details.
        
        Interfere with the operation of the app.
        
        
        5. Pricing and Payment
        
        Prices for services are clearly displayed in the app and may change without notice. Payments are processed via secure third-party payment gateways such as Billstack and Monnify.
        
        6. Refund and Dispute Resolution
        
        If you experience a failed transaction:
        
        Report within 48 hours of occurrence.
        
        Provide relevant details (transaction ID, date, service type).
        
        Refunds are processed within 5–10 working days if confirmed as valid.
        
        7. Service Availability
        
        While we strive for uninterrupted services, JeroPay does not guarantee 24/7 uptime due to maintenance, technical issues, or third-party failures.
        
        8. Force Majeure
        
        We are not liable for service interruptions or failures caused by events beyond our control, such as natural disasters, government actions, strikes, cyberattacks, or network outages.
        
        9. Indemnity
        
        You agree to indemnify and hold harmless JeroPay, its directors, employees, and partners from any claims, losses, damages, or expenses arising from your misuse of the platform or violation of these terms.
        
        10. Limitation of Liability
        
        To the maximum extent permitted by law, our liability for any claim shall not exceed the total value of the transaction in dispute.
        
        11. Data Privacy
        
        We process your personal data in compliance with the Nigeria Data Protection Act (NDPA). Your data is used only for service delivery, fraud prevention, and customer support. See our Privacy Policy for details.
        
        
        12. Intellectual Property
        
        All content, trademarks, and software in JeroPay are owned or licensed by us. You may not copy, modify, distribute, or use them without prior written consent.
        
        13. Termination
        
        We may suspend or terminate your account without notice if you breach these terms or engage in unlawful activities.
        
        14. Jurisdiction
        
        These terms are governed by the laws of the Federal Republic of Nigeria. All disputes shall be resolved exclusively in the courts of Rivers State, Nigeria.
        
        15. Changes to Terms
        
        We may update these terms from time to time. Updates will be posted in-app, and continued use after changes implies acceptance.
        
        16. Contact Information
        
        JeroPay Headquarters
        Victory estate, Elelewon, Port Harcourt, Rivers State.
        Email: info@jeropay.com.ng
        Phone: 07013715767
        
        17. Acknowledgment
        
        By using JeroPay, you acknowledge that you have read, understood, and agreed to these Terms and Conditions.
        
             """),
            ],
          ),
        ),
      ),
    );
  }
}
