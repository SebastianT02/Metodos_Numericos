import math


def factorial ( num ):
    """
    Parameters
    ----------
    num : Int
    Numero Entero a encontrar el factorial

    Returns
    -------
    fac : int
   numero factorial
  
   """
   fac =1
   for i in range ( num ,0 , -1) :
       fac = fac *i

   return fac

def exponencial (x ,n ):

    """
    Parameters
    ----------
    x : Int
    Numero que se evaluara en la funcion
    n : TYPE
    Numero de terminos que se obtendran de la serie de taylor

    Returns
   -------
    e= float
    exponencial evaluado en un punto
 
    """
    e =0
    for i in range (0 , n):
        e=e +( x ** i) /( factorial ( i)) ##Se implementa la funcion en base ala serie de

    return e

def taylor_coseno (x , truncamiento ) :
     Funcion que determina la Serie de Taylor de la funcion coseno
    Parametros :
    x: float ; aproximacion al punto x
    truncamiento : int ; valor al truncar la serie
    ---------------------------------------------
    Retorna :
    Sumatoria ; Aproximacion y resultado de la Serie de Taylor
    
    sumatoria =0.0 # iniciadores
    n =0.0
    termino =0.0
    while (n <= truncamiento ): # repite n veces la derivada
          termino =(( x **(2* n ))) /( math . factorial (2* n) ) # Formula
          if(n %2==0) : # Agrega el signo
               sumatoria += termino
          else :
               sumatoria = sumatoria - termino
          n +=1
    return sumatoria

def taylor_secante (x , truncamiento ):
     Funcion que determina la Serie de Taylor de la funcion secante
    Parametros :
    x: float ; aproximacion al punto x
    truncamiento : int ; valor al truncar la serie
    ---------------------------------------------
    Retorna :
    Sumatoria ; Aproximacion y resultado de la Serie de Taylor
    
    respuesta =1/( taylor_coseno (x , truncamiento )) # invierte la serie del coseno
    return respuesta

def sen (x ,n):
    """
    Parameters
    ----------
    x : Int
    Numero que se evaluara en la funcion
    n : TYPE
    Numero de terminos que se obtendran de la serie de taylor

    Returns
    -------
    s= float
    Seno evaluado en un punto

    """
    s =0
    f =0
    for i in range (0 , n):
        t =( -1) ** i## Definimos los terminos de la serie
    t1 =x **(2* i +1)
    f= factorial (2* i +1) # Factorial
    s=s +(( t* t1 )/ f) # Establecemos la serie de taylo

    return s
 
def csc (x ,n):
    """
    Parameters
    ----------
    x : Int
    Numero que se evaluara en la funcion
    n : TYPE
    Numero de terminos que se obtendran de la serie de taylor

    Returns
    -------
    s= float
    cosecante evaluado en un punto
  
    """
    w=x
    d=n
    se = sen (w ,d) # Invertimos la funcion seno
    s =1/ se
  
    return s
 
def tg (x , n):
    """
    Parameters
    ----------
    x : Int
    Numero que se evaluara en la funcion
    n : TYPE
    Numero de terminos que se obtendran de la serie de taylor
   
    Returns
    -------
    tng = float
    Seno evaluado en un punto
 
    """
    if x ==90:
         tng =" Error Matematico "
    else :
         tng =0
         s= sen (x , n)
         w= taylor_coseno (x ,n)
         tng =( s /w) #Se realiza la evalucion del punto en seno y coseno y se calcula su
    cociente para encontrar la tangente

    return tng

def cotg (x ,n):
   """
   Parameters
    ----------
    x : Int
    Numero que se evaluara en la funcion
    n : TYPE
    Numero de terminos que se obtendran de la serie de taylor
   
    Returns
    -------
    co= float
    cotagente evaluado en un punto
   
    """
    co =1/ tg (x ,n ) #Se realiza la funcion inversa de la tangente
  
    return co
  
print (" Las funciones evaluaran cantidades en el formato de radianes ")
print (" Prueba de funcionalidad ")
print (" Prueba exponencial ", exponencial (2 ,10) )
print (" Prueba Seno ", sen (60 ,10) )
print (" Prueba coseno : ", taylor_coseno (45 ,10) )
print (" Prueba Tangente ", tg (2 ,10) )
print (" Prueba cotangente : ", cotg (2 ,10) )
