/*
APLICACIONES Móvil.
Nombres y Apellidos: Winter Aníbal Meza Jiménez.
Curso: Séptimo "A" 2022(2).
Práctica Guiada 2: Cómo obtener datos de Internet.
Fecha: Domingo, 22 de octubre de 2022.
Docente: Ing. Edgardo Panchana Flores, Mg.
 */
package com.example.android.marsphotos.network
// Importamos las librerías necesarias.
import com.squareup.moshi.Json

// Esta clase de datos define una foto de Marte que incluye una identificación y la URL de la imagen.
// Moshi utiliza los nombres de propiedad de esta clase de datos para hacer coincidir los nombres
// de los valores en JSON.
class MarsPhoto {
    data class MarsPhoto(
        val id: String,
        // Se utiliza para asignar img_src de JSON a imgSrcUrl en nuestra clase.
        @Json(name = "img_src") val imgSrcUrl: String
    )
}