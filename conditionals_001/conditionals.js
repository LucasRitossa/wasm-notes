const fs = require('fs')
const bytes = fs.readFileSync(__dirname + '/conditionals.wasm')
const x = parseInt(process.argv[2]);
const y = parseInt(process.argv[3]);

(async () => {
    const obj = await WebAssembly.instantiate(new Uint8Array(bytes))
    let out = obj.instance.exports.conditionals(x, y)
    console.log(`${out} is the greater number`)
})();
