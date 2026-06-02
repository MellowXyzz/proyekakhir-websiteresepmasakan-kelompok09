<?php
include 'auth.php';
include 'koneksi.php';

$query = "
SELECT resep.*, users.username, resep.id AS id_pemilik
FROM resep
JOIN users ON resep.id = users.id
ORDER BY resep.created_at DESC
";

$result = mysqli_query($koneksi, $query);
?>

<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Index-ResepKita</title>
  <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@300..700&family=Merriweather:ital,opsz,wght@0,18..144,300..900;1,18..144,300..900&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
</head>

<body class=" bg-[length:300px_auto] bg-center bg-repeat bg-fixed" style="background-image: url('assets/card.png')">
  
    <nav
    class="hidden lg:flex justify-between fixed z-100 w-full mx-auto rounded- shadow-xl py-5 px-8 border-b-2 border-[#c5b598] bg-repeat bg-[length:300px_auto]"
    style="background-image: url('assets/navbg.jpg')">
    <img src="assets/mega1.png" alt="" class=" absolute right-44 -top-9 w-21 h-15 scale-150 z-100">
    <img src="assets/mega1.png" alt="" class="absolute left-44 top-13 w-21 h-15 scale-150 z-100">
    <img src="assets/mega3.png" alt="" class="absolute -left-2 -top-12 w-21 h-15 scale-160 z-100">
    <img src="assets/mega2.png" alt="" class="absolute -right-8 top-15 w-21 h-15 scale-130 z-100">
  <!-- Div Logo -->
  <div class="w-70">
          <a href="index.php"
            class="font-bold font-[fredoka] text-3xl text-yellow-950">

            Resep Kita

          </a>
        </div>
        <!-- start div menu -->
<div class= "w-160 flex justify-evenly items-center font-[Merryweather] text-xl">
  <a href="index.php"
          class="font-bold text-yellow-950 hover:text-yellow-700 transition">
          Beranda
        </a>

        <a href="create.php"
          class="font-bold text-yellow-950 hover:text-yellow-700 transition">
          Tambah Resep
        </a>

       
</div>
      <!-- start Div navigasi -->
    <div class="w-90 flex items-center justify-end-safe gap-10 font">


         <a href="search.php"
          class="font-bold text-yellow-950 hover:text-yellow-700 transition">
          <svg xmlns="http://www.w3.org/2000/svg" class="size-6">
                <path fill-rule="evenodd" d="M10.5 3.75a6.75 6.75 0 1 0 0 13.5 6.75 6.75 0 0 0 0-13.5ZM2.25 10.5a8.25 8.25 0 1 1 14.59 5.28l4.69 4.69a.75.75 0 1 1-1.06 1.06l-4.69-4.69A8.25 8.25 0 0 1 2.25 10.5Z" clip-rule="evenodd" />
        </svg>
        </a>
          <span class="font-[Merryweather] text-lg text-yellow-950">
            Halo,
            <?= htmlspecialchars($_SESSION['username']); ?>
          </span>
          <a href="logout.php" class=" bg-orange-900 text-white px-4 py-2 rounded-full hover:scale-110 hover:bg-yellow-900 font-[Merryweather] duration-300">

            Logout
          </a>
    </div>
  </nav>
<!-- Side bar -->

    <nav class=" flex lg:hidden fixed z-100 gap-3 w-full mx-auto rounded- shadow-xl py-5 px-3 border-b-2 border-[#c5b598] bg-repeat bg-[length:300px_auto]" style="background-image: url('assets/navbg.jpg')">
     <button  onclick="toggleSidebar()" ><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-7 mt-2">
  <path  d="M3 6.75A.75.75 0 0 1 3.75 6h16.5a.75.75 0 0 1 0 1.5H3.75A.75.75 0 0 1 3 6.75ZM3 12a.75.75 0 0 1 .75-.75h16.5a.75.75 0 0 1 0 1.5H3.75A.75.75 0 0 1 3 12Zm0 5.25a.75.75 0 0 1 .75-.75h16.5a.75.75 0 0 1 0 1.5H3.75a.75.75 0 0 1-.75-.75Z" clip-rule="evenodd" />
</svg></button>
    <a href="index.php"
            class="font-bold font-[fredoka] text-3xl text-yellow-950">

            Resep Kita

          </a>

 </nav>
<aside class=" z-99 h-screen w-60 lg:hidden
 fixed bg-[#EFE6D5] border-r-2 border-[#c5b598] -translate-x-full
transition-transform
duration-300" id="sidebar">

 <div class="pt-19 px-9 font-[Merryweather] text-xl ">

        <ul class="mt-5 space-y-3">
            <li ><a href="index.php">Home</a></li>
            <li ><a href="create.php">Tambah resep</a> </li>
            <li><a href="search.php">Cari resep</a> </li>
        </ul>
        
    </div>
<div class="absolute bottom-5 left-1/2 -translate-x-1/2 w-[80%]">
    <a href="logout.php" class="font-[Merryweather] block text-center bg-orange-900 text-white px-4 py-2 rounded-full hover:scale-110 hover:bg-yellow-900 duration-300"> Logout
    </a>
</div>
</aside>
  <!-- POSTER istilahnya -->

  <div class="min-h-screen w-full overflow-hidden relative"
    style="background-image: url('assets/card.png')">

    <!--sembunyikan di mobile agar tidak nabrak -->
    <img src="assets/wayang.png" alt="" 
         class="hidden lg:block absolute -left-9 top-80 w-21 h-32 scale-340 rotate-7">
    <img src="assets/pawayangan.png" alt="" 
         class="hidden lg:block absolute -right-2 top-90 w-21 h-45 scale-250 -rotate-10 overflow-hidden">

    <section class="w-full min-h-screen flex flex-col lg:flex-row items-center justify-center px-6 lg:px-10 py-16 lg:py-0 gap-10 lg:gap-0">
        <div class="max-w-7xl w-full flex flex-col lg:flex-row items-center">

            <!-- Teks kiri -->
            <div class="w-full lg:w-[35%] text-center lg:text-left px-4 lg:px-0">
                <h1 class="text-[48px] md:text-[64px] lg:text-[80px] font-black font-[Merryweather] uppercase text-black tracking-tight leading-tight">
                    Nikmati
                    <span class="block lg:pl-7">Cita Rasa</span>
                    <span class="text-yellow-700 italic">Nusantara</span>
                </h1>
                <p class="mt-6 text-lg lg:text-xl text-black font-[fredoka] leading-relaxed">
                    Temukan berbagai resep masakan Indonesia yang lezat, mudah dibuat,
                    dan cocok untuk hidangan keluarga setiap hari.
                </p>

                <button class="mt-8 outline outline-3 outline-yellow-700 text-yellow-900 px-8 lg:px-10 py-3 lg:py-4 rounded-full text-lg hover:scale-105 hover:bg-yellow-700 hover:text-white font-[fredoka] duration-300">
                    <a href="search.php">LIHAT RESEP</a>
                </button>
            </div>

            <!-- Gambar kanan -->
            <figure class="w-full lg:w-[65%] h-[300px] md:h-[420px] lg:h-[550px] overflow-hidden rounded-[24px] lg:rounded-[40px] mt-10 lg:mt-0 lg:ml-20 hover-gallery">
                <img src="assets/makanan1.jpg" alt="Makanan1" class="w-full h-full object-cover">
                <img src="assets/makanan3.jpg" alt="makanan3">
                <img src="assets/makanan4.jpg" alt="makanan4">
            </figure>

        </div>
    </section>
</div>

<div class="mt-4 rounded px-10 py-6 bg-[#EFE6D5] border-2 border-[#c5b598]">
 <h1 class="text-4xl  font-[Merryweather] font-bold text-yellow-950 text-center uppercase italic rounded-xl py-2">
      Resep Terbaru
    </h1>
    <p class="text-gray-500 mt-2 font-[Fredoka] text-center">
            Temukan resep pilihan anda
        </p>
    </div>

    
  <section class="min-h-screen shadow-xl mx-auto px-10 w-full py-12 bg-repeat bg-[length:300px_auto]" style="background-image: url('assets/navbg.jpg')">

   
    
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

      <?php while ($data = mysqli_fetch_assoc($result)) : ?>
        <div class="border-2 border-[#c5b598] bg-white rounded-xl shadow-md overflow-hidden hover:shadow-xl transition bg-bottom" style="background-image: url('assets/card.png')">
          <img src="uploads/<?= $data['foto']; ?>" alt="<?= $data['judul']; ?>" class="w-full h-52 object-cover">

          <div class="p-5">
            <h2 class="text-xl font-[fredoka] font-bold text-yellow-950 mb-2">
              <?= htmlspecialchars($data['judul']); ?> 
            </h2>

            <div class="flex items-center gap-2 text-gray-500 font-[fredoka] text-sm mb-2">
              <span>Oleh :</span>
              <img src="./assets/profil.png" alt="Profil" class="w-4 h-4 object-contain">
              <span class="font-semibold"><?= htmlspecialchars($data['username']); ?></span>
            </div>

            <div class="flex items-center gap-2 text-gray-500  font-[fredoka] text-sm mb-4">
              <span>Kategori :</span>
              <span class="bg-[#EFE6D5] border-2 border-[#c5b598] text-yellow-950 px-2 p-1 rounded-xl">
                <?= htmlspecialchars($data['kategori_daerah']); ?>
            </span>
            </div>

            <div class="flex flex-wrap gap-2">
              <a href="detail.php?id=<?= $data['id_resep']; ?>" class="inline-block font-[fredoka] bg-yellow-950 hover:bg-yellow-800 text-white px-4 py-2 rounded text-sm">
                Lihat Resep
              </a>

              <?php if ($_SESSION['ROLE'] == 'admin') : ?>
                <a href="delete.php?id=<?= $data['id_resep']; ?>" class="inline-block font-[fredoka] bg-orange-900 hover:bg-yellow-700 text-white px-4 py-2 rounded text-sm" onclick="return confirm('Hapus resep ini?')">
                  Hapus
                </a>
              <?php elseif ($_SESSION['ROLE'] == 'user' && $data['id_pemilik'] == $_SESSION['id']) : ?>
                <a href="update.php?id=<?= $data['id_resep']; ?>" class="inline-block font-[fredoka] bg-yellow-950 hover:bg-yellow-800 text-white px-4 py-2 rounded text-sm">
                  Edit
                </a>
                <a href="delete.php?id=<?= $data['id_resep']; ?>" class="inline-block font-[fredoka] bg-orange-900 hover:bg-yellow-700 text-white px-4 py-2 rounded text-sm" onclick="return confirm('Hapus resep ini?')">
                  Hapus
                </a>
              <?php endif; ?>
            </div>
          </div>
        </div>
      <?php endwhile; ?>

    </div>
  </section>

  <section class="w-full shadow-xl py-7 px-20 bg-[length:300px_auto]" style="background-image: url('assets/background.png')">
    <footer class="relative bg-[#2D1B12] rounded-xl overflow-hidden pb-10">
      <div class="absolute inset-0 bg-repeat bg-[length:300px_auto] opacity-10 z-0" style="background-image: url('assets/navbg.jpg')"></div>
      
      <div class="absolute -top-5 left-0 right-0 flex justify-center pt-6 z-10">
        <img class="w-30" src="assets/mega1.png" alt="hiasan">
      </div>
      
      <div class="grid grid-cols-1 md:grid-cols-3 mx-auto px-10 gap-10 pt-20 relative z-10">
        <div>
          <h1 class="font-[Merryweather] text-[#D4AF37] font-bold text-4xl">Resep Kita</h1>
          <p class="pt-3 text-amber-100/80">Temukan berbagai resep makanan Indonesia yang lezat, mudah dibuat, dan cocok untuk hidangan keluarga setiap hari</p>
        </div>
        
        <div>
          <h1 class="font-[Merryweather] text-[#D4AF37] font-bold text-2xl">Navigasi</h1>
          <div class="grid grid-cols-1 gap-1 pt-3">
            <a href="index.php" class="text-amber-100/80 hover:text-white">Beranda</a>
            <a href="create.php" class="text-amber-100/80 hover:text-white">Tambah Resep</a>
            <a href="kategori.php" class="text-amber-100/80 hover:text-white">Kategori</a>    
          </div>
        </div>
        
        <div>
          <h1 class="font-[Merryweather] text-[#D4AF37] font-bold text-2xl">Created By</h1>
          <div class="grid grid-cols-1 gap-1 pt-3">
            <p class="text-amber-100/80">@elopresilberfa_</p>
            <p class="text-amber-100/80">@revatanjani</p>    
          </div>
        </div>
      </div>

      <div class="w-full flex items-center justify-center gap-5 mt-10 relative z-10">
        <div class="w-32 h-[1px] bg-[#D4AF37]"></div>
        <img src="assets/mega2.png" class="w-20 opacity-70">
        <div class="w-32 h-[1px] bg-[#D4AF37]"></div>
      </div>
    </footer>
  </section>
<script src="assets/script.js"></script>
</body>
</html>