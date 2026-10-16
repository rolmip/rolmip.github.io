"""Synchronize the downloadable MATLAB sources with the static page."""
from pathlib import Path
import html
import json
import re

root = Path(__file__).resolve().parent
files = [
    "polynomial_example.m",
    "algebra_example.m",
    "stability_example.m",
    "hinf_example.m",
    "h2_example.m",
    "stateFeedback_hinf_example.m",
]
examples = [
    {"file": filename, "code": (root / "examples" / filename).read_text()}
    for filename in files
]
data = json.dumps(examples, ensure_ascii=False).replace("</", "<\\/")
path = root / "index.html"
page = path.read_text()
page, count = re.subn(
    r'(<script id="example-data" type="application/json">).*?(</script>)',
    lambda match: match[1] + data + match[2], page, flags=re.S,
)
assert count == 1, "Expected a single example-data block"
page, count = re.subn(
    r'(<code id="example-code">).*?(</code>)',
    lambda match: match[1] + html.escape(examples[0]["code"]) + match[2],
    page, flags=re.S,
)
assert count == 1, "Expected a single initial code block"
path.write_text(page)
(root / "examples.json").write_text(json.dumps(examples, indent=2) + "\n")
print(f"Synchronized {len(examples)} MATLAB examples.")
