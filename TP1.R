data1<-AirPassengers
data1

plot(data1) # Tracé de la série temporelle

#D'après le tracé, cette série est à variance non constante. Cette variance augmente avec le temps. 
# Il s'agit donc d'un modèle multiplicatif. Il faut le transformer pour obtenir un modèle additif

data2<-log(data1)
data2
plot(data2) # On obtient ainsi une série à variance stabilisée.

#Simulation de la fonction d'autocorrélation avec acf
phi<-acf(data1)
phi

# Simulation d'un bruit blanc

# Echantillon gaussien centré reduit de taille 100

x<-rnorm(100)
plot(density(x))

#Conversion des données x en série temporelle à l'aide de la fonction ts
a<-ts(x, 1980,f=4)
plot(a)
a

# Autocorrélation 
acf(a)
# Puisque x est un échantillon de la loi normale centrée reduite, x est un bruit blanc

#SIMULATION D'UNE MA(1): x(t)=teta*epsilon(t-1)+epsilon(t); epsilon(t)~BB(0,sigma²) teta=0.9

# Pour se faire on utilise la fonction arima.sim

x<-arima.sim(list(ar=0, ma=0.9), 1000)
x
plot(x)
figma<-acf(x)
figma
#Si après simulation d'une série temporelle et que l'on obtient une figure similaire à
#figma, on conclut que la série peut etre une moyenne mobile
#ci.type

#SIMULATION D'UNE MA(2)

x<-arima.sim(list(ar=0, ma=c(0.9, 0.8)), 1000)
plot(x)
figma<-acf(x, ci.type='ma')
figma

#RETOUR AU DONNEES SUR LES PASSAGERS

acf(data2)

plot(data1)
acf(data1) # Intervalle de confiance pour un bruit blanc
acf(data1, ci.type='ma') # Invalle de confiance pour une moyenne mobile

# Après la stabilisation de la variance

plot(data2)
acf(data2)
acf(data2, ci.type='ma')

# Elimination de la tendance

dif1data2<-diff(data2)
dif1data2
plot(dif1data2) # Série sans tendance

acf(dif1data2, ci.type='ma') # On ne peut pas conclure qu'il y a une moyenne mobile dans la série

# Elimination de la saisonnalité à l'aide de la différence d'ordre 12

dif12data2<-diff(dif1data2, 12)
dif12data2
plot(dif12data2)
acf(dif12data2, ci.type='ma')


# DECOMPOSITION D'UNE SERIE ADDITIVE

Md<-decompose(data2, type="additive")
plot(Md)

Mm<-decompose(data2, type="multiplicative")
plot(Mm)

