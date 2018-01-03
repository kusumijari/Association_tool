$( function() {
  $( ".dragMe" ).draggable();
  $( ".dropHere" ).droppable({
    drop: function( event, ui ) {
      var droppableId = $(this).attr("id");
      var draggableId = $(ui.draggable).attr("id");

      document.getElementsByName(draggableId)[0].value = droppableId;
      $(this)
        .addClass( "ui-state-highlight")
    }
  });
});

