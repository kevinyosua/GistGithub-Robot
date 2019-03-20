*** Settings ***
Library         SeleniumLibrary
Library         DebugLibrary
Library         String

*** Keywords ***
Open Chrome Browser
    [Timeout]           120 seconds
    [Arguments]         ${url}   
    Open Browser        ${url}          gc
    Set Window Size     1024            768