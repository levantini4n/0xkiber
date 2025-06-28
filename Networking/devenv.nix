{ pkgs, ... }:

{
  # Project metadata
  name = "latex-document-project";

  # Environment packages
  packages = with pkgs; [
    # LaTeX environment with all required packages
    (texlive.combine {
      inherit (texlive)
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
    })
    
    # Additional tools
    gnused
    
    # For diagram generation
    graphviz         # ER diagrams
    plantuml         # UML diagrams
  ];

  # Custom scripts and commands
  scripts = {
    compile.exec = ''
      echo "⚡ Compiling LaTeX document..."
      latexmk -pdf main.tex && pdflatex main.tex && pdflatex main.tex
      echo "✅ Compilation complete!"
    '';
    
    # Additional convenience scripts you might find useful
    clean.exec = ''
      echo "🧹 Cleaning build artifacts..."
      latexmk -c
      rm -f *.bbl *.blg *.run.xml *.bcf
      echo "✅ Clean complete!"
    '';
    
    watch.exec = ''
      echo "👀 Watching for changes..."
      latexmk -pdf -pvc main.tex
    '';
    
    view.exec = ''
      if [ -f "main.pdf" ]; then
        echo "📖 Opening PDF..."
        xdg-open main.pdf
      else
        echo "❌ main.pdf not found. Run 'compile' first."
      fi
    '';
  };

  # Environment variables
  env = {
    TEXMFHOME = ".texmf";
    TEXMFVAR = ".texmf-var";
    TEXMFCONFIG = ".texmf-config";
  };

  # Shell welcome message
  enterShell = ''
    echo "🚀 LaTeX Development Environment"
    echo "📁 Project: $(basename $PWD)"
    echo ""
    echo "Available commands:"
    echo "  compile  - Compile the LaTeX document"
    echo "  clean    - Clean build artifacts"
    echo "  watch    - Watch for changes and auto-compile"
    echo "  view     - Open the generated PDF"
    echo ""
    echo "Happy writing! ✍️"
  '';
}

