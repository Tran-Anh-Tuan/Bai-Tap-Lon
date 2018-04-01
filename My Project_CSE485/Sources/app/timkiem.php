<?php
									$trang = (int)$_GET['trang'];
									if($trang == "")
									{
										$trang = 0;
									}
									else
										{
											$trang = $trang - 1;
										}
										//phan trang	            
										$sodu_lieu = mysql_query("SELECT id FROM temp where tentruyen like '%$s2%' or tentruyen like '%$s3%' or tacgia like '%$s2%' or tacgia like '%$s3%'") or die(mysql_error());
										$sodu_lieu = mysql_num_rows($sodu_lieu);
										$baitren_mottrang = 36;
										$sotrang = ceil($sodu_lieu/$baitren_mottrang);
										$dau = $trang*$baitren_mottrang;
										$cuoi = $baitren_mottrang;
										
										$sql2 = mysql_query("SELECT tentruyen,thumb,url,id,tacgia FROM temp where tentruyen like '%$s2%' or tentruyen like '%$s3%' or tacgia like '%$s2%' or tacgia like '%$s3%' order by id DESC limit $dau,$cuoi");
										while($qsql2 = mysql_fetch_array($sql2))
										{
											$idtruyen = $qsql2['id'];
											$tentruyen = $qsql2['tentruyen'];
											$tentruyenurl = chuyenurl($tentruyen);
											$thumb = $qsql2['thumb'];
											$thumb = encode($thumb);
											$thumb = "images.php?hash=$thumb";	
	                                    	echo '
											        <div class="col-sm-6 col-md-2">
											        	<a href="Doc-Truyen-'.$tentruyenurl.'-'.$idtruyen.'/">
											            <div class="img-wrap">
											                <img class="lazy" data-original="'.$thumb.'" alt="'.$tentruyen.'">
											                <div class="caption">
											                    <h6 style="text-align: center; ">'.$tentruyen.'</h6>
											                </div>
											            </div>
											            </a>
											        </div>
											  		';
                                    
										}
									?>