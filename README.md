# Les Traiteurs Engagés

Landing page du service Les Traiteurs Engagés, porté par la [Plateforme de l'inclusion](https://inclusion.beta.gouv.fr/).

## Déploiement

Site statique déployé sur Scalingo via le [nginx-buildpack](https://github.com/Scalingo/nginx-buildpack).

```bash
git push scalingo main
```

## Structure

```
src/
├── index.html      # Page principale
├── styles.css      # Feuille de styles
└── assets/
    ├── fonts/      # Marianne, Fraunces
    └── images/     # Images et illustrations
```

## Licence

[MIT](LICENSE)
