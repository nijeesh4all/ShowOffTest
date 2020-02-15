Flash = {
    notification: (message, type) => {
        Toastify({
            text: message,
            className: type,
            position: 'center'
        }).showToast();
    },

    error: function (message) {
        this.notification(message, 'danger')
    },

    success: function (message) {
        this.notification(message, 'success')
    },

    warning: function (message) {
        this.notification(message, 'info')
    }
}

$(document).on("turbolinks:load", function () {
    $('.alert.danger').each((index, elem) => {
        Flash.error(elem.innerHTML)
    })

    $('.alert.success').each((index, elem) => {
        Flash.success(elem.innerHTML)
    })
})
