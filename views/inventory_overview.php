<?php
/**
 * Jukam Dairy Management System - Inventory Overview
 * File: views/inventory_overview.php
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management | Jukam Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    <link rel="stylesheet" href="../css/inventory.css">
    <link rel="stylesheet" href="../css/alert.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.4.0/css/responsive.bootstrap4.min.css"/>
    
    <!-- Google Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Work+Sans:wght@300;400;500;600;700&family=Space+Grotesk:wght@300;400;500;600;700&family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">

    <style>
        .inventory-page-title {
            font-family: 'Manrope', sans-serif;
            letter-spacing: -0.02em;
        }

        /* Custom Icon Select Styles */
        .custom-icon-select-wrapper {
            position: relative;
            width: 100%;
        }

        .custom-icon-select-trigger {
            align-items: center;
            padding: 0.75rem 1rem;
            background: white;
            border: 1.5px solid #e2e8f0;
            border-radius: 0.5rem;
            cursor: pointer;
            transition: all 0.2s;
            height: 52px;
        }

        .custom-icon-select-trigger:hover {
            border-color: #206223;
        }

        .custom-icon-options-container {
            position: absolute;
            top: calc(100% + 5px);
            left: 0;
            width: 100%;
            background: #f8fafc; /* Slightly darker background */
            border: 1px solid #e2e8f0;
            border-radius: 0.75rem;
            z-index: 2000;
            max-height: 250px;
            overflow-y: auto;
            display: none;
            padding: 0.5rem;
        }

        .custom-icon-options-container.show {
            display: block;
            animation: slideIn 0.2s ease-out;
        }

        .icon-option {
            display: flex;
            align-items: center;
            padding: 0.65rem 1rem;
            border-radius: 0.5rem;
            cursor: pointer;
            transition: all 0.15s;
            gap: 12px;
            color: #475569;
            font-size: 0.9rem;
        }

        .icon-option:hover {
            background-color: #f1f5f9;
            color: #206223;
        }

        .icon-option.active {
            background-color: #ecf3ec;
            color: #206223;
            font-weight: 600;
        }

        .icon-option .material-symbols-outlined {
            font-size: 20px;
            opacity: 0.7;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .btn-add-asset {
            background: linear-gradient(135deg, #206223 0%, #3a7b3a 100%);
            border: none;
            border-radius: 0.5rem;
            font-weight: 400;
            padding: 0.75rem 1.5rem;
            color: white;
            transition: all 0.3s;
        }
        .btn-add-asset:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(32, 98, 35, 0.2);
            color: white;
        }
    </style>
</head>
<body class="bg-background">

    <!-- Modular Sidebar -->
    <?php include 'navigation.php'; ?>

    <!-- Modular Header -->
    <?php include 'header.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content">
        <div class="container-fluid pt-1 px-3">
            <!-- Header Section -->
            <div class="row align-items-end mb-3 mt-2">
                <div class="col">
                    <span class="text-xs uppercase tracking-[0.2rem] font-bold font-label d-block mb-1" style="font-size: 0.75rem; color: #795900; text-transform: uppercase;">OVERVIEW</span>
                    <h2 class="font-headline font-weight-bold text-on-surface mb-0 inventory-page-title">
                        Farm Assets
                    </h2>
                </div>
                <div class="col-auto">
                    <button class="btn btn-add-asset d-flex align-items-center gap-2 shadow-sm" id="addNewItemBtn" style="padding: 0.5rem 1rem; font-size: 0.8rem;">
                        <span class="material-symbols-outlined" style="font-size: 1.1rem;">add</span>
                        <span>Add New Category</span>
                    </button>
                </div>
            </div>

            <!-- Summary Cards -->
            <div class="inventory-grid">
                <!-- Total Value -->
                <div class="inventory-stat-card botanical-shadow-sm">
                    <span class="material-symbols-outlined inventory-card-icon">payments</span>
                    <p class="inventory-stat-label">TOTAL INVENTORY VALUE</p>
                    <h4 class="inventory-stat-value" id="totalInventoryValue">0.00</h4>
                    <div class="inventory-stat-desc d-flex align-items-center gap-2 text-success font-weight-medium">
                        <span class="material-symbols-outlined" style="font-size: 1rem;">trending_up</span>
                        <span>0% vs last month</span>
                    </div>
                </div>

                <!-- Low Stock -->
                <div class="inventory-stat-card botanical-shadow-sm">
                    <span class="material-symbols-outlined inventory-card-icon" style="color: #795900;">warning</span>
                    <p class="inventory-stat-label" style="color: #5c4300;">LOW STOCK ITEMS</p>
                    <h4 class="inventory-stat-value" style="color: #795900;" id="lowStockCount">0</h4>
                    <div class="inventory-stat-desc d-flex align-items-center gap-2 font-weight-medium" style="color: #795900;">
                        <span class="material-symbols-outlined" style="font-size: 1rem;">error</span>
                        <span>Needs reorder</span>
                    </div>
                </div>

                <!-- Categories -->
                <div class="inventory-stat-card botanical-shadow-sm">
                    <span class="material-symbols-outlined inventory-card-icon">category</span>
                    <p class="inventory-stat-label">CATEGORIES COUNT</p>
                    <h4 class="inventory-stat-value" id="categoryCount">0</h4>
                    <div class="inventory-stat-desc d-flex align-items-center gap-2 text-muted font-weight-medium">
                        <span class="material-symbols-outlined" style="font-size: 1rem;">list_alt</span>
                        <span>Active segments</span>
                    </div>
                </div>
            </div>

            <!-- Browse by Category -->
            <div class="mb-3">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h4 class="category-section-title">Browse by Category</h4>
                    <a href="#" class="category-section-link d-flex align-items-center gap-2">
                        View All Categories 
                        <span class="material-symbols-outlined" style="font-size: 1.1rem; margin-left: 4px;">arrow_forward</span>
                    </a>
                </div>
                
                <div class="category-grid" id="categoryGrid">
                    <!-- Categories will be populated here -->
                </div>
            </div>

            <!-- Stock Inventory List Table -->
            <div class="inventory-table-card botanical-shadow-sm mb-3">
                <div class="inventory-table-header flex-column align-items-stretch p-3">
                    <div class="inventory-title-row d-flex justify-content-between align-items-center mb-1">
                        <h4 class="table-section-title mb-0">Stock Inventory List</h4>
                    </div>
                    
                    <div class="inventory-filters-row d-flex flex-wrap">
                        <select class="inventory-select-sm flex-fill" id="inventoryCategoryFilter">
                            <option>All Categories</option>
                        </select>
                        <select class="inventory-select-sm flex-fill">
                            <option>All Status</option>
                        </select>
                    </div>
                    
                    <div class="inventory-actions-row d-flex align-items-center gap-2 w-100">
                        <div class="flex-grow-1">
                            <input type="text" class="form-control inventory-pill-search" placeholder="Search items..." id="inventorySearch">
                        </div>
                        <div class="d-flex align-items-center gap-2">
                            <button class="btn btn-export-excel d-flex align-items-center gap-1">
                                <span class="material-symbols-outlined" style="font-size: 1.1rem;">download</span>
                                Excel
                            </button>
                            <button class="btn btn-export-print d-flex align-items-center gap-1">
                                <span class="material-symbols-outlined" style="font-size: 1.1rem;">print</span>
                                Print
                            </button>
                            <button class="btn btn-success d-flex align-items-center gap-1 flex-shrink-0" id="addAssetBtn" style="height: 38px;">
                                <span class="material-symbols-outlined" style="font-size: 1.2rem;">add</span>
                                <span>Add Asset</span>
                            </button>
                        </div>
                    </div>
                </div>

                
                <div class="inventory-table-container">
                    <table class="table inventory-table mb-0 w-100" id="inventoryDataTable" style="width: 100% !important;">
                        <thead>
                            <tr>
                                <th>SKU / ID</th>
                                <th>NAME</th>
                                <th>CATEGORY</th>
                                <th>UoM</th>
                                <th>UNIT PRICE</th>
                                <th>STOCK QTY</th>
                                <th>STOCK VALUE</th>
                                <th class="text-right">ACTIONS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Item 1: Feed -->
                            <tr>
                                <td><span class="sku-text font-weight-bold text-success" style="font-size: 0.85rem; font-family: 'Space Grotesk', sans-serif;">FEED-DP-18</span></td>
                                <td><span class="font-weight-bold text-dark" style="font-size: 0.9rem;">Dairy Pellets 18%</span></td>
                                <td><span class="text-muted" style="font-size: 0.85rem;">Animal Feed</span></td>
                                <td><span class="text-muted">50kg Bag</span></td>
                                <td><span class="text-dark">KES 2,450</span></td>
                                <td><span class="text-success">45</span></td>
                                <td><span class="text-dark">KES 110,250</span></td>
                                <td class="text-right">
                                    <div class="actions-container">
                                        <button class="btn-action-rounded" onclick="toggleActionMenu(event, this)">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="actions-dropdown botanical-shadow">
                                            <button class="action-menu-item"><span class="material-symbols-outlined">edit</span> Edit Item</button>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">shopping_cart</span> Reorder Stock</button>
                                            <div class="dropdown-divider my-1"></div>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">description</span> View Statement</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Item 2: Medication -->
                            <tr>
                                <td><span class="sku-text font-weight-bold text-success" style="font-size: 0.85rem; font-family: 'Space Grotesk', sans-serif;">MED-FMV-22</span></td>
                                <td><span class="font-weight-bold text-dark" style="font-size: 0.9rem;">Foot & Mouth Vaccine</span></td>
                                <td><span class="text-muted" style="font-size: 0.85rem;">Medical Supplies</span></td>
                                <td><span class="text-muted">100ml Vial</span></td>
                                <td><span class="text-dark">KES 1,200</span></td>
                                <td><span class="text-warning">12</span></td>
                                <td><span class="text-dark">KES 14,400</span></td>
                                <td class="text-right">
                                    <div class="actions-container">
                                        <button class="btn-action-rounded" onclick="toggleActionMenu(event, this)">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="actions-dropdown botanical-shadow">
                                            <button class="action-menu-item"><span class="material-symbols-outlined">edit</span> Edit Item</button>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">shopping_cart</span> Reorder Stock</button>
                                            <div class="dropdown-divider my-1"></div>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">description</span> View Statement</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Item 3: Equipment -->
                            <tr>
                                <td><span class="sku-text font-weight-bold text-success" style="font-size: 0.85rem; font-family: 'Space Grotesk', sans-serif;">EQU-MLK-P</span></td>
                                <td><span class="font-weight-bold text-dark" style="font-size: 0.9rem;">Milking Pump (Heavy)</span></td>
                                <td><span class="text-muted" style="font-size: 0.85rem;">Equipment</span></td>
                                <td><span class="text-muted">Unit</span></td>
                                <td><span class="text-dark">KES 45,000</span></td>
                                <td><span class="text-success">4</span></td>
                                <td><span class="text-dark">KES 180,000</span></td>
                                <td class="text-right">
                                    <div class="actions-container">
                                        <button class="btn-action-rounded" onclick="toggleActionMenu(event, this)">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="actions-dropdown botanical-shadow">
                                            <button class="action-menu-item"><span class="material-symbols-outlined">edit</span> Edit Item</button>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">shopping_cart</span> Reorder Stock</button>
                                            <div class="dropdown-divider my-1"></div>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">description</span> View Statement</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Item 4: Maintenance -->
                            <tr>
                                <td><span class="sku-text font-weight-bold text-success" style="font-size: 0.85rem; font-family: 'Space Grotesk', sans-serif;">MNT-OIL-01</span></td>
                                <td><span class="font-weight-bold text-dark" style="font-size: 0.9rem;">Machine Lubricant</span></td>
                                <td><span class="text-muted" style="font-size: 0.85rem;">Maintenance</span></td>
                                <td><span class="text-muted">5L Jerrycan</span></td>
                                <td><span class="text-dark">KES 3,200</span></td>
                                <td><span class="text-success">15</span></td>
                                <td><span class="text-dark">KES 48,000</span></td>
                                <td class="text-right">
                                    <div class="actions-container">
                                        <button class="btn-action-rounded" onclick="toggleActionMenu(event, this)">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="actions-dropdown botanical-shadow">
                                            <button class="action-menu-item"><span class="material-symbols-outlined">edit</span> Edit Item</button>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">shopping_cart</span> Reorder Stock</button>
                                            <div class="dropdown-divider my-1"></div>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">description</span> View Statement</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Item 5: Feed -->
                            <tr>
                                <td><span class="sku-text font-weight-bold text-success" style="font-size: 0.85rem; font-family: 'Space Grotesk', sans-serif;">FEED-MC-50</span></td>
                                <td><span class="font-weight-bold text-dark" style="font-size: 0.9rem;">Maize Germ Extra</span></td>
                                <td><span class="text-muted" style="font-size: 0.85rem;">Animal Feed</span></td>
                                <td><span class="text-muted">50kg Bag</span></td>
                                <td><span class="text-dark">KES 1,850</span></td>
                                <td><span class="text-success">60</span></td>
                                <td><span class="text-dark">KES 111,000</span></td>
                                <td class="text-right">
                                    <div class="actions-container">
                                        <button class="btn-action-rounded" onclick="toggleActionMenu(event, this)">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="actions-dropdown botanical-shadow">
                                            <button class="action-menu-item"><span class="material-symbols-outlined">edit</span> Edit Item</button>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">shopping_cart</span> Reorder Stock</button>
                                            <div class="dropdown-divider my-1"></div>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">description</span> View Statement</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Item 6: Meds -->
                            <tr>
                                <td><span class="sku-text font-weight-bold text-success" style="font-size: 0.85rem; font-family: 'Space Grotesk', sans-serif;">MED-OX-500</span></td>
                                <td><span class="font-weight-bold text-dark" style="font-size: 0.9rem;">Oxytetracycline 20%</span></td>
                                <td><span class="text-muted" style="font-size: 0.85rem;">Medical Supplies</span></td>
                                <td><span class="text-muted">500ml Bottle</span></td>
                                <td><span class="text-dark">KES 2,800</span></td>
                                <td><span class="text-danger">5</span></td>
                                <td><span class="text-dark">KES 14,000</span></td>
                                <td class="text-right">
                                    <div class="actions-container">
                                        <button class="btn-action-rounded" onclick="toggleActionMenu(event, this)">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="actions-dropdown botanical-shadow">
                                            <button class="action-menu-item"><span class="material-symbols-outlined">edit</span> Edit Item</button>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">shopping_cart</span> Reorder Stock</button>
                                            <div class="dropdown-divider my-1"></div>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">description</span> View Statement</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Item 7: Equipment -->
                            <tr>
                                <td><span class="sku-text font-weight-bold text-success" style="font-size: 0.85rem; font-family: 'Space Grotesk', sans-serif;">EQU-TAG-XP</span></td>
                                <td><span class="font-weight-bold text-dark" style="font-size: 0.9rem;">Eartag Applicator</span></td>
                                <td><span class="text-muted" style="font-size: 0.85rem;">Equipment</span></td>
                                <td><span class="text-muted">Unit</span></td>
                                <td><span class="text-dark">KES 1,400</span></td>
                                <td><span class="text-success">20</span></td>
                                <td><span class="text-dark">KES 28,000</span></td>
                                <td class="text-right">
                                    <div class="actions-container">
                                        <button class="btn-action-rounded" onclick="toggleActionMenu(event, this)">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="actions-dropdown botanical-shadow">
                                            <button class="action-menu-item"><span class="material-symbols-outlined">edit</span> Edit Item</button>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">shopping_cart</span> Reorder Stock</button>
                                            <div class="dropdown-divider my-1"></div>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">description</span> View Statement</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Item 8: General -->
                            <tr>
                                <td><span class="sku-text font-weight-bold text-success" style="font-size: 0.85rem; font-family: 'Space Grotesk', sans-serif;">GEN-DIS-05</span></td>
                                <td><span class="font-weight-bold text-dark" style="font-size: 0.9rem;">Disinfectant Sol.</span></td>
                                <td><span class="text-muted" style="font-size: 0.85rem;">Maintenance</span></td>
                                <td><span class="text-muted">5L Jug</span></td>
                                <td><span class="text-dark">KES 550</span></td>
                                <td><span class="text-success">35</span></td>
                                <td><span class="text-dark">KES 19,250</span></td>
                                <td class="text-right">
                                    <div class="actions-container">
                                        <button class="btn-action-rounded" onclick="toggleActionMenu(event, this)">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="actions-dropdown botanical-shadow">
                                            <button class="action-menu-item"><span class="material-symbols-outlined">edit</span> Edit Item</button>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">shopping_cart</span> Reorder Stock</button>
                                            <div class="dropdown-divider my-1"></div>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">description</span> View Statement</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Footer Pagination Spot -->
                <div class="p-4 border-top d-flex justify-content-between align-items-center" style="background-color: rgba(244, 244, 239, 0.3);">
                    <p class="text-muted mb-0" style="font-size: 0.75rem;" id="inventoryTableInfo"></p>
                    <div id="inventoryDataTable_paginate"></div>
                </div>
            </div>
        </div>
    </main>

    <!-- Global Scripts -->
    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="../plugins/popper.js"></script>
    <script src="../plugins/bootstrap.js"></script>
    <!-- DataTables Advanced -->
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap4.min.js"></script>
    <script src="../plugins/alert.js"></script>
    <script src="../js/functions.js"></script>
    <script src="../js/header.js"></script>
    <script src="../js/inventory.js"></script>

    <?php include 'modals.php'; ?>

    <!-- Add New Category Modal (Local for Context) -->
    <div id="addCategoryModal" class="add-category-overlay" style="display: none;">
        <div class="add-category-container botanical-shadow-lg" style="border-radius: 0.4rem;">
            <!-- Close Button -->
            <button class="add-category-close" onclick="closeAddCategoryModal()">
                <span class="material-symbols-outlined">close</span>
            </button>

            <div class="add-category-row">
                <!-- Left Panel: Botanical Sidebar -->
                <div class="add-category-sidebar">
                    <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDCvyN5rI3g7_3NSOFaz4_0kg52_5FdNeiX_tmk9oa37k40WoR6nzqHo0SCucWIVWBBBSqbGF9HllbiNxTmyFPP74qenXMd4FaAvYJzSEKlZYuGZ3PCuVuJqbvQHG3Vw-Dj7Df00-mabrZrfiIc-i6a-9f4sWNVz2HZtOimbsKrhx-dhqbwrAzRjTwkCqB3ip8dapwxeQcepqR5vtPlz06R9PMyWmw8hxcaWLIwLKw1bbPnck_aNmv1Tw1bNV3sh-kBlJ_0mY5cF0Re" alt="Serene Pasture" class="sidebar-img">
                    <div class="sidebar-botanical-overlay">
                        <div style="margin-bottom: auto;"></div>
                        <div class="sidebar-bottom-content">
                            <span class="material-symbols-outlined botanical-icon" style="font-size: 2.5rem !important; color: white; margin-bottom: 1rem;">potted_plant</span>
                            <h2 class="sidebar-headline" style="font-size: 1.4rem; font-weight: 700; line-height: 1.2; margin-bottom: 0.75rem;">New Inventory Category</h2>
                            <p class="sidebar-subtext" style="color: rgba(255, 255, 255, 0.8); font-size: 0.75rem; line-height: 1.5;">Organize your dairy resources with semantic categories. Define prefixes for automated tracking.</p>
                        </div>
                    </div>
                </div>

                <!-- Right Panel: Form Area -->
                <div class="add-category-form-area">
                    <div class="form-header-meta" style="margin-bottom: 1.5rem;">
                        <span class="meta-label">Categorization Module</span>
                    </div>

                    <div id="categoryModalAlert"></div>

                    <form id="addCategoryForm" class="category-form" onsubmit="return false;" novalidate>
                        <input type="hidden" id="categoryId" value="0">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Category Code</label>
                                    <input type="text" class="category-input" id="catCode" placeholder="e.g. FD" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Category Name</label>
                                    <input type="text" class="category-input" id="catName" placeholder="e.g. Concentrated Feed" required>
                                </div>
                            </div>
                        </div>

                        <div class="category-field-group">
                            <label class="category-input-label">Category Icon</label>
                            <div class="custom-icon-select-wrapper">
                                <div class="custom-icon-select-trigger botanical-shadow-sm" onclick="toggleCustomIconDropdown(event)">
                                    <span id="categoryIconPreview" class="material-symbols-outlined text-success" style="font-size: 20px;">inventory_2</span>
                                    <span id="selectedIconName" class="ml-2 font-weight-medium">Inventory (General)</span>
                                    <span class="material-symbols-outlined ml-auto text-muted" style="font-size: 18px;">expand_more</span>
                                </div>
                                <input type="hidden" id="categoryIcon" value="inventory_2">
                                <div class="custom-icon-options-container botanical-shadow-lg" id="customIconOptions">
                                    <div class="icon-option active" data-value="inventory_2" onclick="selectCustomIcon('inventory_2', 'Inventory (General)')">
                                        <span class="material-symbols-outlined">inventory_2</span>
                                        <span>Inventory (General)</span>
                                    </div>
                                    <div class="icon-option" data-value="grass" onclick="selectCustomIcon('grass', 'Animal Feed (Grass)')">
                                        <span class="material-symbols-outlined">grass</span>
                                        <span>Animal Feed (Grass)</span>
                                    </div>
                                    <div class="icon-option" data-value="medical_services" onclick="selectCustomIcon('medical_services', 'Medical Services')">
                                        <span class="material-symbols-outlined">medical_services</span>
                                        <span>Medical Services</span>
                                    </div>
                                    <div class="icon-option" data-value="precision_manufacturing" onclick="selectCustomIcon('precision_manufacturing', 'Machinery / Equipment')">
                                        <span class="material-symbols-outlined">precision_manufacturing</span>
                                        <span>Machinery / Equipment</span>
                                    </div>
                                    <div class="icon-option" data-value="construction" onclick="selectCustomIcon('construction', 'Maintenance / Tools')">
                                        <span class="material-symbols-outlined">construction</span>
                                        <span>Maintenance / Tools</span>
                                    </div>
                                    <div class="icon-option" data-value="water_drop" onclick="selectCustomIcon('water_drop', 'Liquids / Fuel')">
                                        <span class="material-symbols-outlined">water_drop</span>
                                        <span>Liquids / Fuel</span>
                                    </div>
                                    <div class="icon-option" data-value="potted_plant" onclick="selectCustomIcon('potted_plant', 'Botanical / Seeds')">
                                        <span class="material-symbols-outlined">potted_plant</span>
                                        <span>Botanical / Seeds</span>
                                    </div>
                                    <div class="icon-option" data-value="science" onclick="selectCustomIcon('science', 'Lab / Chemicals')">
                                        <span class="material-symbols-outlined">science</span>
                                        <span>Lab / Chemicals</span>
                                    </div>
                                    <div class="icon-option" data-value="agriculture" onclick="selectCustomIcon('agriculture', 'Farm Vehicles')">
                                        <span class="material-symbols-outlined">agriculture</span>
                                        <span>Farm Vehicles</span>
                                    </div>
                                    <div class="icon-option" data-value="electric_bolt" onclick="selectCustomIcon('electric_bolt', 'Power / Electrical')">
                                        <span class="material-symbols-outlined">electric_bolt</span>
                                        <span>Power / Electrical</span>
                                    </div>
                                    <div class="icon-option" data-value="hardware" onclick="selectCustomIcon('hardware', 'Hardware / Parts')">
                                        <span class="material-symbols-outlined">hardware</span>
                                        <span>Hardware / Parts</span>
                                    </div>
                                    <div class="icon-option" data-value="vaccines" onclick="selectCustomIcon('vaccines', 'Vaccines / Biologics')">
                                        <span class="material-symbols-outlined">vaccines</span>
                                        <span>Vaccines / Biologics</span>
                                    </div>
                                    <div class="icon-option" data-value="pill" onclick="selectCustomIcon('pill', 'Tablets / Meds')">
                                        <span class="material-symbols-outlined">pill</span>
                                        <span>Tablets / Meds</span>
                                    </div>
                                    <div class="icon-option" data-value="shield_health" onclick="selectCustomIcon('shield_health', 'Safety / PPE')">
                                        <span class="material-symbols-outlined">shield_health</span>
                                        <span>Safety / PPE</span>
                                    </div>
                                    <div class="icon-option" data-value="cleaning_services" onclick="selectCustomIcon('cleaning_services', 'Disinfectants')">
                                        <span class="material-symbols-outlined">cleaning_services</span>
                                        <span>Disinfectants</span>
                                    </div>
                                    <div class="icon-option" data-value="factory" onclick="selectCustomIcon('factory', 'Processing Units')">
                                        <span class="material-symbols-outlined">factory</span>
                                        <span>Processing Units</span>
                                    </div>
                                    <div class="icon-option" data-value="propane_tank" onclick="selectCustomIcon('propane_tank', 'Tanks / Gas')">
                                        <span class="material-symbols-outlined">propane_tank</span>
                                        <span>Tanks / Gas</span>
                                    </div>
                                    <div class="icon-option" data-value="oil_barrel" onclick="selectCustomIcon('oil_barrel', 'Lubricants / Oils')">
                                        <span class="material-symbols-outlined">oil_barrel</span>
                                        <span>Lubricants / Oils</span>
                                    </div>
                                    <div class="icon-option" data-value="warehouse" onclick="selectCustomIcon('warehouse', 'Storage Units')">
                                        <span class="material-symbols-outlined">warehouse</span>
                                        <span>Storage Units</span>
                                    </div>
                                    <div class="icon-option" data-value="barcode_scanner" onclick="selectCustomIcon('barcode_scanner', 'Tags / Scanning')">
                                        <span class="material-symbols-outlined">barcode_scanner</span>
                                        <span>Tags / Scanning</span>
                                    </div>
                                    <div class="icon-option" data-value="label" onclick="selectCustomIcon('label', 'General Label')">
                                        <span class="material-symbols-outlined">label</span>
                                        <span>General Label</span>
                                    </div>
                                    <div class="icon-option" data-value="receipt_long" onclick="selectCustomIcon('receipt_long', 'Ledger / Records')">
                                        <span class="material-symbols-outlined">receipt_long</span>
                                        <span>Ledger / Records</span>
                                    </div>
                                    <div class="icon-option" data-value="shopping_cart" onclick="selectCustomIcon('shopping_cart', 'Purchasing')">
                                        <span class="material-symbols-outlined">shopping_cart</span>
                                        <span>Purchasing</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Item Prefix</label>
                                    <input type="text" class="category-input" id="itemPrefix" placeholder="FEED-" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Starting Number</label>
                                    <input type="number" class="category-input" id="startingNum" placeholder="001" required>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex align-items-center gap-3 mt-4">
                            <div class="custom-switch">
                                <input type="checkbox" id="padZeros" checked>
                                <label for="padZeros"></label>
                            </div>
                            <span class="text-on-surface-variant font-weight-medium" style="font-size: 0.9rem;">Pad zeros in numbering</span>
                        </div>

                        <div class="add-category-footer">
                            <button type="button" class="category-btn-text" onclick="closeAddCategoryModal()" style="font-weight: 400; margin-right: 1.5rem;">Cancel</button>
                            <button type="submit" class="category-btn-primary" style="font-weight: 400;">Save Category</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Inventory Item Modal -->
    <div id="addInventoryItemModal" class="add-category-overlay" style="display: none;">
        <div class="add-category-container botanical-shadow-lg inventory-item-modal" style="border-radius: 0.4rem;">
            <!-- Close Button -->
            <button class="add-category-close" onclick="closeAddItemModal()">
                <span class="material-symbols-outlined">close</span>
            </button>

            <div class="add-category-row">
                <!-- Left Panel: Sidebar -->
                <div class="add-category-sidebar">
                    <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuD1wiIMYCi-klEQoWsqSBfgi3mDMxW-EEPUMLptaIbiG8uvLsGvaNiov55cuGNDCyFxmlX17rW-PK8mDq6jf0NR6zDUCTNhxANs_uN4mWk1pOuK96OF9qHvJyWwJhujqN6EVSHWoDQgyL0k6XHUo09b9425HlkRfAGqycr6als85_ebO0Gp_I4dr3jDaUbTqr7odhsPga-jy5Qcbi2XN6QgCIjW5yrJFflr2ZS61nCVTMsXzENwrmbKLTeBWjGLE8uoi5I0s9RRq1nd" alt="Inventory" class="sidebar-img">
                    <div class="sidebar-botanical-overlay">
                        <div class="sidebar-bottom-content">
                            <div style="background: rgba(255,255,255,0.2); width: 44px; height: 44px; border-radius: 50%; margin-bottom: 1rem; display: flex; align-items: center; justify-content: center;">
                                <span class="material-symbols-outlined" style="color: white; font-size: 1.5rem; font-variation-settings: 'FILL' 1;">add_shopping_cart</span>
                            </div>
                            <h2 class="sidebar-headline" style="font-size: 1.5rem; color: white;">New Inventory Item</h2>
                            <p class="sidebar-subtext" style="font-size: 0.8rem; color: rgba(255, 255, 255, 0.9);">Provision new assets to your stock. Track reorder levels and pricing for efficient management.</p>
                        </div>
                    </div>
                </div>

                <!-- Right Panel: Form Area -->
                <div class="add-category-form-area" style="padding-bottom: 0;">
                    <div class="form-header-meta d-flex justify-content-between align-items-center" style="margin-bottom: 1.25rem;">
                        <span class="meta-label" style="color: #D2691E;">Asset Provisioning</span>
                    </div>

                    <div id="itemModalAlert" class="mb-3"></div>
                    <form id="addItemForm" class="category-form" onsubmit="return false;">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Select Category</label>
                                    <select id="itemCategory" class="category-input">
                                        <option disabled selected>Loading...</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Item Name</label>
                                    <input type="text" id="itemName" class="category-input" placeholder="e.g. Maize Germ">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Item Code</label>
                                    <div class="position-relative">
                                        <input type="text" id="itemCode" class="category-input" placeholder="JKM-INV-001" readonly style="opacity: 0.7; padding-right: 90px; font-family: 'Space Grotesk', sans-serif;">
                                        <div class="position-absolute d-flex align-items-center" style="right: 8px; top: 50%; transform: translateY(-50%);">
                                            <input type="checkbox" id="autoGenerateCode" onchange="toggleCodeGeneration()" checked style="display: none;">
                                            <label for="autoGenerateCode" id="autoGenBadge" style="cursor: pointer; margin-bottom: 0; padding: 6px 12px; border-radius: 6px; font-size: 0.65rem; font-weight: 500; letter-spacing: 0.05em; transition: all 0.2s; background: #206223; color: white; display: flex; align-items: center; gap: 4px;">
                                                <span class="material-symbols-outlined" style="font-size: 0.9rem; font-variation-settings: 'FILL' 1;">magic_button</span>
                                                AUTO
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">UoM</label>
                                    <select id="itemUom" class="category-input">
                                        <option>Kg</option>
                                        <option>Litre</option>
                                        <option>Bag</option>
                                        <option>Pcs</option>
                                        <option>Units</option>
                                        <option>Vials</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Unit Price</label>
                                    <div class="position-relative">
                                        <span class="currency-prefix position-absolute">KES</span>
                                        <input type="number" id="itemPrice" class="category-input price-input" placeholder="0.00" style="font-family: 'Space Grotesk', sans-serif;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Reorder Level</label>
                                    <input type="number" id="itemReorder" class="category-input" placeholder="50" style="font-family: 'Space Grotesk', sans-serif;">
                                </div>
                            </div>
                        </div>

                        <div class="category-field-group">
                            <label class="category-input-label">Item Type</label>
                            <div class="d-flex align-items-center justify-content-between item-type-pill-container" style="padding: 0.4rem 1.25rem; border-radius: 0.75rem; height: 40px; background: #f1f5f9; border: 1px solid #e2e8f0;">
                                <span id="typeIngredientLabel" style="font-size: 0.65rem; font-weight: 700; color: #475569;">INGREDIENT</span>
                                <div class="custom-switch switch-sm switch-always-green" style="transform: scale(0.85);">
                                    <input type="checkbox" id="itemTypeToggle" onchange="updateTypeLabels()">
                                    <label for="itemTypeToggle" style="border-radius: 30px;"></label>
                                </div>
                                <span id="typeProductLabel" style="font-size: 0.65rem; font-weight: 700; color: #94a3b8;">PRODUCT</span>
                            </div>
                        </div>

                        <div class="category-field-group" style="margin-bottom: 0;">
                            <label class="category-input-label">Notes / Description</label>
                            <textarea id="itemDescription" class="category-input" rows="3" placeholder="Specifications, vendor details..." style="resize: none;"></textarea>
                        </div>

                        <div class="add-category-footer">
                            <button type="button" class="category-btn-text" onclick="closeAddItemModal()" style="font-weight: 400; margin-right: 1.5rem;">Cancel</button>
                            <button type="submit" class="category-btn-primary" style="font-weight: 400;">Save Item</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
