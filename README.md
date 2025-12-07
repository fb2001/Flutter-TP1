# Flutter TP1 - Profile Card & Quiz Application



Ce projet est une application Flutter développée dans le cadre du TP1, visant à se familiariser avec la création d'interfaces graphiques en Flutter en utilisant les widgets Stateless et Stateful. L'application comporte deux exercices principaux :

1. **Exercice 1** : Carte de profil (Profile Card)
2. **Exercice 2** : Quiz interactif sur Flutter

##  Lien GitHub

Le code source complet de l'application Flutter est disponible à l'adresse suivante :

**[https://github.com/fb2001/Flutter-TP1.git](https://github.com/fb2001/Flutter-TP1.git)**

##  Fonctionnalités

###  Exercice 1 : Profile Card
- Affichage d'une carte de profil élégante avec avatar circulaire
- Informations personnelles (nom, rôle, email, téléphone, localisation, réseaux sociaux)
- Design moderne avec dégradé de couleurs et ombres
- Interface responsive et centrée

###  Exercice 2 : Quiz Flutter
- Quiz interactif de 5 questions sur Flutter
- Questions Vrai/Faux avec feedback immédiat
- Système de score en temps réel
- Écran de résultats avec pourcentage
- Possibilité de recommencer le quiz
- Gestion de l'état avec StatefulWidget

##  Architecture

### Structure du Projet

```
lib/
└── main.dart
    ├── MyApp (StatelessWidget)
    ├── MainMenu (StatelessWidget)
    ├── ProfileHomePage (StatelessWidget)
    │   ├── ProfileAvatar (StatelessWidget)
    │   └── ProfileCard (StatelessWidget)
    │       └── InfoRow (StatelessWidget)
    └── QuizzPage (StatefulWidget)
        └── _QuizzPageState
```

### Widgets Principaux

#### Widgets Stateless
- **MyApp** : Widget racine de l'application, définit le thème global
- **MainMenu** : Menu principal avec navigation vers les deux exercices
- **ProfileHomePage** : Page d'affichage du profil
- **ProfileAvatar** : Avatar circulaire avec gestion d'erreur d'image
- **ProfileCard** : Carte contenant les informations du profil
- **InfoRow** : Ligne d'information avec icône et texte

#### Widgets Stateful
- **QuizzPage** : Gestion du quiz avec état dynamique
  - Progression des questions
  - Calcul du score
  - Affichage des résultats
  - Réinitialisation du quiz

### Modèle de Données

```dart
class Question {
  final String text;
  final bool answer;
}
```

## 🎨 Design

### Palette de Couleurs
- **Couleur principale** : `#7B001C` (Rouge bordeaux)
- **Background** : Dégradé du rouge bordeaux vers transparent
- **Cartes** : Blanc avec élévation
- **Boutons** : 
  - Vrai : Vert
  - Faux : Rouge
  - Principal : Rouge bordeaux

### Thème Material Design 3
- Utilisation de Material 3 pour un design moderne
- ColorScheme généré à partir de la couleur seed
- AppBar personnalisée avec élévation
- Boutons avec coins arrondis
- Cartes avec ombres douces

##  Installation et Exécution

### Prérequis
- Flutter SDK (version 3.0 ou supérieure)
- Dart SDK
- Un IDE (VS Code, Android Studio, IntelliJ)
- Un émulateur ou un appareil physique

### Étapes d'installation

1. **Cloner le dépôt**
```bash
git clone https://github.com/fb2001/Flutter-TP1.git
cd Flutter-TP1
```

2. **Installer les dépendances**
```bash
flutter pub get
```

3. **Vérifier la configuration Flutter**
```bash
flutter doctor
```

4. **Exécuter l'application**
```bash
flutter run
```

### Configuration des Assets

Assurez-vous d'avoir le fichier `pubspec.yaml` configuré avec les assets :

```yaml
flutter:
  assets:
    - assets/images/fadel.png
```

##  Utilisation

1. **Lancement** : L'application démarre sur le menu principal
2. **Navigation** :
   - Cliquer sur "Exercice 1: Profile Card" pour voir la carte de profil
   - Cliquer sur "Exercice 2: Quizz" pour commencer le quiz
3. **Quiz** :
   - Répondre aux questions en cliquant sur VRAI ou FAUX
   - Voir le feedback immédiat (SnackBar verte pour correct, rouge pour incorrect)
   - Consulter le score final avec le pourcentage
   - Recommencer le quiz avec le bouton "Recommencer"

##  Choix Techniques

### Gestion de l'État
- **StatelessWidget** pour les composants statiques (profil, menu)
- **StatefulWidget** pour les composants dynamiques (quiz)
- Utilisation de `setState()` pour mettre à jour l'interface

### Navigation
- `Navigator.push()` avec `MaterialPageRoute` pour la navigation entre les pages
- Bouton de retour automatique dans l'AppBar

### Feedback Utilisateur
- **SnackBar** pour les notifications de réponse
- Désactivation des boutons pendant le traitement (`_isProcessing`)
- Animations fluides avec `Future` et `async/await`

### Gestion des Erreurs
- `errorBuilder` dans `Image.asset()` pour afficher un placeholder en cas d'erreur de chargement d'image

##  Questions du Quiz

1. Flutter utilise le langage Dart , vrai 
2. Un StatelessWidget peut changer son état , faux
3. MaterialApp est un widget racine pour Material Design , vrai
4. Scaffold fournit la structure de base d'une page , vrai 
5. setState() est utilisé dans les StatelessWidget , faux

##  Auteur

**Fadel Benomar**
- Email : fadel.benomar@umontpellier.com
- Localisation : Montpellier, France
- Social : @fb2001

##  Licence

Ce projet est réalisé dans le cadre d'un travail pratique académique.

##  Remerciements

- Équipe Flutter pour le framework
- Université de Montpellier pour l'encadrement du TP

---

**Note** : Pour toute question ou problème, n'hésitez pas à ouvrir une issue sur le dépôt GitHub.
