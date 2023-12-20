import 'package:flutter/material.dart';


class PremiumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back action
          },
        ),
        actions: [
          // Add more actions if needed
        ],
      ),
      body: Container(
        color: Colors.black12, // Background color for the whole page
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Background color
                ),
                child: Text('GET PREMIUM', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  // Handle get premium action
                },
              ),
            ),
            SubscriptionFeature(text: 'Why choose Premium?'),
            SubscriptionFeature(
              text: 'Get in-depth analytics',
            ),
            // ... Repeat for each feature
            SubscriptionOption(
              title: 'Mini',
              subtitle: 'From ₹20/day',
              // Handle choose plan action
              onTap: () {},
            ),
            SubscriptionOption(
              title: 'Weekly',
              subtitle: 'From ₹80/week',
              onTap: () {},
            ),
            SubscriptionOption(
              title: 'Monthly',
              subtitle: 'From ₹150/month',
              onTap: () {},
            ),
            // ... Add more options as needed
          ],
        ),
      ),
    );
  }
}

class SubscriptionFeature extends StatelessWidget {
  final String text;

  const SubscriptionFeature({
   super.key,
    required this.text,
  }) ;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text ?? ''),
    );
  }
}

class SubscriptionOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SubscriptionOption({
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) ;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green, // Button background color
          ),
          child: Text('Choose plan', style: TextStyle(color: Colors.white)),
          onPressed: onTap,
        ),
      ),
    );
  }
}