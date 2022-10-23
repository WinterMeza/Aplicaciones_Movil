/*
APLICACIONES Móvil.
Nombres y Apellidos: Winter Aníbal Meza Jiménez.
Curso: Séptimo "A" 2022(2).
Práctica Guiada 2: Cómo obtener datos de Internet.
Fecha: Domingo, 22 de octubre de 2022.
Docente: Ing. Edgardo Panchana Flores, Mg.
 */


package com.example.android.marsphotos.overview

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.android.marsphotos.network.MarsApi
import com.example.android.marsphotos.network.MarsPhoto
import kotlinx.coroutines.launch

enum class MarsApiStatus { LOADING, ERROR, DONE }


// El [ViewModel] que se adjunta al [OverviewFragment].
class OverviewViewModel : ViewModel() {

    // El MutableLiveData interno que almacena el estado de la solicitud más reciente.
    private val _status = MutableLiveData<MarsApiStatus>()

    // El LiveData inmutable externo para el estado de la solicitud.
    val status: LiveData<MarsApiStatus> = _status

    // Internamente, usamos MutableLiveData, porque actualizaremos la Lista de MarsPhoto
    // con nuevos valores
    private val _photos = MutableLiveData<List<MarsPhoto>>()

    // La interfaz LiveData externa a la propiedad es inmutable, por lo que solo esta clase puede modificar
    val photos: LiveData<List<MarsPhoto>> = _photos


    // Llamar a getMarsPhotos() en init para que podamos mostrar el estado inmediatamente.

    init {
        getMarsPhotos()
    }


     // Obtiene información de fotos de Mars del servicio Mars API Retrofit y actualiza el
     // [MarsPhoto] [Lista] [LiveData].

    private fun getMarsPhotos() {

        viewModelScope.launch {
            _status.value = MarsApiStatus.LOADING
            try {
                _photos.value = MarsApi.retrofitService.getPhotos()
                _status.value = MarsApiStatus.DONE
            } catch (e: Exception) {
                _status.value = MarsApiStatus.ERROR
                _photos.value = listOf()
            }
        }
    }
}
