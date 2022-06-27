import * as React from "react";

class Dom extends React.Component {
    componentDidMount() {
        document.querySelector(".p-top__menu-more").addEventListener("click", () => {
           document.querySelectorAll(".p-top__menu-item--mobile-none").forEach(e => {
               e.classList.remove('p-top__menu-item--mobile-none');
               document.querySelector('.p-top__menu-more').classList.remove('c-mobile-display');
               document.querySelector('.p-top__menu-more').classList.add('c-mobile-none');
           });
        });
        let map1opened = false;
        document.querySelector("#map-1-title").addEventListener('click', () => {
            if(map1opened) {
                document.querySelector('#map-1-items').classList.add('c-mobile-none');
                document.querySelector('#map-1-title').classList.remove('p-top__map-base-mobile-title--close');
                document.querySelector('#map-1-title').classList.add('p-top__map-base-mobile-title--open');
                map1opened = false;
            } else {
                document.querySelector('#map-1-items').classList.remove('c-mobile-none');
                document.querySelector('#map-1-title').classList.remove('p-top__map-base-mobile-title--open');
                document.querySelector('#map-1-title').classList.add('p-top__map-base-mobile-title--close');
                map1opened = true;
            }
        });
        let map2opened = false;
        document.querySelector("#map-2-title").addEventListener('click', () => {
            if(map2opened) {
                document.querySelector('#map-2-items').classList.add('c-mobile-none');
                document.querySelector('#map-2-title').classList.remove('p-top__map-base-mobile-title--close');
                document.querySelector('#map-2-title').classList.add('p-top__map-base-mobile-title--open');
                map2opened = false;
            } else {
                document.querySelector('#map-2-items').classList.remove('c-mobile-none');
                document.querySelector('#map-2-title').classList.remove('p-top__map-base-mobile-title--open');
                document.querySelector('#map-2-title').classList.add('p-top__map-base-mobile-title--close');
                map2opened = true;
            }
        });
        let map3opened = false;
        document.querySelector("#map-3-title").addEventListener('click', () => {
            if(map3opened) {
                document.querySelector('#map-3-items').classList.add('c-mobile-none');
                document.querySelector('#map-3-title').classList.remove('p-top__map-base-mobile-title--close');
                document.querySelector('#map-3-title').classList.add('p-top__map-base-mobile-title--open');
                map3opened = false;
            } else {
                document.querySelector('#map-3-items').classList.remove('c-mobile-none');
                document.querySelector('#map-3-title').classList.remove('p-top__map-base-mobile-title--open');
                document.querySelector('#map-3-title').classList.add('p-top__map-base-mobile-title--close');
                map3opened = true;
            }
        });
        let map4opened = false;
        document.querySelector("#map-4-title").addEventListener('click', () => {
            if(map4opened) {
                document.querySelector('#map-4-items').classList.add('c-mobile-none');
                document.querySelector('#map-4-title').classList.remove('p-top__map-base-mobile-title--close');
                document.querySelector('#map-4-title').classList.add('p-top__map-base-mobile-title--open');
                map4opened = false;
            } else {
                document.querySelector('#map-4-items').classList.remove('c-mobile-none');
                document.querySelector('#map-4-title').classList.remove('p-top__map-base-mobile-title--open');
                document.querySelector('#map-4-title').classList.add('p-top__map-base-mobile-title--close');
                map4opened = true;
            }
        });
        let map5opened = false;
        document.querySelector("#map-5-title").addEventListener('click', () => {
            if(map5opened) {
                document.querySelector('#map-5-items').classList.add('c-mobile-none');
                document.querySelector('#map-5-title').classList.remove('p-top__map-base-mobile-title--close');
                document.querySelector('#map-5-title').classList.add('p-top__map-base-mobile-title--open');
                map5opened = false;
            } else {
                document.querySelector('#map-5-items').classList.remove('c-mobile-none');
                document.querySelector('#map-5-title').classList.remove('p-top__map-base-mobile-title--open');
                document.querySelector('#map-5-title').classList.add('p-top__map-base-mobile-title--close');
                map5opened = true;
            }
        });
        let map6opened = false;
        document.querySelector("#map-6-title").addEventListener('click', () => {
            if(map6opened) {
                document.querySelector('#map-6-items').classList.add('c-mobile-none');
                document.querySelector('#map-6-title').classList.remove('p-top__map-base-mobile-title--close');
                document.querySelector('#map-6-title').classList.add('p-top__map-base-mobile-title--open');
                map6opened = false;
            } else {
                document.querySelector('#map-6-items').classList.remove('c-mobile-none');
                document.querySelector('#map-6-title').classList.remove('p-top__map-base-mobile-title--open');
                document.querySelector('#map-6-title').classList.add('p-top__map-base-mobile-title--close');
                map6opened = true;
            }
        });
    }
    render() {
        return <></>;
    }
}

export default Dom;
