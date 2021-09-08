*** Settings ***
Documentation   Test login to labelf, uploading Ebike dataset, Labelling dataset
Library         SeleniumLibrary
Test Setup      Begin Web Test
Test Teardown   End Web Test
*** Variables ***
${BROWSER}      chrome
${URL}          https://app.labelf.ai/
${USERID}         Subhashini.penumatsa@iths.se
${PASSWORD}        test123
*** Keywords ***
Begin Web Test
   Open Browser               about:black     ${BROWSER}
    Maximize Browser Window
    Go To URL
Go To URL
   Go to     ${URL}
   Verify Page Loaded

When User enters valid email and password
    input text   xpath://*[@id="app"]/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input   ${USERID}
    input text   xpath://*[@id="password"]   ${PASSWORD}
    click button   xpath://*[@id="app"]/div/main/div/div/div/div/div/div[2]/button
    wait until page does not contain    (login, timeout=None, error=None)
    set selenium speed          1
Verify Page Loaded
    Page should contain         Labelf
User adds a new Dataset
    #Go to        https://app.labelf.ai/main/61/datasets/view
    set selenium speed          1
    sleep                       2s
    click element                xpath://html/body/div[1]/div/div[4]/div[1]/main/div/div/div[1]/a
    Page should contain         Add a dataset
User uploads a dataset
    click element               xpath://html/body/div[1]/div/div[3]/div/div/div[2]/div/div/div[1]/div/div[2]/button/div
    #click element               xpath://html/body/div[1]/div/div[3]/div/div/div[2]/div/div[2]/div/form/div[1]/div/div[2]/div/div/i
    choose file                 //input[@id="fileUpload"]    C:\Users\hovde\Downloads/all_1500_rows.csv
    click element               xpath://html/body/div[1]/div/div[3]/div/div/div[2]/div/div[2]/div/form/div[2]/button/div
    Page should contain         Setup
    click element               xpath://html/body/div[1]/div/div[3]/div/div/div[2]/div/div[4]/div/div/div[2]/button/div
User Name a dataset
    Page should contain            Name your dataset
    input text                xpath://html/body/div[1]/div/div[3]/div/div/div[2]/div/div[6]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div/input  Ebike
    input text                xpath://html/body/div[1]/div/div[3]/div/div/div[2]/div/div[6]/div/form/div[1]/div/div/div[2]/div/div/div[1]/div/textarea  Ebike dataset
    click element               xpath://html/body/div[1]/div/div[3]/div/div/div[2]/div/div[6]/div/form/div[2]/button/div
    wait until page contains    Datasets
User starts labelling
     click element          xpath://*[@id="app"]/div[5]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/a/div
     page should contain    Set your Task Question
     input text             xpath://*[@id="app"]/div[2]/div/div/form/div[1]/div/div/div/div/div/div[1]/div/input    how can we check our order
     click element           xpath://*[@id="app"]/div[2]/div/div/form/div[2]/button/div
     page should contain     Add a new label
     input text              xpath://*[@id="app"]/div[2]/div/div/form/div[2]/div/div/div[1]/div/div/div[1]/div/input   Sales
     #click element           xpath:/html/body/div[1]/div/div[3]/div/div/div[1]/a/div/div
     click element           xpath://*[@id="app"]/div[2]/div/div/form/div[3]/button/div
     input text              xpath://*[@id="app"]/div[2]/div/div/form/div[1]/div/div/div/div/div/div[1]/div/textarea   Order history
     click element            xpath://*[@id="app"]/div[2]/div/div/form/div[2]/button/div
     page should contain      Added Labels
     click element             xpath://*[@id="app"]/div[1]/div/div/div[3]/a/div/span
     input text               xpath://*[@id="app"]/div[2]/div/div/form/div[2]/div/div/div[1]/div/div/div[1]/div/input   payment
     click element            xpath://*[@id="app"]/div[2]/div/div/form/div[3]/button/div
      input text              xpath://*[@id="app"]/div[2]/div/div/form/div[1]/div/div/div/div/div/div[1]/div/textarea       payment history
      click element            xpath://*[@id="app"]/div[2]/div/div/form/div[2]/button/div
      page should contain       Ebike
    #  click element            xpath://*[@id="app"]/div[1]/div/div/div[1]/div/div/nav/div/a/div/i
     # click element               xpath://*[@id="app"]/div[5]/div[1]/nav/div/a/div
      #page should contain       Datasets
      #click element           xpath://*[@id="app"]/div[5]/div[1]/main/div/div/div[2]/div/div[1]/div/nav/div/div[3]/div/button/div/i
      #click element               xpath://*[@id="app"]/div[2]/div/div[2]/a/div[1]/div



End Web Test
    Close Browser

*** Test Cases ***
User Login and uploads
    [Documentation]         login and upload a dataset
    [Tags]                  lt 11
    When User enters valid email and password
    Verify Page Loaded
    User adds a new Dataset
    User uploads a dataset
    User Name a dataset
    User starts labelling
