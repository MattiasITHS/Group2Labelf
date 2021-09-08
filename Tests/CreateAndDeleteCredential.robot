*** Settings ***
Documentation                Testar Selenium och RobotFramework
Library                      SeleniumLibrary
Suite Setup                   Begin Web Test
Suite Teardown                End Web Test

*** Variables ***
${BROWSER}      chrome
${URL}          https://app.labelf.ai/login/

*** Keywords ***
Begin Web Test
    Open browser                     about:blank             ${BROWSER}
    Maximize Browser Window
    Set selenium timeout             10

Go to Web Page
    Load Page
    Verify Page Loaded

Load Page
    Go to                           ${URL}

Verify Page Loaded
    ${LINK_TEXT}                    Get Title
    Should Be Equal                 ${LINK_TEXT}      Labelf
    Wait until Page Contains        Labelf

Enter the valid username and password
    Input text          xpath://*[@id="app"]/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input            mattias.hovde@iths.se
    Input text          xpath://*[@id="password"]               Mattias1

Login to the application
    Click Button                    xpath://*[@id="app"]/div/main/div/div/div/div/div/div[2]/button
    Wait until Page Contains        Logged in
    Go to                           https://app.labelf.ai/main/77/datasets/view
    Wait until Page Contains        Datasets
    Page Should Contain             Datasets

Enter into the chosen dataset by clicking OVERVIEW
    Mouse down         xpath://*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[3]/div/div[2]/a/div
    Click Element      xpath://*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[3]/div/div[2]/a/div
    Wait Until Page Contains     Test your model
    Page Should Contain          Test your model

Deploy the model

    Click Element     xpath://*[@id="app"]/div[3]/div[1]/main/div/div/div[1]/div/div/div/nav/div/a[3]/div
    Wait Until Page Contains    Deployed API:s
    Page Should Contain         Deployed API:s

Create a new API Credential
    Mouse Down      xpath://*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div[1]/div[2]/div/div/button[3]/div
    Click Element   xpath://*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div[1]/div[2]/div/div/button[3]/div
    Wait Until Page Contains    Save your credentials
    Page Should Contain         Save your credentials

Delete the API credential created
    Click Element        xpath://*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div[1]/div[2]/div/div/div[11]/div/button/div
    sleep               1
    Page Should not Contain Element   xpath://*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div[1]/div[2]/div/div/div[11]/div/button/div

End Web Test
    Close Browser

*** Test Cases ***
Test to log into app.lablef
  [Documentation]    Test to verify the login-page works
  [Tags]             Login
  Go to Web Page
  Enter the valid username and password
  Login to the application

Test to create a new API Credential
  [Documentation]    Test to create a new API Credential
  [Tags]             CreateAPICredential
  Enter into the chosen dataset by clicking OVERVIEW
  Deploy the model
  Create a new API Credential

Test to Delete the API Credential
  [Documentation]    Test to create a new API Credential
  [Tags]             DeleteAPICredential
  Delete the API credential created
