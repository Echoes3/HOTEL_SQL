--Nombre de clients

SELECT count ( CLI_ID)
FROM T_CLIENT

--Les clients triés sur le titre et le nom

SELECT * 
FROM T_CLIENT 
ORDER BY TIT_CODE, CLI_NOM


--Les clients triés sur le libellé du titre et le nom

SELECT * 
FROM T_CLIENT, T_TITRE
ORDER BY TIT_LIBELLE, CLI_NOM


--Les clients commençant par 'B'

SELECT CLI_NOM
FROM T_CLIENT
WHERE CLI_NOM like 'B%'

--Les clients homonymes

Select COUNT(*), CLI_NOM
FROM T_CLIENT
GROUP BY CLI_NOM 
HAVING Count(*)>1

--Nombre de titres différents

Select distinct TIT_CODE
FROM T_CLIENT


--Nombre d'enseignes

SELECT count ( distinct CLI_ENSEIGNE)
FROM T_CLIENT

--Les clients qui représentent une enseigne 

SELECT CLI_NOM
FROM T_CLIENT
WHERE CLI_ENSEIGNE like '%%'

--Les clients qui représentent une enseigne de transports

SELECT CLI_NOM
FROM T_CLIENT
WHERE CLI_ENSEIGNE like '%TRANSPORT%'

--Nombre d'hommes,Nombres de femmes, de demoiselles, Nombres de sociétés

SELECT count (TIT_CODE)
FROM T_CLIENT
WHERE TIT_CODE like 'M.' 

SELECT count (TIT_CODE)
FROM T_CLIENT
WHERE TIT_CODE like 'Mme.'

SELECT count (TIT_CODE)
FROM T_CLIENT
WHERE TIT_CODE like 'Melle.'

SELECT count (CLI_ENSEIGNE)
FROM T_CLIENT



--Nombre d''emails

SELECT count (EML_ADRESSE)
FROM T_EMAIL


--Client sans email 

SELECT CLI_ID 
FROM T_CLIENT
WHERE CLI_ID
 NOT IN
(SELECT CLI_ID 
FROM T_EMAIL)

--Clients sans téléphone

SELECT CLI_ID 
FROM T_TELEPHONE
WHERE  TYP_CODE <> 'TEL'
 

--Les phones des clients

SELECT TEL_NUMERO
FROM T_TELEPHONE
WHERE TYP_CODE 
LIKE 'TEL'



--Ventilation des phones par catégorie

--Les clients ayant plusieurs téléphones

Select COUNT(*), TEL_NUMERO
FROM T_TELEPHONE
GROUP BY TEL_NUMERO
HAVING Count(*)>1


--Clients sans adresse:

SELECT CLI_ID 
FROM T_CLIENT
WHERE CLI_ID
 NOT IN
(SELECT CLI_ID 
FROM T_ADRESSE)

--Clients sans adresse mais au moins avec mail ou phone 

--Dernier tarif renseigné

SELECT TRF_DATE_DEBUT
FROM T_TARIF
ORDER BY TRF_DATE_DEBUT DESC LIMIT 1

--Tarif débutant le plus tôt 

SELECT TRF_DATE_DEBUT
FROM T_TARIF
ORDER BY TRF_DATE_DEBUT ASC LIMIT 1

--Différentes Années des tarifs

SELECT TRF_DATE_DEBUT
FROM T_TARIF
ORDER BY TRF_PETIT_DEJEUNE

--Nombre de chambres de l'hotel 


SELECT count (CHB_ID)
FROM T_CHAMBRE

--Nombre de chambres par étage

SELECT count (CHB_ID)
FROM T_CHAMBRE
WHERE CHB_ETAGE like 'RDC' 


SELECT count (CHB_ID)
FROM T_CHAMBRE
WHERE CHB_ETAGE like '1er' 


SELECT count (CHB_ID)
FROM T_CHAMBRE
WHERE CHB_ETAGE like '2e' 


--Chambres sans telephone

SELECT CHB_ID
FROM T_CHAMBRE
WHERE CHB_ID
 IN (SELECT CHB_POSTE_TEL
FROM T_CHAMBRE)

--Existence d'une chambre n°13 ?


SELECT CHB_NUMERO
FROM T_CHAMBRE
WHERE CHB_NUMERO like '13' 

--Chambres avec sdb

SELECT CHB_NUMERO
FROM T_CHAMBRE
WHERE CHB_BAIN like '1'



--Chambres avec douche


SELECT CHB_NUMERO
FROM T_CHAMBRE
WHERE CHB_DOUCHE like '1'

--Chambres avec WC


SELECT CHB_NUMERO
FROM T_CHAMBRE
WHERE CHB_WC like '1'

--Chambres sans WC séparés


SELECT CHB_NUMERO
FROM T_CHAMBRE
WHERE CHB_WC not like '1'

--Quels sont les étages qui ont des chambres sans WC séparés ?

SELECT CHB_ETAGE
FROM T_CHAMBRE
WHERE CHB_WC like '0'

--Nombre d'équipements sanitaires par chambre trié par ce nombre d'équipement croissant

--Chambres les plus équipées et leur capacité

SELECT CHB_NUMERO,CHB_COUCHAGE
FROM T_CHAMBRE
ORDER BY CHB_COUCHAGE 

--Repartition des chambres en fonction du nombre d'équipements et de leur capacité

--Nombre de clients ayant utilisé une chambre

SELECT count (distinct CLI_ID)
FROM TJ_CHB_PLN_CLI
WHERE CHB_PLN_CLI_OCCUPE like '1'

--Clients n'ayant jamais utilisé une chambre (sans facture)

SELECT count (distinct CLI_ID)
FROM TJ_CHB_PLN_CLI
WHERE CHB_PLN_CLI_OCCUPE like '0'

--Nom et prénom des clients qui ont une facture

SELECT CLI_NOM, CLI_PRENOM
FROM T_CLIENT
WHERE CLI_ID IN
(SELECT CLI_ID 
FROM T_FACTURE)


--Nom, prénom, telephone des clients qui ont une facture

--Attention si email car pas obligatoire : jointure externe

--Adresse où envoyer factures aux clients

SELECT ADR_LIGNE1
FROM T_ADRESSE

--Répartition des factures par mode de paiement (libellé)

SELECT PMT_CODE
FROM T_FACTURE

--Répartition des factures par mode de paiement 

--Différence entre ces 2 requêtes ? 

--Factures sans mode de paiement 

--Repartition des factures par Années

--Repartition des clients par ville

--Montant TTC de chaque ligne de facture (avec remises)

--Classement du montant total TTC (avec remises) des factures

--Tarif moyen des chambres par années croissantes

--Tarif moyen des chambres par étage et années croissantes

--Chambre la plus cher et en quelle année

--Chambre la plus cher par année 

--Clasement décroissant des réservation des chambres 

--Classement décroissant des meilleurs clients par nombre de réservations

--Classement des meilleurs clients par le montant total des factures

--Factures payées le jour de leur édition

--Facture dates et Délai entre date de paiement et date d'édition de la facture