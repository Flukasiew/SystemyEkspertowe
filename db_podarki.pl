:- dynamic name/1.
name('Call_Of_Duty_Black_Ops').
name('Pluszwoy_Mis_Ben').
name('GTA_3').
name('Lizak_o_samku_Coli').
name('HotWeels').
name('Tabliczka_Czekolady').
name('Chinska_podróbka_HotWeels').
name('Pluszowa_Lalka_Lola').
name('Bilet_na_koncert_Metalici').
name('Vocher_na_FlySpot').
name('FIFA-09').
name('Wakacje_na_Karaibach').
name('Kebab').
name('DND_5e_Podręcznik_Gracza').

:- dynamic class/2.
class('Call_Of_Duty_Black_Ops','gra').
class('Pluszwoy_Mis_Ben','pluszak').
class('GTA_3','gra').
class('Lizak_o_samku_Coli','jedzenie').
class('HotWeels','samochodzik').
class('Tabliczka_Czekolady','jedzenie').
class('Chinska_podróbka_HotWeels','samochodzik').
class('Pluszowa_Lalka_Lola','pluszak').
class('Bilet_na_koncert_Metalici','wydarzenie').
class('Vocher_na_FlySpot','wydarzenie').
class('FIFA-09','gra').
class('Wakacje_na_Karaibach','wydarzenie').
class('Kebab','jedzenie').
class('DND_5e_Podręcznik_Gracza','gra').

:- dynamic cost/2.
cost('Call_Of_Duty_Black_Ops',100).
cost('Pluszwoy_Mis_Ben',30).
cost('GTA_3',100).
cost('Lizak_o_samku_Coli',3).
cost('HotWeels',4).
cost('Tabliczka_Czekolady',4).
cost('Chinska_podróbka_HotWeels',2).
cost('Pluszowa_Lalka_Lola',100).
cost('Bilet_na_koncert_Metalici',100).
cost('Vocher_na_FlySpot',100).
cost('FIFA-09',30).
cost('Wakacje_na_Karaibach',5000).
cost('Kebab',30).
cost('DND_5e_Podręcznik_Gracza',100).

:- dynamic ageRestriction/2.
ageRestriction('Call_Of_Duty_Black_Ops',18).
ageRestriction('Pluszwoy_Mis_Ben',0).
ageRestriction('GTA_3',18).
ageRestriction('Lizak_o_samku_Coli',3).
ageRestriction('HotWeels',3).
ageRestriction('Tabliczka_Czekolady',0).
ageRestriction('Chinska_podróbka_HotWeels',3).
ageRestriction('Pluszowa_Lalka_Lola',0).
ageRestriction('Bilet_na_koncert_Metalici',16).
ageRestriction('Vocher_na_FlySpot',12).
ageRestriction('FIFA-09',3).
ageRestriction('Wakacje_na_Karaibach',0).
ageRestriction('Kebab',0).
ageRestriction('DND_5e_Podręcznik_Gracza',0).

:- dynamic availability/2.
availability('Call_Of_Duty_Black_Ops',0).
availability('Pluszwoy_Mis_Ben',10).
availability('GTA_3',0).
availability('Lizak_o_samku_Coli',0).
availability('HotWeels',1).
availability('Tabliczka_Czekolady',0).
availability('Chinska_podróbka_HotWeels',30).
availability('Pluszowa_Lalka_Lola',10).
availability('Bilet_na_koncert_Metalici',0).
availability('Vocher_na_FlySpot',0).
availability('FIFA-09',10).
availability('Wakacje_na_Karaibach',0).
availability('Kebab',0).
availability('DND_5e_Podręcznik_Gracza',10).

:- dynamic age/2.
age('Call_Of_Duty_Black_Ops',10).
age('Pluszwoy_Mis_Ben',2).
age('GTA_3',15).
age('Lizak_o_samku_Coli',0).
age('HotWeels',2).
age('Tabliczka_Czekolady',0).
age('Chinska_podróbka_HotWeels',3).
age('Pluszowa_Lalka_Lola',6).
age('Bilet_na_koncert_Metalici',0).
age('Vocher_na_FlySpot',0).
age('FIFA-09',13).
age('Wakacje_na_Karaibach',0).
age('Kebab',0).
age('DND_5e_Podręcznik_Gracza',10).

:- dynamic popularity/2.
popularity('Call_Of_Duty_Black_Ops',7).
popularity('Pluszwoy_Mis_Ben',7).
popularity('GTA_3',10).
popularity('Lizak_o_samku_Coli',5).
popularity('HotWeels',5).
popularity('Tabliczka_Czekolady',7).
popularity('Chinska_podróbka_HotWeels',5).
popularity('Pluszowa_Lalka_Lola',5).
popularity('Bilet_na_koncert_Metalici',10).
popularity('Vocher_na_FlySpot',7).
popularity('FIFA-09',7).
popularity('Wakacje_na_Karaibach',5).
popularity('Kebab',5).
popularity('DND_5e_Podręcznik_Gracza',10).

:- dynamic isDigital/2.
isDigital('Call_Of_Duty_Black_Ops',1).
isDigital('Pluszwoy_Mis_Ben',0).
isDigital('GTA_3',1).
isDigital('Lizak_o_samku_Coli',0).
isDigital('HotWeels',0).
isDigital('Tabliczka_Czekolady',0).
isDigital('Chinska_podróbka_HotWeels',0).
isDigital('Pluszowa_Lalka_Lola',0).
isDigital('Bilet_na_koncert_Metalici',1).
isDigital('Vocher_na_FlySpot',1).
isDigital('FIFA-09',1).
isDigital('Wakacje_na_Karaibach',1).
isDigital('Kebab',0).
isDigital('DND_5e_Podręcznik_Gracza',0).

:- dynamic isCooperative/2.
isCooperative('Call_Of_Duty_Black_Ops',1).
isCooperative('Pluszwoy_Mis_Ben',0).
isCooperative('GTA_3',0).
isCooperative('Lizak_o_samku_Coli',0).
isCooperative('HotWeels',1).
isCooperative('Tabliczka_Czekolady',0).
isCooperative('Chinska_podróbka_HotWeels',0).
isCooperative('Pluszowa_Lalka_Lola',0).
isCooperative('Bilet_na_koncert_Metalici',1).
isCooperative('Vocher_na_FlySpot',0).
isCooperative('FIFA-09',1).
isCooperative('Wakacje_na_Karaibach',1).
isCooperative('Kebab',0).
isCooperative('DND_5e_Podręcznik_Gracza',1).

dangereous('Call_Of_Duty_Black_Ops',0).
dangereous('Pluszwoy_Mis_Ben',0).
dangereous('GTA_3',0).
dangereous('Lizak_o_samku_Coli',0).
dangereous('HotWeels',0).
dangereous('Tabliczka_Czekolady',0).
dangereous('Chinska_podróbka_HotWeels',1).
dangereous('Pluszowa_Lalka_Lola',0).
dangereous('Bilet_na_koncert_Metalici',0).
dangereous('Vocher_na_FlySpot',0).
dangereous('FIFA-09',0).
dangereous('Wakacje_na_Karaibach',1).
dangereous('Kebab',0).
dangereous('DND_5e_Podręcznik_Gracza',0).

size('Call_Of_Duty_Black_Ops',0).
size('Pluszwoy_Mis_Ben',0).
size('GTA_3',0).
size('Lizak_o_samku_Coli',0).
size('HotWeels',0).
size('Tabliczka_Czekolady',0).
size('Chinska_podróbka_HotWeels',0).
size('Pluszowa_Lalka_Lola',1).
size('Bilet_na_koncert_Metalici',0).
size('Vocher_na_FlySpot',0).
size('FIFA-09',0).
size('Wakacje_na_Karaibach',0).
size('Kebab',0).
size('DND_5e_Podręcznik_Gracza',0).

