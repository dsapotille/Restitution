<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<head>
    <meta charset="UFT-8">
    <?php include ('connectDB.php'); ?>
</head>
<body>
    <h2 style="color: #2F4F4F;">Information Agent</h2>
    <br>
  
  <?php
        $sql = "SELECT * FROM agent ";?>
        
    <?php
        if($result = mysqli_query($link, $sql)) {

            
            $taille = mysqli_num_rows($result);

           if($taille > 0){ ?>

        <label for="User"><h3 style="color: #2F4F4F;">saisir N°Agent:</label>
        <input list="UserList" name="User"  style="background-color:#F0F8FF; border:2px solid #F0F8FF;">
            <datalist id="UserList"> 
    <?php for ($i=0; $i < $taille; $i++)
            {
                mysqli_data_seek($result,$i);
                $row = mysqli_fetch_assoc($result);
                echo  $row['NumAgent'].'">'.$row['NomAgent'].' '. $row['PrenomAgent'];
                echo '<br>'
             }?>
             </datalist>
    <?php
                mysqli_free_result($result);
            }
            else{
                echo "something wont wrong...";
            }
        }
        else {
            "ERROR : Could not execute $sql." . mysqli_error($link);
        }
    ?>
    

   
  <input type="submit">

    </body>
    </html>