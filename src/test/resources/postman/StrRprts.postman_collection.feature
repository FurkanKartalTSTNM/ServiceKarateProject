Feature:

Background:
* def baseUrl = 'https://sosp.a101.com.tr/api'
* def bearerToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU1YTgwZTlmLTBmZWUtNGM5MS05NzczLWRiZDEwMzQ1MjhiNiIsImVtYWlsIjoiOTkxNmJzMTRAYTEwMS5jb20udHIiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJFUlPEsE4gQkFMQ0kiLCJ1dWlkIjoiM2UzOGU4MTYtMDg3OS00ZTg2LTliZGUtMjAxODZkYzlkZTI0IiwiU3BSZWdpc3RlciI6IjEyNDA2OCIsInJvbGUiOiJCUyIsImV4cCI6MTcwMDk4NjM2NywiaXNzIjoiaHR0cHM6Ly9zb3NwLmExMDEuY29tLnRyIiwiYXVkIjoiaHR0cHM6Ly9zb3NwLmExMDEuY29tLnRyIn0.5CNyjTrBvBJt5ifjH8kL8GzLy_uMxBnkBr7mZ__qh3k'

Scenario:

# Get store ebitda report
* url baseUrl
* path 'store-reports/get-store-ebitda-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store turnover report
* url baseUrl
* path 'store-reports/get-store-turnover-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store performance report
* url baseUrl
* path 'store-reports/get-store-performance-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store daily performance report
* url baseUrl
* path 'store-reports/get-store-performance-daily-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store monthly performance report
* url baseUrl
* path 'store-reports/get-store-performance-monthly-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store yearly performance report
* url baseUrl
* path 'store-reports/get-store-performance-yearly-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store zero material report
* url baseUrl
* path 'store-reports/get-store-zero-material-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store stock day report
* url baseUrl
* path 'store-reports/get-store-stock-day-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store materials not for sale report
* url baseUrl
* path 'store-reports/get-store-materials-not-for-sale-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store average turnover report
* url baseUrl
* path 'store-reports/get-store-avg-turnover-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store average customer count report
* url baseUrl
* path 'store-reports/get-store-avg-customer-count-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store fruit and vegetables turnover report
* url baseUrl
* path 'store-reports/get-store-fruit-and-vegetables-turnover-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store loomis report
* url baseUrl
* path 'store-reports/get-store-loomis-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store cash difference report
* url baseUrl
* path 'store-reports/get-store-cash-difference-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store energy monitoring report
* url baseUrl
* path 'store-reports/get-store-energy-monitoring-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get store instant turnover report
* url baseUrl
* path 'store-reports/get-store-instant-turnover-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get Active Reactive Check
* url baseUrl
* path 'store-reports/get-active-reactive-check-report'
* header Accept = 'application/json'
* method get

# Get Unprinted Tag Check
* url baseUrl
* path 'store-reports/unprinted-tag-check'
* header Accept = 'application/json'
* method get

# /store-reports/GetReturnedProductDetailByStoreCode
* url baseUrl
* path 'store-reports/GetReturnedProductDetailByStoreCode'
* header Accept = 'application/json'
* method get

# Get Store Hourly Bread Turnover Report
* url baseUrl
* path 'store-reports/get-store-hourly-bread-turnover-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get Store Inventory Report
* url baseUrl
* path 'store-reports/get-store-inventory-sales-report/' + storeCode
* header Accept = 'application/json'
* method get

# Get Store Piecemeal Inventory Report
* url baseUrl
* path 'store-reports/get-store-inventory-piecemeal/' + storeCode
* header Accept = 'application/json'
* method get

# Get Store Continually Inventory Report
* url baseUrl
* path 'store-reports/get-store-inventory-continually/' + storeCode
* header Accept = 'application/json'
* method get

# /store-reports/get-store-method-audit-report/:storeCode
* url baseUrl
* path 'store-reports/get-store-method-audit-report/' + storeCode
* header Accept = 'application/json'
* method get
