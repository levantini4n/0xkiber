{
  description = "LaTeX Document Project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        
        # Custom LaTeX environment with required packages
        texlive-env = pkgs.texlive.combine {
          inherit (pkgs.texlive)
            scheme-medium
            biblatex-ieee    # IEEE citation style
            pgf              # For Gantt charts
            pgfgantt         # Gantt chart package
            fancyhdr
            listings
            todonotes        # For review notes
            wrapfig          # Figure wrapping
            multirow         # Table formatting
            hyperref         # PDF links
            geometry         # Page layout
            tocloft          # TOC customization
            titlesec         # Section formatting
            enumitem         # List customization
            microtype        # Typography improvements
            mlmodern         # Modern font
            xcolor           # Color support
            csquotes         # Context sensitive quotation
            latexmk          # Build automation
            biber            # Bibliography processor
            tcolorbox        # Added tcolorbox package
            environ          # Required by tcolorbox
            trimspaces       # Required by tcolorbox
            etoolbox         # Required by tcolorbox
            varwidth         # Required for tcolorbox breakable feature
            
            # Add the tcolorbox libraries
            collection-latexextra  # This includes tcolorbox and its libraries
            ;
        };
        
        # Custom scripts for compile and view commands
        compile-script = pkgs.writeShellScriptBin "compile" ''
          echo "⚡ Compiling LaTeX document..."
          latexmk -pdf main.tex && pdflatex main.tex && pdflatex main.tex
          echo "✅ Compilation complete!"
        '';
        
        view-script = pkgs.writeShellScriptBin "view" ''
          echo "🔍 Opening PDF with mupdf..."
          mupdf main.pdf
        '';
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            texlive-env
            gnused

            # For diagram generation
            graphviz         # ER diagrams
            plantuml         # UML diagrams
          ];

          shellHook = ''
            echo "⚡ LaTeX environment ready!"
            echo "Commands:"
            echo "  compile - Run latexmk and pdflatex to build the document"
            echo "  view    - Open the PDF with mupdf"
          '';
        };
      });
}

