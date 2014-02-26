// EXTRUDER SIDE TAB STUFF:

$(function(){

  // if (self.location.href == top.location.href){
            //     $("body").css({font:"normal 13px/16px 'trebuchet MS', verdana, sans-serif"});
            //     var logo=$("<a href='http://pupunzi.com'><img id='logo' border='0' src='http://pupunzi.com/images/logo.png' alt='mb.ideas.repository' style='display:none;'></a>").css({position:"absolute"});
            //     $("body").prepend(logo);
            //     $("#logo").fadeIn();
            // }

            $("#extruderTop").buildMbExtruder({
                positionFixed:false,
                position:"top",
                width:350,
                extruderOpacity:1,
                autoCloseTime:0,
                autoOpenTime:1000,
                hidePanelsOnClose:false,
                onExtOpen:function(){},
                onExtContentLoad:function(){},
                onExtClose:function(){}
            });

            $("#extruderBottom").buildMbExtruder({
                position:"bottom",
                width:480,
                overflow:"scroll",
                extruderOpacity:1,
                onExtOpen:function(){},
                onExtContentLoad:function(){},
                onExtClose:function(){}
            });

            $("#extruderLeft").buildMbExtruder({
                position:"left",
                width:300,
                extruderOpacity:.8,

                hidePanelsOnClose:false,
                accordionPanels:false,
                onExtOpen:function(){},
                onExtContentLoad:function(){$("#extruderLeft").openPanel();},
                onExtClose:function(){}
            });

            $("#extruderLeft2").buildMbExtruder({
                position:"left",
                width:300,
                positionFixed:false,
                top:0,
                extruderOpacity:.8,
                onExtOpen:function(){},
                onExtContentLoad:function(){},
                onExtClose:function(){}
            });

            $("#extruderRight").buildMbExtruder({
                position:"right",
                width:300,
                overflow:"scroll",
                extruderOpacity:1,
                textOrientation:"tb",
                onExtOpen:function(){},
                onExtContentLoad:function(){$("#extruderRight").openPanel();},
                onExtClose:function(){}
            });

            $.fn.changeLabel=function(text){
                $(this).find(".flapLabel").html(text);
                $(this).find(".flapLabel").mbFlipText();
            };
});





