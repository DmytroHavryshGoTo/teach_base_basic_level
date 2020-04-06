// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener('turbolinks:load', () => {
    const top_places = document.getElementById('top_places')
    const bottom_places = document.getElementById('bottom_places')
    const side_top_places = document.getElementById('side_top_places')
    const side_bottom_places = document.getElementById('side_bottom_places')
    const seat_places = document.getElementById('seat_places')

    let select = document.getElementById('carriage_type')
    const default_value = select.value

    const hide_unnecessary = (type) => {
        show(top_places, bottom_places, side_top_places, side_bottom_places, seat_places)
        switch (type) {
            case 'DefaultCarriage' :
                hide(seat_places)
                break
            case 'CoupeCarriage' :
                hide(seat_places, side_bottom_places, side_top_places)
                break
            case 'PremiumCarriage' :
                hide(seat_places, side_bottom_places, side_top_places, top_places)
                break
            case 'SeatedCarriage' :
                hide(top_places, bottom_places, side_top_places, side_bottom_places)
                break
        }
    }
    select.onchange = (e) => {
        let type = e.target.value
        hide_unnecessary(type)
    }

    hide_unnecessary(default_value)
})

const hide = (...args) => {
    args.map((elem) => {
        elem.style.display = 'none'
    })
}

const show = (...args) => {
    args.map((elem) => {
        elem.style.display = 'block'
    })
}
