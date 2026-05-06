<?php
$firstNames = ['John', 'Jane', 'James', 'Mary', 'Joseph', 'Ann', 'Peter', 'Grace', 'David', 'Sarah', 'Kevin', 'Mercy', 'Brian', 'Faith', 'Samuel', 'Joy', 'Francis', 'Purity', 'Michael', 'Esther', 'Daniel', 'Lillian', 'George', 'Rose', 'Andrew', 'Alice', 'Patrick', 'Emily', 'Paul', 'Lucy', 'Charles', 'Catherine', 'Robert', 'Margaret', 'Anthony', 'Florence', 'Stephen', 'Beatrice', 'Richard', 'Agnes', 'William', 'Judith', 'Thomas', 'Monica', 'Christopher', 'Gladys', 'Wilson', 'Irene', 'Joshua', 'Janet'];
$middleNames = ['Maina', 'Kamau', 'Otieno', 'Anyango', 'Wanjiku', 'Mwangi', 'Omondi', 'Njeri', 'Kipkorir', 'Chepkirui', 'Ochieng', 'Achieng', 'Muthoni', 'Karanja', 'Njoroge', 'Wambui', 'Juma', 'Kariuki', 'Nyambura', 'Githinji', 'Mutua', 'Kyalo', 'Moraa', 'Kerubo', 'Waweru', 'Gitau', 'Kiptoo', 'Chebet', 'Langat', 'Cheruiyot', 'Kimani', 'Ngugi', 'Wawira', 'Mwaniki', 'Nduta', 'Mumbi', 'Okoth', 'Atieno', 'Oluoch', 'Odhiambo', 'Mboya', 'Wafula', 'Nekesa', 'Simiyu', 'Nasimiyu', 'Makokha', 'Wekesa', 'Ouma', 'Adhiambo', 'Khalwale'];
$lastNames = ['Kenyatta', 'Odinga', 'Ruto', 'Mudavadi', 'Kalonzo', 'Wetangula', 'Karua', 'Gachagua', 'Kindiki', 'Murkomen', 'Duale', 'Kuría', 'Munya', 'Joho', 'Kingi', 'Mvurya', 'Ngilu', 'Kibwana', 'Mutua', 'Sang', 'Koskei', 'Tolgos', 'Nanok', 'Oparanya', 'Rasanga', 'Nyong\'o', 'Obado', 'Ongwae', 'Nyaribo', 'Lusaka', 'Wangamati', 'Khafafa', 'Wamatangi', 'Kihika', 'Nderitu', 'Kahiga', 'Muriithi', 'Waiguru', 'Kimemia', 'Kinyanjui', 'Lee', 'Nyoro', 'Wairuria', 'Gakuru', 'Wahome', 'Ngunjiri', 'Ichung\'wa', 'Kimani', 'Sudi', 'Barasa'];

$genders = ['Male', 'Female'];
$memberTypes = ['Gold', 'Silver', 'Bronze', 'VIP', 'Standard'];

$sql = "CREATE TABLE IF NOT EXISTS `members` (\n";
$sql .= "    `memberid` INT AUTO_INCREMENT PRIMARY KEY,\n";
$sql .= "    `firstname` VARCHAR(100) NOT NULL,\n";
$sql .= "    `middlename` VARCHAR(100),\n";
$sql .= "    `lastname` VARCHAR(100) NOT NULL,\n";
$sql .= "    `gender` ENUM('Male', 'Female', 'Other') NOT NULL,\n";
$sql .= "    `idno` VARCHAR(20) UNIQUE NOT NULL,\n";
$sql .= "    `telephone` VARCHAR(20),\n";
$sql .= "    `email` VARCHAR(255),\n";
$sql .= "    `membertype` VARCHAR(50),\n";
$sql .= "    `dob` DATE,\n";
$sql .= "    `registration_date` DATETIME DEFAULT CURRENT_TIMESTAMP\n";
$sql .= ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n\n";

$sql .= "INSERT INTO `members` (`firstname`, `middlename`, `lastname`, `gender`, `idno`, `telephone`, `email`, `membertype`, `dob`, `registration_date`) VALUES\n";

$rows = [];
for ($i = 0; $i < 1000; $i++) {
    $fn = $firstNames[array_rand($firstNames)];
    $mn = $middleNames[array_rand($middleNames)];
    $ln = $lastNames[array_rand($lastNames)];
    $gender = $genders[array_rand($genders)];
    $idno = rand(10000000, 39999999);
    $tel = "07" . rand(10000000, 99999999);
    $email = strtolower($fn . "." . $ln . rand(1, 999) . "@example.com");
    $type = $memberTypes[array_rand($memberTypes)];
    
    // Random DOB between 18 and 60 years ago
    $dob = date('Y-m-d', strtotime('-' . rand(18, 60) . ' years -' . rand(0, 365) . ' days'));
    // Random registration date in the last 2 years
    $reg = date('Y-m-d H:i:s', strtotime('-' . rand(0, 730) . ' days -' . rand(0, 86400) . ' seconds'));
    
    $rows[] = "('{$fn}', '{$mn}', '{$ln}', '{$gender}', '{$idno}', '{$tel}', '{$email}', '{$type}', '{$dob}', '{$reg}')";
}

$sql .= implode(",\n", $rows) . ";";

file_put_contents('c:\xampp\htdocs\dairyfarm\migrations\members_setup.sql', $sql);
echo "SQL file generated successfully.";
?>
