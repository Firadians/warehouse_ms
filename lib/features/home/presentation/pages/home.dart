// Example for HomePage
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/150', // Replace with the user's profile image URL
            ),
          ),
        ),
        title: Center(
          child: Image.asset(
            'assets/wms_logo.png', // Replace with the path to your app logo
            height: 40,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add your notification action here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Section
              _buildGreetingSection(),
              const SizedBox(height: 20),
              // Summary Cards
              _buildSummaryCards(),
              const SizedBox(height: 20),
              // Quick Actions
              _buildQuickActions(context),
              const SizedBox(height: 20),
              // Recent Activities
              _buildRecentActivities(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGreetingSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome Back, John!',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Admin Keamanan - Gudang 1',
            style: TextStyle(
                color: Color.fromARGB(255, 121, 121, 121), fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSummaryCard(
            'Total Items', '1,200', Icons.inventory, Colors.green),
        _buildSummaryCard('Low Stock', '15', Icons.warning, Colors.orange),
        _buildSummaryCard('Expired', '8', Icons.error, Colors.red),
      ],
    );
  }

  Widget _buildSummaryCard(
      String title, String count, IconData icon, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: TextStyle(
                  fontSize: 20, color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Actions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildQuickActionButton('Add Stock', Icons.add_box, Colors.blue),
              _buildQuickActionButton('Adjustments', Icons.tune, Colors.purple),
              _buildQuickActionButton(
                  'Reports', Icons.bar_chart, Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton(String title, IconData icon, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildRecentActivities() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Activities',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.withOpacity(0.2),
                  child: const Icon(Icons.sync, color: Colors.blue),
                ),
                title: const Text('Stock Adjustment'),
                subtitle: const Text('Adjusted 10 items in Gudang 1'),
                trailing: const Text('2 hrs ago'),
              );
            },
          ),
        ],
      ),
    );
  }
}
