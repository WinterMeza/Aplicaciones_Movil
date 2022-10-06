package com.example.dicerolle

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
// APLICACIONES Móvil.
// Nombres y Apellidos: Winter Aníbal Meza Jiménez.
// Curso: Séptimo "A" 2022(2).
// Práctica Guiada: Hola mundo Kotlin.
// Fecha: Jueves, 4 de octubre de 2022.
// Docente: Ing. Edgardo Panchana Flores, Mg.

class MainActivity : AppCompatActivity() {

    /**
    Este método se llama cuando se crea la Actividad.
     */
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Encuentra el botón en el diseño
        val rollButton: Button = findViewById(R.id.button)

        // Configure un oyente de clics en el botón para tirar los dados cuando el usuario toca el botón
        rollButton.setOnClickListener { rollDice() }
    }

    /**
     * Tira los dados y actualiza la pantalla con el resultado.
     */
    private fun rollDice() {
        // Crea un nuevo objeto Dado con 6 lados y tíralo.
        val dice = Dice(6)
        val diceRoll = dice.roll()

        // Actualiza la pantalla con la tirada de dados.
        val resultTextView: TextView = findViewById(R.id.textView)
        resultTextView.text = diceRoll.toString()
    }
}

/**
 * Dados con un número fijo de lados.
 */
class Dice(private val numSides: Int) {

    /**
     * Haz una tirada de dados al azar y devuelve el resultado.
     */
    fun roll(): Int {
        return (1..numSides).random()
    }

