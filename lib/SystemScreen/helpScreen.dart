import 'package:flutter/material.dart';

import '../component/color.dart';
import '../screen/addToCartScreen.dart';


class HelpPage extends StatefulWidget {
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appbarColor,
        toolbarHeight: 70,
        // centerTitle: true,
        title: Text(
          "Help",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'montserrat',
            // color: Colors.grey[600]
          ),
        ),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            _buildSectionTitle('FAQs (Frequently Asked Questions)'),
            _buildFAQItem(
              'How do I place an order?',
              'Tap on the desired product. Select the size, color, and quantity. Click on "Add to Cart" and proceed to checkout.',
            ),
            _buildFAQItem(
              'How can I track my order?',
              'Go to the "My Orders" section in the app. Find your order and click on "Track Order" to see the status.',
            ),
            _buildFAQItem(
              'What payment methods are accepted?',
              'We accept various payment methods, including credit/debit cards, PayPal, and more. You can view all available options during checkout.',
            ),
            _buildFAQItem(
              'What is your return policy?',
              'We offer a hassle-free return policy within [number of days] days of delivery. Please refer to our "Returns & Refunds" page for detailed instructions.',
            ),
            SizedBox(height: 20.0),
            _buildSectionTitle('Contact Us'),
            _buildContactInfo(
              'zafran.mart@email.com',
              '+1 234 567 890',
              '24 hours service',
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.0),
        Text(answer),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildContactInfo(String email, String phoneNumber, String hours) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email: $email',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Phone: $phoneNumber',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('Hours: $hours'),
        SizedBox(height: 10.0),
      ],
    );
  }
}
