import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension IntExtensions on int {
  Widget spaceWidth() {
    return SizedBox(
      width: toDouble(),
    );
  }

  Widget spaceHeight() {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget divide({double thickness = 1}) {
    return Divider(
      color: Colors.black26,
      thickness: thickness,
      indent: 2,
      height: toDouble(),
    );
  }
}

extension DoubleExtensions on double {
  Widget spaceWidth() {
    return SizedBox(
      width: this,
    );
  }

  Widget divide({double thickness = 1}) {
    return Divider(
      height: toDouble(),
      thickness: thickness,
    );
  }

  Widget spaceHeight() {
    return SizedBox(
      height: this,
    );
  }
}

extension StringExtension on String {
  String toLocalString() {
    NumberFormat numberFormat = NumberFormat.decimalPattern('en_US');

    // Format the number using the NumberFormat instance
    String formattedNumber = numberFormat.format(this);
    return formattedNumber;
  }
}

extension ContextExtensions on BuildContext {
  void push(Widget route) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => route));
  }

  void pop() {
    Navigator.pop(this);
  }

  void pushRemoveUntil(Widget route) {
    Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(builder: (context) => route),
        (Route<dynamic> route) => false);
  }

  //
  void showSnackbar(String message, {bool error = false}) {
    if (error) {
      final errorSnack = SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        margin: EdgeInsets.only(top: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      );
      ScaffoldMessenger.of(this).showSnackBar(errorSnack);
      return;
    }
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  //
  void showSnackbarSuccess(String message, {bool success = false}) {
    if (success) {
      final successSnack = SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      );
      ScaffoldMessenger.of(this).showSnackBar(successSnack);
      return;
    }
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  // void showModalMax(Widget modal,
  //     {bool transparent = false, bool dismissible = true}) {
  //   final mediaQueryData = MediaQuery.of(this).size;
  //   const radius = Radius.circular(Dimens.modalRadius);
  //   showModalBottomSheet(
  //       isDismissible: dismissible,
  //       backgroundColor: transparent ? Colors.transparent : Colors.white,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(topRight: radius, topLeft: radius)),
  //       context: this,
  //       constraints: BoxConstraints(
  //         minWidth: mediaQueryData.height,
  //       ),
  //       builder: (context) => modal);
  // }
  //
  // void showModal(Widget modal) {
  //   final mediaQueryData = MediaQuery.of(this).size;
  //   final radius = Radius.circular(Dimens.modalRadius);
  //   showModalBottomSheet(
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(Dimens.modalRadius)),
  //       context: this,
  //       constraints: BoxConstraints(maxHeight: mediaQueryData.height),
  //       builder: (context) => modal);
  // }

  void displayDialog(Widget modal, {bool dismissible = true}) {
    showDialog(
      barrierDismissible: dismissible,
      context: this,
      builder: (context) => AppDialog(
        child: modal,
      ),
    );
  }
//
// void pushReplace(Widget route) {
//   Navigator.pushReplacement(
//     this,
//     MaterialPageRoute(builder: (context) => route),
//   );
// }
//
// void displayDialogDismiss(Widget child) {
//   showDialog(
//     context: this,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return AppDialog(
//         child: child,
//       );
//     },
//   );
// }
}

class AppDialog extends Dialog {
  final Widget child;

  const AppDialog({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        alignment: Alignment.center,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: child);
  }
}
