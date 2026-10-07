# PromCon Website

This repository contains both the content and the static-site generator code for the
PromCon website.

## Prerequisites

You need to have a working Ruby environment set up and then install the
necessary gems:

```bash
cd docs
bundle
```

## Building

To generate the static site, run:

```bash
bundle exec nanoc
```

The resulting static site will be stored in the `output` directory.

## Development Server

To run a local server that displays the generated site, run:

```bash
# Rebuild the site whenever relevant files change:
bundle exec guard
# Start the local development server:
bundle exec nanoc view
```

You should now be able to view the generated site at
[http://localhost:3000/](http://localhost:3000).

## Docker

As an alternative to a local Ruby setup, you can build and preview the site
using the provided [Dockerfile](Dockerfile):

```bash
docker build -t promcon-site .
docker run --rm -p 3000:3000 promcon-site
```

The site is then available at [http://localhost:3000/](http://localhost:3000).

The image contains the site as it was at build time. To preview local changes,
rebuild the image, or mount your checkout and rebuild inside the container:

```bash
docker run --rm -p 3000:3000 -v "$PWD":/site promcon-site \
  sh -c 'bundle exec nanoc && bundle exec nanoc view --host 0.0.0.0'
```

## License

Apache License 2.0, see [LICENSE](LICENSE).
