import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class DEmailProgressDialog {
  final BuildContext _context;
  ProgressDialog? pd;

  DEmailProgressDialog(this._context) {
    pd = ProgressDialog(context: this._context);
  }

  void show(String message) {
    this.pd?.show(
          max: 100,
          msg: message,
          progressType: ProgressType.normal,
        );
  }

  void hide() {
    this.pd?.close();
  }
}
