/* void main() {
  const FlutterSecureStorage();
  setUp(() async {
    FlutterSecureStorage.setMockInitialValues({});

    Get.testMode = true;
    String env = ".env.development";
    await dotenv.load(fileName: env);
    Get.put(UserController());
  });

  group('Secure_Storage_LoginScreen', () {
    test("Prueba de almacenamiento de llave valor en el storage", () async {
      final SecureStorageMethods storage = SecureStorageMethods();

      expect(await storage.existsEmailStorage("david"), false);
      storage.setEmailStorage("david");
      expect(await storage.existsEmailStorage("david"), true);
    });

    testWidgets('Encuentra un Widget usando la dependencia go_router',
        (WidgetTester tester) async {
      final svgPictureImage = find.byType(SvgPicture);
      final buttonPrimary = find.byType(ButtonPrimary);
      final buttonSecondary = find.byType(ButtonSecondary);

      await tester.pumpWidget(MaterialApp.router(routerConfig: appRouter,));

      appRouter.go("/viewLegalRepresent");
      await tester.pumpAndSettle();
      expect(find.text('Bienvenido'), findsOneWidget);
      expect(find.text('Podrás crear usuarios para tu equipo de \ntrabajo, activarlos, inactivarlos y editarlos'), findsOneWidget);
      expect(find.text('Si eres la unica persona que gestionara pagos \nno necesitas crear usuarios'), findsOneWidget);
      expect(svgPictureImage, findsOneWidget);
      expect(buttonPrimary, findsOneWidget);
      expect(buttonSecondary, findsOneWidget);
    });

    testWidgets('Busquedas en la pantalla del view_legal_represent',
        (WidgetTester tester) async {
      
      final buttonSecondary = find.byType(ButtonSecondary);

      await tester.pumpWidget(MaterialApp.router(routerConfig: appRouter,));

      appRouter.go("/viewLegalRepresent");
      await tester.pumpAndSettle();

      expect(find.text("Omitir"), findsOneWidget);
      await tester.tap(buttonSecondary);
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('Prueba con el login y la pantalla del representante legal',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp.router(routerConfig: appRouter,));

      appRouter.go("/login");
      const MaterialApp(home: LoginScreen(isForgetPassword: false));

      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key("email")), "adminPortal");
      await tester.enterText(find.byKey(const Key("password")), "Colombia.1");

      expect(find.text("adminPortal"), findsOneWidget);
      expect(find.text('Colombia.1'), findsOneWidget);

      expect(find.text("Iniciar sesión"), findsOneWidget);
      
      await tester.tap(find.text("Iniciar sesión"));
      appRouter.go("/viewLegalRepresent");

      await tester.pumpAndSettle();

      expect(find.text("Bienvenido"), findsOneWidget);
    });
  });
}
 */