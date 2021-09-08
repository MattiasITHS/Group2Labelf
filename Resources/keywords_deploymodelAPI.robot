*** Variables ***
${BROWSER}      chrome
${URL}          https://app.labelf.ai/login/

*** Keywords ***
Begin Web Test
    Open browser                     about:blank             ${BROWSER}
    Maximize Browser Window
    Go to                                       ${URL}
Given that the user on the home page
    input text                         xpath://*[@id="app"]/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input   mattias.hovde@iths.se
    input text                         xpath://*[@id="password"]                                                                      Mattias1
    click button                       xpath://*[@id="app"]/div/main/div/div/div/div/div/div[2]/button
    wait until page does not contain   (login, timeout=None, error=None)
    set selenium speed                 1
    Page should contain                Labelf
    Click Button                       xpath://*[@id="app"]/div/main/div/div/div/div/div/div[2]/button
    Wait until Page Contains           Logged in
    Set selenium speed                 1
    Go to                              https://app.labelf.ai/main/77/datasets/view
    Page Should Contain                Datasets
When user clicks on the Overview
  click element                         xpath://*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[3]/div/div[2]/a/div
  wait until page contains          Description
And user clicks on the deploy and on deploy model to API
   click element                      xpath://*[@id="app"]/div[3]/div[1]/main/div/div/div[1]/div/div/div/nav/div/a[3]
   page should contain                Deploy / Download
   click element                      xpath://*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div[1]/div[2]/div/div/button[2]/div
Then user should able to see the added current deployed API and can delete the same API
   wait until page contains           Model name: Api testing 30% validation-model
   click element                      xpath://*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div[1]/div[2]/div/div/div[11]/div/button/div
   wait until page contains           How do i call the API?
End Web Test
    Close Browser
