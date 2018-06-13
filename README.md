# gitbook-calibre
Docker image including gitbook and calibre, for CI/CI. Other images that I found were not able to include images in the PDF output, which is why I created this image.

## Usage:

To compile a book in the current folder you execute:
`docker run --rm -v$(pwd):/gitbook gitbook pdf . book.pdf`

A gitlab ci/cd config may look like:

```
image: coenvl/gitbook-calibre

pdf:
  script:
  - gitbook pdf ./ ./$CI_PROJECT_NAME.pdf
  artifacts:
    paths:
    - $CI_PROJECT_NAME.pdf
```
