
import 'package:expense_tracker_app/utils/generate_transaction_id.dart';

class TransactionModel {
  final String id;
  final bool isExpense;
  final String category;
  final String description;
  final double amount;
  final DateTime dateTime;
  final String paymentMode;

  TransactionModel({
 
    String? id,
    required this.isExpense,
    required this.category,
    required this.description,
    required this.amount,
    required this.dateTime,
    required this.paymentMode,
  }) : id = id ?? GenerateTransactionID.generateTransactionId();

  
   // Convert TransactionModel object to Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isExpense': isExpense ? 1 : 0,
      'category': category,
      'description': description,
      'amount': amount,
      'dateTime': dateTime.toIso8601String(),
      'paymentMode': paymentMode,
    };
  }

  // Create a TransactionModel object from a Map
  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      isExpense: map['isExpense'] == 1,
      category: map['category'],
      description: map['description'],
      amount: map['amount'],
      dateTime: DateTime.parse(map['dateTime']),
      paymentMode: map['paymentMode'],
    );
  }
}

