<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<head>
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

<?php include ('connectDB.php'); ?>
</style>
</head>
<body>


            
<form action="restitution_fiche1.php" method="post">
<table style="width:100%">
  <tr>
    <th>N°Restitution</th>
    <th>N°Agent</th>
    <th>Prénom</th>
    <th>Nom</th>
    <th>Service</th>
    <th>Direction</th>
    <th>Date Restitution</th>
    <th>Date Reception</th>
    <th><input type="submit" name="AjouterFiche" value="+Ajouter Fiche Restitution/Réception" style="background-color:#6495ED; color:#F0F8FF"></th>
</tr>
  <?php
        $sql = "SELECT NumAgent, PrenomAgent, NomAgent, LibelleService, LibelleDirection,NumRestitution,DateRestitution,DateReception
        FROM agent
        INNER JOIN service ON agent.NumServiceAgent = service.NumService 
        INNER JOIN direction ON direction.NumDirection = service.NumDirectionService
        INNER JOIN restitution ON agent.NumAgent = restitution.NumAgentRestitution";
        
        if($result = mysqli_query($link, $sql)) {

            
            $taille = mysqli_num_rows($result);

           if($taille > 0){


            for ($i=0; $i < $taille; $i++)
            {
                mysqli_data_seek($result,$i);
                $row = mysqli_fetch_assoc($result);
                echo '<tr>
                <td>'. $row['NumRestitution']. '</td>
                <td>'. $row['NumAgent']. '</td>
                <td>'. $row['PrenomAgent'].'</td>
                <td> '. $row['NomAgent']. '</td>
                <td> '. $row['LibelleService']. '</td>
                <td> '. $row['LibelleDirection']. '</td>
                <td>'. $row['DateRestitution']. '</td>
                <td>'. $row['DateReception']. '</td>
                <td><a  href="Restitution_fiche2.php?numrestitution='.$row['NumRestitution'].'">modifier</a></td>
                <td><a  href="Action.php?action=deleterestitution&numrestitution='.$row['NumRestitution'].'">supprimer</a></td>
                </tr>' ;

             }

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
</table>
</form>

</body>
</html>


