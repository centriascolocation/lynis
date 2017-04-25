#/usr/bin/env sh

VERSION=2.4.8

function echo_exit()
{
    echo "$*"
    exit 1
}

wget --version >/dev/null || echo_exit "wget command not found. Please install first."

wget --no-clobber -q -O lynis-${VERSION}.tar.gz  https://github.com/CISOfy/lynis/archive/${VERSION}.tar.gz

tar xfz lynis-${VERSION}.tar.gz

(
  cd lynis-${VERSION}
  ./lynis show version ; ./lynis update info
  echo "Lynis is ready to use. Please find it here: $(pwd)"
)
