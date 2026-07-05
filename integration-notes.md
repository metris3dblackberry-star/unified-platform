# Technikai osszefoglalo

## Mostani allapot

Mindket rendszer Flask alapokra epul, de mas fokuszu:

- `knb-crm`
  - multi-tenant CRM/szerviz platform
  - ugyfelek, szolgaltatasok, alkatreszek, munkalapok, billing, RBAC
- `PLANETA-ERP`
  - projekt- es penzugyi ERP
  - projektek, ugyfelek, keszlet, szamlak, alvallalkozok, riportok

## Mi kozositheto kesobb

- ugyfel torzsadat
- termek/szolgaltatas katalogus egy resze
- szamlazasi torzsadatok
- dokumentumkezeles
- riport alapok

## Mi maradjon egyelore kulon

- CRM multi-tenant logika es szereloi workflow
- ERP projektpenzugyi folyamatok
- meglovo sajat adatmodell es sajat route-struktura

## CRM backlog a kapott lista alapjan

### Rogton becsatornazhato fejlesztesek

- szolgaltatas felvitele ugyfel oldalrol is
- szolgaltatas XLS import
- termek XLS import
- `munkalap` megnevezes csereje `TIG`-re vagy `TIG / munkalap` atmeneti formara
- TIG oldal uj tabban nyitasa

### Billing/szamlazasi resz

- elolegszamla es dijbekero tipusok
- vevo kotelezo adatai: cegnev, szamlaszam, adoszam
- fizetesi modok bovitese
- teljesites, kiallitas, fizetes datuma
- AFA kulcsok teljesebb listaja
- uj felhasznalohoz szamlalo nullazas
- atlagos munkaertek riport definialasa

### Jogosultsag es meghivas

- csak letezo, megfelelo jogosultsagu munkas kaphasson meghivot
- 404-re futo vagy ervenytelen meghivo ne menjen ki

### Dokumentumtar

- kulon strukturalt ceges dokumentummappa
- dolgozonkent kulon almappa
- projektalapu szerzodes- es epitesi dokumentaciok
- ev es honap szerinti konyvelesi tarolas

## Javasolt sorrend

1. Kozos shell platform elesitese
2. CRM dokumentumtar modul
3. CRM XLS importok
4. CRM TIG atnevezes es uj tabos workflow
5. CRM szamlazasi kotelezo mezok es AFA logika
6. Keszobbi melyebb CRM-ERP adatkozosites
