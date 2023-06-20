<?php
class connecttt{
    public $sever;
    public $user;
    public $password;
    public $dbName;
    public function __construct()
    {
        // $this->sever = "localhost";
        // $this->user = "root";
        // $this->password = "";
        // $this->dbName = "online_shopping";
        $this->sever = "l0ebsc9jituxzmts.cbetxkdyhwsb.us-east-1.rds.amazonaws.com";
        $this->user = "rq1k0dgtn79oh6an";
        $this->password = "ycra5awekrdhjx13";
        $this->dbName = "v210l47hkjg87s2q";
    }
    //option 1: mysql
    function connectToMYSQL():mysqli{
       $conn_my = new mysqli($this->sever, $this->user, $this->password , $this->dbName);
       if($conn_my->connect_error){
        die("Failed".$conn_my->connect_error);
       }else{
        //echo"Connect form mysqli";
       }
       return $conn_my;
    }
    //option 2: PDO
    function connectToPDO():PDO{
        try{
            $conn_pdo = new PDO (
                "mysql:host=$this->sever;
                dbname=$this->dbName",$this->user,
                $this->password);
               // echo "Connect from PDO";
            
        }catch(PDOException $e){
            die("Failes $e");
        }
        return $conn_pdo;
    }
}
$c = new connecttt();
//$c->connectToMYSQL(); //op1
$c->connectToPDO();