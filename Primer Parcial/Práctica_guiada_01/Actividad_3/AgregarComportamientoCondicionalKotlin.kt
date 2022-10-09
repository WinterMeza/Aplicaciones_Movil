// APLICACIONES Móvil.
// Nombres y Apellidos: Winter Aníbal Meza Jiménez.
// Curso: Séptimo "A" 2022(2).
// Práctica Guiada: Hola mundo Kotlin.
// Fecha: Jueves, 4 de octubre de 2022.
// Docente: Ing. Edgardo Panchana Flores, Mg.
fun main() {
    val myFirstDice = Dice(6)
    val rollResult = myFirstDice.roll()
    val luckyNumber = 4
    // Condiciónes
    when (rollResult) {
        luckyNumber -> println("Ganaste!")
        1 -> println("¡Lo siento mucho! Obtuviste un 1. Inténtalo de nuevo!")
        2 -> println("Lamentablemente, sacaste un 2. ¡Inténtalo de nuevo!")
        3 -> println("Desafortunadamente, sacaste un 3. ¡Inténtalo de nuevo!")
        5 -> println("¡No llores! Obtuviste un 5. Inténtalo de nuevo!")
        6 -> println("¡Disculpas! Obtuviste un 6. Inténtalo de nuevo!")
   }
}

class Dice(val numSides: Int) {
    fun roll(): Int {
        return (1..numSides).random()
    }
}
