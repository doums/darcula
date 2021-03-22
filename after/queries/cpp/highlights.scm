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
] @preproc

(preproc_def
  name: (identifier) @macro_name)
(preproc_ifdef
  name: (identifier) @macro_name)
(preproc_function_def
  name: (identifier) @macro_name)
(preproc_if
  condition: (identifier) @macro_name)
(preproc_elif (identifier) @macro_name)
((preproc_arg) @macro_name)
