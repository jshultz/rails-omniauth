'use strict';

angular.module('realEstateApp').controller('AdminController', ['$scope', '$routeParams', '$location', 'userProperties','$http', function($scope, $routeParams, $location, userProperties, $http) {

    $scope.properties = userProperties.all();

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
    };

    $scope.create = function() {
        var theproperty = {
              businessName: this.businessName,
              streetAddress: this.streetAddress,
              city: this.city,
              state: this.state,
              zip: this.zip,
              mdu: this.mdu,
              units: this.units,
              content: this.content
        };

        // var propertywrap = {
        //   property: theproperty
        // }

        var propertywrap = {
          property : {
            businessName: this.businessName,
            streetAddress: this.streetAddress,
            city: this.city,
            state: this.state,
            zip: this.zip,
            mdu: this.mdu,
            units: this.units,
            content: this.content
          }
        }

        // $http({
        //   method: 'POST',
        //   url: '/properties/create',
        //   data: {
        //     property : { businessName: this.businessName }
        //   }
        // })

        userProperties.insertProperty(propertywrap)
            .success(function () {
                $scope.status = 'Inserted Customer! Refreshing customer list.';
                $scope.customers.push(cust);
            }).
            error(function(error) {
                $scope.status = 'Unable to insert customer: ' + error.message;
            })


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
