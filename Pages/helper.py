from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

class helper(object):
    def input_gist_content(self, content):
        webdriver = BuiltIn().get_library_instance('SeleniumLibrary')._current_browser();
        element = webdriver.find_elements_by_xpath("//div[@class='CodeMirror-code']/div/pre/span/span");
        element.send_keys(content)