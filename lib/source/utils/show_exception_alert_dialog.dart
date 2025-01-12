part of 'alert_dialogs.dart';

Future<void> showExceptionAlertDialog({
  required BuildContext context,
  required String title,
  required dynamic exception,
}) =>
    showAlertDialog(
      context: context,
      title: title,
      content: _message(exception),
      defaultActionText: 'OK',
    );

String _message(dynamic exception) {
  if (exception is Exception) {
    return exception.toString();
  }
  if (exception is Exception) {
    return exception.toString();
  }
  return exception.toString();
}
