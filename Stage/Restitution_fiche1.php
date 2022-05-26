<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<head>
    <meta charset="UFT-8">
    <link rel="stylesheet" href="Style.css">
    <style>
        table,td,th{
            padding:1px;
            border-radius:1px;
            text-align:center;
        }
    </style>
    <?php 
    extract ($_POST);
    extract ($_GET);
    //var_dump($_POST);
   // var_dump($_GET);
    include ('connectDB.php');?>
</head>
<body>
<h2 style="color: SlateBlue;"><center>Fiche de Restitution/Reception</center></h2>
    <h2 style="color: #2F4F4F;">Information Agent</h2>
    <br>
    <form action="Action.php" method="post">
    <?php
        $sql = "SELECT * FROM agent ";?>
        

    <?php
        if($result = mysqli_query($link, $sql)) {

            
            $taille = mysqli_num_rows($result);

           if($taille > 0){ ?>

        <label for="User"><h3 style="color: #2F4F4F;">saisir N°Agent:</label>
        <input list="UserList" name="User" <?php if (empty($User)) {echo ' required '; } ?> style="background-color:#F0F8FF; border:2px solid #F0F8FF;">
            <datalist id="UserList"> 
    <?php for ($i=0; $i < $taille; $i++)
            {
                mysqli_data_seek($result,$i);
                $row = mysqli_fetch_assoc($result);
                echo '<option value="'. $row['NumAgent'].'">'.$row['NomAgent'].' '. $row['PrenomAgent'].'</option>' ;
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
    

   
  <input type="submit" name="SearchAgent">
  <?php
  if (isset($User)){

  $sql = "SELECT NumAgent, PrenomAgent, NomAgent, LibelleService, LibelleDirection,LibelleFonction
  FROM agent
  INNER JOIN service ON agent.NumServiceAgent = service.NumService 
  INNER JOIN direction ON direction.NumDirection = service.NumDirectionService
  INNER JOIN fonction ON agent.NumFonctionAgent=fonction.NumFonction
  WHERE NumAgent =" .$User;
 

$result = mysqli_query($link, $sql) or die (mysqli_error($link)) ;

$row = mysqli_fetch_assoc($result);

}
?>

    <h3 style="color: #2F4F4F;">Nom :</h3>
   <?php echo '<input type="text" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" value="'; if (isset($User)){
       echo $row['NomAgent'];} else {echo ' ';} echo '" readonly>'; ?>
        <div class="first">
          <h3 style="color: #2F4F4F;">Prénom :</h3>
   <?php echo '<input type="text" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" value="'; if (isset($User)){
       echo $row['PrenomAgent'];} else {echo ' ';} echo '"readonly>'; ?>
    </div>
    <h3 style="color: #2F4F4F;">Fonction :</h3>
    <?php echo '<input type="text" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" value="'; if (isset($User)){
       echo $row['LibelleFonction'];} else {echo ' ';} echo '"readonly>'; ?>
    <h3 style="color: #2F4F4F;">Service :</h3>
    <?php echo '<input type="text" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" value="'; if (isset($User)){
       echo $row['LibelleService'];} else {echo ' ';} echo '"readonly>'; ?>
      <div class= "second">
          <h3 style="color: #2F4F4F;">Direction :</h3>
          <?php echo '<input type="text" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" value="'; if (isset($User)){
       echo $row['LibelleDirection'];} else {echo ' ';} echo '"readonly>'; ?>
    </div>
    <?php echo '<input type="text" hidden style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" name="NumAgent" value="'; if (isset($User)){
       echo $row['NumAgent'];} else {echo ' ';} echo '" readonly>'; ?>
    <table style="width: 450px; border:2px solid #000000;">
        <th style="align-center;">
            <h3>Date de Restitution/reception</h3>
        </th>
        <tr>
            <td>Date restitution :
                <br>
            <input type="date" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" name= "daterestitution" value="" <?php if (empty($User)){echo ' disabled';} else {echo ' required'; } ?>></td>
            <td>Date Réception :
                <br>
            <input type="date" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" name= "datereception" value="" <?php if (empty($User)){echo ' disabled';}?> ></td>
        </tr>
    </table>
    <center><font size="10pt"><input type="button" value="retour" name="retour" onclick="Javascript:window.document.location.href='Restitution_liste.php';" >
                              <input type="submit" value="enregistrer" style="background-color:#F0F8FF;" name="enregistrer" <?php if (empty($User)){echo ' disabled';}?>></font>  
    </form>
    </body>
    </html>
    
