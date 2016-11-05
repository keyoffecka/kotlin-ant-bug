# kotlin-ant-bug
Kotlin Ant task fails to compile tests if an internal method is referenced.

To reproduce run

**ant**

Remember to set **ivy.cache.dir**=*/path/to/your/ivy/cache/dir* in your build-local.properties file (create it first).

The output will be similar to
```
[javac] kotlin-ant-bug/src/test/kotlin/net/ofk/kotlinantbug/CallerTest.kt:14:36: error: cannot access 'method': it is internal in 'KotlinAntBug'

[javac]     Mockito.doThrow(e).`when`(kab).method()
```
