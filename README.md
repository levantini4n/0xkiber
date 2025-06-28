# 🗂️ This repository so far contains:

## I. Structured Nmap Compendium 🕵️

Concise hands-on lab notes from my journey learning Nmap.

### 🚀 Quick Start with Nix

If you have Nix installed and flakes enabled, building the documentation is simple:

1. Enter the Nix development environment:
   ```bash
   devenv shell
   ```
2. Move files from `assets` to `Networking/`:
    ```bash
    mv assets/* Networking/
    ```

3. Build the TCP/UDP discovery document:
   ```bash
   latexmk -pdf tcp-udp-discovery.tex
   pdflatex tcp-udp-discovery.tex && pdflatex tcp-udp-discovery.tex
   ```
   This produces `tcp-udp-discovery.pdf` in the current directory.

4. Build the basic port scanning document:
   ```bash
   latexmk -pdf basic-port-scanning.tex
   pdflatex basic-port-scanning.tex && pdflatex basic-port-scanning.tex
   ```
   This produces `basic-port-scanning.pdf` in the current directory.

5. Build the aggressive scanning document:
   ```bash
   latexmk aggressive-scan.tex
   pdflatex aggressive-scan.tex && pdflatex aggressive-scan.tex
   ```
   This produces `aggressive-scan.pdf` in the current directory.

6. Combine all documents into a single PDF through the command defined in the flake:
   ```bash
   compile
   ```
   This produces `main.pdf` in the current directory.

Your directory will be a total mess by the way.

### 📖 Document Structure

Each document is designed with a custom page height to accommodate the content:
- `tcp-udp-discovery.tex`: 900mm
- `basic-port-scanning.tex`: 380mm 
- `aggressive-scan.tex`: 330mm

These documents are included in the main document for a complete reference, and that's why Hyperlinks to them are unfortunately broken (clickable, but they don't lead you directly to the clicked subsection, rather to the beginning of each document).

---

*Happy scanning!* 
