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
[
  ","
  ";"
] @keyword
(preproc_def
  name: (identifier) @constant.macro)
(preproc_ifdef
  name: (identifier) @constant.macro)
(preproc_function_def
  name: (identifier) @constant.macro)
(preproc_if
  condition: (identifier) @constant.macro)
(preproc_elif (identifier) @constant.macro)
(preproc_call argument: (preproc_arg) @constant.macro)
((primitive_type) @keyword)
(call_expression
  function: (identifier) @text)
((null) @constant.macro)
((escape_sequence) @keyword)
((identifier) @constant.macro
  (#match? @constant.macro "LC_NUMERIC\|LC_TIME\|SIG_DFL\|SIG_ERR\|SIG_IGN\|SIGABRT\|SIGFPE\|SIGILL\|SIGHUP\|SIGINT\|SIGSEGV\|SIGTERM"))
((identifier) @constant.macro
  (#match? @constant.macro "SIGABRT\|SIGALRM\|SIGCHLD\|SIGCONT\|SIGFPE\|SIGHUP\|SIGILL\|SIGINT\|SIGKILL\|SIGPIPE\|SIGQUIT\|SIGSEGV"))
((identifier) @constant.macro
  (#match? @constant.macro "SIGSTOP\|SIGTERM\|SIGTRAP\|SIGTSTP\|SIGTTIN\|SIGTTOU\|SIGUSR1\|SIGUSR2"))
((identifier) @constant.macro
  (#match? @constant.macro "SEEK_CUR\|SEEK_END\|SEEK_SET\|TMP_MAX\|stderr\|stdin\|stdout\|errno\|EXIT_FAILURE\|EXIT_SUCCESS\|RAND_MAX"))
((primitive_type) @constant.macro
  (#eq? @constant.macro "bool"))
[
 (true)
 (false)
] @constant.macro
((sized_type_specifier) @keyword)
