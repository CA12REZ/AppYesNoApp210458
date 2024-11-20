import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

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
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Buenos Días',  // Este es el mensaje que puedes cambiar dinámicamente
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        
        // Hora debajo del mensaje
        Text(
          time,  // Muestra la hora
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        
        // Fila para la palomita de "visto"
        const SizedBox(height: 5),
        Row(
          children: [
            // Palomita de "visto"
            Icon(
              Icons.check_circle,  // Usamos el ícono de palomita
              size: 18,
              color: Colors.grey,  // Color del ícono
            ),
          ],
        ),
        
        const SizedBox(height: 10),
        
        // Mostrar imagen si es necesario
        _ImageBubble(),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://yesno.wtf/assets/no/7-331da2464250a1459cd7d41715e1f67d.gif",
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Enviando imagen'),
          );
        },
      ),
    );
  }
}
