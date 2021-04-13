const fs = require('fs')

fs.readFile('G:\\Documents\\AofCode\\2020\\Day 1\\input.txt', 'UTF8', (err, data) => {
    if (err) { 
        console.log(err)
        return
    }
    
    var array = data.split("\n");

    array.forEach(element => {
        array.forEach(element2 => {
            var value = parseInt(element) + parseInt(element2)
            if (value == 2020) {
                var results = parseInt(element) * parseInt(element2)
                console.log(`${results}`)
                return
            }
        })
    })

    array.forEach(element => {
        array.forEach(element2 => {
            array.forEach(element3 => {
                var value = parseInt(element) + parseInt(element2) + parseInt(element3)
                if (value == 2020) {
                    var results = parseInt(element) * parseInt(element2) * parseInt(element3)
                    console.log(`${results}`)
                    return
                }
            })
        })
    })
})