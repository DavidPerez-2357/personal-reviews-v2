import 'package:flutter/material.dart';

/// Immutable preset for a category: display name (ES), icon and future fields.
class PresetCategory {
  final String displayNameEs;
  final IconData icon;

  const PresetCategory({required this.displayNameEs, required this.icon});
}

/// Centralized map with all preset categories keyed by the existing keys
/// (e.g. 'movie', 'book', 'gamepad', ...). Use `presetCategories[key]` to
/// obtain both the icon and the Spanish display name.
const Map<String, PresetCategory> presetCategories = {
  // Media & entertainment
  'movie': PresetCategory(displayNameEs: 'Películas', icon: Icons.movie),
  'local_movies': PresetCategory(
    displayNameEs: 'Películas',
    icon: Icons.local_movies,
  ),
  'video_library': PresetCategory(
    displayNameEs: 'Vídeos',
    icon: Icons.video_library,
  ),
  'tv': PresetCategory(displayNameEs: 'Televisión', icon: Icons.tv),
  'tv_off': PresetCategory(displayNameEs: 'TV (apagada)', icon: Icons.tv_off),
  'music_note': PresetCategory(displayNameEs: 'Música', icon: Icons.music_note),
  'music_video': PresetCategory(
    displayNameEs: 'Vídeos musicales',
    icon: Icons.music_video,
  ),
  'podcast': PresetCategory(displayNameEs: 'Podcast', icon: Icons.podcasts),
  'radio': PresetCategory(displayNameEs: 'Radio', icon: Icons.radio),
  'gamepad': PresetCategory(
    displayNameEs: 'Videojuegos',
    icon: Icons.sports_esports,
  ),
  'videogame_asset': PresetCategory(
    displayNameEs: 'Juegos',
    icon: Icons.videogame_asset,
  ),

  // Reading & learning
  'book': PresetCategory(displayNameEs: 'Libros', icon: Icons.book),
  'book_online': PresetCategory(
    displayNameEs: 'Libros (online)',
    icon: Icons.book_online,
  ),
  'library_books': PresetCategory(
    displayNameEs: 'Biblioteca',
    icon: Icons.library_books,
  ),
  'school': PresetCategory(displayNameEs: 'Educación', icon: Icons.school),

  // Food & places
  'restaurant': PresetCategory(
    displayNameEs: 'Restaurante',
    icon: Icons.restaurant,
  ),
  'local_dining': PresetCategory(
    displayNameEs: 'Restaurante',
    icon: Icons.local_dining,
  ),
  'local_cafe': PresetCategory(
    displayNameEs: 'Cafetería',
    icon: Icons.local_cafe,
  ),
  'fastfood': PresetCategory(
    displayNameEs: 'Comida rápida',
    icon: Icons.fastfood,
  ),
  'local_bar': PresetCategory(displayNameEs: 'Bar', icon: Icons.local_bar),
  'wine_bar': PresetCategory(
    displayNameEs: 'Bar de vinos',
    icon: Icons.wine_bar,
  ),
  'local_grocery_store': PresetCategory(
    displayNameEs: 'Supermercado',
    icon: Icons.local_grocery_store,
  ),
  'local_florist': PresetCategory(
    displayNameEs: 'Floristería',
    icon: Icons.local_florist,
  ),

  // Travel & transport
  'flight': PresetCategory(displayNameEs: 'Viajes', icon: Icons.flight),
  'hotel': PresetCategory(displayNameEs: 'Hotel', icon: Icons.hotel),
  'directions_car': PresetCategory(
    displayNameEs: 'Coche',
    icon: Icons.directions_car,
  ),
  'directions_bike': PresetCategory(
    displayNameEs: 'Bicicleta',
    icon: Icons.directions_bike,
  ),
  'place': PresetCategory(displayNameEs: 'Lugar', icon: Icons.place),
  'map': PresetCategory(displayNameEs: 'Mapa', icon: Icons.map),

  // Shopping & finance
  'shopping_cart': PresetCategory(
    displayNameEs: 'Compras',
    icon: Icons.shopping_cart,
  ),
  'attach_money': PresetCategory(
    displayNameEs: 'Finanzas',
    icon: Icons.attach_money,
  ),

  // Work & productivity
  'work': PresetCategory(displayNameEs: 'Trabajo', icon: Icons.work),
  'code': PresetCategory(displayNameEs: 'Programación', icon: Icons.code),
  'build': PresetCategory(displayNameEs: 'Bricolaje', icon: Icons.build),
  'laptop': PresetCategory(displayNameEs: 'Ordenador', icon: Icons.laptop),
  'smartphone': PresetCategory(
    displayNameEs: 'Teléfono',
    icon: Icons.smartphone,
  ),

  // Sports & fitness
  'sports_soccer': PresetCategory(
    displayNameEs: 'Fútbol',
    icon: Icons.sports_soccer,
  ),
  'sports_basketball': PresetCategory(
    displayNameEs: 'Baloncesto',
    icon: Icons.sports_basketball,
  ),
  'fitness_center': PresetCategory(
    displayNameEs: 'Gimnasio',
    icon: Icons.fitness_center,
  ),

  // Creativity & tools
  'palette': PresetCategory(displayNameEs: 'Arte', icon: Icons.palette),
  'brush': PresetCategory(displayNameEs: 'Pintura', icon: Icons.brush),
  'camera_alt': PresetCategory(
    displayNameEs: 'Fotografía',
    icon: Icons.camera_alt,
  ),
  'photo': PresetCategory(displayNameEs: 'Fotos', icon: Icons.photo),
  'mic': PresetCategory(displayNameEs: 'Micrófono', icon: Icons.mic),

  // Social & favorites
  'favorite': PresetCategory(displayNameEs: 'Favorito', icon: Icons.favorite),
  'star': PresetCategory(displayNameEs: 'Estrella', icon: Icons.star),
  'emoji_events': PresetCategory(
    displayNameEs: 'Logros',
    icon: Icons.emoji_events,
  ),

  // Misc
  'headset': PresetCategory(displayNameEs: 'Auriculares', icon: Icons.headset),
  'pets': PresetCategory(displayNameEs: 'Mascotas', icon: Icons.pets),
  'health_and_safety': PresetCategory(
    displayNameEs: 'Salud',
    icon: Icons.health_and_safety,
  ),
  'bookmark': PresetCategory(displayNameEs: 'Marcador', icon: Icons.bookmark),
  'search': PresetCategory(displayNameEs: 'Buscar', icon: Icons.search),
  'keyboard': PresetCategory(displayNameEs: 'Teclado', icon: Icons.keyboard),
  'visibility': PresetCategory(
    displayNameEs: 'Visibilidad',
    icon: Icons.visibility,
  ),
  'lock': PresetCategory(displayNameEs: 'Privado', icon: Icons.lock),
  'calendar_today': PresetCategory(
    displayNameEs: 'Calendario',
    icon: Icons.calendar_today,
  ),
};
