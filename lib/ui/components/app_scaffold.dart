import 'package:flutter/material.dart';
import 'package:jarowallet/ui/components/button.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final String? primaryButtonText;
  final Widget child;
  final void Function()? onPrimaryButtonPressed;
  final void Function()? onBackPressed;

  const AppScaffold(
      {super.key,
      this.title,
      this.onBackPressed,
      this.primaryButtonText,
      this.onPrimaryButtonPressed,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title == null
          ? null
          : AppBar(
              title: Text(title!),
              centerTitle: false,
              automaticallyImplyLeading: false,
              leading: BackButton(
                onPressed: onBackPressed,
                color: Colors.black,
              ),
              titleTextStyle: const TextStyle(
                color: Color(0xFF2B2A29),
                fontSize: 24,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
      body: Padding(
        padding: EdgeInsets.only(
            left: 15, right: 15, bottom: 10, top: title == null ? 50 : 10),
        child: primaryButtonText == null
            ? child
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  child,
                  PrimaryButton(
                    buttonText: primaryButtonText ?? '',
                    onPressed: onPrimaryButtonPressed,
                  )
                ],
              ),
      ),
    );
  }
}
