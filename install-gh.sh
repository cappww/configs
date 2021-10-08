#!/usr/bin/sh
set -e

echo "Get latest version"
VERSION=`curl  "https://api.github.com/repos/cli/cli/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/' | cut -c2-` 
echo $VERSION

echo "Downloading gh ${VERSION}"
curl -sSL https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz -o gh_${VERSION}_linux_amd64.tar.gz
echo "Dowload complete"

echo "Extracting Files"
tar xvf gh_${VERSION}_linux_amd64.tar.gz

echo "Copying binary to /usr/local/bin/"
sudo cp gh_${VERSION}_linux_amd64/bin/gh /usr/local/bin/

echo "Removing unnecessary files"
rm -rf gh_${VERSION}_linux_amd64*

