import csv
import pickle
import os
import codecs

import numpy as np

from urllib.request import urlopen

import matplotlib.pyplot as plt


class TravelingSalesmanProblem:
    """Esta clase resume el problema del viajante de comercio.
    Las coordenadas de la ciudad se leen de un archivo en línea y se calcula la matriz de distancia.
    Los datos se serializan en el disco.
    La distancia total se puede calcular para una ruta representada por una lista de índices de ciudades.
    Se puede crear un gráfico para una ruta representada por una lista de índices de ciudades.
         :param name: El nombre del problema TSPLIB correspondiente, p. 'birmania14' o 'bayg29'.
    """

    def __init__(self, name):
        """
        Crea una instancia de un TSP
        :param name: nombre del problema TSP
        """

        # inicializar variables de instancia:
        self.name = name
        self.locations = []
        self.distances = []
        self.tspSize = 0

        # inicializar los datos:
        self.__initData()

    def __len__(self):
        """
        devuelve la longitud del TSP subyacente
        :return: la longitud del TSP subyacente (número de ciudades)
        """
        return self.tspSize

    def __initData(self):
        """Lee los datos serializados y, si no están disponibles, llama a __create_data() para prepararlos.
        """

        # intentar leer datos serializados:
        try:
            self.locations = pickle.load(open(os.path.join("tsp-data", self.name + "-loc.pickle"), "rb"))
            self.distances = pickle.load(open(os.path.join("tsp-data", self.name + "-dist.pickle"), "rb"))
        except (OSError, IOError):
            pass

        # datos serializados no encontrados - cree los datos desde cero:
        if not self.locations or not self.distances:
            self.__createData()

        # establecer el problema 'tamaño':
        self.tspSize = len(self.locations)

    def __createData(self):
        """Lee el archivo TSP deseado de Internet, extrae las coordenadas de la ciudad, calcula las distancias
         entre cada dos ciudades y las usa para poblar una matriz de distancia (arreglo bidimensional).
         Luego serializa las ubicaciones de la ciudad y las distancias calculadas al disco usando la utilidad pickle.
        """
        self.locations = []

        # abra el archivo delimitado por espacios en blanco desde la url y lea las líneas de él:
        with urlopen("http://elib.zib.de/pub/mp-testdata/tsp/tsplib/tsp/" + self.name + ".tsp") as f:
            reader = csv.reader(codecs.iterdecode(f, 'utf-8'), delimiter=" ", skipinitialspace=True)

            # omita líneas hasta que encuentre una de estas líneas:
            for row in reader:
                if row[0] in ('DISPLAY_DATA_SECTION', 'NODE_COORD_SECTION'):
                    break

            # leer líneas de datos hasta encontrar 'EOF':
            for row in reader:
                if row[0] != 'EOF':
                    # eliminar el índice al principio de la línea:
                    del row[0]

                    # convertir coordenadas x,y a ndarray:
                    self.locations.append(np.asarray(row, dtype=np.float32))
                else:
                    break

            # establece el 'tamaño' del problema:
            self.tspSize = len(self.locations)

            # imprimir datos:
            print("length = {}, locations = {}".format(self.tspSize, self.locations))

            # inicializa la matriz de distancia llenándola con 0:
            self.distances = [[0] * self.tspSize for _ in range(self.tspSize)]

            # llenar la matriz de distancia con distancias calculadas:
            for i in range(self.tspSize):
                for j in range(i + 1, self.tspSize):
                    # calcular la distancia euclidiana entre dos ndarrays:
                    distance = np.linalg.norm(self.locations[j] - self.locations[i])
                    self.distances[i][j] = distance
                    self.distances[j][i] = distance
                    print("{}, {}: location1 = {}, location2 = {} => distance = {}".format(i, j, self.locations[i], self.locations[j], distance))

            # serializar ubicaciones y distancias:
            if not os.path.exists("tsp-data"):
                os.makedirs("tsp-data")
            pickle.dump(self.locations, open(os.path.join("tsp-data", self.name + "-loc.pickle"), "wb"))
            pickle.dump(self.distances, open(os.path.join("tsp-data", self.name + "-dist.pickle"), "wb"))

    def getTotalDistance(self, indices):
        """Calcula la distancia total de la ruta descrita por los índices dados de las ciudades
        :param indices: Una lista de índices de ciudades ordenados que describen la ruta dada.
        :return: distancia total del camino descrito por los índices dados
        """
        # distancia entre la última y la primera ciudad:
        distance = self.distances[indices[-1]][indices[0]]

        # suma la distancia entre cada par de ciudades consecutivas:
        for i in range(len(indices) - 1):
            distance += self.distances[indices[i]][indices[i + 1]]

        return distance

    def plotData(self, indices):
        """traza el camino descrito por los índices dados de las ciudades
        :param indices: Una lista de índices de ciudades ordenados que describen la ruta dada.
        :return: la traza resultante
        """

        # trace los puntos que representan las ciudades:
        plt.scatter(*zip(*self.locations), marker='.', color='red')

        # crear una lista de las ubicaciones de la ciudad correspondientes:
        locs = [self.locations[i] for i in indices]
        locs.append(locs[0])

        # trace una línea entre cada par de ciudades consecutivas:
        plt.plot(*zip(*locs), linestyle='-', color='blue')

        return plt


# probando la clase:
def main():
    # crear una instancia de problema:
    tsp = TravelingSalesmanProblem("bayg29")

    # generar una solución aleatoria y evaluarla:
    #randomSolution = random.sample(range(len(tsp)), len(tsp))

    # see http://elib.zib.de/pub/mp-testdata/tsp/tsplib/tsp/bayg29.opt.tour
    optimalSolution = [0, 27, 5, 11, 8, 25, 2, 28, 4, 20, 1, 19, 9, 3, 14, 17, 13, 16, 21, 10, 18, 24, 6, 22, 7, 26, 15, 12, 23]

    print("Problem name: " + tsp.name)
    print("Optimal solution = ", optimalSolution)
    print("Optimal distance = ", tsp.getTotalDistance(optimalSolution))

    # traza la solución:
    plot = tsp.plotData(optimalSolution)
    plot.show()


if __name__ == "__main__":
    main()