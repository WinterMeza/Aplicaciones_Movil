/*
APLICACIONES Móvil.
Nombres y Apellidos: Winter Aníbal Meza Jiménez.
Curso: Séptimo "A" 2022(2).
Práctica Guiada 2: Cómo obtener datos de Internet.
Fecha: Domingo, 22 de octubre de 2022.
Docente: Ing. Edgardo Panchana Flores, Mg.
 */
package com.example.android.marsphotos
// Importamos las librerías necesarias.
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity

/**
 * MainActivity establece la vista de contenido activity_main, un contenedor de fragmentos que contiene
 * resumen Fragmento.
 */
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
}