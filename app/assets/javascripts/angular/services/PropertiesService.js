'use strict';

//Properties service used for articles REST endpoint
angular.module('realEstateApp')
    .factory('UserProperties', ['$resource', function($resource) {
        return $resource('users/properties/:propertyId', {
            propertyId: '@_id'
        }, {
            update: {
                method: 'PUT'
            }
        });
    }]);