<?php
    extract ($_POST);
    extract ($_GET);
    //var_dump($_POST);
    var_dump($_GET);

    include ('connectDB.php');

    if (isset($SearchAgent)){
    
        header("location: Restitution_fiche1.php?User=".$User);
    }
    

    if (isset($retour)){
    
        header("location: Restitution_liste.php");
    }

    if (isset($enregistrer)){
    
        $sql = "INSERT INTO restitution (DateRestitution,DateReception,NumAgentRestitution)
         VALUES (";
         if (!empty($daterestitution)) { $sql .="'".$daterestitution."',";} else {$sql .= "NULL,";}
         if (!empty($datereception)) { $sql .="'".$datereception."',";} else {$sql .= "NULL,";}
         $sql .=$NumAgent.")";

         mysqli_query($link, $sql) or die (mysqli_error($link)) ;
         $numrestitution = mysqli_insert_id($link);

        header("location: Restitution_fiche2.php?numrestitution=".$numrestitution);
    }

    if (isset($ajoutermateriel)){

        $sql = "INSERT INTO lignematerielrestitution (NumRestitutionLigne ,NumMaterielLigne ,NumModeleLigne ,NumConstructeurLigne ,NumSerie,Observation)
        VALUES ($numrestitution,$materiel,$modele,$constructeur,";
        if (!empty($numserie)) { $sql .="'".$numserie."',";} else {$sql .= "NULL,";}
        if (!empty($observation)) { $sql .="'".$observation."'";} else {$sql .= "NULL";}
        $sql .=")";

        mysqli_query($link, $sql) or die (mysqli_error($link)) ;


       header("location: Restitution_fiche2.php?numrestitution=".$numrestitution);


    }
    if ($action == 'deleterestitution'){
        
        $sql= "DELETE FROM restitution WHERE NumRestitution= $numrestitution";
        echo $sql;
        mysqli_query($link, $sql) or die (mysqli_error($link)) ;
        

        $sql= "DELETE FROM lignematerielrestitution WHERE NumRestitutionLigne = $numrestitution";
        echo $sql;
        mysqli_query($link, $sql) or die (mysqli_error($link)) ;
        header("location: Restitution_liste.php");
        
    }
?>