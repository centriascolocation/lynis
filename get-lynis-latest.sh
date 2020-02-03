#/usr/bin/env sh

VERSION=2.7.5
SHA1_HASH="63e5480cd32121c194929dec531523ddfb54dbbd"
SHA256_HASH="3d27ade73a5c1248925ad9c060024940ce5d2029f40aaa901f43314888fe324d"

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
        cd lynis
        ./lynis show version ; ./lynis update info
        echo "Lynis is ready to use. Please find it here: $(pwd)"
    )
else
    echo_exit "download file integrity could not be verified! (exit)"
fi
