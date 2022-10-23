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
import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import retrofit2.http.GET
// Base URL Servicio Web.
private const val BASE_URL =
    "https://android-kotlin-fun-mars-server.appspot.com"
// Se Crea el objeto Moshi que usará Retrofit, asegurándose de agregar el adaptador Kotlin para
// tener una compatibilidad total con Kotlin.
private val moshi = Moshi.Builder()
    .add(KotlinJsonAdapterFactory())
    .build()

// Usar el generador de modificaciones para crear un objeto de actualización utilizando
// un convertidor de Moshi con nuestro Moshi objeto.
private val retrofit = Retrofit.Builder()
    .addConverterFactory(MoshiConverterFactory.create(moshi))
    .baseUrl(BASE_URL)
    .build()

// Se crea una interfaz pública que expone el método [getPhotos].
interface MarsApiService {
    @GET("photos")
    suspend fun getPhotos(): List<MarsPhoto>
}

// Se crea un objeto Api público que expone el servicio Retrofit con inicialización diferida.
object MarsApi {
    val retrofitService : MarsApiService by lazy {
        retrofit.create(MarsApiService::class.java) }
}
