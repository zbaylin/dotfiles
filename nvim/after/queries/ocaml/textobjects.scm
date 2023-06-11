(module_definition
  (module_binding 
    body: (structure . "struct" . (_) @_start @_end (_)? @_end . "end" 
		     (#make-range! "module.inner" @_start @_end))
    )
  ) @module.outer

(if_expression) @conditional.outer

(if_expression
  (then_clause (_)? @conditional.inner))

(if_expression
  (then_clause (_)?)
  (else_clause (_)? @conditional.inner))

(function_expression
  (match_case
    pattern: (_)? @conditional.inner))

(function_expression
  (match_case
    body: (_)? @conditional.inner))

(match_expression
  (match_case
    pattern: (_)? @conditional.inner))

(match_expression
  (match_case
    body: (_)? @conditional.inner))

(value_definition
  (let_binding
    pattern: (_)? @assignment.lhs
    body: (_)? @assignment.rhs)) @assignment.outer

(comment) @comment.outer
