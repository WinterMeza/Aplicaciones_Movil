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
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import com.example.android.marsphotos.databinding.FragmentOverviewBinding

/**
 * Este fragmento muestra el estado de la transacción de los servicios web de fotos de Mars.
 */
class OverviewFragment : Fragment() {

    private val viewModel: OverviewViewModel by viewModels()

    /**
     * El diseño con Data Binding establece su propietario de ciclo de vida en OverviewFragment
     * para habilitar Data Binding para observar LiveData y configurar RecyclerView con un adaptador.
     */
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val binding = FragmentOverviewBinding.inflate(inflater)

        // Permite que el enlace de datos observe LiveData con el ciclo de vida
        // de este fragmento.
        binding.lifecycleOwner = this

        // Dar acceso al enlace al OverviewViewModel.
        binding.viewModel = viewModel

        return binding.root
    }
}
