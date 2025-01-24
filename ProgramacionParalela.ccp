******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/


#include <iostream>
#include <omp.h>

#define N 1000  /* Cantidad de elementos a manejar en los arreglos*/
#define chunk 200  /*Tamaño que tendrán los pedazos de los arreglos para que cada hilo*/
#define mostrar 20 /*Cantidad de datos a imprimir*/

void imprimeArreglo(float *d);

int main()
{
    std::cout << "\nSumando Arreglos en Paralelo!\n";
    float a[N], b[N], c[N];
    int i;

    for (i = 0; i < N; i++)
    {
        a[i] = i * 10;
        b[i] = (i + 3) * 3.8;
    }
    int pedazos = chunk;

    #pragma omp parallel for \
    shared(a, b, c, pedazos) private(i) \
    schedule(static, pedazos)

    for (i = 0; i < N; i++)
    {
        c[i] = a[i] + b[i]; /*Cada hilo calcula un subconjunto de la suma c[i] = a[i] + b[i].*/
    }

    std::cout << "Imprimiendo los primeros " << mostrar << " valores del arreglo a: " << std::endl;
    imprimeArreglo(a);
    std::cout << "Imprimiendo los primeros " << mostrar << " valores del arreglo b: " << std::endl;
    imprimeArreglo(b);
    std::cout << "Imprimiendo los primeros " << mostrar << " valores del arreglo c: " << std::endl;
    imprimeArreglo(c);
}

void imprimeArreglo(float *d)
{
    for (int x = 0; x < mostrar; x++)
    {
        std::cout << d[x] << " - ";
    }
    std::cout << std::endl;
}