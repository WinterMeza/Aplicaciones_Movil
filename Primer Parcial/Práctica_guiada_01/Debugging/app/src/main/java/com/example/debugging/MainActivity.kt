package com.example.debugging
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.TextView
private const val TAG = "MainActivity"
// APLICACIONES Móvil.
// Nombres y Apellidos: Winter Aníbal Meza Jiménez.
// Curso: Séptimo "A" 2022(2).
// Práctica Guiada: Hola mundo Kotlin.
// Fecha: Jueves, 4 de octubre de 2022.
// Docente: Ing. Edgardo Panchana Flores, Mg.

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        Log.d(TAG, "where the App crashed before")
        val helloTextView: TextView = findViewById(R.id.division_textview)
        Log.d(TAG, "bug fixed")
        helloTextView.text = "Hello, debugging!"
        logging()
        division()
    }
    fun logging() {
        Log.e(TAG, "ERROR: un error grave como un bloqueo de la aplicación")
        Log.w(TAG, "WARN: advierte sobre la posibilidad de errores graves")
        Log.i(TAG, "INFO: informar información técnica, como una operación exitosa")
        Log.d(TAG, "DEBUG: informar información técnica útil para la depuración")
        Log.v(TAG, "VERBOSE: Más VERBOSE que los registros de depuración")
    }
    fun division() {
        val numerator = 60
        var denominator = 4
        repeat(4) {
            Thread.sleep(3000)
            findViewById<TextView>(R.id.division_textview).setText("${numerator / denominator}")
            denominator--
        }
    }
}