*** Settings ***
Library    SeleniumLibrary




*** Test Cases ***
Facebook register
# Chrome automatically closes the browser on its own. Adding the 'options=add....('detach',True)' fixes this and makes it stay open. 
    Open Browser    http://www.facebook.com/r.php    Chrome    options=add_experimental_option("detach", True)

    Maximize Browser Window
    
    Click Element    xpath://button[@title='Allow all cookies']

    Page Should Contain    Create a new account

    Click Element    name:firstname
    Input Text    name:firstname    Donald

    Click Element    name:lastname 
    Input Text    name:lastname    Duck

    Click Element   name:reg_email__    
    Input Text   name:reg_email__    verySpecial@email.com

    Click Element   name:reg_email_confirmation__   
    Input Text   name:reg_email_confirmation__    verySpecial@email.com 
    
    Click Element    name:reg_passwd__
    Input Text    name:reg_passwd__    password

    Click Element    id:month
    Select From List By Label    id:month    Sep

    Click Element    id:day
    Select From List By Label    id:day    16

    Click Element    id:year
    Select From List By Label    id:year    2002
    
    Select Radio Button    sex    1
    Radio Button Should Be Set To    sex    1

    Set Screenshot Directory    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\RobotFiles\\    
    Capture Page Screenshot    facebookscreenshot.png

    Close Browser


*** Test Cases ***
Ny Times
    Open Browser    http://www.nytimes.com    Chrome    options=add_experimental_option("detach", True)

    Maximize Browser Window

    Click Button    xpath:/html/body/div[3]/div/button

    Click Button    xpath://button[@data-testid='GDPR-accept']
    
    # xPATH has been modified to be '*'. This means any value could be there. This way we can count how many are tehre
    ${count}=    Get Element Count    XPATH://html/body/div[1]/div[2]/div/header/div[4]/ul/li[*]/a
    
    ${referencePosition}=    Get Vertical Position    xpath://html/body/div[1]/div[2]/div/header/div[4]/ul/li[1]/a

    FOR    ${index}    IN RANGE    2    ${count}
        Log    ${index}
        ${testPosition}=    Get Vertical Position    xpath://html/body/div[1]/div[2]/div/header/div[4]/ul/li[${index}]/a

        Should Be Equal    ${referencePosition}    ${testPosition}
        
    END

    Close Browser


    

    FOR    ${index}    IN RANGE    1    ${count}
        ${testLink}=    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[${index}]/a
        Log    ${testLink}
          
        ${LinkName}=    Get Text    ${testLink}
        Log    ${LinkName}

        Run Keyword And Continue On Failure    Element Should Be Enabled    ${testLink}
        Click Element    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[${index}]/a
        Sleep    1s
        ${linkCompare}=    Get Text    xpath:/html/body/main/div[1]/div/nav/ol/li[2]/span
        Log    ${linkCompare}
        
        ${landing}=    Get Element Attribute    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[${index}]/a    href
        Log    ${landing}
        Run Keyword And Continue On Failure    Should Not Be Empty    ${landing}


        Run Keyword And Continue On Failure  Should Be Equal    ${LinkName}    ${linkCompare}

    END