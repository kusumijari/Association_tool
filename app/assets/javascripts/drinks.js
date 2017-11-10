$( function() {
    $( ".dragMe" ).draggable();
    $( ".dropHere" ).droppable({
      drop: function( event, ui ) {
          console.log("Dropped in ", $(this).attr("id"));
          var droppableId = $(this).attr("id");
          var url=window.location.href;
          
          if(url.search("bucket") == -1) {
            var separator = (url.indexOf("?")===-1)?"?":"&";
            var newParam= separator + "bucket="+droppableId;
            var newUrl=url.replace(newParam,"");
            newUrl = newUrl + newParam;
          }
          else {
            console.log("Repeated")
            var newUrl = url.replace(/[\?|&]bucket(.*)/, "");
            console.log("New url", newUrl);
            var separator = (newUrl.indexOf("?")===-1)?"?":"&";
            var newParam= separator + "bucket="+droppableId;
            newUrl = newUrl + newParam;
          }
          window.history.pushState("", "", newUrl) ;
        $(this)
          // .append(ui.draggable.css({position: 'relative', width: '100%', margin: '0 auto'}))
          .addClass( "ui-state-highlight" )
    }
    });
  } );