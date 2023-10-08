// expense 지출비용에 대한 모델이 어떻게 생겼는가에 대한 커스텀 클래스

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

enum Category { food, leisure, work, travel }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.leisure: Icons.sports_baseball,
  Category.work: Icons.work_history,
  Category.travel: Icons.card_travel,
};

Uuid uuid = const Uuid();

class Expense {
  Expense(
      {required this.category,
      required this.title,
      required this.amount,
      required this.date})
      : id = uuid.v4();

  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category;

  String getFormattedDate() {
    return formatter.format(date);
  }
}
// Expense라는 클래스의 설계도로, Expense 클래스를 쓰려면 이렇게 써라 하고 정의한 것
// 여기에는 생성자(쓸때 리콰이어먼트, 변수명,

class ExpenseBucket {
  ExpenseBucket({required this.expenses, required this.category});
  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
      : expenses = allExpense.where((e) => e.category == category).toList();

  final List<Expense> expenses;
  final Category category;

  double getCategorySum() {
    double sum = 0;
    for (final expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}
