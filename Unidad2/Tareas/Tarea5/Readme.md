# glm()

La función glm() de R nos permite ajustar modelos lineales de muchos tipos, incluyendo los que ajustamos con lm(), modelos de Poisson y los logit en los que nos enfocaremos. La sintaxis básica para obtener un modelo lineal es
```R
 glm(dependiente~independiente1+independiente2, family=binomial(), data=datos").
```

El primer argumento es un objeto de la clase fórmula. A la izquierda del signo ~ ubicamos a la variable dependiente y a la derecha, unidos por el signo + las independientes, si no estamos especificando una interacción entre variables.

El segundo, family=binomial(), especifica la función de probabilidad que utilizaremos. Para modelos logit es una función binomial. Dentro de los paréntesis se puede especificar la función de enlace. Para la familia de distribuciones binomial glm() por defecto usa una función logit. Si nos interesa una función probit deberíamos especificar link=probit.

El tercero apunta a un data.frame en el que están los datos. Los nombres de columna del data.frame deben coincidir con las variables especificadas en la fórmula, aunque podría contener más variables que serán descartadas. En el caso de hacer previamente una manipulación de datos encadenada con el operador %>% usamos . como sustituto anónimo de los datos.