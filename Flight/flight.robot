# NAME== EDEM QUASHIGAH

*** Settings ***
Library    SeleniumLibrary
Library    String
Library    XML
Library    DateTime

*** Variables ***
${month}    12
${year}    2023
${startingCity}    Boston
${destination}    Cairo

*** Test Cases ***
Blaze Website Choose Locations
    # Open the website from the chrome browser and maximize the window.
    Open Browser    https://blazedemo.com/    Chrome    options=add_experimental_option("detach", True)

    Maximize Browser Window
    # Test that the page says "Welcome to the Simple Travel Agency!"
    Page Should Contain    Welcome to the Simple Travel Agency!
    
    # Select "Boston" as the starting city (store this information in the variable)
    Click Element    name:fromPort
    Select From List By Value    name:fromPort    ${startingCity}
    
    # Select "Cairo" as the destination (store this information in the variable)
    Click Element    name:toPort
    Select From List By Value    name:toPort    ${destination}

    # Check that the Find Flights button is selectable
    Element Should Be Enabled    xpath://html/body/div[3]/form/div/input
    
    Sleep    2

    # Press the Find Flights button
    Click Element    xpath://html/body/div[3]/form/div/input

*** Test Cases ***
Select Desired Flight

    # Check that the page says Flights from Boston to Cairo: (check the city names with the variables you created)
    Page Should Contain    Flights from ${startingCity} to ${destination}:
    
    # Check that you have at least one flight choice visible
    # The '*' has been placed in the table row to make it possible to get the count.
    ${flightCount}=    Get Element Count    xpath://html/body/div[2]/table/tbody/tr[*]
    Should Be True    ${flightCount} > 0

    #Select one of the flights -> store the price, number and airline of that flight in separate variables
    ${flightPrice}=    Get Text    xpath://html/body/div[2]/table/tbody/tr[1]/td[6]
    Log    ${flightPrice}
    ${flightNumber}=    Get Text    xpath://html/body/div[2]/table/tbody/tr[1]/td[2]
    Log    ${flightNumber}
    ${airline}=    Get Text    xpath://html/body/div[2]/table/tbody/tr[1]/td[3]
    Log    ${airline}

    Sleep    1

    Click Element    xpath://html/body/div[2]/table/tbody/tr[1]/td[1]/input

    # Check that the variables are the same in the new page
    #Airline
    ${newAirlineText}=    Get Text    xpath://html/body/div[2]/p[1]
    Log    ${newAirlineText}
    ${newAirline}=    Remove String    ${newAirlineText}    Airline:
    Log    ${newAirline}
    # FlightNumber
    ${newFlightNumber}=    Get Text    xpath://html/body/div[2]/p[2]
    ${newFlightNumber}=    Remove String    ${newFlightNumber}    Flight Number:
    # FlightPrice
    ${newPrice}=    Get Text    xpath://html/body/div[2]/p[3]
    ${newPrice}=    Remove String    ${newPrice}    Price:

    
    Run Keyword And Continue On Failure    Should Be Equal    ${airline}    ${newAirline}
    Run Keyword And Continue On Failure    Should Be Equal    ${flightNumber}    ${newFlightNumber}
    Run Keyword And Continue On Failure    Should Be Equal    ${flightPrice}    ${newPrice}

    # Store the total price of the flight in a new variable
    ${totalPrice}=    Get Text    xpath://html/body/div[2]/p[5]/em
    Set Global Variable    ${totalPrice}

*** Test Cases ***
Fill in Passenger Information
    #Fill in the passenger information on the form
    Click Element    name:inputName
    Input Text    name:inputName    Edem Quashigah

    Click Element    name:address
    Input Text    name:address    Vankanlähde 9

    Click Element    name:city
    Input Text    name:city    Hämeenlinna

    Click Element    name:state
    Input Text    name:state    Kanta-Häme

    Click Element    name:zipCode
    Input Text    name:zipCode    13101

    # Choose Diner's Club as your credit card
    Click Element    id:cardType
    Select From List By Label    id:cardType    Diner's Club

    Click Element    name:creditCardNumber
    Input Text    name:creditCardNumber    123456789

    Click Element    name:creditCardMonth
    Input Text    name:creditCardMonth    ${month}

    Click Element    name:creditCardYear
    Input Text    name:creditCardYear    ${year}

    Click Element    name:nameOnCard
    Input Text    name:nameOnCard    Edem Q
    
    # Click "Remember me"
    Select Checkbox   id:rememberMe

    Sleep    2

*** Test Cases ***
Confirm Purchase Details and Close Browser
    # Click "Purchase Flight"
    Click Element    xpath://html/body/div[2]/form/div[11]/div/input

    # Check that the page that opens says "Thank you for your purchase today!"
    Page Should Contain    Thank you for your purchase today!

    # Check that the exposure time is correct
    ${time}=    Get Text    xpath://html/body/div[2]/div/table/tbody/tr[7]/td[2]
    @{timeList}=    Split String    ${time}
    ${time}=    Set Variable    ${timeList}[4]
    Log    ${time}

    ${currentTime}=    Get Time
    @{currentTimeList}=    Split String    ${currentTime}
    ${currentTime}=    Set Variable    ${currentTimeList}[1]
    Log    ${currentTime}
    

    Run Keyword And Continue On Failure    Should Be Equal    ${currentTime}    ${time}


    # Check that the total price is correct (should be equal with the variable you stored in previous step)
    ${finalPrice}=    Get Text    xpath://html/body/div[2]/div/table/tbody/tr[3]/td[2]
    ${finalPrice}=    Remove String    ${finalPrice}    USD


    Run Keyword And Continue On Failure    Should Be Equal    ${finalPrice}    ${totalPrice} 

    Sleep    2

    # Close the browser
    Close Browser