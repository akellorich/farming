<?php
/**
 * Jukam Poultry Management System - Poultry Settings
 * File: views/poultrysettings.php
 * Implementation: High-fidelity tabbed settings for poultry modules.
 */
$base_path = '../';
$nav_context = 'poultry';
?>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Poultry Settings | JUKAM Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="<?php echo $base_path; ?>plugins/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/all.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/style.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/dashboard.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/header.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/navigation.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>plugins/alert/alert.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>plugins/datatables/datatables.min.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>plugins/datatables/responsive.dataTables.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/poultrysettings.css">
    
    <script>
        var base_path = '<?php echo $base_path; ?>';
    </script>
</head>
<body>

    <!-- Modular Navigation (Sidebar) -->
    <?php include 'navigation.php'; ?>

    <main class="main-content">
        
        <!-- Modular Header (Top Bar) -->
        <?php include 'header.php'; ?>

        <div class="container-fluid p-2 p-md-3">
            <!-- Page Header -->
            <div class="mb-2">
                <h2 class="font-weight-bold h5 mb-0">Poultry Settings</h2>
                <p class="text-muted small mb-0">Configure global parameters for breeds, housing, and operational tracking.</p>
            </div>

            <!-- Tabbed Navigation -->
            <div class="tabs-navigation-outer mb-4">
                <button class="tabs-scroll-btn left" id="tabs-scroll-left">
                    <span class="material-symbols-outlined">chevron_left</span>
                </button>
                <div class="settings-tabs-wrapper">
                    <button class="settings-tab-btn active" data-tab="breeds">
                        Breeds
                        <span class="settings-tab-indicator"></span>
                    </button>
                    <button class="settings-tab-btn" data-tab="bird-type">Bird Type</button>
                    <button class="settings-tab-btn" data-tab="flock-stage">Flock Stage</button>
                    <button class="settings-tab-btn" data-tab="houses">Houses & Pens</button>
                    <button class="settings-tab-btn" data-tab="inventory">Inventory Items</button>
                    <button class="settings-tab-btn" data-tab="formulation">Feed Formulation</button>
                    <button class="settings-tab-btn" data-tab="diseases">Diseases</button>
                    <button class="settings-tab-btn" data-tab="mortality">Mortality Reasons</button>
                    <button class="settings-tab-btn" data-tab="distribution-points">Distribution Points</button>
                </div>
                <button class="tabs-scroll-btn right" id="tabs-scroll-right">
                    <span class="material-symbols-outlined">chevron_right</span>
                </button>
            </div>

            <!-- Tab Contents -->
            <div id="settings-content-wrapper">
                
                <!-- Section: Breeds -->
                <div class="settings-tab-content" id="tab-breeds">
                    <div class="premium-card">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="h6 font-weight-bold mb-0">Poultry Breeds</h3>
                            <button class="btn-add-premium" data-toggle="modal" data-target="#addBreedModal">
                                <span class="material-symbols-outlined mr-2" style="font-size: 18px;">add</span>
                                Add Breed
                            </button>
                        </div>
                        <div class="table-alert-area"></div>
                        <div class="table-responsive">
                            <table class="table table-premium mb-0" id="breedsTable">
                                <thead>
                                    <tr>
                                        <th>Breed Name</th>
                                        <th>Category</th>
                                        <th>Status</th>
                                        <th>Maturity Period</th>
                                        <th class="text-right">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="font-weight-bold">ISA Brown</td>
                                        <td>Layers</td>
                                        <td>18-20 Weeks</td>
                                        <td>High</td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Cobb 500</td>
                                        <td>Broilers</td>
                                        <td>6-8 Weeks</td>
                                        <td>Optimal</td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Section: Bird Type -->
                <div class="settings-tab-content" id="tab-bird-type" style="display: none;">
                    <div class="premium-card">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="h6 font-weight-bold mb-0">Bird Types</h3>
                            <button class="btn-add-premium" data-toggle="modal" data-target="#addBirdTypeModal">
                                <span class="material-symbols-outlined mr-2" style="font-size: 18px;">add</span>
                                Add Type
                            </button>
                        </div>
                        <div class="table-alert-area"></div>
                        <div class="table-responsive">
                            <table class="table table-premium mb-0" id="birdTypeTable">
                                <thead>
                                    <tr>
                                        <th>Type Name</th>
                                        <th>Description</th>
                                        <th>Maturity (Days)</th>
                                        <th class="text-right">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="font-weight-bold">Layers</td>
                                        <td>Birds kept specifically for egg production.</td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Broilers</td>
                                        <td>Birds raised for meat production.</td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Kienyeji</td>
                                        <td>Indigenous or improved indigenous breeds.</td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Section: Flock Stage -->
                <div class="settings-tab-content" id="tab-flock-stage" style="display: none;">
                    <div class="premium-card">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="h6 font-weight-bold mb-0">Flock Growth Stages</h3>
                            <button class="btn-add-premium" data-toggle="modal" data-target="#addFlockStageModal">
                                <span class="material-symbols-outlined mr-2" style="font-size: 18px;">add</span>
                                Add Stage
                            </button>
                        </div>
                        <div class="table-alert-area"></div>
                        <div class="table-responsive">
                            <table class="table table-premium mb-0" id="flockStageTable">
                                <thead>
                                    <tr>
                                        <th>Stage Name</th>
                                        <th>Target Bird Type</th>
                                        <th>Duration (Approx)</th>
                                        <th>Feed Qty (g)</th>
                                        <th class="text-right">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="font-weight-bold">Chick</td>
                                        <td>Layers / Broilers / Kienyeji</td>
                                        <td>0 - 8 Weeks</td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Grower</td>
                                        <td>Layers</td>
                                        <td>9 - 18 Weeks</td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Layer</td>
                                        <td>Layers</td>
                                        <td>19+ Weeks</td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Section: Houses -->
                <div class="settings-tab-content" id="tab-houses" style="display: none;">
                    <div class="premium-card">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="h6 font-weight-bold mb-0">Housing & Pens</h3>
                            <button class="btn-add-premium" data-toggle="modal" data-target="#addHouseModal">
                                <span class="material-symbols-outlined mr-2" style="font-size: 18px;">add</span>
                                Add House
                            </button>
                        </div>
                        <div class="table-alert-area"></div>
                        <div class="table-responsive">
                            <table class="table table-premium mb-0" id="housesTable">
                                <thead>
                                    <tr>
                                        <th>House ID</th>
                                        <th>Capacity</th>
                                        <th>Current Stock</th>
                                        <th>Status</th>
                                        <th class="text-right">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="font-weight-bold">House A</td>
                                        <td>1,000 Birds</td>
                                        <td>950</td>
                                        <td><span class="badge badge-success px-3 py-2 rounded-pill">Active</span></td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Section: Inventory Items -->
                <div class="settings-tab-content" id="tab-inventory" style="display: none;">
                    
                    <!-- Category Summary Cards -->
                    <div id="category-cards-container" class="row mb-0">
                        <!-- Dynamically Populated -->
                    </div>

                    <div class="premium-card">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="h6 font-weight-bold mb-0">Inventory Registry</h3>
                            <button class="btn-add-premium" data-toggle="modal" data-target="#addItemModal">
                                <span class="material-symbols-outlined mr-2" style="font-size: 18px;">add</span>
                                Add Item
                            </button>
                        </div>
                        <div class="table-alert-area"></div>
                        <div class="table-responsive">
                            <table class="table table-premium mb-0" id="inventoryTable">
                                <thead>
                                    <tr>
                                        <th>Item Name</th>
                                        <th>Code</th>
                                        <th>Category</th>
                                        <th>Unit</th>
                                        <th class="text-right">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Dynamic Data -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Section: Feed Formulation -->
                <div class="settings-tab-content" id="tab-formulation" style="display: none;">
                    <div class="premium-card">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="h6 font-weight-bold mb-0">Feed Formulations</h3>
                            <button class="btn-add-premium" data-toggle="modal" data-target="#addFormulationModal">
                                <span class="material-symbols-outlined mr-2" style="font-size: 18px;">science</span>
                                Add Formulation
                            </button>
                        </div>
                        <div class="table-alert-area"></div>
                        <div class="table-responsive">
                            <table class="table table-premium mb-0" id="formulationTable">
                                <thead>
                                    <tr>
                                        <th>Formulation Name</th>
                                        <th>Target Stage</th>
                                        <th>Key Ingredients</th>
                                        <th class="text-right">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="font-weight-bold">Broiler Starter Mix</td>
                                        <td>Chicks (0-4 Weeks)</td>
                                        <td>Maize, Soya, Fishmeal...</td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Layer Phase 1</td>
                                        <td>Layers (18-40 Weeks)</td>
                                        <td>Maize, Lime, Soya...</td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Section: Diseases -->
                <div class="settings-tab-content" id="tab-diseases" style="display: none;">
                    <div class="premium-card">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="h6 font-weight-bold mb-0">Disease Registry</h3>
                            <button class="btn-add-premium" data-toggle="modal" data-target="#addDiseaseModal">
                                <span class="material-symbols-outlined mr-2" style="font-size: 18px;">add</span>
                                Add Disease
                            </button>
                        </div>
                        <div class="table-alert-area"></div>
                        <div class="table-responsive">
                            <table class="table table-premium mb-0" id="diseasesTable">
                                <thead>
                                    <tr>
                                        <th>Disease Name</th>
                                        <th>Type</th>
                                        <th>Severity</th>
                                        <th>Description</th>
                                        <th class="text-right">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="font-weight-bold">Newcastle Disease</td>
                                        <td>Viral</td>
                                        <td><span class="text-danger font-weight-bold">Critical</span></td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Section: Mortality Reasons -->
                <div class="settings-tab-content" id="tab-mortality" style="display: none;">
                    <div class="premium-card">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="h6 font-weight-bold mb-0">Mortality Reasons</h3>
                            <button class="btn-add-premium" data-toggle="modal" data-target="#addMortalityReasonModal">
                                <span class="material-symbols-outlined mr-2" style="font-size: 18px;">add</span>
                                Add Reason
                            </button>
                        </div>
                        <div class="table-alert-area"></div>
                        <div class="table-responsive">
                            <table class="table table-premium mb-0" id="mortalityTable">
                                <thead>
                                    <tr>
                                        <th>Reason Label</th>
                                        <th>Description</th>
                                        <th class="text-right">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="font-weight-bold">Disease / Infection</td>
                                        <td>Losses due to documented illness.</td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Heat Stress</td>
                                        <td>Environmental temperature spike.</td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                                    <a class="action-item" href="#">
                                                        <span class="material-symbols-outlined">edit</span> Edit
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="action-item text-danger" href="#">
                                                        <span class="material-symbols-outlined">delete</span> Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Section: Distribution Points -->
                <div class="settings-tab-content" id="tab-distribution-points" style="display: none;">
                    <div class="premium-card">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="h6 font-weight-bold mb-0">Poultry Distribution Hubs</h3>
                            <button class="btn-add-premium" id="addHubBtn">
                                <span class="material-symbols-outlined mr-2" style="font-size: 18px;">add</span>
                                Add Hub
                            </button>
                        </div>
                        <div class="table-alert-area"></div>
                        <div class="table-responsive">
                            <table class="table table-premium mb-0" id="distributionPointsTable" width="100%">
                                <thead>
                                    <tr>
                                        <th>Hub Name</th>
                                        <th>Location</th>
                                        <th>Contact Person</th>
                                        <th>Contact Phone</th>
                                        <th class="text-right">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Dynamic Data -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


            </div>
        </div>

    </main>
    
    <!-- Settings Modals -->
    <?php include 'poultry_settings_modals.php'; ?>

    <!-- Core Scripts -->
    <script src="<?php echo $base_path; ?>plugins/jquery-3.6.1.js"></script>
    <script src="<?php echo $base_path; ?>plugins/popper.js"></script>
    <script src="<?php echo $base_path; ?>plugins/bootstrap/bootstrap.js"></script>
    <script src="<?php echo $base_path; ?>plugins/datatables/datatables.min.js"></script>
    <script src="<?php echo $base_path; ?>plugins/datatables/dataTables.responsive.js"></script>
    <script src="<?php echo $base_path; ?>js/navigation.js"></script>
    <script src="<?php echo $base_path; ?>js/header.js"></script>
    <script src="<?php echo $base_path; ?>plugins/alert/alert.js"></script>
    <script src="<?php echo $base_path; ?>js/poultrysettings.js"></script>
</body>
</html>
