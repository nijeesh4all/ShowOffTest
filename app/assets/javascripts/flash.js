Flash = {
    notification: (message, type) => {
        Toastify({
            text: message,
            backgroundColor: "indianred",
            className: type,
            position: 'center'
        }).showToast();
    },

    error: function (message) {
        this.notification(message, 'error')
    },

    success: function (message) {
        this.notification(message, 'error')
    }
}

$(document).on("turbolinks:load", function () {
    $('.alert.danger').each((index, elem) => {
        Flash.error(elem.innerHTML)
    })

    $('.alert.sucess').each((index, elem) => {
        Flash.success(elem.innerHTML)
    })
})
