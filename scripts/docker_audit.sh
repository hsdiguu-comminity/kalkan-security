#!/bin/bash
echo "=== KALKAN DOCKER GÜVENLİK DENETİMİ ==="
if ! command -v docker >/dev/null 2>&1; then
    echo "[BİLGİ] Sistemde Docker kurulu değil."
    exit 0
fi
PRIV_CONTAINERS=$(docker ps --quiet | xargs -r docker inspect --format '{{.Name}}: Privileged={{.HostConfig.Privileged}}' | grep "true")
if [ -z "$PRIV_CONTAINERS" ]; then
    echo "[OK] Privileged (tehlikeli tam yetki) modda çalışan konteyner yok."
else
    echo "[KRİTİK UYARI] Privileged modda çalışan konteynerler tespit edildi: $PRIV_CONTAINERS"
fi
