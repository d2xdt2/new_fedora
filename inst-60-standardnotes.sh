curl -s https://api.github.com/repos/standardnotes/desktop/releases/latest | jq -r ".assets[] | select(.name | contains(\"linux-x86_64.AppImage\")) | .browser_download_url" | wget -i - -O /usr/local/bin/standard_notes
chmod a+x /usr/local/bin/standard_notes

