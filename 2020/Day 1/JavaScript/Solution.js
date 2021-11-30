const fs = require('fs')

function callToAction(array, action)
{ 
    var start = Date.now()
    var results = "hello"
    switch (action) {
        case 'Part1':
            for (let element of array) { 
                for (let element2 of array) { 
                    var value = parseInt(element) + parseInt(element2)
                    if (value == 2020) { 
                        results = parseInt(element) * parseInt(element2)
                    }
                }
            }
        break;
        case 'Part1B':
            for (let element of array) { 
                var toFind = 2020 - parseInt(element)
                if (array.includes(`${parseInt(toFind)}`)) {
                    results = parseInt(element) * parseInt(toFind)
                }
            }
        break;
        case 'Part2':
            for (let element of array) { 
                for (let element2 of array) { 
                    for (let element3 of array) { 
                        var value = parseInt(element) + parseInt(element2) + parseInt(element3)
                        if (value == 2020) {
                            results = parseInt(element) * parseInt(element2) * parseInt(element3)
                        }
                    }
                }
            }
        break;
        case 'Part2B':
            for (let element of array) { 
                for (let element2 of array) { 
                    var toFind = 2020 - parseInt(element) - parseInt(element2)
                    if (array.includes(`${parseInt(toFind)}`)) {
                        results = parseInt(element) * parseInt(element2) * parseInt(toFind)
                    }
                }
            }
        break;
    }
    return [start, results]
}

fs.readFile('..\\input.txt', 'UTF8', (err, data) => {
    if (err) {
        console.log(err)
        return
    }

    var array = data.split("\n")
    var toDo = ['Part1', 'Part1B', 'Part2', 'Part2B']
    for(let td of toDo) {
        results = callToAction(array, td)
        var val = results[0]
        var val2 = results[1]
        console.log(`${val2} - ${Date.now() - val} milli`)
    }
})
