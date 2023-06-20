<?php
include_once("connection.php");
?>  
<div class="slider-area">
  <img src="img/h20.jpg" width="100%">
  <!-- <img src="https://lzd-img-global.slatic.net/g/p/40616ff1f04e66062496e37441658684.jpg_1200x1200q80.jpg_.webp" width="600" height="150"> -->
</div>
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title"> Product </h2>
                        <div class="product-carousel">
                            
                       
                           <?php
						  
		  				   	$result = mysqli_query($conn, "SELECT * FROM product" );
			
			                if (!$result) { //add this check.
                                die('Invalid query: ' . mysqli_error($conn));
                            }
		
			            
			                while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
				            ?>
				            <!--A product -->
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="product-imgs/<?php echo $row['Pro_image']?>" width="150" height="150">
                                    
                                </div>
                                
                                <h2><a href="?page=quanly_chitietsanpham&ma=<?php echo  $row['Product_ID']?>"><?php echo  $row['Product_Name']?></a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins><?php echo  $row['Price']?>
                                </div> 
                            </div>
                                    
                <?php
				}
				?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    
   
                
    
    
   
    