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
        <div class="container-fluid pt-1 px-4">
            <!-- Header Section -->
            <div class="row align-items-end mb-5 mt-2">
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
                    <h4 class="inventory-stat-value">4.28M</h4>
                    <div class="inventory-stat-desc d-flex align-items-center gap-2 text-success font-weight-medium">
                        <span class="material-symbols-outlined" style="font-size: 1rem;">trending_up</span>
                        <span>12% vs last month</span>
                    </div>
                </div>

                <!-- Low Stock -->
                <div class="inventory-stat-card botanical-shadow-sm">
                    <span class="material-symbols-outlined inventory-card-icon" style="color: #795900;">warning</span>
                    <p class="inventory-stat-label" style="color: #5c4300;">LOW STOCK ITEMS</p>
                    <h4 class="inventory-stat-value" style="color: #795900;">08</h4>
                    <div class="inventory-stat-desc d-flex align-items-center gap-2 font-weight-medium" style="color: #795900;">
                        <span class="material-symbols-outlined" style="font-size: 1rem;">error</span>
                        <span>Needs reorder</span>
                    </div>
                </div>

                <!-- Categories -->
                <div class="inventory-stat-card botanical-shadow-sm">
                    <span class="material-symbols-outlined inventory-card-icon">category</span>
                    <p class="inventory-stat-label">CATEGORIES COUNT</p>
                    <h4 class="inventory-stat-value">14</h4>
                    <div class="inventory-stat-desc d-flex align-items-center gap-2 text-muted font-weight-medium">
                        <span class="material-symbols-outlined" style="font-size: 1rem;">list_alt</span>
                        <span>Active segments</span>
                    </div>
                </div>
            </div>

            <!-- Browse by Category -->
            <div class="mb-5">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h4 class="category-section-title">Browse by Category</h4>
                    <a href="#" class="category-section-link d-flex align-items-center gap-2">
                        View All Categories 
                        <span class="material-symbols-outlined" style="font-size: 1.1rem; margin-left: 4px;">arrow_forward</span>
                    </a>
                </div>
                
                <div class="category-grid">
                    <!-- Animal Feed -->
                    <div class="category-card cat-animal-feed botanical-shadow-sm">
                        <div class="category-icon-wrapper">
                            <span class="material-symbols-outlined" style="color: #047857;">grass</span>
                        </div>
                        <h6 class="category-name font-weight-bold font-headline mb-1" style="color: #064e3b;">Animal Feed</h6>
                        <p class="text-muted mb-0" style="font-size: 0.75rem;">124 Items</p>
                    </div>

                    <!-- Health & Meds -->
                    <div class="category-card cat-health botanical-shadow-sm">
                        <div class="category-icon-wrapper">
                            <span class="material-symbols-outlined" style="color: #c2410c;">medical_services</span>
                        </div>
                        <h6 class="category-name font-weight-bold font-headline mb-1" style="color: #7c2d12;">Health & Meds</h6>
                        <p class="text-muted mb-0" style="font-size: 0.75rem;">86 Items</p>
                    </div>

                    <!-- Equipment -->
                    <div class="category-card cat-equipment botanical-shadow-sm">
                        <div class="category-icon-wrapper">
                            <span class="material-symbols-outlined" style="color: #334155;">precision_manufacturing</span>
                        </div>
                        <h6 class="category-name font-weight-bold font-headline mb-1" style="color: #0f172a;">Equipment</h6>
                        <p class="text-muted mb-0" style="font-size: 0.75rem;">42 Items</p>
                    </div>

                    <!-- Maintenance -->
                    <div class="category-card cat-maintenance botanical-shadow-sm">
                        <div class="category-icon-wrapper">
                            <span class="material-symbols-outlined" style="color: #92400e;">construction</span>
                        </div>
                        <h6 class="category-name font-weight-bold font-headline mb-1" style="color: #78350f;">Maintenance</h6>
                        <p class="text-muted mb-0" style="font-size: 0.75rem;">215 Items</p>
                    </div>
                </div>
            </div>

            <!-- Stock Inventory List Table -->
            <div class="inventory-table-card botanical-shadow-sm mb-5">
                <div class="inventory-table-header flex-column align-items-stretch p-3">
                    <div class="inventory-title-row d-flex justify-content-between align-items-center mb-1">
                        <h4 class="table-section-title mb-0">Stock Inventory List</h4>
                    </div>
                    
                    <div class="inventory-filters-row d-flex flex-wrap">
                        <select class="inventory-select-sm flex-fill">
                            <option>All Categories</option>
                        </select>
                        <select class="inventory-select-sm flex-fill">
                            <option>All Status</option>
                        </select>
                    </div>
                    
                    <div class="inventory-actions-row d-flex align-items-center">
                        <button class="btn btn-export-excel d-flex align-items-center gap-1">
                            <span class="material-symbols-outlined" style="font-size: 1.1rem;">download</span>
                            Excel
                        </button>
                        <button class="btn btn-export-print d-flex align-items-center gap-1">
                            <span class="material-symbols-outlined" style="font-size: 1.1rem;">print</span>
                            Print
                        </button>
                        <div class="flex-grow-1">
                            <input type="text" class="form-control inventory-pill-search" placeholder="Search..." id="inventorySearch">
                        </div>
                    </div>

                    <button class="btn btn-success d-flex align-items-center gap-1 flex-shrink-0" id="addAssetBtn">
                        <span class="material-symbols-outlined" style="font-size: 1.2rem;">add</span>
                        <span>Add Asset</span>
                    </button>
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

                    <form id="addCategoryForm" class="category-form" onsubmit="return false;">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Category Code</label>
                                    <input type="text" class="category-input" placeholder="e.g. FD" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Category Name</label>
                                    <input type="text" class="category-input" placeholder="e.g. Concentrated Feed" required>
                                </div>
                            </div>
                        </div>

                        <div class="category-field-group">
                            <label class="category-input-label">Category Icon</label>
                            <select class="category-input font-awesome-select">
                                <option value="fas fa-box">📦 Box</option>
                                <option value="fas fa-boxes">📦 Boxes</option>
                                <option value="fas fa-clipboard-list">📋 Ledger</option>
                                <option value="fas fa-tools">🛠 Hardware</option>
                                <option value="fas fa-pills">💊 Medicine</option>
                                <option value="fas fa-vial">🧪 Lab/Vaccine</option>
                                <option value="fas fa-warehouse">🏠 Storage</option>
                                <option value="fas fa-tractor">🚜 Machinery</option>
                                <option value="fas fa-seedling">🌱 Crop/Botanical</option>
                                <option value="fas fa-hand-holding-water">💧 Supplies</option>
                                <option value="fas fa-barcode">🏷 Scanner</option>
                                <option value="fas fa-tag">🏷 Labeled</option>
                                <option value="fas fa-flask">🧪 Chemicals</option>
                                <option value="fas fa-thermometer-half">🌡 Temp</option>
                                <option value="fas fa-microscope">🔬 Analysis</option>
                                <option value="fas fa-first-aid">🏥 Critical Items</option>
                            </select>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Item Prefix</label>
                                    <input type="text" class="category-input" placeholder="FEED-" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Starting Number</label>
                                    <input type="number" class="category-input" placeholder="001" required>
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
                            <div style="background: rgba(255,255,255,0.2); width: fit-content; padding: 0.5rem; border-radius: 50%; margin-bottom: 1rem;">
                                <span class="material-symbols-outlined" style="color: white; font-size: 1.5rem; font-variation-settings: 'FILL' 1;">add_shopping_cart</span>
                            </div>
                            <h2 class="sidebar-headline" style="font-size: 1.5rem;">New Inventory Item</h2>
                            <p class="sidebar-subtext" style="font-size: 0.8rem;">Provision new assets to your stock. Track reorder levels and pricing for efficient management.</p>
                        </div>
                    </div>
                </div>

                <!-- Right Panel: Form Area -->
                <div class="add-category-form-area" style="padding-bottom: 0;">
                    <div class="form-header-meta d-flex justify-content-between align-items-center" style="margin-bottom: 1.25rem;">
                        <span class="meta-label" style="color: #D2691E;">Asset Provisioning</span>
                    </div>

                    <form id="addItemForm" class="category-form" onsubmit="return false;">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Select Category</label>
                                    <select class="category-input">
                                        <option>Dairy Meal</option>
                                        <option>Medical Supplies</option>
                                        <option>Mineral Licks</option>
                                        <option>Equipment</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Item Name</label>
                                    <input type="text" class="category-input" placeholder="e.g. Maize Germ">
                                </div>
                            </div>
                        </div>

                        <div class="row align-items-end">
                            <div class="col-6 col-md-6">
                                <div class="category-field-group">
                                    <label class="category-input-label">Item Code</label>
                                    <input type="text" class="category-input" placeholder="JKM-INV-001" readonly style="opacity: 0.7; font-family: 'Space Grotesk', sans-serif;">
                                </div>
                            </div>
                            <div class="col-6 col-md-6">
                                <div class="category-field-group">
                                    <div class="d-flex align-items-center gap-3 py-2">
                                        <div class="custom-switch switch-lg">
                                            <input type="checkbox" id="autoGenerateCode" onchange="toggleCodeGeneration()" checked>
                                            <label for="autoGenerateCode" style="border-radius: 20px;"></label>
                                        </div>
                                        <span class="auto-gen-label text-on-surface-variant font-weight-bold">Auto-gen</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4 col-md-4">
                                <div class="category-field-group">
                                    <label class="category-input-label">Unit Price</label>
                                    <div class="position-relative">
                                        <span class="currency-prefix position-absolute">KES</span>
                                        <input type="number" class="category-input price-input" placeholder="0.00" style="font-family: 'Space Grotesk', sans-serif;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 col-md-4">
                                <div class="category-field-group">
                                    <label class="category-input-label">Reorder</label>
                                    <input type="number" class="category-input" placeholder="50" style="font-family: 'Space Grotesk', sans-serif;">
                                </div>
                            </div>
                            <div class="col-4 col-md-4">
                                <div class="category-field-group">
                                    <label class="category-input-label">UoM</label>
                                    <select class="category-input">
                                        <option>Kg</option>
                                        <option>Litre</option>
                                        <option>Bag</option>
                                        <option>Pcs</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="category-field-group">
                            <label class="category-input-label">Item Type</label>
                            <div class="d-flex align-items-center justify-content-between item-type-pill-container" style="padding: 0.65rem 1.25rem; border-radius: 0.75rem; height: 48px;">
                                <span id="typeIngredientLabel" style="font-size: 0.7rem; font-weight: 700;">INGREDIENT</span>
                                <div class="custom-switch switch-lg switch-always-green">
                                    <input type="checkbox" id="itemTypeToggle" onchange="updateTypeLabels()">
                                    <label for="itemTypeToggle" style="border-radius: 30px;"></label>
                                </div>
                                <span id="typeProductLabel" style="font-size: 0.7rem; font-weight: 700;">PRODUCT</span>
                            </div>
                        </div>

                        <div class="category-field-group" style="margin-bottom: 0;">
                            <label class="category-input-label">Notes / Description</label>
                            <textarea class="category-input" rows="4" placeholder="Specifications, vendor details..." style="resize: none;"></textarea>
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
