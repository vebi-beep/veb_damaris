<?php 
include'koneksi.php';

$Username = $_POST['username'];
$Password = md5($_POST['password']);
$Email = $_POST['email'];
$NamaLengkap =$_POST['namalengkap'];
$Alamat =$_POST['alamat'];

$sql = mysqli_query($koneksi, "INSERT INTO user VALUES('','$Username','$Password','$Email','$NamaLengkap','$Alamat')");

if ($sql) {
	echo "<script>
	alert('pendaftaran akun berhasil'); 
	location.href='../login.php';
	</script>";
}

?>