const fs = require('fs')
const bytes = fs.readFileSync(__dirname + '/sumSquared.wasm')
const val1 = parseInt(process.argv[2])
const val2 = parseInt(process.argv[3])

    ; (async () => {
        let obj = await WebAssembly.instantiate(new Uint8Array(bytes))
        let sumSquared = obj.instance.exports.sumSquared(val1, val2)
        console.log(`(${val1}+${val2})^2 = ${sumSquared}`)
    })()
