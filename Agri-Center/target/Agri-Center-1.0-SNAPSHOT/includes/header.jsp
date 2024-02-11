<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

<link
      href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
      rel="stylesheet"
    />
<link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,400;0,700;0,800;1,100;1,700;1,800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;1,300;1,400;1,700&family=Ubuntu:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&display=swap"
      rel="stylesheet"
    />
<style>
    .foo {
    background-color: rgba(24, 45, 43, 255);
  }
  .footer-nav {
    display: flex;
    justify-content: space-between;
    padding: 5px 100px;
  }
  .footer-navs {
    display: flex;
    margin-top: 10px;
    justify-content: space-between;
    padding: 20px 100px;
  }
  .footer-navs ul li {
    list-style-type: none;
    padding: 8px;
    cursor: pointer;
  }
  .footer-navs ul li a {
    text-decoration: none;
    color: white;
  }
  .footer-navs ul li:hover {
    color: #749075;
  }
  .footer-nav img {
    height: 70px;
  }
  .footer-nav .footer-icons {
    padding-top: 20px;
  }
  .footer-nav .footer-icons span i {
    font-size: 20px;
    background-color: #749075;
    border-radius: 50%;
    padding: 8px;
  }
  .all-footer {
    color: white;
  }
  .all-footer .line {
    width: 100%;
    height: 1px;
    background-color: #749075;
  }
  .all-footer .allRights {
    text-align: center;
    padding: 20px;
  }
  
body {
    color: white;
    /*font-weight: bold;*/
    background-color: rgba(24, 50, 47, 255);
  }

  
.header {
/*    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 80px;*/
    color: white;
    background-color: rgba(24, 50, 47, 255);
  }
  
  .row {
      color: black;
  }
  
  table th, td {
      color: black;
  }
  
  nav img {
    height: 70px;
  }
  
  .content .intro {
    color: white;
    position: absolute;
    margin-top: -600px;
    padding: 120px 0px 50px 100px;
    margin-bottom: 40px;
  }
  .background {
    background: black;
    opacity: 0.5;
    top: 67px;
    position: absolute;
    height: 593px;
    width: 100%;
  }
  .content .image-content {
    background-image: url(images/ground.jpeg);
    background-repeat: no-repeat;
    background-size: cover;
    width: 100%;
    /* height: 590px; */
    height: 660px;
    object-fit: cover;
    position: relative;
    animation: change 15s infinite ease-in-out;
  }
  @keyframes change {
    0% {
      background-image: url(images/ground.jpeg);
    }
    20% {
      background-image: url(images/seed1.webp);
    }
    40% {
      background-image: url(./images/fertilizers.jpeg);
    }
    60% {
      background-image: url(images/seed2.webp);
    }
    80% {
      background-image: url(images/seed1.webp);
    }
    100% {
      background-image: url(images/3.webp);
    }
  }
  @keyframes slide_Up {
    0% {
      transform: translateY(120px);
      opacity: 1;
    }
    100% {
      opacity: 1;
      transform: translateY(0);
    }
  }
  .content h1 {
    font-size: 60px;
    margin-bottom: 20px;
    font-weight: bold;
    animation: slide_Up 1.4s ease-in-out;
  }
  .inner {
    overflow: hidden;
     /*height: 2000px;*/ 
   
  }
  .content p {
    font-size: 20px;
    margin-bottom: 20px;
    animation: slide_Up 2.1s ease-in-out;
  }
  .content button {
    animation: slide_Up 2.4s ease-in-out;
  }
  button {
    padding: 15px 30px;
    border-radius: 30px;
    border: none;
    background: rgba(116, 144, 117, 255);
    color: white;
    font-size: 16px;
  }
  .product-details {
    background-color: rgba(24, 45, 43, 255);
    padding: 20px;
  }
  .prod {
    display: flex;
  }
  .home-products {
    background-color: white;
    border-radius: 5px;
    padding: 20px;
    height: 250px;
    margin: 20px;
    display: flex;
  }
  .home-products .product-image img {
    width: 250px;
    height: 230px;
  }
  .home-products .product-description {
    padding: 5px 0 0 20px;
  }
  .home-products .product-description h3 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
  }
  .home-products .product-description p {
    margin-bottom: 20px;
    font-size: 14px;
  }
  .home-products .product-description .money {
    font-weight: bold;
    font-size: 20px;
    color: rgba(116, 144, 117, 255);
  }
  .home-products .product-description button {
    border-radius: 5px;
    margin-top: 20px;
    padding: 0px 65px;
  }
  .home-products .product-description span i {
    text-align: center;
    font-size: 40px;
  }
  .product-details .prod-btn {
    text-align: center;
    margin-left: 600px;
  }
  .testmonial-details h1 {
    text-align: center;
    margin: 30px 0px;
    color: rgba(116, 144, 117, 255);
  }
  .testmonial-details .testmonials {
    background-color: rgba(24, 45, 43, 255);
    display: flex;
    gap: 70px;
    padding: 40px 90px;
    color: white;
  }
  
  .testmonial-details .testmonials .testmonial h3 {
    font-size: 14px;
    margin-bottom: 20px;
  }
  .testmonial-details .testmonials .testmonial p {
    font-weight: bold;
    font-size: 30px;
    margin-bottom: 40px;
  }
  .testmonial-details .testmonials .testmonial button {
    padding: 0px;
  }
  .testmonial-details .testmonials .testmonial button span i {
    background-color: #749075;
    border-radius: 100%;
    padding: 10px;
    font-size: 30px;
  }
  .card-image {
    position: relative;
    height: 150px;
    width: 150px;
    border-radius: 50%;
    display: flex;
    gap: 30px;
  }
  .card-image img {
    border-radius: 50%;
    height: 100%;
    width: 100%;
    object-fit: cover;
  }
  .testmonial-details {
    overflow: hidden;
  }
  .cards-container {
    display: flex;
    gap: 20px;
    padding-left: 20px;
    /* justify-content: space-around; */
    transition: transform 0.5s ease-in-out;
    width: 1900px;
    /* background-color: red; */
  }
  .slide-container {
    /* background-color: purple; */
    overflow: hidden;
  }
  .card {
    /* flex: 0 0 calc(95% / 2); */
    width: 420px;
    border-radius: 25px;
    background-color: #749075;
    box-sizing: border-box;
    padding: 10px;
    text-align: center;
  }
  .par-content,
  .card-image {
    padding: 10px 14px;
    display: flex;
    align-items: center;
  }
  .par-content p {
    font-size: 16px;
    text-align: center;
  }
  .slide-content {
    max-width: 1120px;
    width: 100%;
    padding: 40px 0;
  }
  .notification-section {
    text-align: center;
  }
  .notification-section h1 {
    text-align: center;
    margin: 30px 0px;
    color: rgba(116, 144, 117, 255);
  }
  .notification-section .notification-data {
    background-color: rgba(24, 45, 43, 255);
    padding: 40px 0;
    color: white;
    font-style: italic;
    font-weight: bold;
    font-size: 16px;
    display: flex;
    justify-content: space-around;
  }
  .notification-section .notification-data button a {
    text-decoration: none;
    color: white;
  }
  .team-page h1 {
    text-align: center;
    margin: 30px 0px;
    color: rgba(116, 144, 117, 255);
  }
  .team-page {
    width: 100%;
    height: 80vh;
  }
  .team-page .team-box {
    width: 95%;
    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    margin-top: 100px;
  }
  .team-page .team-box .profile {
    color: white;
    width: 310px;
    height: 290px;
    border-radius: 50%;
    margin: 0 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    box-shadow: 0 0 8px rgba(116, 144, 117, 255);
    transition: 0.4s;
  }
  .team-page .team-box .profile:hover {
    border-radius: 20px;
    height: 320px;
  }
  .team-page .team-box .profile img {
    width: 250px;
    height: 250px;
    object-fit: cover;
    transform: scale(1.05);
    object-position: center;
    border-radius: 50%;
    cursor: pointer;
    box-shadow: 0 0 8px rgba(116, 144, 117, 255);
    z-index: 2;
    transition: 0.4s;
  }
  .team-page .team-box .profile:hover img {
    border-radius: 20px;
    margin-top: -230px;
  }
  .team-page .team-box .profile .team-info {
    position: absolute;
    text-align: center;
    top: 60%;
    transition: 0.4s;
  }
  .team-page .team-box .profile .team-info .name {
    margin-bottom: 15px;
  }
  .team-page .team-box .profile .team-info .bio {
    width: 70%;
    text-align: center;
    margin: 0 auto 10px auto;
  }
  
  .hidden {
    opacity: 0;
    filter: blur(5px);
    transform: translateX(-20%);
    transition: all 1s;
  }
  .show {
    opacity: 1;
    filter: blur(0);
    transform: translateX(0);
  }
  @media (prefers-reduced-motion) {
    .hidden {
      transition: none;
    }
  }
  
  .recent {
    margin: 100px 30px 30px 30px;
  }
  .recent h1 {
    text-align: center;
    color: #749075;
    margin-bottom: 40px;
  }
  .announceOne {
    display: flex;
    gap: 30px;
    background-color: rgba(24, 45, 43, 255);
    border-radius: 5px;
    height: 300px;
    margin: 30px 120px;
  }
  .announceOne .onnounceOne-image img {
    width: 300px;
    height: 300px;
    border-radius: 5px 0 0 5px;
  }
  .announceOne .announceOne-info {
    padding: 30px 50px;
    color: white;
  }
  .announceOne .announceOne-info h4 {
    font-style: italic;
    margin-bottom: 20px;
    font-size: 14px;
  }
  .announceOne .announceOne-info h2 {
    color: #749075;
    margin-bottom: 20px;
  }
  
</style>