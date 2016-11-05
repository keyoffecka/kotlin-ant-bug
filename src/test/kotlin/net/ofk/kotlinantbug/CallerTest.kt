package net.ofk.kotlinantbug

import org.junit.Assert
import org.junit.Test
import org.mockito.Mockito

class CallerTest {
  @Test
  fun testCall() {
    val kab = Mockito.mock(KotlinAntBug::class.java)
    val c = Caller(kab)

    val e = RuntimeException()
    Mockito.doThrow(e).`when`(kab).method()

    try {
      c.call()
      Assert.fail()
    } catch(ex: Exception) {
      Assert.assertSame(e, ex)
    }
  }
}