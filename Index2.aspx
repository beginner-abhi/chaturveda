<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Index2.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .crs-lnk {
            transition-delay: 50s;
        }


        @keyframes flickerAnimation {
            0% {
                opacity: 1;
            }

            50% {
                opacity: 0;
            }

            100% {
                opacity: 1;
            }
        }

        @-o-keyframes flickerAnimation {
            0%;

        {
            opacity: 1;
        }

        50% {
            opacity: 0;
        }

        100% {
            opacity: 1;
        }

        }

        @-moz-keyframes flickerAnimation {
            0% {
                opacity: 1;
            }

            50% {
                opacity: 0;
            }

            100% {
                opacity: 1;
            }
        }

        @-webkit-keyframes flickerAnimation {
            0% {
                opacity: 1;
            }

            50% {
                opacity: 0;
            }

            100% {
                opacity: 1;
            }
        }

        .blink {
            -webkit-animation: flickerAnimation .5s infinite;
            -moz-animation: flickerAnimation .5s infinite;
            -o-animation: flickerAnimation .5s infinite;
            animation: flickerAnimation .5s infinite;
        }

        * {box-sizing:border-box}

/* Slideshow container */
.slideshow-container {
   
  max-width: 100%;
  position: relative;
  margin: auto;

}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: none;
  animation-duration: 2.5s;
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     
    <div>
        
        
      <!-- Slideshow container -->
<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
    <img src="public/IMG_20170806_144736.jpg" style="width:100%">
    <div class="text"></div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">2 / 3</div>
    <img src="public/IMG_20170806_121352cpy.jpg"  style="width:100%">
    <div class="text"></div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">3 / 3</div>
    <img src="public/DSC00100cpy.JPG" style="width:100%">
    <div class="text"></div>
  </div>
     <div class="mySlides fade">
    <div class="numbertext">4/ 4</div>

    <img src="public/FB_IMG_1548002809058.jpg" style="width:100%">
    <div class="text"></div>
  </div>
     <div class="mySlides fade">
    <div class="numbertext">5 / 5</div>
        
    <img src="public/FB_IMG_1578224940218.jpg" style="width:100%">
    <div class="text"></div>
  </div>
     <div class="mySlides fade">
    <div class="numbertext">6 / 6</div>

    <img src="public/DSC00016.JPG" style="width:100%">
    <div class="text"></div>
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>


<!-- The dots/circles -->
<%--<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>
</div>--%>
 <div class="gallery-item">
      <img src="Header%20Brown%20Band.png"  alt="Image 1">
    </div> 
<%--<div class="slideshow-container">
<!--Display the images-->
    @foreach(var img in Model.Skill)
    {
        @if(img.type == "Certification")
        {
            <div class="mySlides faade">
                <img src="public/IMG_20170806_144736.jpg" style="width:100%" />
            </div>
     <div class="mySlides faade">
                <img src="public/IMG_20170806_121352.jpg" style="width:100%" />
            </div>
    <div class="mySlides faade">
                <img src="public/DSC00100.JPG" style="width:100%" />
            </div>
        }
    }

    <!-- Next and previous buttons -->
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<!--For The dots/circles -->
<div style="text-align:center">
    @foreach (var img in Model.Skill)
    {
        @if (img.type == "Certification")
        {
            <span class="dot" onclick="currentSlide(@img.Id)"></span>
        }
    }
</div>--%>
        <div class="container">
         
            <h3>परिचय</h3>
          
            <p>
                श्री शुभसंवत् २०५६ चैत्र-शुक्ल-प्रतिपदा तिथि (वासन्तिक नवरात्र एवं भारतीय नव संवत्) तदनुसार १६ मार्च १९९९ गुरुवार को सर्वविद्या की राजधानी, भगवान् विश्वनाथ के आनन्दवन, काशी में संस्थानम् की स्थापना हुयी।

संस्कृत के लिये, संस्कृत में या संस्कृत से कुछ करने को समुद्यत, जिज्ञासु व समर्पित भाव वाले कार्यकर्ताओं का एक राष्ट्रव्यापी मञ्च तथा संगठन है, जो विना किसी लाभ  की अपेक्षा से धर्म, लिंग, जाति, वर्ग आदि भेद-भाव का परित्याग पूर्वक संस्कृतकार्य - देवकार्य एवं संस्कृतसेवा - राष्ट्रसेवा को निरन्तर समर्पित है।
            </p>
            <div class="btm_sec">
                <a href="About_us.aspx" class="btn_02 white">अधिक जानें</a>
            </div>
        </div>
    </div>
<%--<script>
let slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}
</script>--%>

    <script>
        let slideIndex = 0;
        showSlides();

        function showSlides() {
            let i;
            let slides = document.getElementsByClassName("mySlides");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1}
            slides[slideIndex-1].style.display = "block";
            setTimeout(showSlides, 2000); // Change image every 2 seconds
        }
    </script>

  
</asp:Content>

