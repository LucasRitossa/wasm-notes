(module
  (func (export "conditionals")
        (param $value_1 i32) (param $value2 i32)
        (result i32)
        local.get $value_1
        local.get $value_2

        i32.gt_s ;; if value_1 > value_2, put 1 on stack

        if
            local.get $value_1
        nop
        else
            local.get $value_2
        nop
        end
        )
  )
