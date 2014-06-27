'use strict';

//Properties service used for articles REST endpoint
angular.module('realEstateApp')
    .factory('userProperties', ['$http', function($http) {

        var urlBase = '/properties';
        var userProperties = {};

        userProperties.all = function () {
            return $http.get(urlBase);
        };

        userProperties.getProperty = function (id) {
            return $http.get(urlBase + '/' + id);
        };

        userProperties.insertProperty = function (cust) {
            return $http.post(urlBase, cust);
        };

        userProperties.updateProperty = function (cust) {
            return $http.put(urlBase + '/' + cust.ID, cust)
        };

        userProperties.deleteProperty = function (id) {
            return $http.delete(urlBase + '/' + id);
        };

        return userProperties;
    }]);