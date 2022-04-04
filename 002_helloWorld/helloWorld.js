const fs = require('fs')
const bytes = fs.readFileSync(__dirname + '/helloWorld.wasm')

let start_string_index = 100 // location to place string in linear memory
// initliaze one page of memory for wasm binary to use (64kb)
let memory = new WebAssembly.Memory({ initial: 1 })

let importObject = {
    env: {
        buffer: memory,
        start_string: start_string_index,
        // get string bytes from wasm, decode and log string
        print_string: function(str_len) {
            const bytes = new Uint8Array(memory.buffer, start_string_index, str_len)
            const log_string = new TextDecoder('utf8').decode(bytes)
            console.log(log_string)
        }
    }
}

    ; (async () => {
        // get wasm function export
        let obj = await WebAssembly.instantiate(new Uint8Array(bytes), importObject);
        let hello_world = obj.instance.exports.helloworld
        // exec wasm function
        hello_world()
    })()
