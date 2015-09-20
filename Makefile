OCAMLBUILD_FLAGS ?=
OCAMLBUILD_FLAGS += -cflags -w,+A-44
OCAMLBUILD_FLAGS += -use-ocamlfind

.PHONY: all app clean lib top

all: lib

app:
	ocamlbuild $(OCAMLBUILD_FLAGS) main.byte

clean:
	ocamlbuild $(OCAMLBUILD_FLAGS) -clean

lib:
	ocamlbuild $(OCAMLBUILD_FLAGS) evo.cma

top: lib
	utop -I _build/ -require batteries
