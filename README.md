# This repository so far contains:

## I. Network Scanning Documentation

This repository contains concise documentation on network scanning techniques I learned from TryHackMe as well as HackTheBox (mostly TryHackMe though).

## 🚀 Quick Start with Nix

If you have Nix installed, building the documentation is simple:

1. Enter the Nix development environment:
   ```bash
   nix develop
   ```

2. Build the TCP/UDP discovery document:
   ```bash
   latexmk -pdf tcp-udp-discovery.tex
   pdflatex tcp-udp-discovery.tex && pdflatex tcp-udp-discovery.tex
   ```
   This produces `tcp-udp-discovery.pdf` in the current directory.

3. Build the basic port scanning document:
   ```bash
   latexmk -pdf basic-port-scanning.tex
   pdflatex basic-port-scanning.tex && pdflatex basic-port-scanning.tex
   ```
   This produces `basic-port-scanning.pdf` in the current directory.

4. Build the aggressive scanning document:
   ```bash
   latexmk aggressive-scan.tex
   pdflatex aggressive-scan.tex && pdflatex aggressive-scan.tex
   ```
   This produces `aggressive-scan.pdf` in the current directory.

Your directory will be a total mess by the way.

## 📖 Document Structure

Each document is designed with a custom page height to accommodate the content:
- `tcp-udp-discovery.tex`: 900mm height
- `basic-port-scanning.tex`: 400mm height
- `aggressive-scan.tex`: Custom height

These documents are included in the main document for a complete reference, and that's why Hyperlinks to them are unfortunately broken (clickable, but they don't lead you directly to the clicked subsection).

---

*Happy scanning!* 