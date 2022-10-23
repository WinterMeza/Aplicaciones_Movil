/*
APLICACIONES Móvil.
Nombres y Apellidos: Winter Aníbal Meza Jiménez.
Curso: Séptimo "A" 2022(2).
Práctica Guiada 2: Cómo obtener datos de Internet.
Fecha: Domingo, 22 de octubre de 2022.
Docente: Ing. Edgardo Panchana Flores, Mg.
 */
package com.example.android.marsphotos.overview
// Importamos las librerías necesarias.
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.android.marsphotos.network.MarsApi
import kotlinx.coroutines.launch

/**
 * El [ViewModel] que se adjunta al [OverviewFragment].
 */
class OverviewViewModel : ViewModel() {

    // El MutableLiveData interno que almacena el estado de la solicitud más reciente.
    private val _status = MutableLiveData<String>()

    // El LiveData inmutable externo para el estado de la solicitud.
    val status: LiveData<String> = _status

    // Llamar a getMarsPhotos() en init para que podamos mostrar el estado inmediatamente.
    init {
        getMarsPhotos()
    }

    // Obtiene información de fotos de Mars del servicio Mars API Retrofit y actualiza el
    // [MarsPhoto] [Lista] [LiveData].
    private fun getMarsPhotos() {
        viewModelScope.launch {
            try {
                val listResult = MarsApi.retrofitService.getPhotos()
                _status.value = "Success: ${listResult.size} Mars photos retrieved"
            } catch (e: Exception) {
                _status.value = "Failure: ${e.message}"
            }
        }
    }
}