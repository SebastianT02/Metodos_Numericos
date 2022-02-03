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

# cálculo fitness: calcula la distancia total de la lista de ciudades representadas por índices:
def tpsDistance(individual):
    return tsp.getTotalDistance(individual),  # return a tuple

# Matriz e inicialización de variables

def inicialización_procesamiento(tsp):
    """
    Función permite inicializar y preparar los datos de la lib deap
    :param tsp: array
    :return:--------
    """
    # Establece la semilla aleatoria para resultados repetibles
    RANDOM_SEED = 42
    random.seed(RANDOM_SEED)

    # Crea la instancia deseada del problema del viajante:

    # Variables globales
    global toolbox, HALL_OF_FAME_SIZE, P_CROSSOVER, P_MUTATION, POPULATION_SIZE,MAX_GENERATIONS

    #Inicio de variables
    POPULATION_SIZE = 300
    MAX_GENERATIONS = 200
    HALL_OF_FAME_SIZE = 1
    P_CROSSOVER = 0.9  # probabilidad de cruce
    P_MUTATION = 0.1  # probabilidad de mutar a un individuo

    toolbox = base.Toolbox()

    # definir un nico objetivo , minimizando la estrategia de fitness :
    creator.create("FitnessMin", base.Fitness, weights=(-1.0,))

    # crea la clase Individual basada en la lista de numeros enteros :
    creator.create("Individual", array.array, typecode='i', fitness = creator.FitnessMin )

    # create an operator that generates randomly shuffled indices :
    toolbox.register("randomOrder", random.sample, range(len(tsp)), len(tsp))

    # cree un operador que genere ndices aleatorios :
    toolbox.register("individualCreator", tools.initIterate, creator.Individual, toolbox.randomOrder)

    # cree el operador de c r e a c i n de p o b l a c i n para generar una lista de individuos :
    toolbox.register("populationCreator", tools.initRepeat, list, toolbox.individualCreator)
    toolbox.register("evaluate", tpsDistance)

    # Operadores genéticos:
    toolbox.register("select", tools.selTournament, tournsize=3)
    toolbox.register("mate", tools.cxOrdered)
    toolbox.register("mutate", tools.mutShuffleIndexes, indpb=1.0 / len(tsp))
    return

# ####################################################################
# ####################################################################

def buscar_tsp(NAME):
    """
     Funcion que permite buscar el archivo tsp en internet
    :param NAME:
    :return:
    """
    global tsp
    print(" Ejecutando ")
    tsp = tsp.TravelingSalesmanProblem(NAME)  # Llama al archivo externo tsp e ingresa la clase TravelingSalesmanProblem
    print("-" * 80)


# ####################################################################
# ####################################################################
# Algoritmo genético eaSimple
def eaSimple(tsp):
    """
    Funcion que permite ejecutar el algoritmo eaSimple
    :param tsp: array
    :return: Retorna > best , array - minFitnessValues , array
    """
    inicialización_procesamiento(tsp) # llama a la funcion

    # preparar el objeto de estadísticas:
    stats = tools.Statistics(lambda ind: ind.fitness.values)
    stats.register(" min ", np.min)

    # definir el objeto hall -of -fame , crear la población inicial (generación 0):
    hof = tools.HallOfFame(HALL_OF_FAME_SIZE)
    population = toolbox.populationCreator(n=POPULATION_SIZE)

    # realizar el flujo del algoritmo genético con la función hof agregada :
    population, logbook = algorithms.eaSimple(population,toolbox,cxpb=P_CROSSOVER,mutpb=P_MUTATION,
                                          ngen=MAX_GENERATIONS, stats=stats, halloffame=hof, verbose=True)
   # imprime la mejor i n f o r m a c i n individual :
    best = hof.items[0]
    print("eaSimple")

    print(" -- Mejor individuo de todos los tiempos = ",best)
    print(" -- El mejor fitness de todos los tiempos = ",best.fitness.values[0])
    print("-" * 80)

    minFitnessValues = logbook.select(" min ")
    return best, minFitnessValues

#####################################################################
#####################################################################
# Algoritmo genetico eaMuCommaLambda
def eaMuCommaLambda(tsp):
    """Funcion que permite ejecutar el algoritmo eaMuCommaLambda
    :param tsp: array
    :return: best,array - minfitnessvalues,array
    """
    inicialización_procesamiento(tsp)  # llama a la función

    # preparar el objeto de e s t a d s t i c a s :
    stats = tools.Statistics(lambda ind: ind.fitness.values)
    stats.register(" min ", np.min)

    # definir el objeto hall -of -fame , crear la p o b l a c i n inicial ( g e n e r a c i n 0):
    hof = tools.HallOfFame(HALL_OF_FAME_SIZE)
    population = toolbox.populationCreator(n=POPULATION_SIZE)

    # Para los algoritmos eaMuCommaLambda y eaMuPlusLambda
    n = MAX_GENERATIONS
    lambda_ = n
    mu = int(lambda_ / 2)
    # realizar el flujo del algoritmo g e n t i c o con la f u n c i n hof agregada :
    population, logbook = algorithms.eaMuCommaLambda(population, toolbox, mu, lambda_, cxpb= P_CROSSOVER, mutpb=P_MUTATION,
                                                 ngen=MAX_GENERATIONS, stats=stats, halloffame=hof,
                                                 verbose=False)

# imprime la mejor i n f o r m a c i n individual :

    best = hof.items[0]
    print(" eaMuCommaLambda ")
    print(" -- Mejor individuo de todos los tiempos = ", best)
    print(" -- El mejor fitness de todos los tiempos = ", best.fitness.values[0])
    print("-" * 80)

    minFitnessValues = logbook.select(" min ")
    return best, minFitnessValues


# ####################################################################
# ####################################################################
# Algoritmo genetico eaMuPlusLambda
def eaMuPlusLambda(tsp):
    """
    Funcion que permite ejecutar el algoritmo eaMuPlusLambda
    :param tsp:
    :return:
    """

    inicialización_procesamiento(tsp)  # llama a la funcion

    # preparar el objeto de e s t a d s t i c a s :
    stats = tools.Statistics(lambda ind: ind.fitness.values)
    stats.register(" min ", np.min)

    # definir el objeto hall -of -fame , crear la p o b l a c i n inicial ( g e n e r a c i n 0):
    hof = tools.HallOfFame(HALL_OF_FAME_SIZE)
    population = toolbox.populationCreator(n=POPULATION_SIZE)

    # Para los algoritmos eaMuCommaLambda y eaMuPlusLambda
    n = MAX_GENERATIONS
    lambda_ = n
    mu = int(lambda_ / 2)

    # realizar el flujo del algoritmo genético con la función hof agregada :

    population, logbook = algorithms.eaMuPlusLambda(population, toolbox, mu, lambda_, cxpb=P_CROSSOVER, mutpb=P_MUTATION,
                                                ngen=MAX_GENERATIONS, stats=stats, halloffame=hof, verbose=True)

    # imprime la mejor información individual :
    best = hof.items[0]
    print(" eaMuPlusLambda ")
    print(" -- Mejor individuo de todos los tiempos = ", best)
    print(" -- El mejor fitness de todos los tiempos = ", best.fitness.values[0])
    print("-" * 80)

    minFitnessValues = logbook.select(" min ")
    return best, minFitnessValues

# ####################################################################
# ####################################################################
# Codigo Principal

NAME = "st70"  # nombre del problema de http :// elib .zib.de/ pub /mp - testdata / tsp / tsplib / tsp / att48 st70
buscar_tsp(NAME)
camino_Simple,minimo_Simple = eaSimple(tsp)  # Algoritmo eaSimple
camino_CommaLambda,minimo_CommaLambda = eaMuCommaLambda(tsp)  # Algoritmo eaMuCommaLambda
camino_PlusLambda,minimo_PlusLambda = eaMuPlusLambda(tsp)  # Algoritmo eaMuPlusLambda

plt.figure(1)  # Grafica el mejor camino
tsp.plotData(camino_Simple)
plt.title('eaSimple')
plt.figure(2)
tsp.plotData(camino_CommaLambda)
plt.title('eaMuCommaLambda')
plt.figure(3)
tsp.plotData(camino_PlusLambda)
plt.title('eaMuPlusLambda')

plt.figure(4)  # Grafica las estadisticas
sns.set_style("whitegrid")
plt.plot(minimo_Simple, color='red', label ='eaSimple')
plt.plot(minimo_CommaLambda, color='green', label ='eaMuCommaLambda')
plt.plot(minimo_PlusLambda, color='black', label = 'eaMuPlusLambda')
plt.legend()
plt.grid()
plt.xlabel('Generacion')
plt.ylabel('Aptitud fítness / mínima')
plt.title('Aptitud mínima durante generaciones')

plt.show()

