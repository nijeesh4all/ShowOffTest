//Attach the event handler to any element

$(document).on('turbolinks:load', () => {
    $loading = $('#loader_backdrop')
    $(window).on('turbolinks:load', ()=>{
        $loading.fadeOut()
    })

    $(window).load(function () {
        $loading.fadeOut()
    })
    $(window).unload(function () {
        $loading.show()
    });
})
