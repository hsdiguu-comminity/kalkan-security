"""Repodaki tüm YAML ve XML kural dosyalarının geçerli olduğunu kontrol eder.

Bozuk bir kural dosyası (ör. link-rules/*.yaml, wazuh/rules/*.xml) servislere ulaşmadan
CI'da yakalanır.
"""

from pathlib import Path
from xml.etree import ElementTree

import pytest
import yaml

ROOT = Path(__file__).resolve().parents[1]
SKIP = {".venv", ".git", "node_modules"}


def _files(*suffixes: str) -> list[Path]:
    return [
        p
        for p in ROOT.rglob("*")
        if p.suffix in suffixes and not SKIP.intersection(p.relative_to(ROOT).parts)
    ]


@pytest.mark.parametrize("path", _files(".yaml", ".yml"), ids=lambda p: p.name)
def test_yaml_is_valid(path: Path) -> None:
    yaml.safe_load(path.read_text(encoding="utf-8"))


@pytest.mark.parametrize("path", _files(".xml"), ids=lambda p: p.name)
def test_xml_is_valid(path: Path) -> None:
    # Wazuh kural dosyaları birden fazla kök <group> içerebilir; tek kök altında sarmalanır.
    text = path.read_text(encoding="utf-8").strip()
    if text:
        ElementTree.fromstring(f"<root>{text}</root>")  # noqa: S314 (repodaki kendi dosyalarımız)
