# Loss : installer l'appli sur ton PC et ton téléphone

Ce dossier contient une vraie appli installable (une « PWA »). Une fois en ligne, elle s'installe avec l'icône Loss, s'ouvre en plein écran sans barre de navigateur et fonctionne même sans internet. Avec la synchro activée, ce que tu fais sur ton téléphone apparaît sur ton PC, et inversement.

Compte environ 10 minutes. Tout est gratuit.

---

## Étape 1 : la synchro PC ↔ téléphone (facultatif, environ 5 min)

Sans cette étape, l'appli marche, mais chaque appareil garde ses propres données.

1. Crée un compte gratuit sur **supabase.com**, puis clique sur **New project**. Choisis un nom (par exemple `loss`), un mot de passe de base de données (garde-le pour toi) et la région **Europe**.
2. Une fois le projet prêt, ouvre **SQL Editor** dans le menu de gauche, puis **New query**. Colle tout le contenu du fichier `supabase.sql` et clique sur **Run**. Le message « Success » doit s'afficher.
3. Va dans **Authentication**, puis dans la section des fournisseurs de connexion (**Sign In / Providers**), sur **Email**. Désactive **Confirm email** pour pouvoir te connecter tout de suite, sans lien de confirmation.
4. Va dans **Project Settings**, puis **API** (ou **Data API**). Copie la **Project URL** et la clé **anon public**.
5. Ouvre le fichier `config.js` avec le Bloc-notes (ou TextEdit sur Mac) et colle ces deux valeurs entre les guillemets :

```js
window.LOSS_CONFIG = {
  supabaseUrl: "https://xxxxxxxx.supabase.co",
  supabaseAnonKey: "eyJhbGciOi..."
};
```

La clé « anon public » peut se trouver dans le code de l'appli sans risque : grâce à `supabase.sql`, chaque compte ne peut lire et modifier que ses propres données.

## Étape 2 : mettre l'appli en ligne (environ 2 min)

1. Va sur **app.netlify.com/drop**.
2. Glisse **tout le dossier `loss-app`** (décompressé) dans la zone de dépôt.
3. Netlify te donne une adresse du type `https://nom-au-hasard.netlify.app`. C'est ton appli.
4. **Important :** clique sur l'option pour réclamer le site et crée un compte Netlify gratuit **dans l'heure qui suit**. Sinon, le site est supprimé.

Tu peux renommer l'adresse dans Netlify : **Site configuration**, puis **Change site name**, par exemple `loss-tonprenom.netlify.app`.

## Étape 3 : installer Loss

- **PC (Chrome ou Edge)** : ouvre ton adresse Netlify, puis clique sur l'icône d'installation dans la barre d'adresse ou sur le bouton **Installer Loss** en haut de l'appli. Loss apparaît ensuite dans ton menu Démarrer ou ton Dock.
- **Android (Chrome)** : ouvre l'adresse, menu ⋮, puis **Installer l'application** (ou **Ajouter à l'écran d'accueil**).
- **iPhone (Safari)** : ouvre l'adresse, bouton **Partager**, puis **Sur l'écran d'accueil**.

## Étape 4 : relier tes appareils

Dans l'appli, ouvre **Profil**, puis la carte **Synchronisation et sauvegarde** :

1. Sur le premier appareil, clique sur **Créer mon compte** avec ton e-mail et un mot de passe.
2. Sur l'autre appareil, clique sur **Se connecter** avec le même e-mail et le même mot de passe.

C'est fait. Les changements se synchronisent automatiquement. Si tu modifies quelque chose sur ton PC, rouvre l'appli sur ton téléphone pour voir la mise à jour.

---

## Bon à savoir

- **Hors ligne** : l'appli s'ouvre et fonctionne sans internet. Les changements sont gardés sur l'appareil et envoyés dès que la connexion revient.
- **Sauvegarde** : le bouton **Télécharger une sauvegarde** (dans Profil) crée un fichier de tes données. **Restaurer une sauvegarde** permet de le recharger, même sans la synchro.
- **Tes données de la version Claude** ne sont pas transférées automatiquement. Il suffit de ressaisir ton profil, ton budget et tes goûts une fois.
- **Mettre à jour l'appli** : remplace les fichiers du dossier, change `loss-v1` en `loss-v2` dans `sw.js`, puis glisse le dossier dans ton site Netlify (page **Deploys**, zone de dépôt en bas).

## Contenu du dossier

| Fichier | Rôle |
|---|---|
| `index.html` | L'appli |
| `config.js` | Tes réglages de synchro (à remplir à l'étape 1) |
| `manifest.webmanifest` | Nom, couleurs et icônes de l'appli installée |
| `sw.js` | Fonctionnement hors ligne |
| `icons/` | Icône Loss (favicon, écran d'accueil, Android, iPhone) |
| `supabase.sql` | Table de synchro à créer dans Supabase |
