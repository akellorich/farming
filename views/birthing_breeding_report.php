<?php
/**
 * Jukam Dairy Management System - Birthing & Breeding Report
 * File: views/birthing_breeding_report.php
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Birthing & Breeding Report | Jukam Dairy</title>
    
    <!-- Custom Tailwind Config -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script>
        tailwind.config = {
          darkMode: 'class',
          theme: {
            extend: {
              colors: {
                "surface-dark": "#232522",
                "background-dark": "#1a1c19",
                "outline": "#707a6c",
                "on-tertiary-fixed": "#002107",
                "on-secondary": "#ffffff",
                "on-primary-fixed": "#002203",
                "on-primary-container": "#cbffc2",
                "on-error": "#ffffff",
                "on-tertiary-container": "#c7ffc5",
                "on-tertiary": "#ffffff",
                "surface": "#fafaf5",
                "outline-variant": "#bfcaba",
                "surface-container-lowest": "#ffffff",
                "error-container": "#ffdad6",
                "surface-container-high": "#e8e8e3",
                "on-primary-fixed-variant": "#0c5216",
                "surface-variant": "#e3e3de",
                "surface-container": "#eeeee9",
                "on-background": "#1a1c19",
                "secondary-fixed": "#ffdfa0",
                "surface-container-low": "#f4f4ef",
                "on-surface-variant": "#40493d",
                "on-secondary-fixed": "#261a00",
                "inverse-primary": "#91d78a",
                "surface-bright": "#fafaf5",
                "surface-container-highest": "#e3e3de",
                "tertiary-fixed": "#abf4ac",
                "error": "#ba1a1a",
                "on-secondary-fixed-variant": "#5c4300",
                "inverse-on-surface": "#f1f1ec",
                "on-surface": "#1a1c19",
                "on-error-container": "#93000a",
                "surface-dim": "#dadad5",
                "on-tertiary-fixed-variant": "#07521d",
                "surface-tint": "#2a6b2c",
                "on-secondary-container": "#6f5100",
                "background": "#fafaf5",
                "secondary": "#795900",
                "primary": "#206223",
                "inverse-surface": "#2f312e",
                "secondary-fixed-dim": "#f8bd2a",
                "on-primary": "#ffffff",
                "primary-fixed": "#acf4a4",
                "tertiary-container": "#387b41",
                "tertiary": "#1d622b",
                "tertiary-fixed-dim": "#90d792",
                "primary-fixed-dim": "#91d78a",
                "secondary-container": "#fec330",
                "primary-container": "#3a7b3a"
              },
              fontFamily: {
                "headline": ["Manrope"],
                "body": ["Work Sans"],
                "label": ["Work Sans"]
              },
              borderRadius: {"DEFAULT": "0.125rem", "lg": "0.25rem", "xl": "0.5rem", "full": "0.75rem"},
            },
          },
        }
    </script>
    
    <!-- External Dependencies -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Work+Sans:wght@300;400;500;600;700&family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">
    
    <!-- DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.4.0/css/responsive.bootstrap4.min.css"/>

    <!-- Local Styles -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css"> <!-- Font Awesome -->
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/alert.css">

    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        body { font-family: 'Work Sans', sans-serif; font-size: 13px; overflow-x: hidden; }
        h1, h2, h3, .font-headline { font-family: 'Manrope', sans-serif; }
        .no-scrollbar::-webkit-scrollbar { display: none; }
        
        .sidebar { z-index: 50; }
        .header { z-index: 40; }
        
        /* DataTable Localization Path and Theming */
        table.dataTable thead th {
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            padding: 12px 20px !important;
            border-bottom: 1px solid #f1f1f1 !important;
            color: #718096;
        }
        .dark-theme table.dataTable thead th {
            border-bottom: 1px solid #2d3748 !important;
            color: #a0aec0;
            background-color: #2d3748 !important;
        }
        table.dataTable tbody td {
            font-size: 13px;
            padding: 8px 20px !important;
            vertical-align: middle;
        }
        .dark-theme table.dataTable tbody td {
            color: #e2e8f0;
            border-top: 1px solid #2d3748;
        }
        .dataTables_filter input {
            background-color: #f8f9fa;
            border: 1px solid #edf2f7;
            border-radius: 8px;
            padding: 4px 12px;
            font-size: 12px;
        }
        .dark-theme .dataTables_filter input {
            background-color: #2d3748;
            border-color: #4a5568;
            color: #ffffff;
        }
        
        /* Circular Green Pagination (Design Parity) */
        .pagination {
            display: flex !important;
            align-items: center !important;
            gap: 12px !important;
            border: none !important;
        }
        .page-item .page-link {
            width: 36px !important;
            height: 36px !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            border-radius: 50% !important;
            border: 1px solid #eeeeee !important;
            background: #ffffff !important;
            color: #94a3b8 !important;
            font-size: 13px !important;
            font-weight: 600 !important;
            padding: 0 !important;
            margin: 0 !important;
            transition: all 0.2s ease !important;
        }
        .dark-theme .page-item .page-link {
            background: #1a1c19 !important;
            border-color: #2d3748 !important;
            color: #718096 !important;
        }
        .page-item.active .page-link {
            background-color: #206223 !important;
            color: #ffffff !important;
            border-color: #206223 !important;
            box-shadow: 0 4px 6px -1px rgba(32, 98, 35, 0.2) !important;
        }
        .page-item.disabled .page-link {
            background-color: #ffffff !important;
            border-color: #f1f1f1 !important;
            color: #e2e8f0 !important;
            opacity: 0.5 !important;
        }
        .dark-theme .page-item.disabled .page-link {
            background-color: #1a1c19 !important;
            border-color: #2d3748 !important;
            color: #2d3748 !important;
        }
        .page-item:not(.active):not(.disabled) .page-link:hover {
            border-color: #206223 !important;
            color: #206223 !important;
            background-color: #f8fafc !important;
        }
        .dark-theme .page-item:not(.active):not(.disabled) .page-link:hover {
            background-color: #2d3748 !important;
            color: #ffffff !important;
        }
        
        @media print {
            .no-print { display: none !important; }
            .main-content { margin-left: 0 !important; padding: 0 !important; }
        }

        /* Action Dropdown Styling */
        .action-menu {
            position: absolute;
            top: 100%;
            right: 0;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            min-width: 160px;
            display: none;
            z-index: 100;
            margin-top: 8px;
            border: 1px solid #f1f1f1;
        }
        .dark-theme .action-menu {
            background: #1a1c19;
            border-color: #2d3748;
            box-shadow: 0 10px 25px rgba(0,0,0,0.4);
        }
        .action-menu.active { display: block; }
        .action-item {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            font-size: 12px;
            color: #4a5568;
            text-decoration: none;
            transition: all 0.2s;
        }
        .dark-theme .action-item {
            color: #cbd5e0;
        }
        .action-item:hover { background-color: #f7fafc; color: #206223; text-decoration: none !important; }
        .dark-theme .action-item:hover { background-color: #2d3748; color: #acf4a4; text-decoration: none !important; }
        .action-item span { font-size: 16px; }

        /* Force Background Logic for problematic elements in screenshot */
        .dark-theme .bg-white { background-color: #232522 !important; }
        .dark-theme .text-on-surface { color: #f8fafc !important; }
        .dark-theme .bg-gray-50 { background-color: #2d3748 !important; }
    </style>
</head>
<body class="bg-background text-on-background dark:bg-background-dark dark:text-gray-100 transition-colors duration-300">

    <!-- Modular Sidebar -->
    <?php include 'navigation.php'; ?>

    <!-- Modular Header -->
    <?php include 'header.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content" style="margin-left: 260px; padding-top: 80px;">
        <div class="px-3 md:px-8 py-4 md:py-6 min-h-screen">
            
            <!-- Context Header Section -->
            <div class="flex items-center justify-between mb-4 no-print">
                <a href="reports_overview.php" class="flex items-center gap-2 text-gray-500 hover:text-gray-700 hover:no-underline transition-colors group no-underline">
                    <span class="material-symbols-outlined text-base">arrow_back</span>
                    <span class="text-[13px] font-medium font-headline">Back to Reports</span>
                </a>
                
                <div class="flex items-center gap-2">
                    <button onclick="window.print()" class="text-white px-2 md:px-3 py-1 md:py-1.5 rounded-lg text-[10px] md:text-xs font-medium flex items-center gap-2 hover:opacity-90 transition-all shadow-sm" style="background-color: #206223;">
                        <span class="material-symbols-outlined text-sm">print</span> Print
                    </button>
                    <div class="relative">
                        <button id="actionBtn" class="bg-white dark:bg-background-dark border border-gray-200 dark:border-gray-800 text-on-surface dark:text-gray-300 px-2 md:px-3 py-1 md:py-1.5 rounded-lg text-[10px] md:text-xs font-medium flex items-center gap-2 hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors">
                            Actions <span class="material-symbols-outlined text-sm">expand_more</span>
                        </button>
                        <div id="actionMenu" class="action-menu">
                            <a class="action-item no-underline" href="#">
                                <span class="material-symbols-outlined">description</span> Excel Export
                            </a>
                            <a class="action-item no-underline" href="#">
                                <span class="material-symbols-outlined">mail</span> Email Report
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Page Title Section -->
            <div class="mb-6">
                <h2 class="text-lg font-headline font-extrabold text-on-surface mb-1 dark:text-white">Birthing & Breeding Report</h2>
                <p class="text-xs text-on-surface-variant font-body dark:text-gray-400">Detailed overview of livestock reproduction cycles and expected arrivals.</p>
            </div>

            <!-- 1. Summary Metrics Bento -->
            <div class="grid grid-cols-2 lg:grid-cols-4 gap-3 md:gap-4 mb-6">
                <!-- Cows Expected -->
                <div class="bg-white dark:bg-surface-dark p-4 rounded-xl shadow-sm border-l-4 border-[#206223]">
                    <p class="text-[10px] font-label uppercase tracking-widest text-on-surface-variant mb-1 dark:text-gray-500">Total Expected (30 Days)</p>
                    <div class="flex items-baseline gap-2">
                        <span class="text-2xl font-headline font-bold text-[#206223] dark:text-[#acf4a4]">24</span>
                        <span class="text-[10px] text-on-surface-variant font-body dark:text-gray-400">Cows</span>
                    </div>
                    <div class="mt-2 flex items-center text-[10px] font-bold text-[#0c5216] dark:text-[#91d78a]">
                        <span class="material-symbols-outlined text-[12px] mr-1">trending_up</span> 12% vs last month
                    </div>
                </div>

                <!-- Recently Calved -->
                <div class="bg-white dark:bg-surface-dark p-4 rounded-xl shadow-sm border-l-4 border-[#1d622b]">
                    <p class="text-[10px] font-label uppercase tracking-widest text-on-surface-variant mb-1 dark:text-gray-500">Recently Calved</p>
                    <div class="flex items-baseline gap-2">
                        <span class="text-2xl font-headline font-bold text-[#1d622b] dark:text-[#90d792]">18</span>
                        <span class="text-[10px] text-on-surface-variant font-body dark:text-gray-400">This Month</span>
                    </div>
                    <div class="mt-2 flex items-center text-[10px] font-bold text-gray-500 dark:text-gray-400">
                        <span class="material-symbols-outlined text-[12px] mr-1">info</span> 94% Survival Rate
                    </div>
                </div>

                <!-- Steaming Up -->
                <div class="bg-white dark:bg-surface-dark p-4 rounded-xl shadow-sm border-l-4 border-[#795900]">
                    <p class="text-[10px] font-label uppercase tracking-widest text-on-surface-variant mb-1 dark:text-gray-500">Current Steaming Up</p>
                    <div class="flex items-baseline gap-2">
                        <span class="text-2xl font-headline font-bold text-[#795900] dark:text-[#f8bd2a]">32</span>
                        <span class="text-[10px] text-on-surface-variant font-body dark:text-gray-400">High Priority</span>
                    </div>
                    <div class="mt-2 h-1 w-full bg-gray-50 dark:bg-gray-800 rounded-full overflow-hidden">
                        <div class="h-full w-3/4" style="background-color: #795900;"></div>
                    </div>
                </div>

                <!-- Active Serving -->
                <div class="bg-white dark:bg-surface-dark p-4 rounded-xl shadow-sm border-l-4 border-[#707a6c]">
                    <p class="text-[10px] font-label uppercase tracking-widest text-on-surface-variant mb-1 dark:text-gray-500">Active Serving Schedule</p>
                    <div class="flex items-baseline gap-2">
                        <span class="text-2xl font-headline font-bold text-on-surface dark:text-white">15</span>
                        <span class="text-[10px] text-on-surface-variant font-body dark:text-gray-400">Heifers/Cows</span>
                    </div>
                    <div class="mt-2 flex items-center text-[10px] text-on-surface-variant dark:text-gray-500">
                        <span class="material-symbols-outlined text-[12px] mr-1">calendar_month</span> Next 7 days
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <!-- Left Column (2/3 width) -->
                <div class="lg:col-span-2 space-y-6">
                    <!-- 2. Expected Calving -->
                    <section class="bg-white dark:bg-surface-dark rounded-xl shadow-sm overflow-hidden border border-gray-100 dark:border-gray-800">
                        <div class="px-2 py-3 border-b border-gray-50 dark:border-gray-800 flex justify-between items-center">
                            <h3 class="font-headline font-bold text-sm flex items-center gap-2 dark:text-white">
                                <span class="material-symbols-outlined text-[#206223] dark:text-[#acf4a4] text-lg">event_upcoming</span>
                                Expected Calving List
                            </h3>
                        </div>
                        <div class="p-2">
                            <table class="w-full text-left" id="expectedCalvingTable">
                                <thead class="bg-gray-50/50 dark:bg-gray-900/50">
                                    <tr>
                                        <th>Animal ID</th>
                                        <th>Name</th>
                                        <th>Expected Date</th>
                                        <th>Days Left</th>
                                        <th>Pen</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-50 dark:divide-gray-800">
                                    <?php 
                                    $expected = [
                                        ['JK-1022', 'Bessie Bloom', 'Oct 24, 2023', '3', 'Maternity-A', 'urgent'],
                                        ['JK-0988', 'Goldie Horn', 'Oct 28, 2023', '7', 'Maternity-A', 'warning'],
                                        ['JK-1105', 'Luna Mist', 'Nov 05, 2023', '14', 'Dry Cow-1', 'normal'],
                                        ['JK-0872', 'Daisy Blue', 'Nov 02, 2023', '22', 'Dry Cow-1', 'normal'],
                                        ['JK-1215', 'Rosie Red', 'Nov 05, 2023', '25', 'Dry Cow-2', 'normal'],
                                        ['JK-1180', 'Sasha Grey', 'Oct 22, 2023', '1', 'Maternity-B', 'urgent'],
                                        ['JK-1301', 'Penny Lane', 'Oct 15, 2023', 'Today', 'Dry Cow-3', 'urgent']
                                    ];
                                    foreach($expected as $item): ?>
                                    <tr class="hover:bg-gray-50/30 dark:hover:bg-gray-800/30 transition-colors">
                                        <td class="font-bold text-[#206223] dark:text-[#acf4a4]"><?php echo $item[0]; ?></td>
                                        <td class="dark:text-gray-300 font-medium"><?php echo $item[1]; ?></td>
                                        <td class="dark:text-gray-400"><?php echo $item[2]; ?></td>
                                        <td>
                                            <?php if($item[5] == 'urgent'): ?>
                                                <span class="bg-red-50 dark:bg-red-900/20 text-red-600 dark:text-red-400 px-2 py-0.5 rounded text-[10px] font-bold"><?php echo $item[3]; ?> Days</span>
                                            <?php else: ?>
                                                <span class="dark:text-gray-400"><?php echo $item[3]; ?> Days</span>
                                            <?php endif; ?>
                                        </td>
                                        <td class="dark:text-gray-400"><?php echo $item[4]; ?></td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </section>

                    <!-- 5. Service & Breeding Log -->
                    <section class="bg-white dark:bg-surface-dark rounded-xl shadow-sm overflow-hidden border border-gray-100 dark:border-gray-800">
                        <div class="px-2 py-3 border-b border-gray-50 dark:border-gray-800 flex justify-between items-center">
                            <h3 class="font-headline font-bold text-sm flex items-center gap-2 dark:text-white">
                                <span class="material-symbols-outlined text-[#795900] dark:text-[#f8bd2a] text-lg">genetics</span>
                                Service & Breeding History
                            </h3>
                        </div>
                        <div class="p-2">
                            <table class="w-full text-left" id="breedingLogTable">
                                <thead class="bg-gray-50/50 dark:bg-gray-900/50">
                                    <tr>
                                        <th>Service Date</th>
                                        <th>Animal</th>
                                        <th>Bull / Breed</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-50 dark:divide-gray-800">
                                    <?php 
                                    $logs = [
                                        ['Oct 01, 2023', 'JK-1250 (Lucy)', 'BULL-X / Holstein', 'Confirmed Positive'],
                                        ['Oct 05, 2023', 'JK-1310 (Fancy)', 'BULL-Y / Jersey', 'Pending (21 Day)'],
                                        ['Sep 28, 2023', 'JK-1100 (Ruby)', 'BULL-W / Friesian', 'Failed - Re-service'],
                                        ['Sep 25, 2023', 'JK-1211 (Pearl)', 'BULL-X / Holstein', 'Confirmed Positive']
                                    ];
                                    foreach($logs as $log): ?>
                                    <tr class="hover:bg-gray-50/30 dark:hover:bg-gray-800/30 transition-colors">
                                        <td class="dark:text-gray-400 text-xs"><?php echo $log[0]; ?></td>
                                        <td class="font-bold text-[#206223] dark:text-[#acf4a4]"><?php echo $log[1]; ?></td>
                                        <td class="dark:text-gray-400"><?php echo $log[2]; ?></td>
                                        <td>
                                            <?php 
                                            $statusClass = 'bg-gray-50 text-gray-600 dark:bg-gray-800 dark:text-gray-400';
                                            if(strpos($log[3], 'Confirmed') !== false) $statusClass = 'bg-green-50 text-green-700 dark:bg-green-900/20 dark:text-green-400';
                                            if(strpos($log[3], 'Pending') !== false) $statusClass = 'bg-blue-50 text-blue-700 dark:bg-blue-900/20 dark:text-blue-400';
                                            if(strpos($log[3], 'Failed') !== false) $statusClass = 'bg-red-50 text-red-700 dark:bg-red-900/20 dark:text-red-400';
                                            ?>
                                            <span class="<?php echo $statusClass; ?> px-3 py-0.5 rounded-full text-[10px] font-bold uppercase tracking-tight">
                                                <?php echo $log[3]; ?>
                                            </span>
                                        </td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>

                <!-- Right Column (1/3 width) -->
                <div class="lg:col-span-1 space-y-6">
                    <!-- 3. Recently Calved -->
                    <section class="bg-white dark:bg-surface-dark rounded-xl shadow-sm overflow-hidden border border-gray-100 dark:border-gray-800">
                        <div class="px-2 py-3 border-b border-gray-50 dark:border-gray-800">
                            <h3 class="font-headline font-bold text-sm flex items-center gap-2 dark:text-white">
                                <span class="material-symbols-outlined text-[#1d622b] dark:text-[#90d792] text-lg">new_releases</span>
                                Recent Calved
                            </h3>
                        </div>
                        <div class="p-2 md:p-4 space-y-3">
                            <div class="flex items-start gap-3 md:gap-4 p-2 md:p-3 bg-gray-50 dark:bg-gray-800/50 rounded-xl">
                                <div class="w-10 h-10 bg-white dark:bg-gray-800 rounded-lg flex items-center justify-center text-[#1d622b] dark:text-[#90d792]">
                                    <span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">child_care</span>
                                </div>
                                <div class="flex-grow">
                                    <h4 class="font-bold text-[12px] dark:text-gray-100">Calf JK-C402</h4>
                                    <p class="text-[10px] text-on-surface-variant dark:text-gray-400">Dam: JK-1011 | Weight: 38kg</p>
                                    <span class="inline-block mt-1 px-2 py-0.5 bg-green-50 dark:bg-green-900/20 text-green-700 dark:text-green-400 text-[9px] font-bold rounded uppercase">HEALTHY</span>
                                </div>
                                <span class="text-[9px] text-on-surface-variant dark:text-gray-500 font-label font-bold uppercase">2H AGO</span>
                            </div>
                            <div class="flex items-start gap-3 md:gap-4 p-2 md:p-3 bg-white dark:border-gray-800 rounded-xl dark:bg-gray-800/30">
                                <div class="w-10 h-10 bg-gray-50 dark:bg-gray-800 rounded-lg flex items-center justify-center text-gray-400">
                                    <span class="material-symbols-outlined text-2xl">child_care</span>
                                </div>
                                <div class="flex-grow">
                                    <h4 class="font-bold text-[12px] dark:text-gray-100">Calf JK-C400</h4>
                                    <p class="text-[10px] text-on-surface-variant dark:text-gray-400">Dam: JK-0922 | Weight: 35kg</p>
                                    <span class="inline-block mt-1 px-2 py-0.5 bg-amber-50 dark:bg-amber-900/20 text-amber-700 dark:text-amber-400 text-[9px] font-bold rounded uppercase">OBSERVATION</span>
                                </div>
                                <span class="text-[9px] text-on-surface-variant dark:text-gray-500 font-label font-bold">OCT 08</span>
                            </div>
                        </div>
                    </section>

                    <!-- 4. Steaming Up Schedule -->
                    <section class="bg-white dark:bg-surface-dark rounded-xl shadow-sm overflow-hidden flex flex-col border border-gray-100 dark:border-gray-800">
                        <div class="px-2 py-3 border-b border-gray-50 dark:border-gray-800">
                            <h3 class="font-headline font-bold text-sm flex items-center gap-2 dark:text-white">
                                <span class="material-symbols-outlined text-[#795900] dark:text-[#f8bd2a] text-lg">nutrition</span>
                                Steaming Up Progress
                            </h3>
                        </div>
                        <div class="p-6 flex-grow">
                            <ul class="space-y-6">
                                <li class="relative pl-6 border-l-2 border-[#795900] dark:border-[#f8bd2a]">
                                    <div class="absolute -left-[9px] top-0 w-4 h-4 bg-[#795900] dark:bg-[#f8bd2a] rounded-full border-2 border-white dark:border-surface-dark"></div>
                                    <div class="flex justify-between items-start">
                                        <span class="font-bold text-[12px] dark:text-gray-100">JK-1180 (Sasha)</span>
                                        <span class="text-[9px] text-[#795900] dark:text-[#f8bd2a] font-label font-bold uppercase tracking-tighter">PHASE 2</span>
                                    </div>
                                    <p class="text-[10px] text-on-surface-variant dark:text-gray-400 mt-1 italic">Started: Sep 25 | Due: Oct 22</p>
                                </li>
                                <li class="relative pl-6 border-l-2 border-gray-100 dark:border-gray-700">
                                    <div class="absolute -left-[9px] top-0 w-4 h-4 bg-gray-200 dark:bg-gray-700 rounded-full border-2 border-white dark:border-surface-dark"></div>
                                    <div class="flex justify-between items-start">
                                        <span class="font-bold text-[12px] dark:text-gray-100">JK-1202 (Molly)</span>
                                        <span class="text-[9px] text-on-surface-variant dark:text-gray-400 font-label uppercase tracking-tighter">PHASE 1</span>
                                    </div>
                                    <p class="text-[10px] text-on-surface-variant dark:text-gray-400 mt-1 italic">Started: Oct 02 | Due: Oct 30</p>
                                </li>
                            </ul>
                            <button class="w-full mt-10 py-2 text-xs font-semibold text-[#795900] dark:text-[#f8bd2a] border border-[#795900]/20 dark:border-[#f8bd2a]/20 rounded-md hover:bg-[#795900]/5 dark:hover:bg-[#f8bd2a]/5 transition-colors">
                                View Full Regimen
                            </button>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </main>

    <!-- Global Scripts -->
    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="../plugins/popper.js"></script>
    <script src="../plugins/bootstrap.js"></script>
    
    <!-- DataTables JS -->
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>

    <script src="../js/header.js"></script>
    <script src="../js/navigation.js"></script>
    <script src="../plugins/alert.js"></script>

    <script>
        $(document).ready(function() {
            // Action Menu Logic
            $('#actionBtn').click(function(e) {
                e.stopPropagation();
                $('#actionMenu').toggleClass('active');
            });
            $(document).click(function() {
                $('#actionMenu').removeClass('active');
            });

            // Sync Tailwind with System Dark Mode Class
            const syncTheme = () => {
                const isDark = $('body').hasClass('dark-theme');
                if(isDark) {
                    $('html').addClass('dark');
                } else {
                    $('html').removeClass('dark');
                }
            };
            
            // Initial sync
            syncTheme();
            
            // Watch for body class changes
            const observer = new MutationObserver(syncTheme);
            observer.observe(document.body, { attributes: true, attributeFilter: ['class'] });

            // Sync DataTables with Dark Mode
            const dtOptions = {
                responsive: true,
                paging: true,
                pageLength: 5,
                searching: true,
                info: true,
                dom: 'tr<"d-flex justify-content-between align-items-center p-4 border-t border-gray-50 dark:border-gray-800"ip>',
                language: {
                    paginate: {
                        previous: '<span class="material-symbols-outlined" style="font-size: 1.25rem;">chevron_left</span>',
                        next: '<span class="material-symbols-outlined" style="font-size: 1.25rem;">chevron_right</span>'
                    }
                }
            };

            $('#expectedCalvingTable').DataTable(dtOptions);
            $('#breedingLogTable').DataTable(dtOptions);
        });
    </script>
</body>
</html>
