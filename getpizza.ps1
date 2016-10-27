properties {
    $pizzaArray
}

task default -depends GetPizza

task GetPizza {
    $pizzaArray = Get-Content C:\pizza.txt
    'Read from file'
}