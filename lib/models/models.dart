class Pelicula {
  final int id;
  final String titulo;
  final String imagenUrl;
  final String trailerUrl;
  final String descripcion;
  final String genero;
  final double calificacion;
  final int anio;

  Pelicula({
    required this.id,
    required this.titulo,
    required this.imagenUrl,
    required this.trailerUrl,
    required this.descripcion,
    required this.genero,
    required this.calificacion,
    required this.anio,
  });

  factory Pelicula.fromJson(Map<String, dynamic> json) {
    return Pelicula(
      id: json['id'],
      titulo: json['titulo'],
      imagenUrl: json['imagen_url'],
      trailerUrl: json['trailer_url'],
      descripcion: json['descripcion'],
      genero: json['genero'],
      calificacion: json['calificacion'].toDouble(),
      anio: json['anio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'imagen_url': imagenUrl,
      'trailer_url': trailerUrl,
      'descripcion': descripcion,
      'genero': genero,
      'calificacion': calificacion,
      'anio': anio,
    };
  }
}

class Serie {
  final int id;
  final String titulo;
  final String imagenUrl;
  final String trailerUrl;
  final String descripcion;
  final String genero;
  final double calificacion;
  final int temporadas;
  final int episodios;

  Serie({
    required this.id,
    required this.titulo,
    required this.imagenUrl,
    required this.trailerUrl,
    required this.descripcion,
    required this.genero,
    required this.calificacion,
    required this.temporadas,
    required this.episodios,
  });

  factory Serie.fromJson(Map<String, dynamic> json) {
    return Serie(
      id: json['id'],
      titulo: json['titulo'],
      imagenUrl: json['imagen_url'],
      trailerUrl: json['trailer_url'],
      descripcion: json['descripcion'],
      genero: json['genero'],
      calificacion: json['calificacion'].toDouble(),
      temporadas: json['temporadas'],
      episodios: json['episodios'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'imagen_url': imagenUrl,
      'trailer_url': trailerUrl,
      'descripcion': descripcion,
      'genero': genero,
      'calificacion': calificacion,
      'temporadas': temporadas,
      'episodios': episodios,
    };
  }
}

class ListaReproduccion {
  final int id;
  final String nombre;
  final String usuarioId;
  final List<int> peliculasIds;
  final List<int> seriesIds;

  ListaReproduccion({
    required this.id,
    required this.nombre,
    required this.usuarioId,
    required this.peliculasIds,
    required this.seriesIds,
  });

  factory ListaReproduccion.fromJson(Map<String, dynamic> json) {
    return ListaReproduccion(
      id: json['id'],
      nombre: json['nombre'],
      usuarioId: json['usuario_id'],
      peliculasIds: List<int>.from(json['peliculas_ids']),
      seriesIds: List<int>.from(json['series_ids']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'usuario_id': usuarioId,
      'peliculas_ids': peliculasIds,
      'series_ids': seriesIds,
    };
  }
} 