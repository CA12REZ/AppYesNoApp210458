import 'package:flutter/material.dart'; // Importa el paquete de Flutter para la construcción de interfaces gráficas.
import 'package:flutter_yesnoapp/config/theme/app_theme.dart'; // Importa el tema de la aplicación desde la carpeta de configuración.
import 'package:flutter_yesnoapp/presentation/providers/chat_provider.dart'; // Importa el proveedor de estado para gestionar el chat.
import 'package:flutter_yesnoapp/presentation/screens/chat/chat_screen.dart'; // Importa la pantalla principal de la aplicación, donde se muestra el chat.
import 'package:provider/provider.dart'; // Importa la librería Provider, utilizada para el manejo del estado de la aplicación.

void main() => runApp(const MyApp()); // Llama al método `runApp` para iniciar la aplicación Flutter.

/// Clase principal de la aplicación que extiende StatelessWidget.
/// Esta clase construye la interfaz de la aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor de la clase MyApp.

  @override
  Widget build(BuildContext context) {
    // `MultiProvider` se utiliza para envolver la aplicación y proporcionar múltiples proveedores de estado.
    return MultiProvider(
      providers: [
        // `ChangeNotifierProvider` es utilizado para crear y gestionar el estado del `ChatProvider`.
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        // Título de la aplicación que aparece en la barra de título del sistema.
        title: 'YES NO APP',
        
        // Evita mostrar el banner de depuración en el entorno de producción.
        debugShowCheckedModeBanner: false,
        
        // Aplica el tema de la aplicación, que es personalizado con el valor del color seleccionado (en este caso, 3).
        theme: AppTheme(selectedColor: 3).theme(),
        
        // Define la pantalla de inicio de la aplicación, que es el `ChatScreen`.
        home: const ChatScreen()
      ),
    );
  }
}
