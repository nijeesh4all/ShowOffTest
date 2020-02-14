class Flash{

}

Flash.error = (message) => {
    $.bootstrapPurr(message, {
        draggable: false,
        type: 'danger'
    });
}

Flash.success = (message) => {
    $.bootstrapPurr(message, {
        draggable: false,
        type: 'success'
    });
}

