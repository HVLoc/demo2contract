import 'package:e_contract/modules/modules_src.dart';
import 'package:e_contract/routes/pages.dart';
import 'package:e_contract/shares/shares_src.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final botToastBuilder = BotToastInit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo Contract',
      getPages: RoutePage.route,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) {
        Widget toastChild = MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? Container(),
        );
        return botToastBuilder(context, toastChild);
      },
      home: TwoButtonView(),
    );
  }
}

class TwoButtonView extends StatelessWidget {
  TwoButtonView({Key? key}) : super(key: key);
  final LoginModelResponse loginModelResponse = LoginModelResponse(
    accessToken:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsIm9yZ2FuaXphdGlvbklkIjoyLCJ1c2VybmFtZSI6InNkc19hZG1pbiIsImlhdCI6MTc0NTk0NjM0MCwiZXhwIjoyNjkyNjc0MzQwfQ.dmOXChFGoxQCk5ZejttSQHhijbEjo1DI5jQEzgDB7PY',
    userInfo: UserInfo(
        address: "address",
        avatar: "avatar",
        imageSignatures: "imageSignatures",
        defaultSignature: "defaultSignature",
        email: "email",
        id: 2,
        memberOf: [],
        name: 'name',
        phone: "phone",
        status: 1,
        updatedAt: null,
        username: "username",
        identityNumber: "identityNumber"),
  );
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
                    loginModelResponse: loginModelResponse);
              },
              child: const Text('Tất cả công việc'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                ContractModules.gotoDocumentsHandle(
                  loginModelResponse: loginModelResponse,
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
