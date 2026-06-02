<?php
include 'auth.php';
include 'koneksi.php';

$keyword = isset($_GET['keyword']) ? trim($_GET['keyword']) : '';

// Membuat pola pencarian SQL (contoh: %soto%)
$search_pattern = "%" . $keyword . "%";

// Query SQL dengan Prepared Statement (Menggunakan database driver mysqli_stmt)
$query = "
SELECT DISTINCT resep.*, users.username
FROM resep
JOIN users ON resep.id = users.id
LEFT JOIN komentar ON resep.id_resep = komentar.id_resep
WHERE 
    resep.judul LIKE ? 
    OR resep.kategori_daerah LIKE ? 
    OR komentar.isi_komentar LIKE ?
ORDER BY resep.created_at DESC
";

$stmt = $koneksi->prepare($query);
// Bind parameter string ("sss" karena ada 3 tanda tanya)
$stmt->bind_param("sss", $search_pattern, $search_pattern, $search_pattern);
$stmt->execute();

$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Arapey:ital@0;1&family=Fredoka:wght@300..700&family=Hanken+Grotesk:ital,wght@0,100..900;1,100..900&family=Instrument+Serif:ital@0;1&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">

    <title>Cari-ResepKita</title>
</head>

<body class=" bg-center bg-repeat bg-[length:300px_auto]" style="background-image: url('assets/navbg.jpg')">

     <nav class="flex flex-wrap justify-between items-center z-100 w-full mx-auto shadow-xl py-5 px-8 border-b border-neutral-900 bg-repeat bg-[length:300px_auto]"
    style="background-image: url('./assets/navbg.jpg')">

    <!-- Dekorasi gambar tetap sama -->
    <img src="assets/mega1.png" alt="" class="absolute right-27 -top-6 w-17 h-12 scale-150 z-100">
    
    <img src="assets/mega3.png" alt="" class="absolute -left-3 -top-6 w-17 h-12 scale-160 z-100">
    

    <!-- Logo + Tombol Hamburger -->
    <div class="flex w-full justify-between items-center md:w-auto">
        <a href="index.php" class="font-bold font-[fredoka] text-3xl text-yellow-950">
            Resep Kita
        </a>

        <!-- Tombol hamburger, hanya tampil di mobile -->
        <button id="menu-toggle" class="md:hidden flex items-center text-yellow-950 focus:outline-none">
            <svg id="icon-open" xmlns="http://www.w3.org/2000/svg" class="h-7 w-7" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
            </svg>
            <svg id="icon-close" xmlns="http://www.w3.org/2000/svg" class="h-7 w-7 hidden" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
            </svg>
        </button>
    </div>

    <!-- Menu items — tersembunyi di mobile, tampil di desktop -->
    <div id="mobile-menu" class="hidden w-full md:flex md:w-auto md:items-center gap-7 mt-4 md:mt-0">

        <form action="search.php" method="GET" class="w-full md:w-80 relative">
            <input
                type="text"
                name="keyword"
                value="<?= htmlspecialchars($keyword); ?>"
                class="w-full bg-[#EFE6D5] placeholder:text-[#c5b598] text-[#c5b598] text-sm border border-[#c5b598] rounded-md pl-3 pr-20 py-2 transition duration-300 ease focus:outline-none focus:border-slate-400 hover:border-slate-300 shadow-sm focus:shadow"
                placeholder="Jawa, Pecel, Nikmat..." />

            <button type="submit"
                class="absolute top-1 right-1 flex items-center rounded bg-orange-900 py-1 px-2.5 border border-transparent text-center text-sm text-white transition-all shadow-sm hover:shadow focus:bg-slate-700 focus:shadow-none active:bg-slate-700 hover:bg-slate-700 active:shadow-none cursor-pointer">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-4 h-4 mr-1">
                    <path fill-rule="evenodd" d="M10.5 3.75a6.75 6.75 0 1 0 0 13.5 6.75 6.75 0 0 0 0-13.5ZM2.25 10.5a8.25 8.25 0 1 1 14.59 5.28l4.69 4.69a.75.75 0 1 1-1.06 1.06l-4.69-4.69A8.25 8.25 0 0 1 2.25 10.5Z" clip-rule="evenodd" />
                </svg> Cari
            </button>
        </form>

        <span class="font-[Fredoka] text-sm text-yellow-950 whitespace-nowrap">
            Halo, <?= htmlspecialchars($_SESSION['username']); ?>
        </span>

        <a href="logout.php" class="block text-center bg-orange-900 text-white px-4 py-2 rounded-full hover:scale-110 hover:bg-yellow-900 font-[Merryweather] duration-300">
            Logout
        </a>
    </div>
</nav>

<!-- Script toggle hamburger -->
<script>
    const toggle = document.getElementById('menu-toggle');
    const menu = document.getElementById('mobile-menu');
    const iconOpen = document.getElementById('icon-open');
    const iconClose = document.getElementById('icon-close');

    toggle.addEventListener('click', () => {
        menu.classList.toggle('hidden');
        iconOpen.classList.toggle('hidden');
        iconClose.classList.toggle('hidden');
    });
</script>

    <div class="pt-9"></div>

    <section class=" mt-5 px-10 py-6 bg-[#EFE6D5] mb-4 border-2 border-[#c5b598]">
        <h1 class="text-3xl font-bold text-yellow-950 font-[Playfair-Display]">
            Cari Resep
        </h1>
        <p class="text-gray-500 mt-2 font-[Fredoka]">
            Cari resep yang sesuai dengan keinginan anda.
        </p>
    </section>

    <section class="mx-10 mb-10 bg-[#EFE6D5] shadow-2xl rounded-2xl border-2 border-[#c5b598] p-6">
        <h1 class="text-3xl font-[playfair-display] font-bold mb-8 text-yellow-950">
            <?= ($keyword != '') ? "Hasil Pencarian: '" . htmlspecialchars($keyword) . "'" : "Hasil Pencarian"; ?>
        </h1>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

            <?php if (mysqli_num_rows($result) > 0) : ?>
                <?php while ($data = mysqli_fetch_assoc($result)) : ?>

                    <div class="border-2 border-[#c5b598] bg-white rounded-xl shadow-md overflow-hidden hover:shadow-xl transition flex flex-col justify-between" style="background-image: url('assets/card.png')">
                        <div>
                            <img
                                src="uploads/<?= $data['foto']; ?>"
                                alt="<?= $data['judul']; ?>"
                                class="w-full h-52 object-cover">

                            <div class="p-5">
                                <h2 class="text-xl font-[fredoka] font-bold text-yellow-950 mb-2">
                                    <?= htmlspecialchars($data['judul']); ?>
                                </h2>

                                <div class="flex items-center gap-2 text-gray-500 font-[fredoka] text-sm mb-2">
                                    <span>Oleh :</span>
                                    <img src="./assets/profil.png" alt="Profil" class="w-4 h-4 object-contain">
                                    <span class="font-semibold"><?= htmlspecialchars($data['username']); ?></span>
                                </div>

                                <div class="flex items-center gap-2 text-gray-500 font-[fredoka] text-sm mb-4">
                                    <span>Kategori :</span>
                                    <span class="bg-yellow-100 text-yellow-950 px-2 py-1 rounded-full">
                                        <?= htmlspecialchars($data['kategori_daerah']); ?>
                                    </span>
                                </div>

                            </div>
                        </div>

                        <!-- Bagian Aksi Card Tombol -->
                        <div class="p-5 pt-0 flex flex-wrap gap-2">
                            <a href="detail.php?id=<?= $data['id_resep']; ?>"
                                class="w-full text-center font-[fredoka] bg-yellow-950 hover:bg-yellow-800 text-white px-3 py-2 rounded text-sm transition">
                                Lihat Resep
                            </a>

                        </div>
                    </div>

                <?php endwhile; ?>
            <?php else : ?>
                <div class="col-span-1 md:col-span-2 lg:col-span-3 text-center py-12">
                    <p class="text-gray-500 font-[fredoka] text-lg">Maaf, resep dengan kata kunci tersebut tidak ditemukan.</p>
                </div>
            <?php endif; ?>

        </div>

        <div class="flex items-center mt-4 font-[Fredoka] gap-3">
            <a href="index.php"
                class="bg-red-700 text-white px-4 py-2 rounded hover:scale-110 hover:bg-red-900 font-[Merryweather] duration-300">
                Kembali
            </a>
        </div>
    </section>

</body>

</html>