import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Text(""" 
            JeroPay Privacy Policy
        
        Effective Date: February 15, 2025
        Last Updated: August 13, 2025
        
        JeroPay (“we,” “our,” or “us”) values the privacy of all users (“you,” “your”) who use our services. This Privacy Policy explains how we collect, use, store, and protect your personal data when you access or use JeroPay’s applications, websites, and value-added services. By using JeroPay, you agree to this policy.
        
        
        1. Information We Collect
        
        We collect personal information such as your full name, phone number, email address, and any identity verification documents you provide. We also collect transactional data (such as airtime and data purchases, bill payments, and API usage), device information, location data (where applicable), and customer support interactions. This information helps us deliver, improve, and secure our services.
        
        
        2. How We Collect Information
        
        Information is collected directly from you when you sign up, perform transactions, contact support, or interact with JeroPay’s features. We may also obtain information from trusted third-party service providers, such as payment gateways or identity verification partners, in line with legal requirements.
        
        3. Purpose of Data Collection
        
        We use your data to process transactions, personalize your user experience, detect and prevent fraud, comply with legal obligations, send important account updates, and improve our services. We will never use your personal data for unrelated purposes without your consent.
        
        4. Data Sharing with Third Parties
        
        We may share your data with trusted service providers, such as payment processors, telecommunication partners, and regulatory authorities, only as necessary to provide our services or comply with the law. We do not sell your personal information to advertisers or unrelated third parties.
        
        5. Data Storage and Security
        
        Your data is stored on secure servers with strong encryption and access control measures. We use firewalls, multi-factor authentication, and regular security audits to protect your information against unauthorized access, disclosure, alteration, or destruction.
        
        
        6. Data Retention
        
        We retain your personal data only for as long as necessary to fulfill the purposes stated in this policy or as required by law. After this period, your data will be securely deleted or anonymized.
        
        
        7. Your Rights Under NDPA
        
        You have the right to access, update, correct, or delete your personal information. You may also request a copy of the data we hold about you, object to processing, or withdraw consent where applicable, in line with the Nigeria Data Protection Act 2023.
        
        
        8. Cookies and Tracking
        
        We may use cookies, web beacons, and similar technologies to remember your preferences, enhance performance, and analyze how you use our platform. You can manage cookie settings in your browser, though disabling them may affect certain features.
        
        
        
        9. Marketing Communications and No Spam
        
        We will only send you marketing messages if you have consented. All promotional emails or SMS will include an option to unsubscribe. We will never spam you, sell your contact details, or send irrelevant messages.
        
        
        10. User Conduct and Privacy Protection
        
        You must not use JeroPay to engage in illegal activities, harassment, spamming, or unauthorized data collection. Any abuse of our platform that compromises the privacy of others will lead to account suspension and possible legal action.
        
        
        
        11. Children’s Privacy
        
        JeroPay is not intended for users under 18 years old. We do not knowingly collect information from minors. If we discover that a child has provided us with personal information, we will delete it immediately.
        
        
        
        12. Cross-Border Data Transfers
        
        Where necessary, your information may be transferred to and processed in countries outside Nigeria. Such transfers will only occur with adequate safeguards in line with NDPA requirements.
        
        
        13. Data Breach Notification
        
        In the event of a data breach that may harm your rights or freedoms, we will notify you and the relevant authorities promptly, as required by law.
        
        
        
        14. Third-Party Links and Services
        
        Our platform may contain links to external websites or services. We are not responsible for the privacy practices or content of those third parties. We encourage you to read their privacy policies before providing any personal data.
        
        
        
        15. Changes to This Policy
        
        We may update this Privacy Policy to reflect changes in technology, law, or our business practices. We will notify you of significant updates through email, app notifications, or our website. Continued use of JeroPay after such updates means you accept the revised policy.
        
        
        
        16. Complaints and Dispute Resolution
        
        If you believe your privacy rights have been violated, you may contact our Data Protection Officer at info@jeropay.com.ng or call 07013715767. If unresolved, you may lodge a complaint with the Nigeria Data Protection Commission (NDPC).
        
        
        
        17. Contact Information
        
        If you have any questions about this Privacy Policy or our data handling practices, contact us at:
        JeroPay
        Support Email: info@jeropay.com.ng
        Phone: 07013715767
        Location: Port Harcourt, Rivers State, Nigeria
             """),
            ],
          ),
        ),
      ),
    );
  }
}