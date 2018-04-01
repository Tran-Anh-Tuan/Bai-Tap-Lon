<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
<form method="POST" action="dangnhap.php">
	<fieldset>
	    <legend>Đăng nhập</legend>
	    	<table>
	    		<tr>
	    			<td>Username</td>
	    			<td><input type="text" name="username" size="30"></td>
	    		</tr>
	    		<tr>
	    			<td>Password</td>
	    			<td><input type="password" name="password" size="30"></td>
	    		</tr>
	    		<tr>
	    			<td colspan="2" align="center"> <input type="submit" name="btn_submit" value="Đăng nhập"></td>
	    		</tr>
	    	</table>
    </fieldset>
</form>
	<?php 
//conect csld
$link = new mysqli('localhost', 'root', '' ,'btl-web') or die("Không thể kết nối CSDL");
	// Kiểm tra nếu người dùng đã ân nút đăng nhập thì mới xử lý
if (isset($_POST["btn_submit"])) {
	// lấy thông tin người dùng
	$username = $_POST["username"];
	$password = $_POST["password"];
	
	
	

	if ($username == "" || $password =="") {
		echo "Username hoặc password bạn không được để trống!";
	}else{
		$sql = "select * from user where username = '$username' and password = '$password' ";
		$query = mysqli_query($link,$sql);
		$num_rows = mysqli_num_rows($query);
		if ($num_rows==0) {
			echo "Tên đăng nhập hoặc mật khẩu không đúng !";
		}else{
			// Lấy ra thông tin người dùng và lưu vào session
			while ( $data = mysqli_fetch_array($query) ) {
	    		$_SESSION["user_id"] = $data["id"];
				$_SESSION['username'] = $data["username"];
				$_SESSION["email"] = $data["email"];
				$_SESSION["fullname"] = $data["fullname"];
				$_SESSION["is_block"] = $data["is_block"];
				$_SESSION["permision"] = $data["permision"];
	    	}
			
                // Thực thi hành động sau khi lưu thông tin vào session
                // ở đây mình tiến hành chuyển hướng trang web tới một trang gọi là index.php
			header('Location: index.php');
		}
	}
}
?>

</body>
</html>