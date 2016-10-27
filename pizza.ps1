# Import-Module '..\psake-master\psake.psm1'

properties {
    $welcomeMessage = 'Welcome to chucks pizza! Please select a option'
    $currentOrderCountMessage = "Your current order count is: "
    $invalidMenuItemSelected = "Please select a valid menu option."
    $exitMessage = "Closing application"
    
    $hamPizza = @{
        count = 0
        message = 'Ham Pizza'
    }

    $plainPizza = @{
        count = 0;
        message = 'Plane Pizza'
    }

    $saltPizza = @{
        count = 0;
        message = 'Salt Pizza'
    }

    $pizzaCount = 0

    $pizzaArray = @()
    $pizzaArray += $hamPizza, $plainPizza, $saltPizza
    
}

task default -depends DisplayMenu -Description "Default must be specified and cannot perform a action"

task SetupPizzaObjects {
}

task DisplayMenu -depends SetupPizzaObjects{
    $welcomeMessage

while($order -ne 'e') {
    foreach($pizzaOrder in $pizzaArray) {
        [string]([array]::IndexOf($pizzaArray, $pizzaOrder) + 1) + ':' + $pizzaOrder.message + ' order count:' + $pizzaOrder.count
    }

    $order = Read-host 'What would you like to order?'

    if($order -eq 'e') {
        $exitMessage
    } elseif ($order -gt 0 -And  $order -le $pizzaArray.length) {
         Invoke-psake '.\orderpizza.ps1' -parameters @{"pizza" = $pizzaArray[$order - 1]}
         Invoke-psake '.\savepizza.ps1' -parameters @{"pizzaArray" = $pizzaArray}
    } else {
         $invalidMenuItemSelected
    }

    Invoke-psake '.\getpizza.ps1' -parameters @{'pizzaArray' = $pizzaArray}
}    
}
