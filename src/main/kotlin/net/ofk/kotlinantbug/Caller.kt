package net.ofk.kotlinantbug

class Caller(private val kab: KotlinAntBug) {
  fun call() {
    kab.method()
  }
}