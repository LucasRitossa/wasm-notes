(module
  (func (export "conditionals") (param $x i32) (param $y i32) (result i32)
            local.get $x
            local.get $y
            i32.gt_s
            local.get $x
            local.get $y
            select
            )
  )
