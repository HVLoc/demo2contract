import 'package:e_contract/modules/modules_src.dart';
import 'package:e_contract/routes/pages.dart';
import 'package:e_contract/shares/shares_src.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo Contract',
      getPages: RoutePage.route,
      home: const TwoButtonView(),
    );
  }
}

class TwoButtonView extends StatelessWidget {
  const TwoButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                ContractModules.gotoDocumentManagement(
                  token: "accsess_token",
                );
              },
              child: const Text('Tất cả công việc'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                ContractModules.gotoDocumentsHandle(
                  token: "accsess_token",
                  status: DocumentsManagementConst.listUnprocessed,
                );
              },
              child: const Text('Chưa xử lý'),
            ),
          ],
        ),
      ),
    );
  }
}
