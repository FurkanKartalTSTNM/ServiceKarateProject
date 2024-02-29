Feature: A101StoreReport

  Background:
    * url 'https://sosp.a101.com.tr/api'
    * def response = karate.http('api')
    * if (response.timeTaken >= 10000) karate.abort()

  @canli_GetEkmekCiro
  Scenario: EkmekCiro
    And path '/store-reports/get-store-hourly-bread-turnover-report/G421'
    * def response = karate.http('/store-reports/get-store-hourly-bread-turnover-report/G421')
    * if (response.timeTaken >= 10000) karate.abort()
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.payload.totalTurnover !=null
    Then status 200



  @canli_GetMeyveSebzeCiro
  Scenario: MeyveSebzeCiro
    And path '/store-reports/get-store-fruit-and-vegetables-turnover-report/G421'
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.payload.totalTurnover !=null
    Then status 200

  @canli_GetMagazaAnlikCiro
  Scenario: MagazaAnlikCiro
    And path '/store-reports/get-store-instant-turnover-report/G421'
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then status 200

  @canli_GetMagazaDisiDenetimPuani
  Scenario: MagazaDisiDenetimPuani
    And path '/store-reports/get-store-method-audit-report/G421'
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then status 200
