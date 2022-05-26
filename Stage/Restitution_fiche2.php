<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<head>
    <meta charset="UFT-8">
    <link rel="stylesheet" href="Style.css">
    <style>
        table,td,th{
            padding:1px;
            border-radius:5px;
            text-align:left;
        }
        
        table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #DDD;
}

tr:hover {background-color: #D6EEEE;}
    </style>
     <?php 
    extract ($_POST);
    extract ($_GET);
    include ('connectDB.php');?>
</head>
<body>
<h2 style="color: SlateBlue;"><center>Fiche de Restitution/Reception</center></h2>
    <h2 style="color: #2F4F4F;">Information Agent</h2>
    <br>
<form action="Action.php" method="post">
<?php
  if (isset($numrestitution)){

  $sql = "SELECT NumAgent, PrenomAgent, NomAgent, LibelleService, LibelleDirection,LibelleFonction,DateRestitution,DateReception
  FROM agent
  INNER JOIN service ON agent.NumServiceAgent = service.NumService 
  INNER JOIN direction ON direction.NumDirection = service.NumDirectionService
  INNER JOIN fonction ON agent.NumFonctionAgent=fonction.NumFonction
  INNER JOIN restitution ON restitution.NumAgentRestitution=agent.NumAgent
  WHERE NumRestitution  =" .$numrestitution;
  
  

    $result = mysqli_query($link, $sql) or die (mysqli_error($link)) ;
    $taille = mysqli_num_rows($result);
    if($taille > 0){ 

        $row = mysqli_fetch_assoc($result); ?>
        <h3 style="color: #2F4F4F;">Numéro agent :</h3>
        <?php echo '<input type="text" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" value="'; if (isset($numrestitution)){
            echo $row['NumAgent'];} else {echo ' ';} echo '" readonly>'; ?>
        <h3 style="color: #2F4F4F;">Nom :</h3>
        <?php echo '<input type="text" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" value="'; if (isset($numrestitution)){
            echo $row['NomAgent'];} else {echo ' ';} echo '" readonly>'; ?>
            <div class="first">
               <h3 style="color: #2F4F4F;">Prénom :</h3>
        <?php echo '<input type="text" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" value="'; if (isset($numrestitution)){
            echo $row['PrenomAgent'];} else {echo ' ';} echo '"readonly>'; ?>
        </div>
         <h3 style="color: #2F4F4F;">Fonction :</h3>
         <?php echo '<input type="text" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" value="'; if (isset($numrestitution)){
            echo $row['LibelleFonction'];} else {echo ' ';} echo '"readonly>'; ?>
         <h3 style="color: #2F4F4F;">Service :</h3>
         <?php echo '<input type="text" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" value="'; if (isset($numrestitution)){
            echo $row['LibelleService'];} else {echo ' ';} echo '"readonly>'; ?>
           <div class= "second">
               <h3 style="color: #2F4F4F;">Direction :</h3>
               <?php echo '<input type="text" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" value="'; if (isset($numrestitution)){
            echo $row['LibelleDirection'];} else {echo ' ';} echo '"readonly>'; ?>
         </div>
         <?php echo '<input type="text" hidden style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" name="NumAgent" value="'; if (isset($numrestitution)){
            echo $row['NumAgent'];} else {echo ' ';} echo '" readonly>'; ?>
         <table style="width: 450px; border:2px solid #000000;">
             <th style="align-center;">
                 <h3>Date de Restitution/reception</h3>
             </th>
             <tr>
                 <td>Date restitution :
                     <br>
                     <?php echo '<input type="date" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" name= "daterestitution" value="' ;  if (isset($numrestitution)){
            echo $row['DateRestitution'];} else {echo ' ';} echo '"'; ?>
            </td>
                 <td>Date Réception :
                     <br>
                     <?php echo '<input type="date" style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" name= "datereception" value="' ;  if (isset($numrestitution)){
            echo $row['DateReception'];} else {echo ' ';} echo '"'; ?>
            </td>
             </tr>
         </table>
<?php
         mysqli_free_result($result);
             }
    else{
            echo "something wont wrong...";
            }
    

}
?>

<font size="5pt"><h3>Indication du matériel</font>
    <br>
<table style="width: 100%; border:0px solid #000000;">
    <tr>
<?php   $sql2 = "SELECT * FROM `materiel`";
        $result2 = mysqli_query($link, $sql2) or die (mysqli_error($link)) ;
        $taille2 = mysqli_num_rows($result2);
?>
        <td style= "border:0px solid #F0F8FF; width: 100px;"><h5>Type matériel :
        <br>
        <select id="materiel" name="materiel" size="1"  style= "border:1px solid #000000; width: 250px;" required>
        <option value="materiel">--matériel--</option>
<?php   for ($i=0; $i < $taille2; $i++)
            {
                mysqli_data_seek($result2,$i);
                $row2 = mysqli_fetch_assoc($result2);
                echo '<option value="'. $row2['NumMateriel'].'">'.$row2['LibelleMateriel'].'</option>' ;
             }
?>
        </select></td>    

        <?php   $sql3 = "SELECT * FROM `modele`";
        $result3 = mysqli_query($link, $sql3) or die (mysqli_error($link)) ;
        $taille3 = mysqli_num_rows($result3);
?>
        <td style= "border:0px solid #F0F8FF; width: 100px;"><h5> modèle :
        <br>
        <select id="modele" name="modele" size="1"  style= "border:1px solid #000000; width: 250px;" required>
        <option value="modele">--modèle--</option>
<?php   for ($i=0; $i < $taille3; $i++)
            {
                mysqli_data_seek($result3,$i);
                $row3 = mysqli_fetch_assoc($result3);
                echo '<option value="'. $row3['NumModele'].'">'.$row3['LibelleModele'].'</option>' ;
             }
?>
        </select></td>
        <?php   $sql4 = "SELECT * FROM `constructeur`";
        $result4 = mysqli_query($link, $sql4) or die (mysqli_error($link)) ;
        $taille4 = mysqli_num_rows($result4);
?>
        <td style= "border:0px solid #F0F8FF; width: 100px;"><h5> Constructeur/Opérateur :
        <br>
        <select id="constructeur" name="constructeur" size="1"  style= "border:1px solid #000000; width: 250px;" required>
        <option value="constructeur">--constructeur--</option>
<?php   for ($i=0; $i < $taille4; $i++)
            {
                mysqli_data_seek($result4,$i);
                $row4 = mysqli_fetch_assoc($result4);
                echo '<option value="'. $row4['NumConstructeur'].'">'.$row4['LibelleConstructeur'].'</option>' ;
             }
?>
        </select></td>
    <tr>
        <br>
        <th style="border:0px solid#F0F8FF; width: 100px;"><h5>N°Série :
        <br>
        <input type="text" style="border:1px solid #000000; width: 250px;" name = "numserie" >
        <th style="border:0px solid#F0F8FF; width: 100px;"><h5>Observation(s) :
        <br>
        <textarea name="observation" rows="10" cols="30" ></textarea>
        <?php echo '<input type="text" hidden style="background-color:#F0F8FF; border:2px solid #F0F8FF; width: 450px;" name="numrestitution" value="'.$numrestitution.'"'; ?>

    </table>
    <center><font size="10pt"><input type="button" value="retour" name="retour" onclick="Javascript:window.document.location.href='Restitution_liste.php';" >
    <input type="submit" value="Ajouter Matériel" style="background-color:#6495ED; color:#F0F8FF" name = "ajoutermateriel">
    <br>
    <br>
    <style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #DDD;
}

tr:hover {background-color: #D6EEEE;}
</style>
<table id="listmateriel" style="width:100%">
  <tr class="Titre_M">
    <th>Type matériel</th>
    <th>Constructeur/Opérateur</th>
    <th>Modèles</th>
    <th>N°Séries</th>
    <th>Observation</th>
  <tr>
    <?php
        $sql = "SELECT LibelleMateriel , LibelleModele , LibelleConstructeur , NumSerie , Observation
        FROM lignematerielrestitution lmr
        INNER JOIN materiel ON lmr.NumMaterielLigne  = materiel.NumMateriel  
        INNER JOIN modele ON lmr.NumModeleLigne = modele.NumModele
        INNER JOIN constructeur ON lmr.NumConstructeurLigne  = constructeur.NumConstructeur
        WHERE NumRestitutionLigne =".$numrestitution;
        
        if($result = mysqli_query($link, $sql)) {

            
            $taille = mysqli_num_rows($result);

           if($taille > 0){


            for ($i=0; $i < $taille; $i++)
            {
                mysqli_data_seek($result,$i);
                $row = mysqli_fetch_assoc($result);
                echo '<tr>
                <td>'. $row['LibelleMateriel']. '</td>
                <td>'. $row['LibelleConstructeur']. '</td>
                <td>'. $row['LibelleModele'].'</td>
                <td> '. $row['NumSerie']. '</td>
                <td> '. $row['Observation']. '</td>
                </tr>' ; 

             }

                mysqli_free_result($result);
            }
            else{
                echo "<tr><td colspan=5> AUCUNE DONNEES TROUVEES </td></tr>";
            }
        }
        else {
            "ERROR : Could not execute $sql." . mysqli_error($link);
        }
    ?>
</table>
</form>
</body>
</html> 