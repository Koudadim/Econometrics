# Etudions la consommation réelle trimestrielle en log au RoyaumeUni, du 4e trimestre 1966 au 2e trimestre 1991

# On utilise la composante lc de Raotbl3 de urca

```{r}
require(urca)
data(Raotbl3)
View(Raotbl3)
attach(Raotbl3,warn.conflicts=FALSE)
plot(lc,type="l",xaxt ="n",xlab="temps",cex=.8)
axis(1,at=seq(from=2,to=98,by=12),
       + labels=as.character(seq(from=1967,to=1991,by=3)))
lc.df0=ur.df(y=lc,lags=6,type='trend') #lag permet correspond à la valeur du p
```


```{r}
str(lc.df0)
lc.df0@testreg$coefficients # les t-statistiques

# La bonne valeur de p correspond au premier retard très significatif 
# (càd p est tel que p-value < 5% )
# On part d'un p plus grand et on récule jusqu'à trouver obtenir le premier
# retard significatif
```

```{r}
# Dans notre cas, p=6 n'est pas le premier retard significatif
lc = diff(Raotbl3.lc)
lc.df1=ur.df(y=lc,lags=5,type='trend')
lc.df1@testreg$coefficients
#5 peut être considéré comme un ppremeir retard significatif, mais il y a mieux
```

```{r}
lc.df2=ur.df(y=lc,lags=3,type='trend')
lc.df2@testreg$coefficients
Nous considérons 3 comme premier retard significatif
```


```{r}
```

