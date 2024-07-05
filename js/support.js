function getBroVol() {
    var b = 0,
        a = 0,
        c = {};
    if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
        b = document.documentElement.clientWidth;
        a = document.documentElement.clientHeight
    } else {
        if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
            b = document.body.clientWidth;
            a = document.body.clientHeight
        } else {
            if (document.body && document.body.offsetWidth) {
                b = document.body.offsetWidth;
                a = document.body.offsetHeight
            } else {
                if (document.compatMode == "CSS1Compat" && document.documentElement && document.documentElement.offsetWidth) {
                    b = document.documentElement.offsetWidth;
                    a = document.documentElement.offsetHeight
                }
            }
        }
    }
    this.h = a;
    this.w = b;
    return
}
function broW() {
    return new getBroVol().w
}
(function ($) {
    $.fn.setEqH = function (options) {
        var settings = { parent: 0, oh: 0 }, temp = 0;
        options = $.extend(settings, options);
        this.each(function (index, el) {
            var $element = $(this);
            // console.log($element.height());
            if (temp < $(this)[(options.oh == 1) ? 'outerHeight' : 'height']()) temp = $(this)[(options.oh == 1) ? 'outerHeight' : 'height']()
        });
        return (options.parent == 1) ? this.parent().css('height', temp) : this.css('height', temp);
    };
})(jQuery);

var winW = broW(),
    winH = new getBroVol().h,
    res
var focus_area_slider
var history_slider2
var tempTop, dropTop, hdrH
$(window).on("resize", function (a) {
    a.preventDefault();
    if (res) {
        clearTimeout(res)
    }
    res = setTimeout(function () {
        winW = broW();
        winH = new getBroVol().h;
        $(".upcoming_exp .cont,.courses_offered .courses_lists .col,.main_banner .cont,.courses_listing .course_card,.title_sec .custom_dropdown .lists,.courses_listing p,.testimonials .author .details,.main_banner .cont,.main").removeAttr('style')
        $(".upcoming_exp .cont").setEqH({ oh: 1 })
        $(".courses_offered .courses_lists .col").setEqH({ oh: 1 })
//        $('.type_03 .desk_cont').html($('.type_03 .container').html())
        $(".courses_listing .course_card").setEqH({ oh: 1 })
        $(".courses_listing p").setEqH({ oh: 1 })
        $(".main_banner .cont").setEqH({ oh: 1 })
        dropTop = parseInt($('.title_sec').css('padding-top')) + parseInt($('.custom_dropdown').outerHeight())
        $('.title_sec .custom_dropdown .lists').css('top', dropTop)
        setTimeout(function () {
            $(".testimonials .author .details ").setEqH({ oh: 1 })
            booksPicHeight()
        }, 3000)

        setTimeout(function () {
            hdrH = $('header').outerHeight()
            $('.main').css('paddingTop', hdrH)
            $(".courses_listing .course_card").removeAttr('style')
            $(".courses_listing .course_card").setEqH({ oh: 1 })
            setPageTitleTop()
        }, 2000)
        booksPicHeight()
        

    }, 100)

    if (winW > 979) {
        $(".main_banner .cont").setEqH({ oh: 1 })
    }
    
    
    
}).trigger('resize');

function booksPicHeight(){
    $('.books_section .main_books .pic').removeAttr('style')
    $(".books_section .main_books .pic").setEqH({ oh: 1 })

    $('.books_section .other_books .col').removeAttr('style')
    $('.books_section .other_books .col').setEqH({ oh: 1 })
}

$('.hamburger_menu').on('click', function () {
    $('header').addClass('active')
})

$('header .close').on('click', function () {
    $('header').removeClass('active')
})

$('.sub_level > a').on('click', function (e) {
    if (winW < 1024) {
        e.preventDefault()
        $(this).parent().toggleClass('active').siblings().removeClass('active').find('ul').slideUp()
        $(this).next().slideToggle()
    }
})

var curClass = $('nav .sub_level')
$('nav .sub_level').on('mouseenter mouseleave', function (e) {
    if (winW > 1023 && (e.type !== 'click')) $(this).find('ul,.sub_menu').stop(true, false)['slide' + ((e.type == 'mouseenter') ? 'Down' : 'Up')]();
})

var curClass = $('nav .sub_level')
$('nav .sub_level').on('mouseenter mouseleave', function (e) {
    if (winW > 1023 && (e.type !== 'click')) $(this).find('.sub_menu').stop(true, false)['slide' + ((e.type == 'mouseenter') ? 'Down' : 'Up')]();
})

function counterAnim(targetValue, duration, updateInterval, id) {
    let currentValue = 0;
    const increment = parseInt(targetValue) / (duration / updateInterval);

    const intervalId = setInterval(() => {
        currentValue += increment;
        document.getElementById(id).innerText = Math.round(currentValue);
        if (currentValue >= parseInt(targetValue)) {
            clearInterval(intervalId);
            document.getElementById(id).innerText = parseInt(targetValue);
        }
    }, updateInterval);
}

function startCounterAnimation() {
    startCounterAnimation = function () { };
    counterAnim($('#user_counter').html(), 2000, 20, 'user_counter')
    counterAnim($('#teachers_counter').html(), 2000, 20, 'teachers_counter')
    counterAnim($('#courses_counter').html(), 2000, 20, 'courses_counter')
    counterAnim($('#hours_counter').html(), 2000, 20, 'hours_counter')
}


$(window).scroll(function () {
    if ($(this).scrollTop() > 0) {
        $('header').addClass('sticky')
    }
    else {
        $('header').removeClass('sticky')
    }

    if ($(this).scrollTop() > 800) {
        $('.scrollToTop').fadeIn();
    } else {
        $('.scrollToTop').fadeOut();
    }
    if($('.about_course').length){
        if($('.about_course').get(0).getBoundingClientRect().top <  hdrH){
            $('.sticky_btn').addClass('active')
        }
        else{
            $('.sticky_btn').removeClass('active')
        }
    }

    if ($('.courses_offered .info').length) {
        if ($('.courses_offered .info').get(0).getBoundingClientRect().top < 500) {
            startCounterAnimation()
        }
    }
});

$('.acc_main .hdr').on('click', function () {
    $(this).toggleClass('active').next().slideToggle().parent().siblings().find('.hdr').removeClass('active').next().slideUp()
})

$('.scrollToTop').on('click', function (event) {
    event.preventDefault();
    $('html, body').animate({
        scrollTop: $('body').offset().top
    }, 1000);
});



$('.get_intouch_btn').on('click', function (e) {
    e.preventDefault()
    $('#get_in_touch').fadeIn()
})
$('.popup .close').on('click', function (e) {
    e.preventDefault()
    $(this).parents('.popup').fadeOut()
})

$('.accordion_main .acc_hd').on('click', function () {
    $(this).toggleClass('active').next().slideToggle().parent().siblings().find('.acc_hd').removeClass('active').next().slideUp()
})

$(document).on('click', function (e) {
    if ($(e.target).closest(".title_sec .custom_dropdown").length === 0) {
        $(".title_sec .custom_dropdown .lists").slideUp();
    }
});

$('.title_sec .custom_dropdown .hdr').on('click', function () {
    $('.title_sec .custom_dropdown .lists').slideToggle()
})

// var tempIcon, tempName
// $('.custom_dropdown .lists a').on('click', function (e) {
//     e.preventDefault()
//     tempIcon = $(this).find('.icon').html()
//     tempName = $(this).find('.c_name').html()
//     $('.title_sec .custom_dropdown .hdr .icon').html(tempIcon)
//     $('.title_sec .custom_dropdown h1').html(tempName)
//     $(".title_sec .custom_dropdown .lists").slideUp();
// })


$('.dates_col li a').on('click', function (e) {
    e.preventDefault()
    $(this).parent().addClass('active').siblings().removeClass('active')
})


const testimonials_slider = new Swiper('#testimonials_slider', {
    loop: true,
    effect: 'slide',
    spaceBetween: 10,
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
    on: {
        slideChangeTransitionStart: function () {
            stopVideo($('.testimonials'))
        },
    },
});
const main_banner = new Swiper('#main_banner', {
    loop: true,
    effect: 'fade',
	fadeEffect: {
        crossFade: true
      },
    spaceBetween: 10,
    autoplay:{delay:5000},
	speed: 800,
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
});
const courses_banner = new Swiper('#courses_banner', {
    loop: true,
    effect: 'slide',
    spaceBetween: 10,
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
});

const gallery_slider = new Swiper('#gallery_slider', {
    loop: false,
    slidesPerView: 1.25,
    spaceBetween: 0,
    breakpoints: {
        640: {
            slidesPerView: 3,
            spaceBetween: 10,
            loop: true,
        },
        640: {
            slidesPerView: 3,
            spaceBetween: 21,
            loop: true,
        }
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    pagination: {
        el: '.swiper-pagination',
        dynamicBullets: true,
    },
    on: {
        init: function () {
            $('.image_title').html($('.gallery .swiper-slide-active .pic img').attr('alt'))
        },
        slideChangeTransitionStart: function () {
            $('.image_title').html($('.gallery .swiper-slide-active .pic img').attr('alt'))
        },
    },
});

$(function () {
    $('.gallery_sec .sec').each(function (index) {
        const gallery_slider_01 = new Swiper('#gallery_slider_' + (index + 1), {
            loop: false,
            slidesPerView: 1.25,
            spaceBetween: 0,
            breakpoints: {
                640: {
                    slidesPerView: 3,
                    spaceBetween: 10,
                    loop: true,
                },
                1024: {
                    slidesPerView: 3,
                    spaceBetween: 21,
                    loop: true,
                }
            },
            navigation: {
                nextEl: '.swiper-button-next_' + (index + 1),
                prevEl: '.swiper-button-prev_' + (index + 1),
            },
            pagination: {
                el: '.swiper-pagination_' + (index + 1),
                dynamicBullets: true,
            }
        });
    });


})


const brochure_slider = new Swiper('#brochure_slider', {
    loop: false,
    slidesPerView: 1.25,
    spaceBetween: 0,
    breakpoints: {
        640: {
            slidesPerView: 2,
            spaceBetween: 10,
            loop: true,
        },
        1280: {
            slidesPerView: 2,
            spaceBetween: 54,
            loop: true,
        }
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    pagination: {
        el: '.swiper-pagination',
        dynamicBullets: true,
    }
});




// validation start
var namevalid = /^([A-Za-z .]+\s?)*$/;
var email =
    /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9\-]+)\.(([a-zA-Z]{2,}|[0-9]{2,})|([a-zA-Z]{2,}\.[a-zA-Z]{2,})|([a-zA-Z]{2,}\.[a-zA-Z]{2,}\.[a-zA-Z]{2,}))$/;
var mobil = /^(\+\d{1,3}[- ]?)?\d{10}$/;
var phoneRegex = /^(\+\d{1,3}\s?)?(\d{10,12})$/;
var alphaNumeric = /^[\w]+([-_\s!]{1}[a-z0-9]+)*$/i;
var comments = /^[-_!.&,()@ a-zA-Z0-9]+$/;

function inpValid(id, _alert, _alert2, _valid) {
    if ($(id).val() === "") {
        $(id).focus().select().parent().addClass("error");
        alert(_alert);
        return false;
    } else if (!window[_valid].test($(id).val())) {
        $(id).focus().select().parent().addClass("error");
        alert(_alert2);
        return false;
    } else {
        $(id).parent().removeClass("error");
        return true;
    }
}

function inpEmpty(id, _alert) {
    if ($(id).val() === "") {
        $(id).focus().select().parent().addClass("error");
        alert(_alert);
        return false;
    } else {
        $(id).parent().removeClass("error");
        return true;
    }
}

function selectValid(id, _alert) {
    if ($(id).prop("selectedIndex") == "0") {
        $(id).focus().select().addClass("error");
        alert(_alert);
        return false;
    }
    $(id).removeClass("error");
    return true;
}



function validateNotifyMeForm() {
    if (!inpValid("#cus_email", "Please enter your email address", "Please enter a valid email address", "email")) {
        return false;
    }
    if (!inpValid("#cus_phone", "Please enter your phone number", "Please enter a valid phone number", "phoneRegex")) {
        return false;
    }
    return true;
}

$("#notify_me").on("click", function (e) {
    e.preventDefault();
    if (validateNotifyMeForm()) {
        console.log('Submit');
    }
});

// validation end


$('.open_course_guide').on('click', function(e){
    e.preventDefault()
    $('#course_guide_popup').fadeIn()
})

$('.show_more').on('click', function(e){
    e.preventDefault()
    $(this).parent('.hidden_cont').toggleClass('show_more_cont')
    $(this).text($(this).parent().hasClass('show_more_cont') ? 'Less' : 'More'); 
    $('html, body').animate({
        scrollTop: $(this).parents('.main').offset().top  - hdrH
    }, 1000);
})


function stopVideo(element) {
    // getting every iframe 
    var iframes = element.find('iframe');
    // console.log(iframes);
    // reinitializing the values of the src attribute of every iframe to stop the YouTube video.
    for (let i = 0; i < iframes.length; i++) {
       if (iframes[i] !== null) {
          var temp = iframes[i].src;
          iframes[i].src = temp;
       }
    }
 };


 function setPageTitleTop(){
    $('.sticky_hdr').css('top', hdrH + 'px')
    $('.sticky_btn').css('top', (hdrH + 20) + 'px')
 }


