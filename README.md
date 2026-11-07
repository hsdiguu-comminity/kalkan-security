# Kalkan – Siber Güvenlik

Kullanıcılara sunulan güvenlik araçlarının mantığı ve içeriği; platformun korunması ve test edilmesi.

**Sorumlu:** Kerim Yorulmaz · **Diller:** Python, Bash, YAML/XML

## Klasör yapısı

```
blue-team/
├── waf/                WAF kuralları
├── wazuh/rules/        Wazuh SIEM kuralları (XML)
├── wazuh/decoders/     Wazuh decoder'ları
├── ci-scans/           Semgrep, Trivy, gitleaks yapılandırmaları
├── monitoring/         Grafana / güvenlik dashboard'u
└── kvkk/               KVKK uyum dokümanları
red-team/
├── scope.md            Test kapsamı – yalnızca Kalkan'ın kendi sistemleri
├── reports/            Pentest raporları
├── findings/           Bulgu takibi
└── bug-bounty/         İç bug bounty
tool-engine/
├── link-rules/         Link analiz kuralları (YAML)
├── email-header/       SPF/DKIM/DMARC kontrol mantığı
├── knowledge-base/     Asistan için bilgi tabanı (RAG kaynağı)
└── academy-content/    Akademi ders ve quiz içerikleri
scripts/                Python / Bash betikleri
tests/                  pytest
```

> Red Team **yalnızca Kalkan'ın kendi sistemlerini** test eder. Kullanıcıların bildirdiği linklere, sitelere veya kişilere saldırı ya da aktif tarama yapılmaz.

## Çalışma kuralları

- `main` korumalıdır; her değişiklik ayrı bir branch ve pull request ile gelir, en az 1 onay gerekir.
- Branch adları: `feature/<alan>-<kısa-açıklama>`, `fix/<alan>-<kısa-açıklama>`
- Commit mesajları: Conventional Commits (`feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`)
- `.env` dosyaları repoya eklenmez; örnek değerler `.env.example` içinde tutulur.
- Projenin tamamı için bkz. [`CLAUDE.md`](CLAUDE.md).
