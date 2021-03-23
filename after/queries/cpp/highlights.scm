[
  "#include"
  "#define"
  "#if"
  "#ifdef"
  "#ifndef"
  "#else"
  "#elif"
  "#endif"
  (preproc_directive)
] @annotation

(preproc_def
  name: (identifier) @constant.macro)
(preproc_ifdef
  name: (identifier) @constant.macro)
(preproc_function_def
  name: (identifier) @constant.macro)
(preproc_if
  condition: (identifier) @constant.macro)
(preproc_elif (identifier) @constant.macro)
((preproc_arg) @constant.macro)
((primitive_type) @keyword)
(call_expression
  function: (identifier) @text)
