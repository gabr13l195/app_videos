import 'package:app_clase/models/models.dart';
import 'package:app_clase/supabase_client.dart';

class SupabaseService {
  // Películas
  Future<List<Pelicula>> getPeliculas() async {
    final response = await supabase
        .from('peliculas')
        .select()
        .order('titulo');
    
    return response.map((json) => Pelicula.fromJson(json)).toList();
  }

  Future<Pelicula?> getPeliculaById(int id) async {
    final response = await supabase
        .from('peliculas')
        .select()
        .eq('id', id)
        .single();
    
    return response != null ? Pelicula.fromJson(response) : null;
  }

  // Series
  Future<List<Serie>> getSeries() async {
    final response = await supabase
        .from('series')
        .select()
        .order('titulo');
    
    return response.map((json) => Serie.fromJson(json)).toList();
  }

  Future<Serie?> getSerieById(int id) async {
    final response = await supabase
        .from('series')
        .select()
        .eq('id', id)
        .single();
    
    return response != null ? Serie.fromJson(response) : null;
  }

  // Listas de Reproducción
  Future<List<ListaReproduccion>> getListasReproduccion(String usuarioId) async {
    final response = await supabase
        .from('listas_reproduccion')
        .select()
        .eq('usuario_id', usuarioId)
        .order('nombre');
    
    return response.map((json) => ListaReproduccion.fromJson(json)).toList();
  }

  Future<ListaReproduccion?> getListaReproduccionById(int id) async {
    final response = await supabase
        .from('listas_reproduccion')
        .select()
        .eq('id', id)
        .single();
    
    return response != null ? ListaReproduccion.fromJson(response) : null;
  }

  Future<void> crearListaReproduccion(ListaReproduccion lista) async {
    await supabase.from('listas_reproduccion').insert(lista.toJson());
  }

  Future<void> actualizarListaReproduccion(ListaReproduccion lista) async {
    await supabase
        .from('listas_reproduccion')
        .update(lista.toJson())
        .eq('id', lista.id);
  }

  Future<void> eliminarListaReproduccion(int id) async {
    await supabase
        .from('listas_reproduccion')
        .delete()
        .eq('id', id);
  }

  // Búsqueda
  Future<List<dynamic>> buscarContenido(String query) async {
    final peliculas = await supabase
        .from('peliculas')
        .select()
        .ilike('titulo', '%$query%')
        .order('titulo');

    final series = await supabase
        .from('series')
        .select()
        .ilike('titulo', '%$query%')
        .order('titulo');

    return [
      ...peliculas.map((json) => Pelicula.fromJson(json)),
      ...series.map((json) => Serie.fromJson(json)),
    ];
  }
} 