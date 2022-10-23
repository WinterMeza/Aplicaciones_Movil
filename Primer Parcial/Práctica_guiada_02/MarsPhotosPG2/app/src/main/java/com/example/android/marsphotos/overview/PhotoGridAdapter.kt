/*
APLICACIONES Móvil.
Nombres y Apellidos: Winter Aníbal Meza Jiménez.
Curso: Séptimo "A" 2022(2).
Práctica Guiada 2: Cómo obtener datos de Internet.
Fecha: Domingo, 22 de octubre de 2022.
Docente: Ing. Edgardo Panchana Flores, Mg.
 */

package com.example.android.marsphotos.overview

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.example.android.marsphotos.databinding.GridViewItemBinding
import com.example.android.marsphotos.network.MarsPhoto

/**
 * Esta clase implementa un [RecyclerView] [ListAdapter] que usa Data Binding para presentar [List]
 * datos, incluido el cálculo de diferencias entre listas.
 */
class PhotoGridAdapter :
    ListAdapter<MarsPhoto, PhotoGridAdapter.MarsPhotosViewHolder>(DiffCallback) {

    /**
     * El constructor MarsPhotosViewHolder toma la variable vinculante del asociado
     * GridViewItem, que muy bien le da acceso a la información completa de [MarsPhoto].
     */
    class MarsPhotosViewHolder(
        private var binding: GridViewItemBinding
    ) : RecyclerView.ViewHolder(binding.root) {
        fun bind(marsPhoto: MarsPhoto) {
            binding.photo = marsPhoto
            // Esto es importante, porque obliga a que el enlace de datos se ejecute inmediatamente,
            // que permite que RecyclerView tome las medidas correctas del tamaño de la vista
            binding.executePendingBindings()
        }
    }

    /**
     * Permite que RecyclerView determine qué elementos han cambiado cuando la [Lista] de
     * [MarsPhoto] ha sido actualizado.
     */
    companion object DiffCallback : DiffUtil.ItemCallback<MarsPhoto>() {
        override fun areItemsTheSame(oldItem: MarsPhoto, newItem: MarsPhoto): Boolean {
            return oldItem.id == newItem.id
        }

        override fun areContentsTheSame(oldItem: MarsPhoto, newItem: MarsPhoto): Boolean {
            return oldItem.imgSrcUrl == newItem.imgSrcUrl
        }
    }

    /**
     * Crear nuevas vistas de elementos [RecyclerView] (invocadas por el administrador de diseño)
     */
    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): MarsPhotosViewHolder {
        return MarsPhotosViewHolder(
            GridViewItemBinding.inflate(LayoutInflater.from(parent.context))
        )
    }

    /**
     * Reemplaza el contenido de una vista (invocado por el administrador de diseño)
     */
    override fun onBindViewHolder(holder: MarsPhotosViewHolder, position: Int) {
        val marsPhoto = getItem(position)
        holder.bind(marsPhoto)
    }
}
