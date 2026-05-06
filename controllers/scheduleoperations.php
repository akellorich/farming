<?php
require_once("../models/schedule.php");
$schedule = new schedule();

header('Content-Type: application/json');
$action = $_GET['action'] ?? $_POST['action'] ?? '';

if ($action == 'savevaccinationschedule') {
    $id = $_POST['id'] ?? 0;
    $diseaseid = $_POST['diseaseid'];
    $penids = $_POST['penids'] ?? []; // Array of pen IDs
    $scheduledate = $_POST['scheduledate'];
    $scheduletime = $_POST['scheduletime'];
    $repeat_annually = isset($_POST['repeat_annually']) ? 1 : 0;
    $notes = $_POST['notes'] ?? '';
    
    $response = $schedule->saveVaccinationSchedule($id, $diseaseid, $penids, $scheduledate, $scheduletime, $repeat_annually, $notes);
    echo json_encode($response);
}

if ($action == 'savedewormingschedule') {
    $id = $_POST['id'] ?? 0;
    $schedulename = $_POST['schedulename'];
    $penids = $_POST['penids'] ?? [];
    $scheduledate = $_POST['scheduledate'];
    $scheduletime = $_POST['scheduletime'];
    $repeat_annually = isset($_POST['repeat_annually']) ? 1 : 0;
    $notes = $_POST['notes'] ?? '';
    
    $response = $schedule->saveDewormingSchedule($id, $schedulename, $penids, $scheduledate, $scheduletime, $repeat_annually, $notes);
    echo json_encode($response);
}

if ($action == 'getvaccinationschedules') {
    echo $schedule->getVaccinationSchedules();
}

if ($action == 'getdewormingschedules') {
    echo $schedule->getDewormingSchedules();
}

if ($action == 'getvaccinationscheduledetails') {
    $id = $_GET['id'];
    echo $schedule->getVaccinationScheduleDetails($id);
}

if ($action == 'getdewormingscheduledetails') {
    $id = $_GET['id'];
    echo $schedule->getDewormingScheduleDetails($id);
}

if ($action == 'deletevaccinationschedule') {
    $id = $_POST['id'];
    echo json_encode($schedule->deleteSchedule($id, 'vaccination'));
}

if ($action == 'deletedewormingschedule') {
    $id = $_POST['id'];
    echo json_encode($schedule->deleteSchedule($id, 'deworming'));
}

if ($action == 'getschedulestats') {
    echo $schedule->getScheduleStats();
}

if ($action == 'deleteschedule') {
    $id = $_POST['id'];
    $type = $_POST['type']; // 'vaccination' or 'deworming'
    echo json_encode($schedule->deleteSchedule($id, $type));
}
?>
