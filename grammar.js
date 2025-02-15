/**
 * @file Reproducing a bug in another Parser
 * @author Matt Monroe <matt.a.monroe@gmail.com>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "repro",

  rules: {
    // TODO: add the actual grammar rules
    source_file: $ => repeat($.function_definition),

    function_definition: $ => seq(
      field("name", $.identifier),
      $.parameters,
      ":",
      field("return", $.type),
      "=",
      prec.left(1, $._statements)
    ),

    parameters: _$ => seq(
      "(",
      ")"
    ),

    _statements: $ => repeat1($._statement),
    _statement: $ => choice(
      $.return_statement,
      $.comment,
    ),

    return_statement: $ => seq("return", "1"),

    comment: _$ => seq("#", /.*/),

    type: _$ => "int",
    identifier: _$ => /[a-zA-Z\._]+/,

  }
});
