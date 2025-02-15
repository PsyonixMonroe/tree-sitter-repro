package tree_sitter_repro_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_repro "github.com/psyonixmonroe/tree-sitter-repro/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_repro.Language())
	if language == nil {
		t.Errorf("Error loading Repro grammar")
	}
}
