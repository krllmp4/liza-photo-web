# Liza Photography

Minimal editorial photography portfolio built with Flutter Web.

The project uses a small feature-first clean architecture:

```text
lib/
├── core/
│   ├── config/
│   ├── shared_widgets/
│   └── theme/
└── src/features/gallery/
    ├── data/          # Dio service and repository implementation
    ├── domain/        # Models and repository contract
    └── presentation/  # Pages, widgets and ChangeNotifier view model
```

Navigation uses Flutter's built-in `Navigator`. There is no router, provider, BLoC, code generation, or UI package.

## Run

```sh
fvm flutter pub get
fvm flutter run -d chrome
```

Without configuration the app shows demo Unsplash images. To connect a public JSON manifest (for example, in Supabase Storage):

```sh
fvm flutter run -d chrome \
  --dart-define=GALLERY_MANIFEST_URL=https://example.com/portfolio/photos.json
```

Pass the same define to `fvm flutter build web`.

```sh
fvm flutter build web --release \
  --dart-define=GALLERY_MANIFEST_URL=https://example.com/portfolio/photos.json
```

## Manifest

```json
[
  {
    "id": "portrait-01",
    "thumbnail": "thumbnails/portrait-01.webp",
    "full": "full/portrait-01.webp",
    "width": 1600,
    "height": 2400,
    "title": "Portrait I",
    "category": "Portraits"
  }
]
```

Relative image paths are resolved against the manifest URL.

The storage endpoint must allow browser requests from the site's domain (CORS). Upload optimized thumbnails and full-size web images rather than camera originals.

## GitHub Pages

The workflow in `.github/workflows/deploy-pages.yml` builds and deploys every push to `main`.

1. In the GitHub repository, open `Settings → Pages` and select `GitHub Actions`.
2. Add the repository variable `GALLERY_MANIFEST_URL` under `Settings → Secrets and variables → Actions → Variables`.
3. Configure the custom domain in `Settings → Pages` after its DNS records are ready.

The workflow assumes the final site is served from the root of a custom domain. If it is temporarily served as `username.github.io/repository`, change `--base-href /` to `--base-href /repository/`.
