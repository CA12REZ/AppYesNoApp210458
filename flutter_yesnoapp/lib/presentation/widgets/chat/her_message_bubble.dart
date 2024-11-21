import 'package:flutter/material.dart';
import 'package:flutter_yesnoapp/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Obtener la hora actual
    final String time = TimeOfDay.now().format(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contenedor con el mensaje
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text, // Este es el mensaje que puedes cambiar dinámicamente
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),

        // Hora debajo del mensaje
        Text(
          time, // Muestra la hora
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),

        // Fila para la palomita de "visto"
        const SizedBox(height: 5),
        Row(
          children: [
            // Palomita de "visto"
            Icon(
              Icons.check_circle, // Usamos el ícono de palomita
              size: 18,
              color: Colors.grey, // Color del ícono
            ),
          ],
        ),

        const SizedBox(height: 5),

        // Mostrar imagen si es necesario
        _ImageBubble(message.imageUrl!),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(  this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;


          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Enviando imagen...'),
          );
        },
      ),
    );
}
}
