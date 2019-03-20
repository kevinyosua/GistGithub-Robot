*** Settings ***
Resource    ../config.robot
*** Keywords ***
Click Create New Gist Button
    Wait Until Element Is Visible               xpath=//a[@data-ga-click="Header, go to new gist, text:new gist"]
    Click Element                               xpath=//a[@data-ga-click="Header, go to new gist, text:new gist"]
    ${current_url}=                             Get Location
    Should Be Equal As Strings                  ${current_url}          https://gist.github.com/

Show All My Gist By Account Menu
    Wait Until Element Is Visible               css=.HeaderNavlink.name.mt-1
    Click Element                               css=.HeaderNavlink.name.mt-1
    Wait Until Element Is Visible               css=.dropdown-menu.dropdown-menu-sw
    Click Element                               xpath=//a[@data-ga-click='Header, go to your gists, text:your gists']
    Location Should Be                          ${Github.URL}/${Github.USERNAME}

Show All My Gist
    Wait Until Element Is Visible               xpath=//li[@class='flex-auto py-3 text-bold text-right f6 lh-condensed']/a[text()='See all of your gists']
    Location Should Be                          ${Github.URL}/${Github.USERNAME}

Input Gist Description
    [Arguments]         ${gist_description}
    Wait Until Element Is Visible               css=.form-control.input-block.input-contrast
    Input Text                                  css=.form-control.input-block.input-contrast       ${gist_description}

Input Filename
    [Arguments]         ${filename}
    Wait Until Element Is Visible               css=.form-control.filename.js-gist-filename.js-blob-filename
    Input Text                                  css=.form-control.filename.js-gist-filename.js-blob-filename       ${filename}

Input Content
    [Arguments]         ${content}
    Wait Until Element Is Visible               css=.CodeMirror-code
    Input Gist Content                          ${content}
    # Input Text                                  css=.form-control.file-editor-textarea.js-blob-contents.js-code-textarea       ${content}

Click Create Public Gist Button
    Wait Until Element Is Visible               css=.btn.js-gist-create
    Click Element                               css=.btn.js-gist-create

Click Create Secret Gist Button
    Wait Until Element Is Visible               css=.btn btn-secret.js-gist-create 
    Click Element                               css=.btn btn-secret.js-gist-create 

Open Gist with Filename
    [Arguments]         ${filename}
    ${filename}         Convert to Lowercase    ${filename}
    Show All My Gist By Account Menu
    Scroll Element Into View                    id=file-${filename}
    Click Element                               id=file-${filename}

Click Edit Gist Button
    Wait Until Element Is Visible               css=.octicon.octicon-pencil
    Click Element                               css=.octicon.octicon-pencil

Click Update Public Gist Button
    Scroll Element Into View                    xpath=//button[@type='submit'][text()='Update public gist']
    Click Element                               xpath=//button[@type='submit'][text()='Update public gist']

Click Delete Gist Button
    Wait Until Element Is Visible               css=.octicon.octicon-trashcan
    Click Element                               css=.octicon.octicon-trashcan

Verify Gist
    [Arguments]             ${gist_description}     ${filename}     ${content}
    Wait Until Element Is Visible                xpath=//div[@itemprop='about'][text()='${gist_description}']
    Wait Until Element Is Visible                xpath=//strong[@class='user-select-contain gist-blob-name css-truncate-target'][text()=${filename}]
    Wait Until Page Contains Element             xpath=//textarea[@name='gist[content]'][text()=${content}]