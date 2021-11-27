Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'http://localhost:6969/barcode/v1/'

  Scenario: not null
    Given path 'checkgroup'
    And request {barcode:""}
    When method post
    Then status 200
    And match $ == {message: "กรุณากรอกข้อมูลค่ะ"}
    And match $ == {message: "#string"}
    And match $ == {message: "#notnull"}
    And match $.message != "#null"

  Scenario: bodycare01
    Given path 'checkgroup'
    And request {barcode:"10122"}
    When method post
    Then status 200
    And match $ == {category: "body care",group: "hair care",status: "Active"}
    And match $ == {category: "#string",group: "#string",status: "#string"}
    And match $ == {category: "#notnull",group: "#notnull",status: "#notnull"}
    And match $ != {category: "#null",group: "#null",status: "#null"}

  Scenario: bodycare02
    Given path 'checkgroup'
    And request {barcode:"10222"}
    When method post
    Then status 200
    And match $ == {category: "body care",group: "hand skin care",status: "Active"}
    And match $ == {category: "#string",group: "#string",status: "#string"}
    And match $ == {category: "#notnull",group: "#notnull",status: "#notnull"}
    And match $ != {category: "#null",group: "#null",status: "#null"}

  Scenario: excepttext
    Given path 'checkgroup'
    And request {barcode:"plppp"}
    When method post
    Then status 200
    And match $ == {message: "กรุณากรอกเฉพาะตัวเลขค่ะ"}
    And match $ == {message: "#string"}
    And match $ == {message: "#notnull"}
    And match $ != {message: "#null"}

  Scenario: incomplete
    Given path 'checkgroup'
    And request {barcode:"1234"}
    When method post
    Then status 200
    And match $ == {message: "กรุณากรอกตัวเลขให้ครบ 5 ตัวค่ะ"}
    And match $ == {message: "#string"}
    And match $ == {message: "#notnull"}
    And match $ != {message: "#null"}

  Scenario: overnumber
    Given path 'checkgroup'
    And request {barcode:"123456"}
    When method post
    Then status 200
    And match $ == {message: "กรุณากรอกตัวเลข 5 ตัวค่ะ"}
    And match $ == {message: "#string"}
    And match $ == {message: "#notnull"}
    And match $ != {message: "#null"}

  Scenario: skincare01
    Given path 'checkgroup'
    And request {barcode:"20166"}
    When method post
    Then status 200
    And match $ == {category: "skin care",group: "facial cleansing",status: "Active"}
    And match $ == {category: "#string",group: "#string",status: "#string"}
    And match $ == {category: "#notnull",group: "#notnull",status: "#notnull"}
    And match $ != {category: "#null",group: "#null",status: "#null"}

  Scenario: skincare02
    Given path 'checkgroup'
    And request {barcode:"20266"}
    When method post
    Then status 200
    And match $ == {category: "skin care",group: "facial care",status: "Active"}
    And match $ == {category: "#string",group: "#string",status: "#string"}
    And match $ == {category: "#notnull",group: "#notnull",status: "#notnull"}
    And match $ != {category: "#null",group: "#null",status: "#null"}