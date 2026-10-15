import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'How can we help you today?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.phone_outlined, color: Colors.green),
                  title: const Text('Call Customer Care'),
                  subtitle: const Text('+880 1234 567890'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.chat_bubble_outline, color: Colors.green),
                  title: const Text('Live Chat Support'),
                  subtitle: const Text('Chat with our support team'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.email_outlined, color: Colors.green),
                  title: const Text('Email Us'),
                  subtitle: const Text('support@kachabazaar.com'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ExpansionTile(
            title: const Text('What is the delivery time?'),
            children: const [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('We deliver your daily needs within 30 minutes of order placement.'),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('What are the payment methods?'),
            children: const [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('We accept Cash on Delivery, bKash, Nagad, and credit/debit cards.'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
