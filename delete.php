<?php
session_start();
include 'koneksi.php'; 

if (!isset($_SESSION['id'])) { 
    header("Location: login.php"); 
    exit(); 
}

if (isset($_GET['id'])) { 
    $id_resep = $_GET['id']; 

    // 1. Ambil data resep dan id pemiliknya dulu untuk pengecekan keamanan
    $queryCek = "SELECT id, foto FROM resep WHERE id_resep = ?";
    $stmtCek = $koneksi->prepare($queryCek);
    $stmtCek->bind_param("i", $id_resep);
    $stmtCek->execute();
    $resultCek = $stmtCek->get_result();
    $dataResep = $resultCek->fetch_assoc();

    if ($dataResep) {
        
        // Boleh hapus JIKA yang login adalah Admin OR (yang login adalah User DAN id pemilik resep cocok)
        if ($_SESSION['ROLE'] == 'admin' || ($_SESSION['ROLE'] == 'user' && $dataResep['id'] == $_SESSION['id'])) {
            
            // Hapus file foto dari folder
            $path = "uploads/" . $dataResep['foto']; 
            if (file_exists($path)) { 
                unlink($path); 
            }

            // Jalankan query delete
            $query = "DELETE FROM resep WHERE id_resep = ?"; 
            $stmt = $koneksi->prepare($query); 
            $stmt->bind_param("i", $id_resep); 

            if ($stmt->execute()) { 
                echo "<script>alert('Resep berhasil dihapus!'); window.location='index.php';</script>"; 
            } else {
                echo "Gagal menghapus resep!"; 
            }
        } else {
            // Jika user coba-coba hapus resep orang lain lewat ketik URL langsung
            echo "<script>alert('Anda tidak memiliki akses untuk menghapus resep ini!'); window.location='index.php';</script>";
        }
    }
}
?>