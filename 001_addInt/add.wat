(module
  ;; delare function name
  (func (export "AddInt")
        ;; init 2 global vars
        (param $value_1 i32)
        (param  $value_2 i32)
        (result i32)
        ;; move both global vars to stack
        local.get $value_1
        local.get $value_2
        ;; pop local vars off stack and add them together
        i32.add
        )
  )
