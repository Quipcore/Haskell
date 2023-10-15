# Define the Haskell compiler
GHC = ghc

# Define source and output paths
SRCDIR = ./app
OUTDIR = ./out

# Input and output file names
SRCFILE = Main.hs
EXEFILE = Main.exe

# Full paths to source and executable
SRC = $(SRCDIR)/$(SRCFILE)
EXE = $(OUTDIR)/$(EXEFILE)

# Default target
all: run

# Compile the Haskell source file and move all generated files to the out directory
$(EXE): $(SRC)
	$(GHC) -outputdir $(OUTDIR) -o $(EXE) $(SRC)

# Run the executable
run: $(EXE)
	$(EXE)

# Clean up compiled files
clean:
	rm -f $(EXE) $(OUTDIR)/*.o $(OUTDIR)/*.hi

.PHONY: all run clean
