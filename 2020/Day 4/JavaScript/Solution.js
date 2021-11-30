const fs = require('fs')

function checkID(input) {
    var pid = input.includes('pid:')
    var iyr = input.includes('iyr');
    var eyr = input.includes('eyr');
    var hgt = input.includes('hgt');
    var hcl = input.includes('hcl');
    var ecl = input.includes('ecl');
    var byr = input.includes('byr');

    if (pid && iyr && eyr && hgt && hcl && ecl && byr) {
        return true
    }
    return false
}

function checkIDDetails(newInput) {
    newStringArray = newInput.split(' ')

    pid = false
    iyr = false
    eyr = false
    hgt = false
    hcl = false
    ecl = false
    byr = false

    newStringArray.forEach(item => {
        if (item.includes('pid') && item.length == 13) {
            pid = true
        }
        if (item.includes('iyr') && item.length == 8 && item.split(':')[1] >= 2010 && item.split(':')[1] <= 2020) {
            iyr = true
        }
        if (item.includes('eyr') && item.length == 8 && item.split(':')[1] >= 2020 && item.split(':')[1] <= 2030) {
            eyr = true
        }

        if (item.includes('hgt') && item.includes('in') && item.split(':')[1].split('in')[0] >= 59 && item.split(':')[1].split('in')[0] <= 76) {
            
            hgt = true
        } else if (item.includes('hgt') && item.includes('cm') && item.split(':')[1].split('cm')[0] >= 150 && item.split(':')[1].split('cm')[0] <= 193) {
            
            hgt = true
        }

        let re = new RegExp('#[aA-fF0-9]{6}')
        if (item.includes('hcl') && re.test(item)) {            
            hcl = true
        }
        
        let eyelist = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']
        if (item.includes('ecl') && eyelist.includes(item.split(':')[1])) {
            ecl = true
        }
        
        if (item.includes('byr') && item.split(':')[1] >= 1920 && item.split(':')[1] <= 2002 && item.length == 8) {
            
            byr = true
        }    
    })
    
    if (pid && iyr && eyr && hgt && hcl && ecl && byr) {
        return true
    } else { 
        return false
    }

    
}

function PartOne(input) {
    var results = 0
    var newInput = ""

    input.forEach(item => {
        if (item.length === 1) {
            var correct = checkID(newInput)
            if (correct) {
                results++
            }
            newInput = ""
        } else {
            newInput = newInput + " " + item
        }
    })

    return results
}

function PartTwo(input) {
    var results = 0
    var newInput = ""

    input.forEach(item => {
        if (item.length === 1) {
            var correct = checkIDDetails(newInput)
            if (correct) {
                results++
            }
            newInput = ""
        } else {
            newInput = newInput + " " + item
        }
    })

    return results
}

fs.readFile('..\\Input.txt', 'UTF-8', (err, data) => {
    if (err) {
        console.log(err)
        return
    }

    var array = data.split('\n')

    results = PartOne(array)
    results2 = PartTwo(array)

    console.log(`Part One ${results} Part Two ${results2}`);
})