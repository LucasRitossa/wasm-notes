(module
  (func (export "conditionals") (param $x i32) (param $y i32) (result i32)
        get_local $x ;; stack: x
        get_local $y ;; stack: x,y
        get_local $x ;; stack: x,y,x
        get_local $y ;; stack: x,y,x,y
        i32.gt_s     ;; stack: 0/1,x,y
        select)      ;; stack: x/y
  ;; select takes 3 values in stack and 
  ;; compares and returns first param if true, and second param if false
  )
