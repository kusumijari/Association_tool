$( function() {
    $( ".dragMe" ).draggable();
    $( ".dropHere" ).droppable({
      drop: function( event, ui ) {
          var droppableId = $(this).attr("id");
          var draggableId = $(ui.draggable).attr("id");
          var url=window.location.href;
          if(url.search(draggableId) == -1) {
            var separator = (url.indexOf("?")===-1)?"?":"&";
            var newParam= separator +  draggableId + "=" +droppableId;
            var newUrl=url.replace(newParam,"");
            newUrl = newUrl + newParam;
          }
          else {
            var regex = new RegExp("[\?|&]" + draggableId + "(.*)");
            console.log("Second time", regex)
            var newUrl = url.replace(regex, "");
            var separator = (newUrl.indexOf("?")===-1)?"?":"&";
            var newParam= separator + draggableId + "=" +droppableId;
            newUrl = newUrl + newParam;
          }
          window.history.pushState("", "", newUrl) ;

          var div = document.getElementById('url');
          div.innerHTML = newUrl;
        $(this)
          // .append(ui.draggable.css({position: 'relative', width: '100%', margin: '0 auto'}))
          .addClass( "ui-state-highlight")
    }
    });

    history.pushState(null, "", location.href.split("?")[0]);
  } );

