var app = angular.module("GridCambiable", []);

// Creamos y registramos el nuevo servicio de instagram
app.factory('instagram', ['$http', function($http){

	return {
		fetchPopular: function(callback){
            
            var endPoint = "https://api.instagram.com/v1/media/popular?client_id=642176ece1e7445e99244cec26f4de1f&callback=JSON_CALLBACK";
            
            $http.jsonp(endPoint).success(function(response){
                callback(response.data);
            });
		}
	}

}]);

app.controller('GridCambiableController', ['$scope', 'instagram' ,
function ($scope, instagram){

	// Layout por defecto

	$scope.layout = 'grid';
    
    $scope.setLayout = function(layout){
        $scope.layout = layout;
    };
    
    $scope.isLayout = function(layout){
        return $scope.layout == layout;
    };

	$scope.pics = [];

	// Usamos el servicio q construimos
	instagram.fetchPopular(function(data){

		$scope.pics = data;
	});

}]);