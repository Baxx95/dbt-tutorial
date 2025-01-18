# DBT Tutorial Project

## Introduction
Ce projet est une démonstration pratique de l'utilisation de **dbt (Data Build Tool)** pour gérer et transformer les données dans un environnement analytique. Il met en œuvre des modèles SQL pour structurer, nettoyer et enrichir des données provenant de diverses sources.

---

## Structure du projet

### Arborescence
sales_dbt_project/
│
├── models/
│ ├── staging/ # Modèles pour normaliser les données brutes
│ │ ├── staging_customers.sql
│ │ ├── staging_orders.sql
│ │ └── ...
│ ├── intermediate/ # Modèles pour les transformations intermédiaires
│ │ └── intermediate_customer_orders.sql 
│ ├── analytics/ # Modèles pour les analyses finales
│ │ └── analytics_customer_segments.sql 
│ └── my_first_dbt_model.sql # Exemple de modèle de démarrage 
│ ├── tests/ # Tests pour valider la qualité des données
├── sources/ # Configuration des sources de données
├── dbt_project.yml # Fichier de configuration principal du projet
└── README.md #



---

## Modèles dbt

### **1. Staging**
Les modèles de staging normalisent et nettoient les données brutes :
- **`staging_customers.sql`** : Nettoie les données des clients (supprime les doublons, ajuste les formats de dates, etc.).
- **`staging_orders.sql`** : Prépare les données des commandes pour les analyses ultérieures.

### **2. Intermediate**
Ces modèles intègrent les données entre les étapes :
- **`intermediate_customer_orders.sql`** : Joint les données des clients et des commandes pour construire une vue unifiée.

### **3. Analytics**
Les modèles d'analyses finales produisent des insights :
- **`analytics_customer_segments.sql`** : Segmente les clients selon leurs habitudes d'achat.

---

## Tests dbt (à completer ...)
Des tests automatisés sont utilisés pour garantir la qualité des données :
- **Tests de données uniques** : Vérifient que certaines colonnes, comme les identifiants clients, n'ont pas de doublons.
- **Tests de validité** : Vérifient que les données sont conformes aux contraintes (par exemple, des dates valides).

---

## Sources
Les sources de données sont définies dans le dossier `sources/` :
- **Customers Source** : Les données des clients.
- **Orders Source** : Les données des commandes.

---

## Comment exécuter le projet

1. **Cloner le dépôt** :
   ```bash
   git clone git@github.com:Baxx95/dbt-tutorial.git
   cd dbt-tutorial

2. **Installer dbt : Assurez-vous que dbt est installé sur votre machine** :
    pip install dbt-mysql

3. **Configurer les sources de données** :
    Mettez à jour le fichier profiles.yml avec vos identifiants de base de données.

4. **Exécuter les commandes dbt** :
- Compiler et exécuter les modèles :
    dbt run
- Exécuter les tests :
    dbt test
- Générer une documentation interactive :
    dbt docs generate
    dbt docs serve


Prérequis
- Python 3.8 ou version supérieure.
- MySQL ou une autre base de données compatible avec dbt.
- Accès à un IDE ou éditeur de texte pour écrire et modifier le SQL.

Objectifs pédagogiques
- Apprendre à structurer un projet dbt.
- Comprendre comment nettoyer et transformer des données en SQL.
- Mettre en œuvre des tests pour garantir la qualité des données.

Auteur : 
Ce projet a été réalisé par Diakariaou GOUNDIAM (Zakaria) en tant que tutoriel pratique pour se familiariser avec dbt et les bonnes pratiques en data engineering.

