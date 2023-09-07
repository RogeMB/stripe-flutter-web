import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: const Color.fromARGB(139, 0, 23, 66),
    useSafeArea: true,
    //traversalEdgeBehavior: TraversalEdgeBehavior.leaveFlutterView,
    barrierDismissible:
        false, //* This makes the dialog non-dismissible if the user taps outside it.
    builder: (_) => AlertDialog.adaptive(
      title: const Text('Please wait...'),
      content: LinearProgressIndicator(
        backgroundColor: Colors.amber.shade600,
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(20)),
        minHeight: 5,
      ),
    ),
  );
}

showError(
  BuildContext context, {
  required String title,
  required String message,
}) {
  showDialog(
    context: context,
    barrierColor: const Color.fromARGB(139, 0, 23, 66),
    useSafeArea: true,
    //traversalEdgeBehavior: TraversalEdgeBehavior.leaveFlutterView,
    barrierDismissible:
        false, //* This makes the dialog non-dismissible if the user taps outside it.
    builder: (_) => AlertDialog.adaptive(
      title: Text(title),
      content: Text(message),
      actions: [
        MaterialButton(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          autofocus: true,
          color: Colors.white24,
          shape: const StadiumBorder(),
          onPressed: () => Navigator.pop(context),
          child: const Text('Ok'),
        )
      ],
    ),
  );
}
