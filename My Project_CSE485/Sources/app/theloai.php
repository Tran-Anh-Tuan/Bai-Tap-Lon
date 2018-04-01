<?php
                        
						$sql = mysql_query("SELECT * FROM dstheloai");
						while($qsql = mysql_fetch_array($sql))
						{
						$idtheloaimenu = $qsql['id'];
						$tentheloaimenu = $qsql['ten'];
						$tenurlmenu = $qsql['tenurl'];
                        
                        
                        ?>
                        <li class="nav-item  ">
                            <a href="/the-loai/<?php echo $tenurlmenu;?>.html" title="Thể loại <?php echo $tentheloaimenu;?>" class="nav-link nav-toggle">
                                <i class="icon-tag"></i>
                                <span class="title"><?php echo $tentheloaimenu;?></span>
                            </a>
                        </li>
                        <?php
						}
						
						?>