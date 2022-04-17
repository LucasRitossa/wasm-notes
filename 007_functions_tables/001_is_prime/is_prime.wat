(module
  (func $even_check (param $n i32) (result i32)
        local.get $n
        i32.const 2
        i32.rem_u ;; get remainder of n/2
        i32.const 0
        i32.eq ;; $n % 2 == 0, put 1 on stack
  )

  (func $eq_2 (param $n i32) (result i32)
        local.get $n
        i32.const 2
        i32.eq ;; $n === 2, put 1 on stack
  )

  (func $multiple_check (param $n i32) (param $m i32) (result i32)
        local.get $n
        local.get $m
        i32.rem_u ;; get remainder of $n / $m
        i32.const 0
        i32.eq ;; if $n / $m has 0 remainder, $n is a multiple of $m
  )

  (func (export "is_prime") (param $n i32) (result i32)
        (local $i i32)
        (if (i32.eq (local.get $n) (i32.const 1));; check for 1, not prime
        (then
            i32.const 0
            return
        ))
        (if (call $eq_2 (local.get $n));; true if n == 2
            (then
                i32.const 1
                return
            )
        )

        (block $not_prime
            (call $even_check (local.get $n)) 
            br_if $not_prime ;; if number is even , break from block $not_prime

            (local.set $i (i32.const 1))
            
            (loop $prime_test_loop
                  (local.tee $i (i32.add (local.get $i) (i32.const 2)));; $i += 2
                  local.get $n ;; stack = $n,$i
                  i32.ge_u ;; $i >= $n
                  if ;; if $i >= $n, $n is prime
                    i32.const 1
                    return
                  end

                  (call $multiple_check (local.get $n) (local.get $i))
                  br_if $not_prime ;;break out of $not_prime block if $multiple_check returns 1
                  br $prime_test_loop ;;branch to top of loop
            )
        )
        i32.const 0 ;; return false
  )
)
