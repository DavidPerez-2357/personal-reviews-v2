import 'package:flutter/material.dart';

/// Immutable preset for a category: display name (ES), icon and future fields.
class CategoryIcon {
  final String displayNameEs;
  final IconData icon;

  const CategoryIcon({required this.displayNameEs, required this.icon});
}

/// Centralized map with all preset categories keyed by the existing keys
/// (e.g. 'movie', 'book', 'gamepad', ...). Use `presetCategories[key]` to
/// obtain both the icon and the Spanish display name.
const Map<String, CategoryIcon> presetCategories = {
  // Media & entertainment
  'movie': CategoryIcon(displayNameEs: 'Películas', icon: Icons.movie),
  'local_movies': CategoryIcon(
    displayNameEs: 'Películas',
    icon: Icons.local_movies,
  ),
  'video_library': CategoryIcon(
    displayNameEs: 'Vídeos',
    icon: Icons.video_library,
  ),
  'tv': CategoryIcon(displayNameEs: 'Televisión', icon: Icons.tv),
  'tv_off': CategoryIcon(displayNameEs: 'TV (apagada)', icon: Icons.tv_off),
  'music_note': CategoryIcon(displayNameEs: 'Música', icon: Icons.music_note),
  'music_video': CategoryIcon(
    displayNameEs: 'Vídeos musicales',
    icon: Icons.music_video,
  ),
  'podcast': CategoryIcon(displayNameEs: 'Podcast', icon: Icons.podcasts),
  'radio': CategoryIcon(displayNameEs: 'Radio', icon: Icons.radio),
  'gamepad': CategoryIcon(
    displayNameEs: 'Videojuegos',
    icon: Icons.sports_esports,
  ),
  'videogame_asset': CategoryIcon(
    displayNameEs: 'Juegos',
    icon: Icons.videogame_asset,
  ),

  // Reading & learning
  'book': CategoryIcon(displayNameEs: 'Libros', icon: Icons.book),
  'book_online': CategoryIcon(
    displayNameEs: 'Libros (online)',
    icon: Icons.book_online,
  ),
  'library_books': CategoryIcon(
    displayNameEs: 'Biblioteca',
    icon: Icons.library_books,
  ),
  'school': CategoryIcon(displayNameEs: 'Educación', icon: Icons.school),

  // Food & places
  'restaurant': CategoryIcon(
    displayNameEs: 'Restaurante',
    icon: Icons.restaurant,
  ),
  'local_dining': CategoryIcon(
    displayNameEs: 'Restaurante',
    icon: Icons.local_dining,
  ),
  'local_cafe': CategoryIcon(
    displayNameEs: 'Cafetería',
    icon: Icons.local_cafe,
  ),
  'fastfood': CategoryIcon(
    displayNameEs: 'Comida rápida',
    icon: Icons.fastfood,
  ),
  'local_bar': CategoryIcon(displayNameEs: 'Bar', icon: Icons.local_bar),
  'wine_bar': CategoryIcon(displayNameEs: 'Bar de vinos', icon: Icons.wine_bar),
  'local_grocery_store': CategoryIcon(
    displayNameEs: 'Supermercado',
    icon: Icons.local_grocery_store,
  ),
  'local_florist': CategoryIcon(
    displayNameEs: 'Floristería',
    icon: Icons.local_florist,
  ),

  // Travel & transport
  'flight': CategoryIcon(displayNameEs: 'Viajes', icon: Icons.flight),
  'hotel': CategoryIcon(displayNameEs: 'Hotel', icon: Icons.hotel),
  'directions_car': CategoryIcon(
    displayNameEs: 'Coche',
    icon: Icons.directions_car,
  ),
  'directions_bike': CategoryIcon(
    displayNameEs: 'Bicicleta',
    icon: Icons.directions_bike,
  ),
  'place': CategoryIcon(displayNameEs: 'Lugar', icon: Icons.place),
  'map': CategoryIcon(displayNameEs: 'Mapa', icon: Icons.map),

  // Shopping & finance
  'shopping_cart': CategoryIcon(
    displayNameEs: 'Compras',
    icon: Icons.shopping_cart,
  ),
  'attach_money': CategoryIcon(
    displayNameEs: 'Finanzas',
    icon: Icons.attach_money,
  ),

  // Work & productivity
  'work': CategoryIcon(displayNameEs: 'Trabajo', icon: Icons.work),
  'code': CategoryIcon(displayNameEs: 'Programación', icon: Icons.code),
  'build': CategoryIcon(displayNameEs: 'Bricolaje', icon: Icons.build),
  'laptop': CategoryIcon(displayNameEs: 'Ordenador', icon: Icons.laptop),
  'smartphone': CategoryIcon(displayNameEs: 'Teléfono', icon: Icons.smartphone),

  // Sports & fitness
  'sports_soccer': CategoryIcon(
    displayNameEs: 'Fútbol',
    icon: Icons.sports_soccer,
  ),
  'sports_basketball': CategoryIcon(
    displayNameEs: 'Baloncesto',
    icon: Icons.sports_basketball,
  ),
  'fitness_center': CategoryIcon(
    displayNameEs: 'Gimnasio',
    icon: Icons.fitness_center,
  ),

  // Creativity & tools
  'palette': CategoryIcon(displayNameEs: 'Arte', icon: Icons.palette),
  'brush': CategoryIcon(displayNameEs: 'Pintura', icon: Icons.brush),
  'camera_alt': CategoryIcon(
    displayNameEs: 'Fotografía',
    icon: Icons.camera_alt,
  ),
  'photo': CategoryIcon(displayNameEs: 'Fotos', icon: Icons.photo),
  'mic': CategoryIcon(displayNameEs: 'Micrófono', icon: Icons.mic),

  // Social & favorites
  'favorite': CategoryIcon(displayNameEs: 'Favorito', icon: Icons.favorite),
  'star': CategoryIcon(displayNameEs: 'Estrella', icon: Icons.star),
  'emoji_events': CategoryIcon(
    displayNameEs: 'Logros',
    icon: Icons.emoji_events,
  ),

  // Misc
  'headset': CategoryIcon(displayNameEs: 'Auriculares', icon: Icons.headset),
  'pets': CategoryIcon(displayNameEs: 'Mascotas', icon: Icons.pets),
  'health_and_safety': CategoryIcon(
    displayNameEs: 'Salud',
    icon: Icons.health_and_safety,
  ),
  'bookmark': CategoryIcon(displayNameEs: 'Marcador', icon: Icons.bookmark),
  'search': CategoryIcon(displayNameEs: 'Buscar', icon: Icons.search),
  'keyboard': CategoryIcon(displayNameEs: 'Teclado', icon: Icons.keyboard),
  'visibility': CategoryIcon(
    displayNameEs: 'Visibilidad',
    icon: Icons.visibility,
  ),
  'lock': CategoryIcon(displayNameEs: 'Privado', icon: Icons.lock),
  'calendar_today': CategoryIcon(
    displayNameEs: 'Calendario',
    icon: Icons.calendar_today,
  ),
};

// Functions to get icons
CategoryIcon getCategoryIcon(String key) {
  return presetCategories[key] ??
      CategoryIcon(displayNameEs: 'Categoría', icon: Icons.category);
}

IconData getCategoryIconData(String key) {
  return presetCategories[key]?.icon ?? Icons.category;
}
