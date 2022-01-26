def ingreso_datos () :
     """
     Controla El Ingreso De Datos
     -------
     parametros String
     datos a convertir
     """
     try :# Control de errores
          parametros = input (" Ingrese sus parametros ")
          assert "," not in parametros ," Utilice el (.) para indicar decimal " # Controla 
     Errores de digitacion como puede ser cuando se utilza , en lugar del punto
     except :
          print (" Utilice el (.) para indicar decimal ")

     return parametros

def sgn ( numero ):
    """
    Nos devuelve un signo en formato decimal o 754
    ----------
    numero : str
    Numero Real .

    Returns
    -------
    signo : str
    Signo Correspondiente
    """
    auxn = numero . split ()

    if len ( auxn ) ==1: #En caso de que el parametro sea solo uno
         if float ( numero ) <0: # Comprueba el valor del signo y nos devuelve una
    transformacion
            signo ="1"
         else :
            signo = "0"

    elif len ( auxn ) ==3: #En caso de que existan dos parametros
         if auxn [0] == "0":
             signo = "+"
         elif auxn [0] == "1":
             signo = "-"
         else :
             signo = " Parametros no admitidos " #En caso de que no tenga los parametros
             permitidos o adecuados

     return signo

 def decimal_binario (x):
      """
      Transforma un numero decimal a binario
      ----------
      x : Numero Real

      Returns
       -------
      binario : String
      Numero binario tranformado
      """
      # Transdormacion de la parte entera
      x= str (x) . replace ("-","") # Obviamos el signo negativo para tratar solo con el
      numero que se desea convertir
      bi1 = bin ( int (x))#Se transforma el numero a binario
      bi1 = int ( str ( bi1 ) [2::]) # Tomamos desde la segunda posicion que es el numero binario
      exacto

      return float ( bi1 )

 def decimal_binarioneg ( n):
     """
     Tranformar un numero entero a binario negativo
     ----------
     n : int
     Numero racional a convertir

     Returns
     -------
     s : Entero
     Devuelve un numero racional en binario

     """
     dec = float ("0."+ n) #Le damos el formato de decimal ya que tenemos un numero
     inicial entero
     listab =[] # Lista que almacenara los numeros binarios
     c =1

     while c <20: #Ya que cuando se transforma la parte decimal de un binario no es
     exacta le damos un rango de 20
         dec = dec *2
         aux = str ( dec ). split (".")
         listab . append ( aux [0])
         dec = float ("0."+ aux [1]) # Actualizamos la variable
         c +=1

     bi2 ="". join ( listab )

     return float ("0."+ bi2 )

 def binario ( num ):
     """
    retorna un numero binario
    ----------
    num : str
    numero del cual se encontrar el exponente sesgado
    Returns
    -------
    e : int
    exponente sesgado

    auxn : string
    guardara el numero de parametros ingresados

    """
    auxn = num . split () #Se dividen los parametros
    fnum = str ( float ( num ))
    if len ( auxn ) ==1:
        fnum = fnum . split (".")
        bi = decimal_binario ( fnum [0]) + decimal_binarioneg ( fnum [1]) #Se trasnforma
     la parte que va antes y despues de la coma del numero decimal y se unen
    elif len ( auxn ) ==3:
        pass # Caso por posible implementacion inmediata de la contraconversion
     else :
          bi = " Parametros no admitidos "

     return bi

def exponente ( binario ):
    """
    Obtiene el exponente sesgado del numero binario
   ----------
    binario : str
    numero decimal en base binaria

    c: Int
    Contador

    Returns
    -------
    e: Int
    exponente sesgado


    """
    c =0#Se inicializan las variables
    e =0
    if binario >=1: #En caso de que se trate de un numero mayo a uno la coma se
    recorrera hacia la izquierda
       c =0
       while binario >2:
          binario = binario /10 #Se divide por 10 hasta recorrer al primer uno del
    numero
          c +=1

       e=c #Se toma el numero positivo ya que se recorre hacia la izquierda

    elif binario <1: #En caso de que el numero sea menor a uno la coma recorrera hacia
    la derecha
       while binario <1:
            binario = binario *10 #Se recorre la coma hasta encontrar el primer uno en el
    numero
            c +=1

       e = -( c)#Se toma el numero negativo ya que se recorre hacia la derecha esto por
    notacion cientifica


    return e

def bits ( e):
    """

    Nos devuelve una cadena de 8 bits
    ----------
    e : Int
    Exponente sesgado

    ochobits
    -------
    ochobits : Int
    Numero binario

    """
    ochobits = decimal_binario (127+ e) #Se realiza el desplazamiento del exponente
    sesgado
    if len ( str (int( ochobits )) ) <8: #Se comprueba que el numero tenga los ocho bits
          ochobits ="0"+ str ( ochobits )#En caso de que tenga menos bits , quiere decir que
    el numero no esta contando un cero de la izquierda
          #Y se agrega el cero faltante

    return ochobits

def mantisa (e , n):
    """
    En base al numero binario y al exponente sesgado nos devuelve la mantisa de 23
    bits
    ----------
    e : Int

    Exponente sesgado
    n : Numero Binario
    DESCRIPTION .

    Returns
    -------
    man : Int
    numero de 23 bits

    """
    num = n *10** - e #Se recorre las posiciones necesarias para normalizar el numero

    num1 = str ( num ) [2::] #Se toma la parte significativa del numero normalizado

    while len ( num1 ) <23: #Se comprueba de que el numero cuente con los 23 bits , si no
    es asi se agregan ceros
           num1 +="0"

    return num1

def db (n) :
    """
    Realiza una conversion de un numero binario a decimal
    ----------
    n : Int
   Numero Binario

   Returns
   -------
    s : Int
   Numero convertido

   """
   l = len ( str (n) ) -1 # Se lee las cifras que tiene el numero binario como la cuenta
   comienza desde 0 se le quita 1
   s =0
   for j in str (n):
       s += int( j) *(2** l) #Se multiplica los 1 y 0 que se tienen por su base dos
   elevados al exponente correspondiente
      # Sumamos los numeros que se obtienen como lo hariamos en una tranformacion
   normal
       l -=1 #Se disminuye el exponente

   return s

def dbng ( n):
    """
    Nos devuelve un valor decimal en base a un numero binario
    ----------
    n : Int
    Binario Parte Decimal

    Return
    ------
    s : int

    Devuelve la suma de los valores , este es el valor decimal

    """
    s =0
    for i ,j in enumerate (n) :
        s += int( j) *(2** -( i +1) ) #Se realiza el mismo proceso de transformacion a decimal
    , pero con los numeros despues de la coma del numero

    return s


def exponente2 (s):
    """
    Parameters
    ----------
    s : exponente sesgado

    Returns
    -------
    e : Entero
    exponente

    """
    e = db (s) -127 #Se obtiene el exponente sesgado
    return e

def encontrar_numero (e , m):
    """
    Parameters
     ----------
    e : Int
    Exponente Sesgado
    m : String
    Numero Binario

   Returns
   -------
   numero : Float
   Numero transofrmado decimal
   """
   m= "1."+m # Volvemos a la forma normalizada del numero
   numero = float (m)* 10** e #Se le multiplica por el exponente sesgado y se obtiene
   el numero decimal en base 2

   return numero

   # Prueba de las funciones y funcionalidad del programa

parametros = ingreso_datos ()
n = len ( parametros . split () )
if n ==1: #En caso de que exista un solo parametro
   bi = binario ( parametros ) # Obtenemos el numero decimal en base binario
   e= exponente ( bi ) # Encontramos el exponente sesgado
   print (" Signo (1 bit ): ", sgn ( parametros ) ) #En base al parematro dado se encuentra
   el signo


   print (" Exponente (8 bits ): ", bits (e))#Con el exponente sesgado encontramos el
   desplazamiento que se representara en los 8 bits
   print (" Mantisa (23 bits ): ", mantisa (e , bi ))# Encontramos la mantisa con el exponente
   y el nmumeor binario
   print ("-" *50)
   print (" Numero En formato IEEE 754 ")
   print ("-" *50)
   print ( sgn ( parametros ) ," ", bits (e) ," ", mantisa (e , bi ))
   print ("-" *50)

elif n ==3: # Caso en el que existan 3 parametrso

   print (" Numero a transformar ", parametros )
   par = parametros . split () # Divimos los parametros en 3 partes
   sig = sgn ( parametros )# Encontramos el signo del parametro dado
   e = exponente2 ( par [1]) # Exponente sesgado para reconvertir el numero
   n = encontrar_numero (e , par [2]) #Se encuentra el numero coma flotante transformado
   a binario
   numeros = str( n). split (".")# Dividimos nuevamente la parte antes de la coma y
   despues de la coma
   print (" Signo (1 bit ): ", par [0]) # Resultados
   print (" Exponente (8 bits ): ", par [1])
   print (" Mantisa (23 bits ): ", par [2])
   print ("-" *50)
   print (" Numero En formato Decimal ")
   print ("-" *50)
   print ( sig , db ( int ( numeros [0]) ) + dbng ( numeros [1]) )
   print ("-" *50)

else :#El caso en el que no se cumpla ninguna de las alternativas propuestas
   print (" Numero de parametros incorrectos ")
