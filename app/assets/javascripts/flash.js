class Flash{

}

Flash.error = (message) => {
    $.bootstrapPurr(message, {
        draggable: false,
        type: 'danger'
    });
}