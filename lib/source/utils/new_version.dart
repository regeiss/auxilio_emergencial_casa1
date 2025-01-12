// void versionCheck() async {
//     final NewVersion newVersion = NewVersion(context: context);
//     VersionStatus versionStatus = await newVersion.getVersionStatus();
//     if (versionStatus != null && versionStatus.canUpdate) {
//       await ConfirmDialog(
//           context: context,
//           title: 'Update Available',
//           body: Text('A new version, ${versionStatus.storeVersion}, is available.'),
//           acceptButton: 'Update Now',
//           cancelButton: 'Update Later'
//       ).then((ConfirmAction res) async {
//         if (res == ConfirmAction.CONFIRM && await canLaunch(versionStatus.appStoreLink)) {
//           await launch(versionStatus.appStoreLink, forceWebView: false);
//         }
//       });
//     }
//   }....