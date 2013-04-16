<div><span> <input type="text" id="traziPro"> </span><span class="klik" onClick='ajaxGET("id=<?php echo $data['id'];?>&trazi=opis:"+document.getElementById("traziPro").value,"levi_div");'> Trazi </span></div>
		<?php 
			//print_r($data);
			foreach ($data["sadrzaj"] as $proizvod)
			{
		?>
			
			
			<div class="new_prod_box">
				<a href="#" onClick='ajaxGET("id=<?php echo $data['id'];?>&trazi=id:<?php echo $proizvod['id'];?>","levi_div");' class='hover klik' >
					<?php echo strtolower($proizvod['naziv']); ?>
				</a>
				<div class="new_prod_bg">
					<span class="new_icon"><img src="pub/images/new_icon.gif" alt="" title="" /></span>
					<a href="pub/images/v/<?php echo $proizvod['slika']; ?>" rel="lightbox">
						<img src="pub/images/m/<?php echo $proizvod['slika']; ?>" alt="" title="" class="thumb" border="0" />
					</a>
					<a href="#" onClick="korpa(this);"><?php echo $proizvod['cena']." RSD"; ?></a>
				</div>           
            </div>

		<?php
			
			}
		
			
		?>
		    <div class="pagination">
            <span class="disabled"><<</span><span class="current">1</span><a href="#" class="klik" onClick='ajaxGET("id=<?php echo $data['id'];?>&s=2,"levi_div"); return false;'>2</a><a href="#?page=2">>></a>
            </div>  