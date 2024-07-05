<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
     .gallery {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 10px;
  padding: 20px;
}

.gallery-item {
  overflow: hidden;
}

.gallery-item img {
  width: 100%;
  height: auto;
  display: block;
}
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.9);
}

.modal-content {
  margin: auto;
  display: block;
  max-width: 90%;
  max-height: 90%;
}

.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="gallery-item">
      <img src="Header%20Brown%20Band.png"  alt="Image 1">
    </div> 

      <div class="container">
  <!-- Heading Name -->
  <div class="heading">
    <h3>छवि </h3>
  </div>
    <!-- Image Gallery section all image in one div -->
    <div class="gallery">
    <div class="gallery-item">
      <img src="public/99b7cac7-1a94-4996-9c42-c8d5f918cef6.jfif " onclick="openModal('public/99b7cac7-1a94-4996-9c42-c8d5f918cef6.jfif')" alt="Image 1">
    </div>
           <div class="gallery-item">
   
      <img 
src="public/9a6e68da-eafd-496c-83ec-042ad9088016.jfif" 
onclick="openModal('public/9a6e68da-eafd-496c-83ec-042ad9088016.jfif')" alt="Image 2">
    </div>
 
    <div class="gallery-item">
       
      <img src="public/4913d0d5-dc07-48f4-8c1b-4b9e9d479e8a.jfif" 
onclick="openModal('public/4913d0d5-dc07-48f4-8c1b-4b9e9d479e8a.jfif')" alt="Image 3">
    </div>
   
<div class="gallery-item">
  <img 
src="public/9642ec26-fabe-4e8d-b318-afd35dc5ba66.jfif" 
onclick="openModal('public/9642ec26-fabe-4e8d-b318-afd35dc5ba66.jfif')" alt="Image 4">
    </div>

 <div class="gallery-item">
      <img src="public/1488034061092.jpg" onclick="openModal('public/1488034061092.jpg')" alt="Image 7">
    </div>
 
    <div class="gallery-item">
      <img 
src="public/72702068-7a35-4088-bf5b-66b6f0f65048.jfif" 
 onclick="openModal('public/72702068-7a35-4088-bf5b-66b6f0f65048.jfif')" alt="Image 5">
    </div>
    
     <div class="gallery-item">  
<img src="public/IMG_20170806_121352.jpg" 
onclick="openModal('public/IMG_20170806_121352.jpg')" alt="Image 8">
    </div>   
    
      <div class="gallery-item">
      <img 
src="public/6fce3448-cb6e-41cc-beb4-6ecec5a5166c.jfif" 
           onclick="openModal('public/6fce3448-cb6e-41cc-beb4-6ecec5a5166c.jfif')" alt="Image 4">
    </div>
 <div class="gallery-item">
      <img src="public/66ca2bcb-0162-468e-904e-fc9e7d8d92db.jfif " onclick="openModal('public/66ca2bcb-0162-468e-904e-fc9e7d8d92db.jfif') " 
alt="Image 3">
    </div>
           <div class="gallery-item">
      <img 
 src="public/420ffe29-3395-495b-8965-98f4e8980f7d.jfif" 
onclick="openModal('public/420ffe29-3395-495b-8965-98f4e8980f7d.jfif')" alt="Image 2">
    </div>


<%--         <div class="gallery-item">
      <img 
src="public/9a6e68da-eafd-496c-83ec-042ad9088016.jfif" 
onclick="openModal('public/9a6e68da-eafd-496c-83ec-042ad9088016.jfif')" alt="Image 8">
    </div>--%>
  </div>
    <div id="myModal" class="modal">
    <span class="close" onclick="closeModal()">&times;</span>
    <img class="modal-content" id="modalImage">
  </div>
          </div>
    <script src="script.js"></script>

    <script>
function openModal(imageSrc) {
  var modal = document.getElementById("myModal");
  var modalImg = document.getElementById("modalImage");
  modal.style.display = "block";
  modalImg.src = imageSrc;
}

function closeModal() {
  var modal = document.getElementById("myModal");
  modal.style.display = "none";
}
        </script>
</asp:Content>

