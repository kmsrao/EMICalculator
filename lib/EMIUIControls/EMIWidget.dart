import 'dart:math';
import 'package:flutter/material.dart';
import 'ColumnWidget.dart';
import 'ResultWidget.dart';

class EMIWidget extends StatefulWidget {
  const EMIWidget({super.key});

  @override
  EMIScreenState createState() => EMIScreenState();
}

class EMIScreenState extends State<EMIWidget> {
  final loanAmountController = TextEditingController();
  final interestRateController = TextEditingController();
  final tenureController = TextEditingController();
  final loanEMIController = TextEditingController();
  final interestPayableController = TextEditingController();
  final totalAmountController = TextEditingController();

  @override
  void dispose() {
    loanAmountController.dispose();
    interestRateController.dispose();
    tenureController.dispose();
    loanEMIController.dispose();
    interestPayableController.dispose();
    totalAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ColumnWidget(labelText: 'Loan Amount', controller: loanAmountController,min:0,max:5000000, maxLength:6 ,),
          ColumnWidget(labelText: 'Interest Rate', controller: interestRateController,min:0,max:30, maxLength:2 ,),
          ColumnWidget(labelText: 'Tenure in months', controller: tenureController,min:0,max:240, maxLength:3, ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: _calculateEMI,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blue[700], // Text color
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            child: const Text(
              'Calculate',
              style: TextStyle(color: Colors.white), // Text color
            ),
          ),
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(20),
            color: Colors.blueGrey,
            child: SizedBox(
              height: 150, // Fixed height for the Card
              child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ResultWidget(label: 'Loan EMI', value: loanEMIController.text),
                      const SizedBox(height: 10),
                      ResultWidget(label: 'Interest Payable', value: interestPayableController.text),
                      const SizedBox(height: 10),
                      ResultWidget(label: 'Total Amount', value: totalAmountController.text),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _calculateEMI() {
    final double loanAmount = double.tryParse(loanAmountController.text) ?? 0.0;
    final double interestRate = double.tryParse(interestRateController.text) ?? 0.0;
    final double tenure = double.tryParse(tenureController.text) ?? 0.0;

    if (loanAmount > 0 && interestRate > 0 && tenure > 0) {
      final double monthlyInterestRate = interestRate / 12 / 100;
      final int totalMonths = (tenure * 12).toInt();
      final double emi = (loanAmount * monthlyInterestRate * pow(1 + monthlyInterestRate, totalMonths)) /
          (pow(1 + monthlyInterestRate, totalMonths) - 1);
      final double totalInterestPayable = emi * totalMonths - loanAmount;
      final double totalAmount = loanAmount + totalInterestPayable;
      setState(() {
        loanEMIController.text = emi.toStringAsFixed(0);
        interestPayableController.text = totalInterestPayable.toStringAsFixed(0);
        totalAmountController.text = totalAmount.toStringAsFixed(0);
      });
    }
  }
}
