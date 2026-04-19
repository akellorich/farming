<?php
/**
 * Jukam Dairy Management System - Individual Animal Health Card
 * File: views/animal_health_card.php
 * Ported from high-fidelity design: individual_animal_health_card
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Animal Health Card | Jukam Farm</title>
    
    <!-- Global Assets -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    <link rel="stylesheet" href="../css/reports.css">
    
    <!-- DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.4.0/css/responsive.bootstrap4.min.css"/>
    
    <!-- Design System - Tailwind (Requested for high-fidelity parity) -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script>
      tailwind.config = {
        darkMode: ["class", ".dark-theme"],
        theme: {
          extend: {
            colors: {
              "background": "#fafaf5",
              "surface-container-highest": "#e3e3de",
              "on-secondary-fixed": "#261a00",
              "inverse-primary": "#91d78a",
              "on-error-container": "#93000a",
              "surface-container-lowest": "#ffffff",
              "on-surface": "#1a1c19",
              "secondary-fixed-dim": "#f8bd2a",
              "secondary-fixed": "#ffdfa0",
              "on-error": "#ffffff",
              "primary-fixed": "#acf4a4",
              "on-secondary": "#ffffff",
              "on-primary-container": "#cbffc2",
              "tertiary": "#1d622b",
              "surface": "#fafaf5",
              "on-tertiary-fixed": "#002107",
              "secondary-container": "#fec330",
              "error-container": "#ffdad6",
              "outline": "#707a6c",
              "on-primary-fixed-variant": "#0c5216",
              "on-primary": "#ffffff",
              "inverse-surface": "#2f312e",
              "on-primary-fixed": "#002203",
              "primary-container": "#3a7b3a",
              "on-tertiary-fixed-variant": "#07521d",
              "surface-dim": "#dadad5",
              "surface-container-low": "#f4f4ef",
              "on-surface-variant": "#40493d",
              "on-secondary-container": "#6f5100",
              "surface-tint": "#2a6b2c",
              "tertiary-fixed-dim": "#90d792",
              "on-secondary-fixed-variant": "#5c4300",
              "primary-fixed-dim": "#91d78a",
              "on-background": "#1a1c19",
              "surface-container-high": "#e8e8e3",
              "surface-variant": "#e3e3de",
              "error": "#ba1a1a",
              "on-tertiary-container": "#c7ffc5",
              "tertiary-container": "#387b41",
              "outline-variant": "#bfcaba",
              "on-tertiary": "#ffffff",
              "tertiary-fixed": "#abf4ac",
              "surface-bright": "#fafaf5",
              "primary": "#206223",
              "surface-container": "#eeeee9",
              "secondary": "#795900",
              "inverse-on-surface": "#f1f1ec"
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
    
    <!-- Google Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Work+Sans:wght@300;400;500;600;700&family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">
    
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .bento-shadow {
            box-shadow: 0 4px 24px -2px rgba(26, 28, 25, 0.08);
        }
        /* Fix for system shell integration */
        .main-content {
            padding-top: 0 !important;
            background-color: #fafaf5;
        }
        .dark-theme .main-content {
            background-color: #1a1c19;
        }
        .sidebar { z-index: 100 !important; }
        header { z-index: 90 !important; }
        
        @media print {
            .no-print { display: none !important; }
            .main-content { margin-left: 0 !important; padding: 0 !important; }
            .sidebar, header { display: none !important; }
            body { background: white !important; }
        }
    </style>
</head>
<body class="bg-background dark:bg-[#1a1c19] text-on-surface dark:text-gray-100 font-body antialiased transition-colors duration-300">

    <!-- Modular Sidebar -->
    <?php include 'navigation.php'; ?>

    <!-- Modular Header -->
    <?php include 'header.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content">
        <!-- Breadcrumb / Back Button -->
        <div class="px-6 pt-20 no-print">
            <a href="reports_overview.php" class="inline-flex items-center gap-1.5 text-gray-400 dark:text-gray-500 hover:text-green-800 dark:hover:text-green-400 transition-all text-[13px] font-medium no-underline hover:no-underline">
                <span class="material-symbols-outlined text-base">arrow_back</span>
                Back to Reports
            </a>
        </div>

        <div class="pt-1 pb-12 px-0 min-h-screen">
            <div class="w-full px-2 lg:px-4 space-y-4">
                
                <!-- Animal Profile Header Section -->
                <div class="relative bg-white dark:bg-[#232522] rounded-2xl p-6 shadow-sm flex flex-col md:flex-row items-center gap-8 overflow-hidden border border-gray-100 dark:border-gray-800">
                    <div class="w-36 h-36 rounded-2xl overflow-hidden relative group shrink-0 border border-gray-100 dark:border-gray-800">
                        <img class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCT6d3mnwJjTkM-xctt0e4A_-a5OZSWabVHV0uIbD_igMm_7E-o9M4pTvfuHK6_dNbVdrQBQd1Ho6DrMHVsPKtP4k8japV3iduqu7COiVknZA1-pamRobIKNERrcHfbzu8zzUDRa7TrRuqVEKIfndxrKtQSdY4HCcUINt-QDQUzGf5a95WFBhM9YPg2d9haWeKc2uWLEfsK_oGzdiUic73CGls0Q32m03x7ognETgM70zT00H6XDghhzbDxzfhvMqBumt_TQpisd2oz" alt="Cow Profile">
                        <div class="absolute bottom-2 right-2 text-white text-[9px] px-2 py-0.5 rounded-full font-medium uppercase dark:bg-[#a5eca1] dark:text-[#002203]" style="background-color: #206223;">Active</div>
                    </div>

                    <div class="flex-1 space-y-4 text-center md:text-left">
                        <div>
                            <div class="flex flex-col md:flex-row md:items-center gap-2 md:gap-4 mb-2">
                                <h1 class="text-2xl font-extrabold font-headline dark:text-[#a5eca1]" style="color: #206223;">Bessie</h1>
                                <span class="bg-gray-100 dark:bg-gray-800 px-3 py-1 rounded-md font-mono text-[10px] text-on-surface-variant dark:text-gray-400 border border-gray-200 dark:border-gray-700">ID: JK-8821</span>
                            </div>
                            <div class="flex flex-wrap justify-center md:justify-start gap-x-6 gap-y-2 text-on-surface-variant dark:text-gray-400">
                                <div class="flex items-center gap-2">
                                    <span class="material-symbols-outlined text-sm text-gray-500 dark:text-gray-400">category</span>
                                    <span class="text-sm font-medium">Holstein Friesian</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <span class="material-symbols-outlined text-sm text-gray-500 dark:text-gray-400">calendar_today</span>
                                    <span class="text-sm font-medium">Born: 14 May 2019</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <span class="material-symbols-outlined text-sm text-gray-500 dark:text-gray-400">location_on</span>
                                    <span class="text-sm font-medium">Barn Block A, Stall 14</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="flex flex-wrap gap-2 justify-center md:justify-start no-print">
                            <button onclick="window.print()" class="text-white px-4 py-2 rounded-lg text-xs font-medium flex items-center gap-2 hover:opacity-90 transition-all shadow-sm active:scale-95" style="background-color: #206223;">
                                <span class="material-symbols-outlined text-sm" style="font-variation-settings: 'FILL' 1;">print</span>
                                Print Health Card
                            </button>
                            <div class="relative group">
                                <button class="bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 text-on-surface dark:text-white px-4 py-2 rounded-lg text-xs font-medium flex items-center gap-2 hover:bg-gray-50 dark:hover:bg-gray-750 transition-colors">
                                    Actions
                                    <span class="material-symbols-outlined text-sm">expand_more</span>
                                </button>
                                <div class="absolute top-full left-0 mt-2 w-48 bg-white dark:bg-gray-800 rounded-xl shadow-xl border border-gray-100 dark:border-gray-700 hidden group-hover:block z-10 overflow-hidden">
                                    <div class="py-1">
                                        <a href="#" class="flex items-center gap-3 px-4 py-3 text-sm hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors dark:text-gray-300">
                                            <span class="material-symbols-outlined text-gray-400">picture_as_pdf</span> Export PDF
                                        </a>
                                        <a href="#" class="flex items-center gap-3 px-4 py-3 text-sm hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors dark:text-gray-300">
                                            <span class="material-symbols-outlined text-gray-400">mail</span> Email Record
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="hidden lg:flex flex-col items-end gap-1 text-right">
                        <span class="text-[10px] font-bold uppercase tracking-widest text-gray-400 dark:text-gray-500 mb-2">CURRENT YIELD</span>
                        <div class="text-3xl font-black font-headline dark:text-[#a5eca1]" style="color: #206223;">32.4 <span class="text-sm font-medium text-gray-400 dark:text-gray-600">L/day</span></div>
                        <div class="h-8 w-32 flex items-end gap-1 mt-2">
                            <div class="flex-1 bg-primary/10 dark:bg-primary/20 h-3 rounded-sm"></div>
                            <div class="flex-1 bg-primary/20 dark:bg-primary/30 h-4 rounded-sm"></div>
                            <div class="flex-1 bg-primary/40 dark:bg-primary/50 h-7 rounded-sm"></div>
                            <div class="flex-1 bg-primary/20 dark:bg-primary/30 h-5 rounded-sm"></div>
                            <div class="flex-1 h-8 rounded-sm dark:bg-[#a5eca1]" style="background-color: #206223;"></div>
                        </div>
                    </div>
                </div>

                <!-- Health Summary Cards (Asymmetric Bento Grid) -->
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <!-- Status -->
                    <div class="bg-[#abf4ac] dark:bg-[#1a381c] rounded-2xl p-6 shadow-sm flex flex-col justify-between min-h-[140px]">
                        <span class="text-[10px] font-bold uppercase tracking-widest text-[#002107] dark:text-[#abf4ac]">GENERAL HEALTH STATUS</span>
                        <div class="mt-2 flex items-center gap-3">
                            <span class="material-symbols-outlined text-3xl text-[#002107] dark:text-[#abf4ac]" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                            <span class="text-xl font-black font-headline text-[#002107] dark:text-[#abf4ac]">Excellent</span>
                        </div>
                        <p class="mt-2 text-[10px] font-medium text-[#002107]/60 dark:text-[#abf4ac]/60 leading-tight">Last physical exam: 3 days ago</p>
                    </div>

                    <!-- Incidents -->
                    <div class="bg-white dark:bg-[#232522] rounded-2xl p-6 shadow-sm flex flex-col justify-between border border-gray-100 dark:border-gray-800">
                        <span class="text-[10px] font-bold uppercase tracking-widest text-gray-400 dark:text-gray-500">TOTAL INCIDENTS (YTD)</span>
                        <div>
                            <div class="mt-2 text-3xl font-black font-headline text-on-surface dark:text-white">02</div>
                            <div class="mt-1 flex items-center gap-1 text-[10px] text-green-600 dark:text-green-400 font-bold">
                                <span class="material-symbols-outlined text-sm">trending_down</span>
                                <span>-40% from last year</span>
                            </div>
                        </div>
                    </div>

                    <!-- Last Treatment -->
                    <div class="bg-white dark:bg-[#232522] rounded-2xl p-6 shadow-sm flex flex-col justify-between border border-gray-100 dark:border-gray-800">
                        <span class="text-[10px] font-bold uppercase tracking-widest text-gray-400 dark:text-gray-500">LAST TREATMENT DATE</span>
                        <div>
                            <div class="mt-2 text-lg font-bold font-headline text-on-surface dark:text-white">Sept 12, 2023</div>
                            <div class="mt-1 flex items-center gap-2">
                                <span class="w-2.5 h-2.5 rounded-full bg-yellow-400"></span>
                                <span class="text-[10px] text-on-surface dark:text-gray-300 font-medium">Vitamin Supplementation</span>
                            </div>
                        </div>
                    </div>

                    <!-- Vaccination -->
                    <div class="bg-[#fec330] dark:bg-[#4b3d00] rounded-2xl p-6 shadow-sm flex flex-col justify-between border border-yellow-200 dark:border-[#6f5100]">
                        <div class="flex justify-between items-start">
                            <span class="text-[10px] font-bold uppercase tracking-widest text-[#6f5100] dark:text-[#fec330]">VACCINATION STATUS</span>
                            <span class="material-symbols-outlined text-[#6f5100] dark:text-[#fec330]" style="font-size: 1.25rem;">vaccines</span>
                        </div>
                        <div class="mt-2">
                            <span class="text-xl font-black font-headline text-[#6f5100] dark:text-[#fec330] tracking-tighter">COMPLETE</span>
                            <div class="w-full bg-[#6f5100]/20 dark:bg-black/20 h-1.5 rounded-full mt-2 overflow-hidden">
                                <div class="bg-[#6f5100] dark:bg-[#fec330] h-full w-full rounded-full"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Health Records Table -->
                <div class="bg-white dark:bg-[#232522] rounded-2xl shadow-sm overflow-hidden border border-gray-100 dark:border-gray-800">
                    <div class="px-6 py-4 flex flex-col md:flex-row justify-between items-center gap-4 border-b border-gray-50 dark:border-gray-800">
                        <h3 class="text-md font-extrabold font-headline dark:text-[#a5eca1]" style="color: #206223 !important;">Detailed Health Records</h3>
                        <div class="flex items-center gap-4 w-full md:w-auto no-print">
                            <div class="relative flex items-center">
                                <span class="material-symbols-outlined absolute left-3 text-gray-400 text-sm">search</span>
                                <input id="recordSearch" class="bg-gray-50 dark:bg-gray-900 border-none rounded-lg pl-10 pr-4 py-2 text-xs focus:ring-1 focus:ring-green-800/20 w-48 dark:text-white" placeholder="Search records..." type="text">
                            </div>
                        </div>
                    </div>

                    <div class="">
                        <table class="w-full border-collapse text-left" id="animalHealthRecords">
                            <thead class="bg-gray-50/50 dark:bg-gray-900/50">
                                <tr>
                                    <th class="px-6 py-3 text-[10px] font-bold uppercase tracking-widest text-gray-400 dark:text-gray-500">DATE</th>
                                    <th class="px-6 py-3 text-[10px] font-bold uppercase tracking-widest text-gray-400 dark:text-gray-500">DISEASE/CONDITION</th>
                                    <th class="px-6 py-3 text-[10px] font-bold uppercase tracking-widest text-gray-400 dark:text-gray-500">TREATMENT PLAN</th>
                                    <th class="px-6 py-3 text-[10px] font-bold uppercase tracking-widest text-gray-400 dark:text-gray-500">ADMINISTRATOR</th>
                                    <th class="px-6 py-3 text-[10px] font-bold uppercase tracking-widest text-gray-400 dark:text-gray-500">STATUS</th>
                                    <th class="px-6 py-3 no-print"></th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-50 dark:divide-gray-800">
                                <!-- Entry 1 -->
                                <tr class="hover:bg-gray-50/30 dark:hover:bg-gray-800/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600 dark:text-gray-400">Sep 12, 2023</td>
                                    <td class="px-6 py-3">
                                        <div class="flex flex-col">
                                            <span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">Mild Milk Fever</span>
                                            <span class="text-[9px] text-gray-400 dark:text-gray-600 font-bold uppercase tracking-tighter">METABOLIC</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-3">
                                        <div class="flex flex-col">
                                            <span class="text-sm italic text-gray-600 dark:text-gray-400">Calcium Supplement (Oral)</span>
                                            <span class="text-[11px] text-gray-400 dark:text-gray-600">400g dose, immediate response</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-3 text-sm text-gray-600 dark:text-gray-400">Dr. Sarah Mwangi</td>
                                    <td class="px-6 py-3">
                                        <span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 dark:bg-green-900/30 text-green-800 dark:text-green-400 text-[10px] font-bold uppercase tracking-tighter">
                                            Recovered
                                        </span>
                                    </td>
                                    <td class="px-6 py-3 text-right no-print">
                                        <button class="material-symbols-outlined text-gray-400 hover:text-green-800 translation-all">chevron_right</button>
                                    </td>
                                </tr>
                                <!-- Entry 2 -->
                                <tr class="hover:bg-gray-50/30 dark:hover:bg-gray-800/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600 dark:text-gray-400">Aug 28, 2023</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">Routine Checkup</span><span class="text-[9px] text-gray-400 dark:text-gray-600 font-bold uppercase tracking-tighter">GENERAL</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600 dark:text-gray-400">Height & Weight Check</span><span class="text-[11px] text-gray-400 dark:text-gray-600">Weight: 540kg. Optimal.</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600 dark:text-gray-400">J. Kamau</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 dark:bg-green-900/30 text-green-800 dark:text-green-400 text-[10px] font-bold uppercase tracking-tighter">Healthy</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                                <tr class="hover:bg-gray-50/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600">July 15, 2023</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">FMD Booster</span><span class="text-[9px] text-gray-400 dark:text-gray-600 font-bold uppercase tracking-tighter">VACCINATION</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600">Administered via IM</span><span class="text-[11px] text-gray-400">Next due in 6 months.</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600">Vet Omari</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 text-green-800 text-[10px] font-bold uppercase tracking-tighter">Completed</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                                <tr class="hover:bg-gray-50/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600">June 04, 2023</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">Bovine Respiratory Disease</span><span class="text-[9px] text-gray-400 dark:text-gray-600 font-bold uppercase tracking-tighter">INFECTIOUS</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600">Penicillin Course (5 days)</span><span class="text-[11px] text-gray-400">Managed in isolation unit B</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600">James Kamau</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 text-green-800 text-[10px] font-bold uppercase tracking-tighter">Recovered</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                                <tr class="hover:bg-gray-50/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600">May 12, 2023</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">Minor Hoof Trim</span><span class="text-[9px] text-gray-400 font-bold uppercase tracking-tighter">MAINTENANCE</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600">Standard corrective trim</span><span class="text-[11px] text-gray-400">Rear-right hoof, normal wear.</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600">J. Kamau</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 text-green-800 text-[10px] font-bold uppercase tracking-tighter">Finished</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                                <tr class="hover:bg-gray-50/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600">April 20, 2023</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">Deworming Cycle</span><span class="text-[9px] text-gray-400 font-bold uppercase tracking-tighter">PREVENTATIVE</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600">Ivomec Injection</span><span class="text-[11px] text-gray-400">Full herd standard cycle.</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600">Dr. Mwangi</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 text-green-800 text-[10px] font-bold uppercase tracking-tighter">Done</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                                <tr class="hover:bg-gray-50/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600">March 05, 2023</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">Tick Fever Check</span><span class="text-[9px] text-gray-400 font-bold uppercase tracking-tighter">CLINICAL</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600">Blood smear negative</span><span class="text-[11px] text-gray-400">Observation only, no symptoms.</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600">Vet Omari</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 text-green-800 text-[10px] font-bold uppercase tracking-tighter">Clear</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                                <tr class="hover:bg-gray-50/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600">Feb 14, 2023</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">BVD Vaccination</span><span class="text-[9px] text-gray-400 font-bold uppercase tracking-tighter">PREVENTATIVE</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600">Annual BVD Booster</span><span class="text-[11px] text-gray-400">Administered subcutaneous.</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600">James Kamau</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 text-green-800 text-[10px] font-bold uppercase tracking-tighter">Complete</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                                <tr class="hover:bg-gray-50/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600">Jan 18, 2023</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">Routine Vaccination</span><span class="text-[9px] text-gray-400 font-bold uppercase tracking-tighter">PREVENTATIVE</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600">Anthrax & Black Quarter</span><span class="text-[11px] text-gray-400">Annual booster dose</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600">Vet Assist Omari</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 text-green-800 text-[10px] font-bold uppercase tracking-tighter">Completed</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                                <tr class="hover:bg-gray-50/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600">Dec 05, 2022</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">Weight Assessment</span><span class="text-[9px] text-gray-400 font-bold uppercase tracking-tighter">LOGISTIC</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600">Monthly group weight</span><span class="text-[11px] text-gray-400">Weight: 520kg (+20kg).</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600">James Kamau</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 text-green-800 text-[10px] font-bold uppercase tracking-tighter">Logged</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                                <tr class="hover:bg-gray-50/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600">Nov 12, 2022</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">Eye Inflammation</span><span class="text-[9px] text-gray-400 font-bold uppercase tracking-tighter">CLINICAL</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600">Terramycin Eye Powder</span><span class="text-[11px] text-gray-400">Cleared in 3 days.</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600">Dr. Mwangi</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 text-green-800 text-[10px] font-bold uppercase tracking-tighter">Recovered</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                                <tr class="hover:bg-gray-50/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600">Oct 24, 2022</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">Internal Worm Check</span><span class="text-[9px] text-gray-400 font-bold uppercase tracking-tighter">LABORATORY</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600">Fecal count low</span><span class="text-[11px] text-gray-400">No treatment needed.</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600">Vet Omari</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 text-green-800 text-[10px] font-bold uppercase tracking-tighter">Healthy</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                                <tr class="hover:bg-gray-50/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600">Sept 10, 2022</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">Mastitis Screening</span><span class="text-[9px] text-gray-400 font-bold uppercase tracking-tighter">PREVENTATIVE</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600">CMT test completed</span><span class="text-[11px] text-gray-400">All quarters negative.</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600">James Kamau</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 text-green-800 text-[10px] font-bold uppercase tracking-tighter">Clear</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                                <tr class="hover:bg-gray-50/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600">Aug 15, 2022</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">LSD Vaccination</span><span class="text-[9px] text-gray-400 font-bold uppercase tracking-tighter">VACCINATION</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600">Annual Lumpy Skin Disease</span><span class="text-[11px] text-gray-400">Institutional cycle booster.</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600">Vet Omari</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 text-green-800 text-[10px] font-bold uppercase tracking-tighter">Done</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                                <tr class="hover:bg-gray-50/30 transition-colors">
                                    <td class="px-6 py-3 text-sm font-medium text-gray-600">July 01, 2022</td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm font-bold dark:text-[#a5eca1]" style="color: #206223;">First Record Entry</span><span class="text-[9px] text-gray-400 font-bold uppercase tracking-tighter">SYSTEM</span></div></td>
                                    <td class="px-6 py-3"><div class="flex flex-col"><span class="text-sm italic text-gray-600">Animal digitized</span><span class="text-[11px] text-gray-400">Full profile migration.</span></div></td>
                                    <td class="px-6 py-3 text-sm text-gray-600">System Admin</td>
                                    <td class="px-6 py-3"><span class="inline-flex items-center px-4 py-1 rounded-full bg-green-100 text-green-800 text-[10px] font-bold uppercase tracking-tighter">Verified</span></td>
                                    <td class="px-6 py-3 text-right no-print"><button class="material-symbols-outlined text-gray-400">chevron_right</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Footer Section -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="bg-white dark:bg-[#232522] p-6 rounded-2xl shadow-sm border-l-4 border-[#795900] dark:border-[#5c4300] flex flex-col justify-center">
                        <div class="flex gap-6">
                            <span class="material-symbols-outlined text-[#795900] dark:text-[#f8bd2a] text-4xl" style="font-variation-settings: 'FILL' 1;">calendar_today</span>
                            <div class="space-y-4">
                                <h4 class="font-extrabold text-md text-gray-800 dark:text-white">Next Scheduled Checkup</h4>
                                <p class="text-sm text-gray-500 dark:text-gray-400 leading-relaxed">Prenatal screening and routine foot trimming scheduled for October 22nd.</p>
                                <div class="flex gap-6 no-print">
                                    <button class="text-[13px] font-bold text-[#795900] dark:text-[#f8bd2a] uppercase tracking-widest hover:no-underline hover:opacity-70">RESCHEDULE</button>
                                    <button class="text-[13px] font-bold text-gray-400 dark:text-gray-600 uppercase tracking-widest hover:no-underline hover:text-gray-600">DISMISS</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="bg-[#206223] p-6 rounded-2xl shadow-sm text-white relative overflow-hidden group">
                        <div class="relative z-10 space-y-4">
                            <h4 class="font-extrabold text-lg">Genetic Health Index</h4>
                            <p class="text-sm opacity-90 leading-relaxed max-w-sm text-white">Bessie's health lineage shows high resistance to typical climatic stresses. Recommended for the upcoming cycle.</p>
                            <button class="bg-white px-5 py-2 rounded-lg text-[10px] font-bold uppercase tracking-widest hover:bg-gray-100 transition-colors no-print" style="color: #206223;">
                                VIEW PEDIGREE DATA
                            </button>
                        </div>
                        <span class="material-symbols-outlined absolute -bottom-8 -right-8 text-7xl opacity-10 rotate-12" style="font-size: 8rem;">dna</span>
                    </div>
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
    
    <script>
        $(document).ready(function() {
            // High-density DataTable initialization
            const table = $('#animalHealthRecords').DataTable({
                responsive: true,
                paging: true,
                pageLength: 10,
                searching: true,
                info: true,
                dom: 'tr<"d-flex justify-content-between align-items-center p-4 border-t border-gray-50"ip>',
                language: {
                    paginate: {
                        previous: '<span class="material-symbols-outlined" style="font-size: 1.25rem;">chevron_left</span>',
                        next: '<span class="material-symbols-outlined" style="font-size: 1.25rem;">chevron_right</span>'
                    }
                }
            });

            // Connect external search field
            $('#recordSearch').on('keyup', function() {
                table.search(this.value).draw();
            });
        });
    </script>
</body>
</html>
