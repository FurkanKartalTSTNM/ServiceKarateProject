Feature: loc

  Background
    * url =  'https://bayi.petrolofisi.com.tr/'
    * def utils = Java.type('util.GeneralUtils')
    * def name = utils.getName()
    * def job = utils.getJob()

  @loc
  Scenario: loc Test
    * print 'loc Test Starting'
    * def postTest = call read('tst/Karate.feature@postSubTest') {externalName:#(name) , externalJob:#(job)}
