<?php
/**
 * Jukam Dairy Management System - Inventory & Stock Level Report
 * File: views/stock_level_report.php
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Stock Levels | Jukam Dairy</title>
    
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
                "on-surface": "#1a1c19",
                "on-surface-variant": "#40493d",
                "background": "#fafaf5",
                "primary": "#206223",
                "secondary": "#795900",
                "tertiary": "#1d622b",
                "error": "#ba1a1a",
              },
              fontFamily: {
                "headline": ["Manrope"],
                "body": ["Work Sans"],
                "label": ["Work Sans"]
              },
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
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/style.css">

    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        body { font-family: 'Work Sans', sans-serif; font-size: 13px; overflow-x: hidden; }
        h1, h2, h3, h4, h5, .font-headline { font-family: 'Manrope', sans-serif; }
        
        /* Loose Row DataTable Architecture */
        #inventoryTable {
            border-collapse: separate !important;
            border-spacing: 0 4px !important;
            margin-top: -8px !important;
        }
        table.dataTable thead th {
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            padding: 16px 24px !important;
            color: #707a6c;
            background: #f4f4ef !important;
            border: none !important;
        }
        .dark-theme table.dataTable thead th {
            color: #a0aec0;
            background: #232522 !important;
        }
        table.dataTable tbody tr {
            background-color: #ffffff;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .dark-theme table.dataTable tbody tr {
            background-color: #232522;
        }
        table.dataTable tbody tr:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            background-color: #fafaf5;
        }
        .dark-theme table.dataTable tbody tr:hover {
            background-color: #2d312c;
        }
        table.dataTable tbody td {
            font-size: 13px;
            padding: 12px 24px !important;
            vertical-align: middle;
            border: none !important;
            font-weight: 400 !important;
        }
        table.dataTable tbody td:first-child { border-radius: 12px 0 0 12px; }
        table.dataTable tbody td:last-child { border-radius: 0 12px 12px 0; }

        .qty-font { font-size: 14px; font-weight: 600; color: #1a1c19; font-family: 'Work Sans', sans-serif; }
        .dark-theme .qty-font { color: #ffffff; }

        .status-pill {
            padding: 5px 16px;
            border-radius: 999px;
            font-size: 9px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        .status-sufficient { background-color: #dcfce7 !important; color: #166534 !important; }
        .status-low { background-color: #fef3c7 !important; color: #92400e !important; }
        .status-out { background-color: #fee2e2 !important; color: #991b1b !important; }
        
        .dark-theme .status-sufficient { background-color: rgba(22, 101, 52, 0.2) !important; color: #86efac !important; }
        .dark-theme .status-low { background-color: rgba(146, 64, 14, 0.2) !important; color: #fcd34d !important; }
        .dark-theme .status-out { background-color: rgba(153, 27, 27, 0.2) !important; color: #fca5a5 !important; }

        /* Alignments */
        .text-qty { text-align: center !important; }
        .text-reorder { text-align: center !important; }
        .text-status { text-align: right; }
        
        .dark-theme .status-sufficient { background-color: rgba(22, 101, 52, 0.2); color: #86efac; }
        .dark-theme .status-low { background-color: rgba(146, 64, 14, 0.2); color: #fcd34d; }
        .dark-theme .status-out { background-color: rgba(153, 27, 27, 0.2); color: #fca5a5; }

        /* Custom Pagination */
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
            font-weight: 800 !important;
        }
        .dark-theme .page-item.active .page-link {
            background-color: #acf4a4 !important;
            color: #1a1c19 !important;
            border-color: #acf4a4 !important;
        }
        .page-item.disabled .page-link {
            opacity: 0.3 !important;
            pointer-events: none;
        }
        .pagination li { margin: 0 !important; }
        .page-item.disabled .page-link {
            background-color: #ffffff !important;
            border-color: #f1f1f1 !important;
            color: #e2e8f0 !important;
            opacity: 0.5 !important;
            pointer-events: none;
        }
        .dark-theme .page-item.disabled .page-link {
            background-color: #1a1c19 !important;
            border-color: #2d3748 !important;
            color: #2d3748 !important;
        }

        /* DataTable Search Styling */
        .dataTables_filter {
            margin-bottom: 0 !important;
        }
        .dataTables_filter input {
            background: #ffffff !important;
            border: 1px solid #f1f5f9 !important;
            border-radius: 8px !important;
            padding: 6px 12px !important;
            font-size: 11px !important;
            font-weight: 500 !important;
            color: #1a1c19 !important;
            outline: none !important;
            margin-left: 8px !important;
            width: 200px !important;
            transition: all 0.2s;
        }
        .dark-theme .dataTables_filter input {
            background: #1a1c19 !important;
            border-color: #2d3748 !important;
            color: #e2e8f0 !important;
        }
        .dataTables_filter input:focus {
            border-color: #206223 !important;
            box-shadow: 0 0 0 2px rgba(32, 98, 35, 0.1) !important;
        }
        .dark-theme .dataTables_filter input:focus {
            border-color: #acf4a4 !important;
        }
        .dataTables_filter label {
            font-size: 11px !important;
            font-weight: 700 !important;
            text-transform: uppercase;
            color: #718096;
            margin-bottom: 0 !important;
            display: flex;
            align-items: center;
        }

        /* DataTable Search Styling */
        .dataTables_filter {
            margin: 0 !important;
            float: right !important;
            text-align: right !important;
        }
        .dataTables_filter input {
            background: #ffffff !important;
            border: 1px solid #e2e8f0 !important;
            border-radius: 8px !important;
            padding: 8px 16px !important;
            font-size: 13px !important;
            color: #1a1c19 !important;
            outline: none !important;
            width: 280px !important;
            transition: all 0.2s;
            margin-left: 0 !important;
        }
        .dark-theme .dataTables_filter input {
            background: #1a1c19 !important;
            border-color: #2d3748 !important;
            color: #e2e8f0 !important;
        }
        .dataTables_filter input:focus {
            border-color: #206223 !important;
            box-shadow: 0 0 0 3px rgba(32, 98, 35, 0.1) !important;
        }
        .dark-theme .dataTables_filter input:focus {
            border-color: #acf4a4 !important;
        }

        /* Toggle Button Styles */
        .toggle-btn.active {
            background-color: #ffffff !important;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            color: #206223 !important;
        }
        .dark-theme .toggle-btn.active {
            background-color: #232522 !important;
            color: #acf4a4 !important;
        }
        .toggle-btn:not(.active) {
            color: #94a3b8 !important;
        }
        /* Action Dropdown Styling */
        .action-container { position: relative; }
        .action-menu {
            position: absolute;
            top: calc(100% + 8px);
            right: 0;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            box-shadow: 0 10px 25px -5px rgba(0,0,0,0.1);
            width: 180px;
            display: none;
            z-index: 50;
        }
        .dark-theme .action-menu {
            background: #1a1c19;
            border-color: #2d3748;
        }
        .action-menu.show { display: block; }
        .action-item {
            padding: 10px 16px;
            font-size: 11px;
            font-weight: 500;
            color: #4a5568;
            cursor: pointer;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none !important;
        }
        .action-item:hover {
            background: #f8fafc;
            color: #206223;
        }
        .dark-theme .action-item:hover {
            background: #2d3748;
            color: #acf4a4;
        }
        .action-item:first-child { border-radius: 12px 12px 0 0; }
        .action-item:last-child { border-radius: 0 0 12px 12px; }

        /* DataTable Full Width Override */
        #inventoryTable_wrapper, 
        #inventoryTable_wrapper .dataTables_scrollHead table,
        #inventoryTable_wrapper .dataTables_scrollBody table {
            width: 100% !important;
        }

        /* Prediction Card Texture */
        .prediction-card {
            background-color: #206223;
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .prediction-card::after {
            content: '';
            position: absolute;
            top: 0; right: 0; bottom: 0; 
            width: 50%; /* Texture only on the right half */
            background-image: url('https://www.transparenttextures.com/patterns/leaf.png');
            background-color: rgba(0,0,0,0.05);
            opacity: 0.15;
            pointer-events: none;
        }

        /* Force backgrounds for dark mode */
        .dark-theme .bg-white { background-color: #232522 !important; }
        .dark-theme .bg-gray-50 { background-color: #1a1c19 !important; }
        .dark-theme .text-on-surface { color: #ffffff !important; }
        .dark-theme .border-gray-100 { border-color: #2d3748 !important; }

        @media print {
            .no-print { display: none !important; }
            .main-content { margin-left: 0 !important; padding: 0 !important; }
        }
    </style>
</head>
<body class="bg-background text-on-surface dark:bg-background-dark dark:text-gray-100 transition-colors duration-300">

    <!-- Modular Sidebar -->
    <?php include 'navigation.php'; ?>

    <!-- Modular Header -->
    <?php include 'header.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content" style="margin-left: 260px; padding-top: 80px;">
            <!-- Global Action Toolbar -->
            <div class="flex items-center justify-between mb-4 no-print">
                <a href="reports_overview.php" class="h-8 px-3 flex items-center gap-2 rounded-full bg-white dark:bg-surface-dark border border-gray-100 dark:border-gray-800 text-gray-500 hover:text-primary transition-all shadow-sm no-underline hover:no-underline">
                    <span class="material-symbols-outlined text-base">arrow_back</span>
                    <span class="text-[11px] font-headline font-medium">Back to Reports</span>
                </a>
                
                <div class="flex items-center gap-2">
                    <button onclick="window.print()" class="h-8 px-3 rounded-full bg-white dark:bg-surface-dark border border-gray-100 dark:border-gray-800 text-gray-500 hover:text-primary transition-all shadow-sm font-headline font-medium text-[11px] flex items-center gap-1.5 no-print">
                        <span class="material-symbols-outlined text-base">print</span>
                        Print
                    </button>
                    <div class="action-container">
                        <button id="actionBtn" class="h-8 px-3 rounded-full bg-white dark:bg-surface-dark border border-gray-100 dark:border-gray-800 text-gray-500 hover:text-primary transition-all shadow-sm font-headline font-medium text-[11px] flex items-center gap-1.5">
                            <span class="material-symbols-outlined text-base">settings</span>
                            Actions
                            <span class="material-symbols-outlined text-base">expand_more</span>
                        </button>
                        <div id="actionMenu" class="action-menu">
                            <a class="action-item"><span class="material-symbols-outlined text-base">ios_share</span> Export Excel</a>
                            <a class="action-item"><span class="material-symbols-outlined text-base">mail</span> Email Report</a>
                            <div class="h-[1px] bg-gray-100 dark:bg-gray-800 my-1"></div>
                            <a class="action-item text-red-600"><span class="material-symbols-outlined text-base">archive</span> Archive Record</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Overhead Label -->
            <p class="text-[10px] font-label uppercase tracking-widest text-[#795900] mb-2 font-bold">Stock Analysis</p>
            
            <!-- Page Title Section -->
            <div class="mb-4">
                <h1 class="text-lg md:text-xl font-headline font-medium text-[#1a1c19] dark:text-white leading-tight">Inventory Stock Levels</h1>
                <p class="text-[10px] md:text-xs text-on-surface-variant dark:text-gray-400 mt-1">Comprehensive Inventory Health and Consumption Audit</p>
            </div>

            <!-- Bento Summary Grid -->
            <div class="grid grid-cols-2 lg:grid-cols-4 gap-3 md:gap-4 mb-4">
                <!-- Raw Materials -->
                <div class="bg-white dark:bg-surface-dark p-3 md:p-4 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col justify-between overflow-hidden">
                    <div class="flex justify-between items-start mb-2 md:mb-4">
                        <div class="w-8 h-8 md:w-10 md:h-10 rounded-lg bg-green-50 dark:bg-green-900/20 flex items-center justify-center text-[#206223] dark:text-[#acf4a4]">
                            <span class="material-symbols-outlined text-xl md:text-2xl" style="font-variation-settings: 'FILL' 1;">eco</span>
                        </div>
                        <div class="text-right">
                            <p class="text-[7px] md:text-[8px] uppercase font-medium text-gray-400 tracking-tight mb-0.5 md:mb-1">Category Share</p>
                            <div class="flex flex-col items-end">
                                <p class="text-lg md:text-xl font-headline font-bold text-[#206223] dark:text-[#acf4a4] leading-none mb-1">58%</p>
                            </div>
                        </div>
                    </div>
                    <div class="mb-2 md:mb-3">
                        <p class="text-[8px] md:text-[9px] font-medium text-gray-500 uppercase tracking-widest mb-1 leading-tight">Dairy Meal Raw</p>
                        <div class="flex items-baseline gap-1">
                            <span class="text-2xl md:text-3xl font-headline font-extrabold dark:text-white">12.4</span>
                            <span class="text-[7px] md:text-[9px] font-bold text-gray-400 uppercase tracking-tighter">Tons</span>
                        </div>
                    </div>
                    <div class="h-1 w-full bg-gray-50 dark:bg-gray-800 rounded-full overflow-hidden">
                        <div class="h-full bg-[#206223] w-[58%]"></div>
                    </div>
                </div>

                <!-- Commercial Meals -->
                <div class="bg-white dark:bg-surface-dark p-3 md:p-4 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col justify-between overflow-hidden">
                    <div class="flex justify-between items-start mb-2 md:mb-4">
                        <div class="w-8 h-8 md:w-10 md:h-10 rounded-lg bg-amber-50 dark:bg-amber-900/20 flex items-center justify-center text-[#795900] dark:text-[#f8bd2a]">
                            <span class="material-symbols-outlined text-xl md:text-2xl" style="font-variation-settings: 'FILL' 1;">package_2</span>
                        </div>
                        <div class="text-right">
                            <p class="text-[7px] md:text-[8px] uppercase font-medium text-gray-400 tracking-tight mb-0.5 md:mb-1">Category Share</p>
                            <div class="flex flex-col items-end">
                                <p class="text-lg md:text-xl font-headline font-medium text-[#795900] dark:text-[#f8bd2a] leading-none mb-1">22%</p>
                            </div>
                        </div>
                    </div>
                    <div class="mb-2 md:mb-3">
                        <p class="text-[8px] md:text-[9px] font-medium text-gray-500 uppercase tracking-widest mb-1 leading-tight">Commercial Meals</p>
                        <div class="flex items-baseline gap-1">
                            <span class="text-2xl md:text-3xl font-headline font-extrabold dark:text-white">450</span>
                            <span class="text-[7px] md:text-[9px] font-bold text-gray-400 uppercase tracking-tighter">Bags</span>
                        </div>
                    </div>
                    <div class="h-1 w-full bg-gray-50 dark:bg-gray-800 rounded-full overflow-hidden">
                        <div class="h-full bg-[#795900] w-[22%]"></div>
                    </div>
                </div>

                <!-- Medical Supplies -->
                <div class="bg-white dark:bg-surface-dark p-3 md:p-4 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col justify-between overflow-hidden">
                    <div class="flex justify-between items-start mb-2 md:mb-4">
                        <div class="w-8 h-8 md:w-10 md:h-10 rounded-lg bg-red-50 dark:bg-red-900/20 flex items-center justify-center text-[#ba1a1a] dark:text-[#ffb4ab]">
                            <span class="material-symbols-outlined text-xl md:text-2xl" style="font-variation-settings: 'FILL' 1;">medical_services</span>
                        </div>
                        <div class="text-right">
                            <p class="text-[7px] md:text-[8px] uppercase font-medium text-gray-400 tracking-tight mb-0.5 md:mb-1">Category Share</p>
                            <div class="flex flex-col items-end">
                                <p class="text-lg md:text-xl font-headline font-medium text-[#ba1a1a] dark:text-[#ffb4ab] leading-none mb-1">12%</p>
                            </div>
                        </div>
                    </div>
                    <div class="mb-2 md:mb-3">
                        <p class="text-[8px] md:text-[9px] font-medium text-gray-500 uppercase tracking-widest mb-1 leading-tight">Medical Supplies</p>
                        <div class="flex items-baseline gap-1">
                            <span class="text-2xl md:text-3xl font-headline font-extrabold dark:text-white">84</span>
                            <span class="text-[7px] md:text-[9px] font-bold text-gray-400 uppercase tracking-tighter">Units</span>
                        </div>
                    </div>
                    <div class="h-1 w-full bg-gray-50 dark:bg-gray-800 rounded-full overflow-hidden">
                        <div class="h-full bg-[#ba1a1a] w-[12%]"></div>
                    </div>
                </div>

                <!-- Farm Utility -->
                <div class="bg-white dark:bg-surface-dark p-3 md:p-4 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col justify-between overflow-hidden">
                    <div class="flex justify-between items-start mb-2 md:mb-4">
                        <div class="w-8 h-8 md:w-10 md:h-10 rounded-lg bg-blue-50 dark:bg-blue-900/20 flex items-center justify-center text-[#0061a4] dark:text-[#d1e4ff]">
                            <span class="material-symbols-outlined text-xl md:text-2xl" style="font-variation-settings: 'FILL' 1;">construction</span>
                        </div>
                        <div class="text-right">
                            <p class="text-[7px] md:text-[8px] uppercase font-medium text-gray-400 tracking-tight mb-0.5 md:mb-1">Category Share</p>
                            <div class="flex flex-col items-end">
                                <p class="text-lg md:text-xl font-headline font-medium text-[#0061a4] dark:text-[#d1e4ff] leading-none mb-1">8%</p>
                            </div>
                        </div>
                    </div>
                    <div class="mb-2 md:mb-3">
                        <p class="text-[8px] md:text-[9px] font-medium text-gray-500 uppercase tracking-widest mb-1 leading-tight">Farm Utility</p>
                        <div class="flex items-baseline gap-1">
                            <span class="text-2xl md:text-3xl font-headline font-extrabold dark:text-white">156</span>
                            <span class="text-[7px] md:text-[9px] font-bold text-gray-400 uppercase tracking-tighter">Items</span>
                        </div>
                    </div>
                    <div class="h-1 w-full bg-gray-50 dark:bg-gray-800 rounded-full overflow-hidden">
                        <div class="h-full bg-[#0061a4] w-[8%]"></div>
                    </div>
                </div>
            </div>

            <!-- Main Stock Table Card -->
            <section class="bg-white dark:bg-surface-dark rounded-xl shadow-sm overflow-hidden border border-gray-100 dark:border-gray-800 mb-4">
                <div class="px-3 md:px-6 pt-2 pb-2">
                    <h2 class="font-headline font-medium text-lg dark:text-white">Inventory Stock List</h2>
                    <p class="text-[10px] md:text-xs text-on-surface-variant dark:text-gray-400">Real-time status of managed inventory assets.</p>
                </div>
                <!-- Custom Control Container for injection -->
                <div id="customControl" class="no-print">
                    <div class="flex p-0.5 bg-gray-50 dark:bg-gray-800/50 rounded-lg stock-toggle">
                        <button id="viewAll" class="toggle-btn px-2.5 py-1 text-[9px] sm:text-[11px] font-medium uppercase rounded-md transition-all active bg-white dark:bg-surface-dark shadow-sm text-primary dark:text-acf4a4">All</button>
                        <button id="viewLowStock" class="toggle-btn px-2.5 py-1 text-[9px] sm:text-[11px] font-medium uppercase rounded-md transition-all text-gray-400">Low Stock</button>
                    </div>
                </div>
                <div class="p-2 no-scrollbar">
                    <table class="w-full text-left" id="inventoryTable">
                        <thead class="bg-transparent">
                            <tr>
                                <th>Item Name</th>
                                <th>Category</th>
                                <th>Unit</th>
                                <th>Qty in Stock</th>
                                <th>Reorder Level</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-50 dark:divide-gray-800">
                            <?php 
                            $stockItems = [
                                ['Crushed Yellow Maize', 'Dairy Meal Raw Materials', 'Tons', '4.2', '2.5', 'SUFFICIENT'],
                                ['High-Protein Dairy Pellets', 'Complete Commercial Meals', '50kg Bags', '12', '20', 'LOW STOCK'],
                                ['Foot and Mouth Vaccines', 'Medical Supplies', 'Vials', '5', '10', 'LOW STOCK'],
                                ['Cotton Seed Cake', 'Dairy Meal Raw Materials', 'Tons', '0.0', '1.0', 'OUT OF STOCK'],
                                ['Nitrile Farm Gloves', 'General Supplies', 'Box (100ct)', '45', '10', 'SUFFICIENT'],
                                ['Molasses Liquid', 'Dairy Meal Raw Materials', 'Liters', '1,200', '400', 'SUFFICIENT']
                            ];
                            foreach($stockItems as $item): ?>
                            <tr class="hover:shadow-lg transition-all">
                                <td class="text-[#2d3748] dark:text-gray-200 font-medium"><?php echo $item[0]; ?></td>
                                <td class="text-[#718096] dark:text-gray-400"><?php echo $item[1]; ?></td>
                                <td class="text-[#a0aec0] dark:text-gray-500 text-[11px]"><?php echo $item[2]; ?></td>
                                <td class="text-qty"><span class="qty-font"><?php echo $item[3]; ?></span></td>
                                <td class="text-reorder"><span class="reorder-font"><?php echo $item[4]; ?></span></td>
                                <td class="text-status">
                                    <?php 
                                    $sClass = 'status-sufficient';
                                    if($item[5] == 'LOW STOCK') $sClass = 'status-low';
                                    if($item[5] == 'OUT OF STOCK') $sClass = 'status-out';
                                    ?>
                                    <div class="flex justify-end">
                                        <span class="status-pill <?php echo $sClass; ?>"><?php echo $item[5]; ?></span>
                                    </div>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </section>

            <!-- Horizontal Analytical Row -->
            <div class="grid grid-cols-1 lg:grid-cols-4 gap-8 mb-8">
                <!-- Prediction Profile (1/2 Screen) -->
                <div class="lg:col-span-2 prediction-card p-6 md:p-8 rounded-2xl shadow-xl min-h-[280px] flex flex-col justify-between">
                    <div class="relative z-10">
                        <p class="text-[10px] font-medium uppercase tracking-[0.2em] text-white/70 mb-4 font-label">Inventory Prediction</p>
                        <h2 class="text-xl md:text-2xl font-headline font-medium text-white leading-tight max-w-xl">
                            Critical reorder window opening for 'Dairy Meal Raw Materials' in 5 days.
                        </h2>
                    </div>
                    
                    <div class="mt-auto flex flex-col sm:flex-row items-center gap-8 relative z-10">
                        <div class="flex items-center gap-6">
                            <div class="flex flex-col">
                                <div class="flex items-baseline gap-2 text-white">
                                    <span class="text-3xl md:text-3xl font-headline font-medium leading-none">2.4</span>
                                    <span class="text-sm font-medium text-white/80 uppercase tracking-widest">T/wk</span>
                                </div>
                                <p class="text-[11px] font-medium text-white/70 uppercase tracking-widest mt-1">Consumption Rate</p>
                            </div>
                            <!-- Vertical Separator -->
                            <div class="h-10 w-[1px] bg-white/20"></div>
                        </div>

                        <button class="bg-white text-[#206223] px-6 py-2.5 rounded-lg font-headline font-medium text-[11px] shadow-lg hover:shadow-xl hover:scale-[1.02] transition-all no-print">
                            Generate Purchase Order
                        </button>
                    </div>
                </div>

                <!-- Consumption Velocity (1/4 Screen) -->
                <div class="lg:col-span-1 bg-white dark:bg-surface-dark p-6 md:p-6 rounded-2xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col">
                    <h3 class="text-xs font-headline font-medium dark:text-white mb-4 uppercase tracking-widest text-[#206223]/60 dark:text-[#acf4a4]/60">Most Consumed</h3>
                    <div class="space-y-4 flex-grow px-1">
                        <?php 
                        $consumptionData = [
                            ['Crushed Maize', 74, '#206223', '1.2 Tons/wk'],
                            ['Dairy Pellets', 62, '#795900', '18 Bags/wk'],
                            ['Molasses', 45, '#1d622b', '120 L/wk'],
                            ['Cotton Seed', 38, '#40493d', '0.8 Tons/wk'],
                            ['Sunflower Cake', 22, '#206223', '0.4 Tons/wk']
                        ];
                        foreach($consumptionData as $item): ?>
                        <div class="space-y-1">
                            <div class="flex justify-between items-end">
                                <div>
                                    <span class="text-[12px] font-medium text-gray-800 dark:text-gray-100 uppercase tracking-tight block leading-none"><?php echo $item[0]; ?></span>
                                    <span class="text-xs font-medium text-[#795900] dark:text-[#f8bd2a] leading-none mt-0.5 block"><?php echo $item[3]; ?></span>
                                </div>
                                <span class="text-sm font-medium text-[#1a1c19] dark:text-gray-100"><?php echo $item[1]; ?>%</span>
                            </div>
                            <div class="h-1 w-full bg-gray-50 dark:bg-gray-800 rounded-full overflow-hidden">
                                <div class="h-full rounded-full" style="width: <?php echo $item[1]; ?>%; background-color: <?php echo $item[2]; ?>;"></div>
                            </div>
                        </div>
                        <?php endforeach; ?>
                    </div>
                </div>

                <!-- Dead-Stock Terminal (1/4 Screen) -->
                <div class="lg:col-span-1 bg-white dark:bg-surface-dark p-6 md:p-6 rounded-2xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col">
                    <h3 class="text-xs font-headline font-medium dark:text-white mb-4 uppercase tracking-widest text-[#ba1a1a]/60 dark:text-[#ffb4ab]/60">Inactive Stock</h3>
                    <div class="space-y-4 flex-grow px-1">
                        <?php 
                        $deadStockData = [
                            ['Vaccines', 92, '#ba1a1a', '184d stale'],
                            ['Shears', 85, '#ba1a1a', '92d stale'],
                            ['Shavings', 78, '#ba1a1a', '64d stale'],
                            ['Bulk Fly Spray', 72, '#ba1a1a', '48d stale'],
                            ['Iodine Wash', 65, '#ba1a1a', '32d stale']
                        ];
                        foreach($deadStockData as $item): ?>
                        <div class="space-y-1">
                            <div class="flex justify-between items-end">
                                <div>
                                    <span class="text-[12px] font-medium text-gray-800 dark:text-gray-100 uppercase tracking-tight block leading-none"><?php echo $item[0]; ?></span>
                                    <span class="text-xs font-medium text-red-500/80 leading-none mt-0.5 block"><?php echo $item[3]; ?></span>
                                </div>
                                <span class="text-sm font-medium text-[#1a1c19] dark:text-gray-100"><?php echo $item[1]; ?>%</span>
                            </div>
                            <div class="h-1 w-full bg-gray-50 dark:bg-gray-800 rounded-full overflow-hidden">
                                <div class="h-full rounded-full" style="width: <?php echo $item[1]; ?>%; background-color: <?php echo $item[2]; ?>;"></div>
                            </div>
                        </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>

        </div>
    </main>

    <!-- Global Scripts -->
    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="../plugins/bootstrap.bundle.min.js"></script>
    
    <!-- DataTables JS -->
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap4.min.js"></script>

    <script src="../js/header.js"></script>
    <script src="../js/navigation.js"></script>

    <script>
        $(document).ready(function() {
            // Initialize Inventory DataTable
            let inventoryTable;
            if ($('#inventoryTable').length) {
                inventoryTable = $('#inventoryTable').DataTable({
                    responsive: true,
                    paging: true,
                    pageLength: 6,
                    searching: true,
                    info: true,
                    dom: '<"d-flex flex-row justify-content-between align-items-center px-2 px-md-6 py-2 flex-nowrap overflow-hidden w-100"f>tr<"d-flex justify-content-between align-items-center px-6 py-6 border-t border-gray-100 dark:border-gray-800"ip>',
                    initComplete: function() {
                        // Move the toggle into the filter row
                        $('#customControl').prependTo('.dataTables_filter').addClass('d-flex align-items-center mr-2 flex-shrink-0');
                        $('.dataTables_filter').addClass('d-flex flex-row flex-nowrap align-items-center flex-grow-1 min-w-0');
                        $('.dataTables_filter input').addClass('flex-grow-1 mr-0 text-[11px] h-8 min-w-0').css({
                            'width': '100%',
                            'margin-left': '8px'
                        });
                        $('.dataTables_filter label').addClass('d-flex flex-row flex-nowrap align-items-center mb-0 flex-grow-1 min-w-0');
                    },
                    columnDefs: [
                        { responsivePriority: 1, targets: 0 }, // Item Name
                        { responsivePriority: 2, targets: 3 }, // Qty in Stock
                        { responsivePriority: 3, targets: 5 }, // Status
                        { responsivePriority: 4, targets: 1 }, // Category
                        { responsivePriority: 5, targets: 2 }, // Unit
                        { responsivePriority: 6, targets: 4 }  // Reorder Level
                    ],
                    language: {
                        search: "",
                        searchPlaceholder: "Search records...",
                        info: "Showing _START_ to _END_ of _TOTAL_ items",
                        paginate: {
                            previous: '<span class="material-symbols-outlined" style="font-size: 1.25rem;">chevron_left</span>',
                            next: '<span class="material-symbols-outlined" style="font-size: 1.25rem;">chevron_right</span>'
                        }
                    }
                });
            }

            // Custom Filter for Low Stock
            $.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
                if (settings.nTable.id !== 'inventoryTable') return true;
                
                const filterType = $('.toggle-btn.active').attr('id');
                if (filterType === 'viewAll') return true;
                
                const status = data[5].toUpperCase();
                return status.includes('LOW STOCK') || status.includes('OUT OF STOCK');
            });

            // Toggle Interaction Logic
            $('.toggle-btn').on('click', function() {
                $('.toggle-btn').removeClass('active bg-white dark:bg-surface-dark shadow-sm text-primary dark:text-acf4a4 text-gray-400');
                $(this).addClass('active bg-white dark:bg-surface-dark shadow-sm text-primary dark:text-acf4a4');
                $('.toggle-btn:not(.active)').addClass('text-gray-400');
                inventoryTable.draw();
            });

            // Set initial state
            $('#viewAll').addClass('active');

            // Theme Sync
            const syncTheme = () => {
                const isDark = $('body').hasClass('dark-theme');
                $('html').toggleClass('dark', isDark);
            };
            syncTheme();
            new MutationObserver(syncTheme).observe(document.body, { attributes: true, attributeFilter: ['class'] });

            // Button Mock Interaction
            $('.status-pill').css('cursor', 'pointer');

            // Action Menu Trigger
            $('#actionBtn').on('click', function(e) {
                e.stopPropagation();
                $('#actionMenu').toggleClass('show');
            });

            $(document).on('click', function() {
                $('#actionMenu').removeClass('show');
            });
        });
    </script>
</body>
</html>
