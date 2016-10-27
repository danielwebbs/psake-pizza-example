properties {
    $pizza 
}

task default -depends IncrementPizzaCount

task IncrementPizzaCount {
    $pizza.count++
}