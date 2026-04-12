FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntunoble

# Metadata for the browser environment
ENV TITLE="WhatsApp Web"
ENV APP_NAME="WhatsApp Web"
# Disabling EGL is required for stable software rendering in Docker
ENV MOZ_FORCE_DISABLE_EGL=1

# 1. Install Firefox
# Install Firefox from PPA (avoiding Snap)
RUN \
  rm -rf /etc/apt/sources.list.d/* && \
  apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository ppa:mozillateam/ppa -y && \
  echo 'Package: *\nPin: release o=LP-PPA-mozillateam\nPin-Priority: 1001' > /etc/apt/preferences.d/mozilla-firefox && \
  apt-get update && \
  apt-get install -y \
    firefox \
    libgbm1 \
    libasound2t64 \
    fonts-noto-color-emoji \
    --no-install-recommends && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# 2. Setup the Autostart Service
# This launches Firefox as the default 'abc' user on startup
RUN mkdir -p /etc/services.d/firefox
RUN echo '#!/usr/bin/with-contenv bash\n\
exec s6-setuidgid abc firefox --new-instance https://web.whatsapp.com' > /etc/services.d/firefox/run && \
    chmod +x /etc/services.d/firefox/run

# 3. Firefox System Preferences (Bypassing default browser prompts)
RUN mkdir -p /usr/lib/firefox/browser/defaults/preferences && \
    echo 'pref("browser.shell.checkDefaultBrowser", false);' >> /usr/lib/firefox/browser/defaults/preferences/syspref.js && \
    echo 'pref("layers.acceleration.disabled", true);' >> /usr/lib/firefox/browser/defaults/preferences/syspref.js && \
    echo 'pref("browser.tabs.warnOnClose", false);' >> /usr/lib/firefox/browser/defaults/preferences/syspref.js

# KasmVNC internal port
EXPOSE 3000
