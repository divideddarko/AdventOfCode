const fs = require('fs');

function PartOne(array) {
    var results = 0
    var position = 0

    array.forEach(element => {
        var currentChar = element.charAt(position)

        if (currentChar == "#") {
            results++
        }

        var positionToGo = position + 3
        if (positionToGo >= 31) {
            position = positionToGo - 31
        } else {
            position = position + 3
        }
    })
    return results
}

function PartTwo(array) {
    var finalResults = 1
    var found = []
    var numToCheck = ['1','3','5','7','1']
    var iter = 0

    numToCheck.forEach(nTC => {
        var results = 0
        var position = 0
        var rowCount = 0

        array.forEach(element => {
            if((iter == 4) && (!(rowCount % 2 == 0))){
                rowCount++
                return
            }

            var currentChar = element.charAt(position)

            if(currentChar == "#") { 
                results++
            }


            var positionToGo = parseInt(position) + parseInt(nTC)

            if (positionToGo >= 31) { 
                position = parseInt(positionToGo) - 31
            } else { 
                position = parseInt(position) + parseInt(nTC)
            }
            rowCount++
        })
        iter++
        found.push(results)
    })

    found.forEach(num => {
        finalResults *= num
    })

    return finalResults
}


fs.readFile('..\\Input.txt', 'UTF-8', (err, data) => {
    if (err) {
        console.log(err)
        return
    }

    var array = data.split('\n')
    results = PartOne(array)
    results2 = PartTwo(array)

    console.log(`Part One: ${results} Part Two: ${results2}`)
})