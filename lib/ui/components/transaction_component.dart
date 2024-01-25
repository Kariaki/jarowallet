import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jarowallet/core/config/icons.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/data/enum/enums.dart';
import 'package:jarowallet/data/model/transaction_model.dart';

class TransactionComponent extends StatelessWidget {
  final TransactionModel transactionModel;

  const TransactionComponent({super.key, required this.transactionModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFF2F2F2)),
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x141C2731),
            blurRadius: 6,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transaction ID: ${transactionModel.transactionId.toString().substring(4,9)}',
                style: const TextStyle(
                  color: Color(0xFF2B2A29),
                  fontSize: 14,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '23/10/2022 | 9:00 AM',
                style: const TextStyle(
                  color: Color(0xFFBDBDBD),
                  fontSize: 12,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: iconBackground(),
            title: Text(
              'Top-Up',
              style: TextStyle(
                color: Color(0xFF2B2A29),
                fontSize: 14,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            subtitle: Text(
              'Credit',
              style: TextStyle(
                color: Color(0xFF667398),
                fontSize: 14,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Amount',
              style: TextStyle(
                color: Color(0xFF828282),
                fontSize: 14,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
                height: 0.10,
              ),
            ),
            contentPadding: EdgeInsets.all(0),
            subtitle: Text(
              '₦ ${transactionModel.amount.toString()}',
              style: const TextStyle(
                color: Color(0xFF2B2A29),
                fontSize: 16,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: transactionStatus(transactionModel.status),
          )
        ],
      ),
    );
  }

  Widget iconBackground() {
    return Container(
      width: 35,
      height: 35,
      padding: EdgeInsets.all(5),
      decoration: const ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(width: 1, color: Color(0xFFD12B2F)),
        ),
      ),
      child: AppIcon.walletCreditCardIcon,
    );
  }

  Widget transactionStatus(TransactionStatus status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: ShapeDecoration(
        color: status == TransactionStatus.success
            ? Color(0x334C956C)
            : Color(0x33D12B2F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Successful',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: status == TransactionStatus.success
              ? Color(0xFF4C956C)
              : Color(0xFFD12B2F),
          fontSize: 14,
          fontFamily: 'Work Sans',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
