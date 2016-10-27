properties {
    $pizzaArray
}

task default -depends SavePizza 

task SavePizza {
    $pizzaArray | out-file -FilePath C:\pizza.txt
}