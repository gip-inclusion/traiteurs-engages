# Plan d'implémentation - Landing Page "Les Traiteurs Engagés"

## 1. Structure du projet

```
Les Traiteurs Engagés V2/
├── index.html              # Page principale
├── styles.css              # CSS custom (fonts, clip-paths, animations)
├── assets/
│   ├── fonts/
│   │   ├── Fraunces-Variable.ttf
│   │   ├── Marianne-Regular.woff2
│   │   ├── Marianne-Regular.woff
│   │   ├── Marianne-Bold.woff2
│   │   └── Marianne-Bold.woff
│   ├── images/
│   │   ├── logo-traiteurs-engages.png          (db37b06f...)
│   │   ├── logo-republique.png                 (à fournir ou placeholder)
│   │   ├── logo-plateforme-inclusion.png       (à fournir ou placeholder)
│   │   ├── hero-chef.png                       (ba4ac706...)
│   │   ├── hero-food.png                       (4a099941...)
│   │   ├── shape-8.png                         (5cfe41ab...)
│   │   ├── shape-mushroom.png                  (16044038...)
│   │   ├── shape-butterfly.png                 (18ef7bec...)
│   │   ├── shape-star-pink.png                 (52dcb3ae...)
│   │   ├── shape-drop.png                      (5e943fbe...)
│   │   ├── shape-scallop-coral.png             (8448cd9c...)
│   │   ├── shape-star-coral.png                (bec25227...)
│   │   ├── shape-scallop-pink.png              (e35be31b...)
│   │   ├── deco-brush-strokes.png              (56832d86...)
│   │   ├── chemin-desktop.svg                  (cheminDesktop.svg)
│   │   └── chemin-mobile.svg                   (cheminMobile.svg)
│   └── screenshots/                            (à fournir par l'utilisateur)
│       ├── screenshot-messagerie.png
│       ├── screenshot-demande.png
│       └── screenshot-catalogue.png
└── source/                 # Assets originaux (conservés)
```

## 2. Renommage des assets

| Fichier original (hash) | Nouveau nom | Description |
|---|---|---|
| `db37b06fe6c1...` | `logo-traiteurs-engages.png` | Logo complet avec sous-titre |
| `ba4ac7063ce7...` | `hero-chef.png` | Photo chef dressant des assiettes |
| `4a099941ef9c...` | `hero-food.png` | Photo canapés/plats |
| `5cfe41abaa76...` | `shape-8.png` | Forme 8 corail |
| `16044038080390...` | `shape-mushroom.png` | Forme champignon corail |
| `18ef7bec897a...` | `shape-butterfly.png` | Forme papillon corail |
| `52dcb3ae9e71...` | `shape-star-pink.png` | Étoile rose avec traits rouges |
| `5e943fbe5173...` | `shape-drop.png` | Forme goutte corail |
| `8448cd9cb229...` | `shape-scallop-coral.png` | Cercle dentelé corail |
| `bec252278825...` | `shape-star-coral.png` | Étoile corail |
| `e35be31b60d3...` | `shape-scallop-pink.png` | Cercle dentelé rose |
| `56832d86b069...` | `deco-brush-strokes.png` | Trois traits pinceau rouge foncé |
| `cheminDesktop.svg` | `chemin-desktop.svg` | Chemin SVG desktop |
| `cheminMobile.svg` | `chemin-mobile.svg` | Chemin SVG mobile |

## 3. Design Tokens

### Couleurs
- **Navy (primary):** `#1A3A52`
- **Coral accent:** `#F06B5B`
- **Pink light:** `#F9C5C0`
- **Cream background:** `#FDF5EE`
- **Dark red (brush):** `#8B1A1A`
- **White:** `#FFFFFF`

### Typographies
- **Marianne Regular (400):** corps de texte, paragraphes
- **Marianne Bold (700):** titres, boutons, navigation
- **Fraunces Variable (italic):** mot "engagés", décorations typographiques

### Boutons
- **CTA primaire** (fond navy, texte blanc, pill shape)
- **CTA outlined** (bordure navy ou coral, fond transparent, pill shape)

## 4. Sections de la page (7 sections)

### Section 1 - Header/Navigation
- Logo République française (gauche) + Logo Les traiteurs engagés
- Liens "Demande d'aide" + bouton "Se connecter" (navy pill)
- Responsive: hamburger menu sur mobile (ou liens simplifiés)

### Section 2 - Hero
- **Desktop:** 2 colonnes (texte gauche, images droite)
- **Mobile:** Stack vertical (texte puis images)
- Titre avec "engagés" en Fraunces italic
- Bouton CTA → https://tally.so/r/wgMrXd
- Statistiques (61 / 350+ / 89%)
- Images composites avec clip-path organiques
- Fond crème `#FDF5EE`

### Section 3 - Comment ça fonctionne
- Titre avec soulignement décoratif (brush strokes)
- 4 étapes avec marqueurs décoratifs (formes corail)
- Chemin SVG en arrière-plan (desktop vs mobile swap)
- Fond blanc

### Section 4 - Bientôt disponible
- Badge "Lancement avril 2026"
- Titre + sous-titre
- 3 screenshots de features (à fournir)
- Bouton "Demander une démo" → placeholder `#demo`
- Fond navy `#1A3A52`

### Section 5 - Plateforme de l'inclusion
- Texte + logo Plateforme de l'inclusion
- Fond crème

### Section 6 - CTA final
- Titre rouge/corail
- Bouton outlined coral → https://tally.so/r/wgMrXd
- Fond navy `#1A3A52`

### Section 7 - Footer
- Logo + liens (CGU/CGV, Mentions légales, etc.)
- Fond crème

## 5. Approche technique

### Tailwind CSS via CDN
- Utilisation de `<script src="https://cdn.tailwindcss.com">` avec config inline
- Configuration custom des couleurs, fonts et breakpoints dans `tailwind.config`

### CSS custom (`styles.css`)
- `@font-face` pour Marianne et Fraunces
- Clip-paths pour les formes organiques des photos hero
- Positionnement du chemin SVG dans la section "Comment ça fonctionne"
- Animations subtiles (scroll-triggered si souhaité)

### Responsive
- Mobile-first avec breakpoint `lg:` (1024px) pour desktop
- Swap des SVG chemin (mobile vs desktop) via classes `hidden`/`block`
- Navigation adaptative

## 6. Étapes d'implémentation (ordre)

1. **Setup** : Créer la structure de dossiers + copier/renommer les assets
2. **HTML de base** : Structure sémantique avec toutes les sections
3. **Tailwind config** : Couleurs, fonts, breakpoints custom
4. **CSS custom** : @font-face, clip-paths, positionnements spéciaux
5. **Section par section** : Intégrer chaque section en commençant par le header
6. **Responsive** : Ajuster mobile/desktop pour chaque section
7. **Finitions** : Liens, accessibilité, smooth scroll, meta tags

## 7. Points d'attention

- Les **screenshots de la section "Bientôt disponible"** devront être fournis par l'utilisateur (messagerie, demande sur-mesure, catalogue)
- Le **logo République française** devra être fourni ou on utilise un placeholder
- Le **logo Plateforme de l'inclusion** devra être fourni ou on utilise un placeholder
- Le lien **"Demander une démo"** est en placeholder `#demo` pour l'instant
- Le lien **"Se connecter"** est en placeholder `#login`
