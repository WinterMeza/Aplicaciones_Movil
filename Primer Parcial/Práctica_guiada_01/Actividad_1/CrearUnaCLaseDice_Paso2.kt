// APLICACIONES Móvil.
// Nombres y Apellidos: Winter Aníbal Meza Jiménez.
// Curso: Séptimo "A" 2022(2).
// Práctica Guiada: Hola mundo Kotlin.
// Fecha: Jueves, 4 de octubre de 2022.
// Docente: Ing. Edgardo Panchana Flores, Mg.
// Función para generar números aleatorios del 1 al 6.
fun main() {
    val myFirstDice = Dice()
    println(myFirstDice.sides)
    myFirstDice.roll()
}

class Dice {
    var sides = 6

    fun roll() {
        val randomNumber = (1..6).random()
        println(randomNumber)
    }
}