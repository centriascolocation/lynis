#/usr/bin/env sh

VERSION=2.4.8
SHA1_HASH="91b7e94c1b39c4b41340c55c0ff601e04aef7387"
SHA256_HAHS="6be0dcb0e3c66c76266944b1c5b6f1d8ba617dc1ce89b8d278f4e1f990a6f70a"

function echo_exit()
{
    echo "$*"
    exit 1
}

echo "checking wget ..."
wget --version >/dev/null || echo_exit "wget command not found. Please install first."

echo "downloading lynis in version: ${VERSION} ..."
wget --no-clobber -q -O lynis-${VERSION}.tar.gz https://cisofy.com/files/lynis-${VERSION}.tar.gz

echo "checking downloaded file integrity ..."
if which openssl >/dev/null; then
    _SHA1=$(openssl sha1 lynis-${VERSION}.tar.gz  | cut -f2 -d" ")
elif which sha1sum >/dev/null; then
    _SHA1=$(sha1sum lynis-${VERSION}.tar.gz  | cut -f1 -d" ")
else
    echo_exit "unable to verify download (exit)"
fi

if [ "$_SHA1" == "$SHA1_HASH" ]; then
    echo "extracting lynis and show version and update info ..."
    tar xfz lynis-${VERSION}.tar.gz
    (
        cd lynis-${VERSION}
        ./lynis show version ; ./lynis update info
        echo "Lynis is ready to use. Please find it here: $(pwd)"
    )
else 
    echo_exit "download file integrity could not be verified! (exit)"
fi
