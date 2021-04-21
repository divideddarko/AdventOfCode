const fs = require('fs');

function PartOne(array) {
    wordsThatMatch = 0
    array.forEach(e => {
        charTotal = 0
        lowNum = e.split('-')[0]
        highNum = (e.split('-')[1].split(' '))[0]
        charToFind = (((e.split(' '))[1]).split(':')[0])
        password = (e.split(": "))[1]

        for (var i = 0; i < password.length; i++) {
            p = password[i]
            if (p.match(charToFind)){
                charTotal++;
            }
        }

        if (charTotal >= lowNum && charTotal <= highNum) { 
            wordsThatMatch++;
        }

    })
    console.log(`Words that match ${wordsThatMatch}`)
}

function PartTwo(array) { 
    wordsThatMatch = 0
    array.forEach(e => {
        charTotal = 0
        lowNum = e.split('-')[0]
        highNum = (e.split('-')[1].split(' '))[0]
        charToFind = (((e.split(' '))[1]).split(':')[0])
        password = (e.split(": "))[1]

        currentChar = 1
        for (var i = 0; i < password.length; i++) {
            p = password[i]
            if (p.match(charToFind) && (currentChar == lowNum || currentChar == highNum )){
                charTotal++
            }
            currentChar++
        }

        if (charTotal == 1) { 
            wordsThatMatch++;
        }

    })
    console.log(`Words that match ${wordsThatMatch}`)
}

fs.readFile('..\\Input.txt', 'UTF-8', (err, data) => {
    if (err) {
        console.log(err)
        return
    }

    var array = data.split('\n')
    results = PartOne(array)
    results = PartTwo(array)
})