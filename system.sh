# System

## load ssh credentials
eval "$(ssh-agent -s >/dev/null 2>&1)" >/dev/null 2>&1

# localstack setup for macOS
TMPDIR=/private$TMPDIR
