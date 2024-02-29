Feature: SosV2_ReportService

  Background:
    * url 'https://sosp.a101.com.tr/api'
    * def baseUrl = 'https://sosp.a101.com.tr/api'
    * def storeCode = 'F240'
    * def bearerToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU1YTgwZTlmLTBmZWUtNGM5MS05NzczLWRiZDEwMzQ1MjhiNiIsImVtYWlsIjoiOTkxNmJzMTRAYTEwMS5jb20udHIiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJFUlPEsE4gQkFMQ0kiLCJ1dWlkIjoiM2UzOGU4MTYtMDg3OS00ZTg2LTliZGUtMjAxODZkYzlkZTI0IiwiU3BSZWdpc3RlciI6IjEyNDA2OCIsInJvbGUiOiJCUyIsImV4cCI6MTcwMDk4NjM2NywiaXNzIjoiaHR0cHM6Ly9zb3NwLmExMDEuY29tLnRyIiwiYXVkIjoiaHR0cHM6Ly9zb3NwLmExMDEuY29tLnRyIn0.5CNyjTrBvBJt5ifjH8kL8GzLy_uMxBnkBr7mZ__qh3k'
    * def response = karate.http('api')
    * if (response.timeTaken >= 10000) karate.abort()


  @canli_AnlikCiroRaporu
  Scenario: AnlikCiroRaporu
    And url baseUrl
    And path '/store-reports/get-store-instant-turnover-report/F240'
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.payload.safesTotalTurnover !=null
    Then match $.payload.totalTransactionCount contains '#number'
    Then match $.payload.safesTotalTurnover contains '#string'
    Then assert response.payload.totalTransactionCount !=null
    And assert response.payload.storeInstantSafeTurnover[0].transactionCount !=null
    And assert response.payload.storeInstantSafeTurnover[0].total !=null
    And assert response.payload.storeInstantSafeTurnover[1].transactionCount !=null
    And assert response.payload.storeInstantSafeTurnover[1].total !=null
    Then status 200

  @Get_store_ebitda_report
  Scenario: GetStoreEbitdaReport
    And url baseUrl
    And path '/store-reports/get-store-ebitda-report/F240'
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then match $.payload[0].price contains '#string'
    Then match response.payload[0].month == '#string'
    Then status 200

  @Get_store_turnover_report
  Scenario: GetStoreTurnoverReport
    Given url baseUrl
    And path '/store-reports/get-store-turnover-report/F240'
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then assert response.payload[0].percent !=null
    Then match $.payload[0].percent contains '#string'
    Then status 200

  @Get_store_performance_report
  Scenario: GetStorePerformanceReport
    Given url baseUrl
    And path 'store-reports/get-store-performance-report/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then assert response.payload.dailyTotal !=null
    Then assert response.payload.monthlyTotal !=null
    Then assert response.payload.yearlyTotal !=null
    Then match $.payload.dailyTotal contains '#string'
    Then match $.payload.monthlyTotal contains '#string'
    Then match $.payload.yearlyTotal contains '#string'
    Then status 200



  @Get_store_zero_material_report
  Scenario: GetStoreZeroMaterialReport
    Given url baseUrl
    And path 'store-reports/get-store-zero-material-report/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then assert response.payload[0].materialName !=null
    Then assert response.payload[0].materialDayCount !=null
    Then match $.payload[0].materialName contains '#string'
    Then match $.payload[0].materialDayCount contains '#string'
    Then status 200

  @Get_store_stock_day_report
  Scenario: GetStoreStockDayReport
    Given url baseUrl
    And path 'store-reports/get-store-stock-day-report/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then assert response.payload[0].materialName !=null
    Then assert response.payload[0].stockDay !=null
    Then assert response.payload[0].piece !=null
    Then match $.payload[0].materialName contains '#string'
    Then match $.payload[0].stockDay contains '#string'
    Then match $.payload[0].piece contains '#string'
    Then status 200ss

  @Get_store_materials_not_for_sale_report
  Scenario: GetStoreMaterialsNotForSaleReport
    Given url baseUrl
    And path 'store-reports/get-store-materials-not-for-sale-report/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then assert response.payload[0].title !=null
    Then assert response.payload[0].value !=null
    Then match $.payload[0].title contains '#string'
    Then match $.payload[0].value contains '#string'
    Then status 200

  @Get_store_average_turnover_report
  Scenario: GetStoreAverageTurnoverReport
    Given url baseUrl
    And path 'store-reports/get-store-avg-turnover-report/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then status 200

  @Get_store_average_customer_count_report
  Scenario: GetStoreAverageCustomerCountReport
    Given url baseUrl
    And path 'store-reports/get-store-avg-customer-count-report/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then status 200

  @Get_store_fruit_and_vegetables_turnover_report
  Scenario: GetStoreFruitAndVegetablesTurnoverReport
    Given url baseUrl
    And path 'store-reports/get-store-fruit-and-vegetables-turnover-report/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then assert response.payload.totalTurnover !=null
    Then match $.payload.totalTurnover contains '#string'
    Then status 200

  @Get_store_loomis_report
  Scenario: GetStoreLoomisReport
    Given url baseUrl
    And path 'store-reports/get-store-loomis-report/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then assert response.payload[0].differenceLoomisAndYesterday !=null
    Then assert response.payload[0].loomisCash !=null
    Then assert response.payload[0].differenceLoomisAndStore !=null
    Then assert response.payload[0].yesterdayCash !=null
    Then assert response.payload[0].sentCash !=null
    Then match $.payload[0].differenceLoomisAndYesterday contains '#number'
    Then match $.payload[0].loomisCash contains '#number'
    Then match $.payload[0].differenceLoomisAndStore contains '#number'
    Then match $.payload[0].yesterdayCash contains '#number'
    Then match $.payload[0].sentCash contains '#number'
    Then status 200

  @Get_store_cash_difference_report
  Scenario: GetStoreCashDifferenceReport
    Given url baseUrl
    And path 'store-reports/get-store-cash-difference-report/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then assert response.payload[0].totalCash !=null
    And assert response.payload[0].totalDayCash !=null
    And assert response.payload[0].questionableCash !=null
    And assert response.payload[0].differenceQuestionableCash !=null
    And assert response.payload[0].differenceCash !=null
    Then match $.payload[0].totalCash contains '#number'
    And match $.payload[0].totalDayCash contains '#number'
    And match $.payload[0].questionableCash contains '#number'
    And match $.payload[0].differenceQuestionableCash contains '#number'
    And match $.payload[0].differenceCash contains '#number'
    Then status 200

  @Get_store_energy_monitoring_report
  Scenario: GetStoreEnergyMonitoringReport
    Given url baseUrl
    And path 'store-reports/get-store-energy-monitoring-report/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then assert response.payload[0].consumptionKW !=null
    And assert response.payload[0].consumptionTL !=null
    And assert response.payload[0].dailyconsumptionKW !=null
    Then match $.payload[0].consumptionKW contains '#number'
    And match $.payload[0].consumptionTL contains '#number'
    And match $.payload[0].dailyconsumptionKW contains '#number'
    Then status 200

  @Get_Active_Reactive_Check
  Scenario: GetActiveReactiveCheck
    Given url baseUrl
    And path 'store-reports/get-active-reactive-check-report'
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then assert response.payload.result[0] !=null
    Then assert response.payload.result[0].isActive !=null
    Then assert response.payload.result[0].storeCode !=null
    Then assert response.payload.result[0].storeName !=null
    Then assert response.payload.result[0].storeCode == "4593 - Bahçelievler Üsküdar"
    Then status 200

  @Get_Unprinted_Tag_Check
  Scenario: GetUnprintedTagCheck
    Given url baseUrl
    And path 'store-reports/unprinted-tag-check'
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then assert response.payload.result[0] !=null
    Then assert response.payload.result[0].isActive !=null
    Then assert response.payload.result[0].storeCode !=null
    Then assert response.payload.result[0].storeCode == "4593 - Bahçelievler Üsküdar"
    Then status 200

  @Get_Returned_Product_Detail_By_StoreCode
  Scenario: GetReturnedProductDetailByStoreCode
    Given url baseUrl
    And path 'store-reports/GetReturnedProductDetailByStoreCode'
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then status 200

  @Get_Store_Hourly_Bread_Turnover_Report
  Scenario: GetStoreHourlyBreadTurnoverReport
    Given url baseUrl
    And path 'store-reports/get-store-hourly-bread-turnover-report/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then assert response.payload.totalTurnover !=null
    Then match $.payload.totalTurnover contains '#string'
    Then status 200


  @Get_Store_Piecemeal_Inventory_Report
  Scenario: GetStorePiecemealInventoryReport
    Given url baseUrl
    And path 'store-reports/get-store-inventory-piecemeal/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then status 200

  @Get_Store_Continually_Inventory_Report
  Scenario: GetStoreContinuallyInventoryReport
    Given url baseUrl
    And path 'store-reports/get-store-inventory-continually/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then status 200

  @Get_Store_Audit_Report
  Scenario: GetStoreMethodAuditReport
    Given url baseUrl
    And path 'store-reports/get-store-method-audit-report/' + storeCode
    And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwMmFmZGJiLTk0ZmEtNGFlMi1hMGVjLWRhODNmOGMyMzFjYiIsImVtYWlsIjoic2Vya2FuLnNvbm1lekBhMTAxLmNvbS50ciIsInByZWZlcnJlZF91c2VybmFtZSI6IlNFUktBTiBTw5ZOTUVaIiwidXVpZCI6IjcxOTI1M2RjLWM5YzMtNDlkYS1iNGU4LTA0YTU5NDM3YmVhMSIsIlNwUmVnaXN0ZXIiOiIyNzk1MzQiLCJyb2xlIjoiU00iLCJleHAiOjE3MDYwNzg4NjgsImlzcyI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciIsImF1ZCI6Imh0dHBzOi8vc29zcC5hMTAxLmNvbS50ciJ9.Sw3THgtarRhMvuyPo4-KdkN4b6o0s1A4Aa7LXifJ4iw'
    When method get
    Then print response
    Then assert response.processStatus == "Success"
    Then assert response.payload[0].points !=null
    Then match $.payload[0].points contains '#number'
    Then status 200
