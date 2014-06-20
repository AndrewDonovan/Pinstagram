var App = angular.module('drag-and-drop', ['ngDragDrop']);

App.controller('oneCtrl', function($scope, $timeout) {
  $scope.list1 = [];
  $scope.list2 = [];
  $scope.list3 = [];
  $scope.list4 = [];
  
  $scope.hello = function(id){
    console.log(id.$id);
    console.log('popped');
    $scope.popped =  {
      'position': 'absolute',
      'z-index': '9999'
    };
  };  

  $scope.bye = function(){
    console.log('unpopped');
    $scope.popped =  {
      'position': 'relative',
      'z-index': '9999'
    };
  };

  $scope.save = function(){
    console.log('saved bro');
  };


  $scope.list5 = [
    { 'title': 'Item 1', 'drag': true },
    { 'title': 'Item 2', 'drag': true },
  ];

  $scope.testPhoto = "";

  // Limit items to be dropped in list1
  $scope.optionsList1 = {
    accept: function(dragEl) {
      if ($scope.list1.length >= 2) {
        return false;
      } else {
        return true;
      }
    }
  };
});