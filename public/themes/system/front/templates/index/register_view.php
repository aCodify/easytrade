

	<?php if ( ! empty( $success ) ): ?>
	
	    <div class="alert alert-success">
			<?php echo $success ?>
	    </div>
		
	<?php endif ?>

<?php echo form_open('', ''); ?>
<div id="over_set" >
	<h4>Shop Detail</h4>	
	<span>ชื่อ</span> <input name="name" type="text"> <br>
	<span>นามสกุล</span> <input name="surname" type="text"> <br>
	<span>ที่อยู่ร้านค้า</span> <input name="store_address" type="text"> <br>
	<span>จังหวัด</span> <input name="province" type="text"> <br>
	<span>รหัสไปรษณีย์</span> <input name="postal code" type="text"> <br>
	<span>ชื่อร้านค้า</span> <input name="name_shop" type="text"> <br>
	<span>ประเภทร้านค้า</span>
	<select name="category" >
		<option value="0">กรุณาเลือก ประเภท</option>
		<option value="1">เสื้อผ้า</option>
		<option value="2">กางเอง</option>
		<option value="3">หมวก</option>
	</select>
	<hr>
	<h4>Username & Password</h4>

	<span>ชื่อผูใช้</span> <input name="username" type="text"> <br>
	<span>อีเมล์</span> <input name="email" type="text"> <br>
	<span>รูปภาพ</span> <input name="image" type="text"> <br>
	<span>รหัสผ่าน</span> <input name="password" type="text"> <br>
	<span>ยืนยันรหัสผ่าน</span> <input name="" type="text"> <br>

	<span></span><button type="" class="btn">บันทึก</button>
</div>
<?php echo form_close(); ?>