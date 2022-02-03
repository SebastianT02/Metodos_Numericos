from deap import base
from deap import creator
from deap import tools
from deap import algorithms
from math import log

import random
import array

import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

import tsp

# Establece la semilla aleatoria para resultados repetibles
RANDOM_SEED = 42
random.seed(RANDOM_SEED)

# Crea la instancia deseada del problema del viajante:
TSP_NAME = "bayg29"  # Nombre del problema
tsp = tsp.TravelingSalesmanProblem(TSP_NAME)

# Constantes del algoritmo genético
lambda_=int(4+3*log(200))
mu=int(lambda_/2)
POPULATION_SIZE = 300
MAX_GENERATIONS = 200
HALL_OF_FAME_SIZE = 1
P_CROSSOVER = 0.9  # Probabilidad de cruce
P_MUTATION = 0.1   # Probabilidad de mutar un individuo

toolbox = base.Toolbox()

# Define un único objetivo, minimizando la estrategia de fitness:
creator.create("FitnessMin", base.Fitness, weights=(-1.0,))

# Cree la clase Individual basada en la lista de enteros:
creator.create("Individual", array.array, typecode='i', fitness=creator.FitnessMin)

# Crear un operador que genere índices aleatorios:
toolbox.register("randomOrder", random.sample, range(len(tsp)), len(tsp))

# Crea el operador de creación individual para llenar una instancia Individual con índices barajados:
toolbox.register("individualCreator", tools.initIterate, creator.Individual, toolbox.randomOrder)

# Crea el operador de creación de población para generar una lista de individuos:
toolbox.register("populationCreator", tools.initRepeat, list, toolbox.individualCreator)


# cálculo fitness: calcula la distancia total de la lista de ciudades representadas por índices:
def tpsDistance(individual):
    return tsp.getTotalDistance(individual),  # returna una tuple


toolbox.register("evaluate", tpsDistance)


# Operadores genéticos:
toolbox.register("select", tools.selTournament, tournsize=3)
toolbox.register("mate", tools.cxOrdered)
toolbox.register("mutate", tools.mutShuffleIndexes, indpb=1.0/len(tsp))


# Flujo del algoritmo genético:
def main():

    # Crea población inicial (generación 0):
    population = toolbox.populationCreator(n=POPULATION_SIZE)

    # Prepara el objeto de estadísticas:
    stats = tools.Statistics(lambda ind: ind.fitness.values)
    stats.register("min", np.min)
    stats.register("avg", np.mean)

    # Define el objeto 'the hall-of-fame'
    hof = tools.HallOfFame(HALL_OF_FAME_SIZE)

    # Realiza el flujo del Algoritmo Genético con la función hof agregada:
    population, logbook = algorithms.eaMuCommaLambda(population, toolbox,mu,lambda_, cxpb=P_CROSSOVER, mutpb=P_MUTATION,
                                              ngen=MAX_GENERATIONS, stats=stats, halloffame=hof, verbose=True)

    # Imprime la mejor información individual:
    best = hof.items[0]
    print("-- El mejor individual = ", best)
    print("-- El mejor fitness = ", best.fitness.values[0])

    # Traza la mejor solución:
    plt.figure(1)
    tsp.plotData(best)

    # Traza las estadísticas
    minFitnessValues, meanFitnessValues = logbook.select("min", "avg")
    plt.figure(2)
    sns.set_style("whitegrid")
    plt.plot(minFitnessValues, color='red')
    plt.plot(meanFitnessValues, color='green')
    plt.xlabel('Generaciones')
    plt.ylabel('Estado mínimo/promedio')
    plt.title('Estado mínimo y promedio durante generaciones')

    # Muestra los dos plots
    plt.show()


if __name__ == "__main__":
    main()