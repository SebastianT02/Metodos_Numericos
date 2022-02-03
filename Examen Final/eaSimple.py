#Inicio del librerías
from deap import base
from deap import creator
from deap import tools
from deap import algorithms

import random
import array

import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

import tsp

# Establece un valor aleatorio para resultados repetibles
RANDOM_SEED = 14
random.seed(RANDOM_SEED)

# Crea la instancia deseada del problema del viajante:
TSP_NAME = "bayg29"  # Nombre del problema ciudad
tsp = tsp.TravelingSalesmanProblem(TSP_NAME)

# Constantes del algoritmo genético:
POPULATION_SIZE = 300
MAX_GENERATIONS = 200
HALL_OF_FAME_SIZE = 1
P_CROSSOVER = 0.9  # Probabilidad de cruce
P_MUTATION = 0.1   # Probabilidad de mutar un individuo

toolbox = base.Toolbox()

# Define un único objetivo, minimizando la estrategia fitness:
creator.create("FitnessMin", base.Fitness, weights=(-1.0,))

# Crea la clase Individual basada en la lista de enteros:
creator.create("Individual", array.array, typecode='i', fitness=creator.FitnessMin)

# Crea un operador que genere índices aleatorios:
toolbox.register("randomOrder", random.sample, range(len(tsp)), len(tsp))

# Crea el operador de creación individual para llenar una instancia Individual con índices barajados
toolbox.register("individualCreator", tools.initIterate, creator.Individual, toolbox.randomOrder)

# Crea el operador de creación de población para generar una lista de individuos:
toolbox.register("populationCreator", tools.initRepeat, list, toolbox.individualCreator)


# Cálculo Fitness: calcula la distancia total de la lista de ciudades representadas por índices:
def tpsDistance(individual):
    return tsp.getTotalDistance(individual),  # Devuelve una 'tuple'


toolbox.register("evaluate", tpsDistance)


# Operadores genéticos:
toolbox.register("select", tools.selTournament, tournsize=3)
toolbox.register("mate", tools.cxOrdered)
toolbox.register("mutate", tools.mutShuffleIndexes, indpb=1.0/len(tsp))


# Flujo del algoritmo genético:
def main():

    # Crea población inicial (generación 0):
    population = toolbox.populationCreator(n=POPULATION_SIZE)

    # Preparar el objeto de estadísticas:
    stats = tools.Statistics(lambda ind: ind.fitness.values)
    stats.register("min", np.min)
    stats.register("avg", np.mean)

    # Define el objetivo de 'hall-of-fame':
    hof = tools.HallOfFame(HALL_OF_FAME_SIZE)

    # Realiza el flujo del Algoritmo Genético con la función 'hof' agregada:
    population, logbook = algorithms.eaSimple(population, toolbox, cxpb=P_CROSSOVER, mutpb=P_MUTATION,
                                              ngen=MAX_GENERATIONS, stats=stats, halloffame=hof, verbose=True)

    # Imprime la mejor información individual:
    best = hof.items[0]
    print("-- El mejor Individual = ", best)
    print("-- El mejor Fitness = ", best.fitness.values[0])

    # Traza la mejor solución
    plt.figure(1)
    tsp.plotData(best)

    # Traza las estadísticas con un digrama de lineas
    minFitnessValues, meanFitnessValues = logbook.select("min", "avg")
    plt.figure(2)
    sns.set_style("whitegrid")
    plt.plot(minFitnessValues, color='red')
    plt.plot(meanFitnessValues, color='green')
    plt.xlabel('Generación')
    plt.ylabel('Mínimo / Promedio Fitness')
    plt.title('Estado fitness mínimo y Estado fitness promedio durante generaciones')

    # Muestra las dos gráficas:
    plt.show()

    
# Corre el programa hecho:
if __name__ == "__main__":
    main()

