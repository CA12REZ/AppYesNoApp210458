import 'package:flutter/material.dart';
import 'package:flutter_yesnoapp/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Obtén la hora actual en formato de 24 horas
    final String time = TimeOfDay.now().format(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Contenedor con el mensaje
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
             message.text,// Aquí puedes reemplazar con el mensaje dinámico
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5), // Espacio entre el mensaje y la hora

        // Fila para mostrar la hora y la palomita de "visto"
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Hora del mensaje
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(width: 5), // Espacio entre la hora y la palomita
            // Palomita de "visto"
            Icon(
              Icons.check_circle,
              size: 18,
              color: const Color.fromARGB(255, 5, 221,
                  12), // Cambiar a verde para mostrar que el mensaje ha sido leído
            ),
          ],
        ),
      ],
    );
  }
}
