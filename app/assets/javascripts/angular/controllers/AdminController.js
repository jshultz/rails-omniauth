'use strict';

angular.module('realEstateApp').controller('AdminController', ['$scope', '$routeParams', '$location', 'Users', 'UserProperties', function($scope, $routeParams, $location, Users, UserProperties) {

    $scope.init = function() {
        $scope.result = 'hey there'
    }

    var serverErrorHandler = function() {
        alert("There was a server error, please reload the page and try again.")
    }

    $scope.getClass = function(path) {
        if ($location.path().substr(0, path.length) == path) {
            return "active"
        } else {
            return ""
        }
    }

    $scope.create = function() {
        var property = new UserProperties({
            businessName: this.businessName,
            streetAddress: this.streetAddress,
            city: this.city,
            state: this.state,
            zip: this.zip,
            mdu: this.mdu,
            units: this.units,
            content: this.content
        });
        property.$save(function(response) {
            $location.path('users/properties/' + response._id);
        });

        this.businessName = '';
        this.streetAddress = '';
        this.city = '';
        this.state = '';
        this.zip = '';
        this.mdu = '';
        this.units = '';
        this.content = '';
        this.userID = '';
    };

}])

