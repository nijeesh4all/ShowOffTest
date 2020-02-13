class Flash{

}

Flash.error = (message) => {
    M.toast({
        html: message,
        classes: 'red lighten-2'
    })
}