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

`GalleryRepositoryModule` currently selects `MockGalleryRepository`, which returns demo Unsplash images. `GalleryRepository` is the production implementation for a public JSON manifest (for example, in Supabase Storage).

After switching the DI module to `GalleryRepository`, pass the manifest URL when running the app:

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
{
  "photos": [
    {
      "thumbnail": "https://storage.example.com/thumbnails/portrait-01.webp",
      "full": "https://storage.example.com/full/portrait-01.webp",
      "title": "Portrait I",
      "category": "Portraits"
    }
  ]
}
```

Image URLs in the manifest must be absolute.

The storage endpoint must allow browser requests from the site's domain (CORS). Upload optimized thumbnails and full-size web images rather than camera originals.

## GitHub Pages

The workflow in `.github/workflows/deploy-pages.yml` builds and deploys every push to `main`.

1. In the GitHub repository, open `Settings → Pages` and select `GitHub Actions`.
2. Add the repository variable `GALLERY_MANIFEST_URL` under `Settings → Secrets and variables → Actions → Variables`.
3. Configure the custom domain in `Settings → Pages` after its DNS records are ready.

The workflow assumes the final site is served from the root of a custom domain. If it is temporarily served as `username.github.io/repository`, change `--base-href /` to `--base-href /repository/`.
