#!/bin/bash
echo "=== KALKAN SUNUCU SIKILAŞTIRMA (HARDENING) KONTROLÜ ==="
if grep -q "^PermitRootLogin no" /etc/ssh/sshd_config 2>/dev/null; then
    echo "[OK] SSH üzerinden doğrudan Root girişi kapalı."
else
    echo "[UYARI] SSH üzerinden Root girişi açık olabilir! (PermitRootLogin no önerilir)"
fi
if grep -q "^PasswordAuthentication no" /etc/ssh/sshd_config 2>/dev/null; then
    echo "[OK] SSH şifreli giriş kapalı (Sadece SSH Key aktif)."
else
    echo "[UYARI] SSH şifreli giriş açık! Brute-force riski var."
fi
if command -v ufw >/dev/null 2>&1 && ufw status | grep -q "Status: active"; then
    echo "[OK] Güvenlik duvarı (UFW) aktif."
else
    echo "[UYARI] Güvenlik duvarı (UFW) aktif değil veya kurulu değil!"
fi
