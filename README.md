# Financial-Market-DataBase-co

## Réponse aux question de PHPMyAdmin :

### Niveau facile :

#### mf01 Donner la liste des noms des jeunes trader et leurs classe actifs ; où jeune si moins de 5 ans d'expérience.

```sql
SELECT nom, classe_actif 
FROM trader
WHERE anneeExperience >= 5 ;
``` 

#### mf02 Donner la liste des différentes classes d’actifs de l’équipe 1

```sql
SELECT classe_actif FROM trader
WHERE nomEquipe = 'equipe1' ;
```

####  mf03 Donner toutes les informations sur les traders commodities

```sql
SELECT * FROM trader
WHERE classe_actif = 'commodities' ;
```

#### mf04 Donner la liste des classes d’actifs des traders de  plus de 20 ans d'expérience.

```sql
SELECT classe_actif FROM trader
WHERE anneeExperience >= 20 ;
```

#### mf05 Donner la liste des noms des traders ayant entre 5 et 10 ans d'expérience (bornes incluses).

```sql
SELECT nom FROM trader
WHERE anneeExperience BETWEEN  5 AND 10 ;
```

#### mf06 Donner la liste des classes d’actifs commençant par « ch » (e.g. change...)

```sql
SELECT classe_actif FROM trader
WHERE classe_actif LIKE  'ch%' ;
```

#### mf07 Donner la liste des noms des équipes utilisant l’arbitrage statistique

```sql
SELECT nom FROM equipe
WHERE style =  'arbitrage statistique' ;
```

#### mf08 Donner la liste des noms des équipes dont le chef est Smith.

```sql
SELECT nom FROM equipe
WHERE chef =  'SMITH' ;
```

#### mf09 Donner la liste des transactions  triés par ordre alphabétique.

```sql
SELECT * FROM transaction
ORDER BY nom ;
```

#### mf10 Donner la liste des transactions se déroulant le 20 Avril 2019  à Hong Kong

```sql
SELECT * FROM transaction
WHERE date = '2019-04-20' AND lieu = "HONG KONG";
```

#### mf11 Donner la liste des marchés ( lieux)  où le prix est supérieur à 150 euros.

```sql
SELECT lieu FROM transaction
WHERE prix >= 150;
```

#### mf12 Donner la liste des transactions se déroulant à Paris pour moins de 50 euros.

```sql
SELECT * FROM transaction
WHERE prix <= 50 AND lieu = 'PARIS';
```

#### mf13 Donner la liste des marchés ( lieux)  ayant eu lieu en 2014.

```sql
SELECT lieu FROM transaction
WHERE YEAR(date) = '2014';
```

### Multi-tables, avec jointures

#### mmtj01 Donner la liste des noms et classes d’actifs des traders ayant plus de 3 ans d'expérience et faisant partie d'une équipe de style arbitrage statisque. On affichera par ordre alphabétique sur les noms. ATTENTION : utilisation de sous-requête ou de produit cartésien non autorisés.

```sql
SELECT trader.nom, classe_actif
FROM trader
INNER JOIN equipe ON trader.nomEquipe = equipe.nom
WHERE anneeExperience > 3 AND style = 'arbitrage statistique'
ORDER BY trader.nom;
```

#### mmtj02 Donner les différents marchés(lieux), triés par ordre alphabétique, des transactions effectuées dans  l'équipe du chef Smith avec un prix inférieur à 20. ATTENTION : utilisation de sous-requête ou de produit cartésien non autorisés.

```sql
SELECT lieu
FROM transaction
INNER JOIN equipe ON transaction.nomEquipe = equipe.nom
WHERE prix < 20 AND chef = 'SMITH'
ORDER BY lieu;
```

#### mmtj03 Donner le nombre de marchés sur lesquels intervenaient les traders  de style Market Making  en 2021. ATTENTION : utilisation de sous- requête ou de produit cartésien non autorisés.

```sql
SELECT COUNT(lieu), lieu
FROM transaction
INNER JOIN equipe ON transaction.nomEquipe = equipe.nom
WHERE YEAR(date) = 2021 AND style = 'market making'
ORDER BY lieu;
```

#### mmtj04 Donner le prix moyen des actifs des traités par les traders market maker  par zone géographique de transaction ATTENTION : utilisation de sous-requête ou de produit cartésien non autorisés.

```sql
SELECT AVG(prix), lieu
FROM transaction
INNER JOIN equipe ON transaction.nomEquipe = equipe.nom
WHERE style = 'market making'
GROUP BY lieu;
```

#### mmtj05 Donner la liste des classes d’actifs des traders qui ont effectué des transactions le 1ER Janvier 2016 sous le management de monsieur SmithATTENTION : utilisation de sous-requête ou de produit cartésien non autorisés.

```sql
SELECT classe_actif
FROM transaction
INNER JOIN trader ON transaction.nomEquipe = trader.nomEquipe
INNER JOIN equipe ON transaction.nomEquipe = equipe.nom
WHERE date = '2016-01-01' AND chef = 'SMITH';
```

#### mmtj21 Donner le nombre moyen d'années d'expérience des traders d’action par style  de stratégie d’équipe ATTENTION : utilisation de sous-requête ou de produit cartésien non autorisés.

```sql
SELECT AVG(anneeExperience), style
FROM transaction
INNER JOIN trader ON transaction.nomEquipe = trader.nomEquipe
INNER JOIN equipe ON transaction.nomEquipe = equipe.nom
WHERE classe_actif = 'action'
GROUP BY style;
```

### Multi-tables, avec jointures

#### mmts01 Donner la liste des noms et classes d’actifs des traders ayant plus de 3 ans d'expérience et faisant partie d'une équipe de style arbitrage statistique. On affichera par ordre alphabétique sur les noms. ATTENTION : utilisation de jointure (y compris le produit cartésien) non autorisée.

```sql
SELECT nom, classe_actif
FROM trader
WHERE anneeExperience > 3 AND nomEquipe IN ( 
    SELECT nom 
    FROM equipe
    WHERE style = 'arbitrage statistique'
)
ORDER BY nom;
```

#### mmts02 Donner les différents marchés(lieux), triés par ordre alphabétique, des transactions effectuées dans  l'équipe du chef Smith avec un prix inférieur à 20. ATTENTION : utilisation de jointure (y compris le produit cartésien) non autorisée.

```sql
SELECT lieu
FROM transaction
WHERE prix <20 AND nomEquipe IN ( 
    SELECT nom 
    FROM equipe
    WHERE chef = 'SMITH'
)
ORDER BY lieu;
```

#### mmts03 Donner le nombre de marchés sur lesquels sont intervenus les traders de volatilite en 2015. ATTENTION : utilisation de jointure (y compris le produit cartésien) non autorisée.

```sql
SELECT COUNT(lieu)
FROM transaction
WHERE prix <20 AND YEAR(date) = 2015 AND nomEquipe IN ( 
    SELECT nom
    FROM equipe
    WHERE style = 'trading de volatilite'
)
GROUP BY lieu;
```

#### mmts04 Donner le prix moyen des actifs des traités par les traders market maker  par zone géographique de transaction. ATTENTION : utilisation de jointure (y compris le produit cartésien) non autorisée.

```sql
SELECT AVG(prix), lieu
FROM transaction
WHERE nomEquipe IN ( 
    SELECT nom
    FROM equipe
    WHERE style = 'market making'
)
GROUP BY lieu;
```

#### mmts05 Donner la liste des classes d’actifs des traders qui ont effectué des transactions le 1ER Janvier 2016 sous le management de monsieur Smith. ATTENTION: utilisation de jointure (y compris le produit cartésien) non autorisée.

```sql
SELECT classe_actif
FROM trader
WHERE nomEquipe IN ( 
    SELECT nom
    FROM equipe
    WHERE chef = 'SMITH'
)
AND nomEquipe IN (
    SELECT nomEquipe
    FROM transaction
    WHERE date = '2016-01-01'
);
```
