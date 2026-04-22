<?php
/**
 * Jukam Dairy Management System - Users Manager
 * File: views/users_manager.php
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users Manager | Jukam Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="../plugins/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    <link rel="stylesheet" href="../css/users.css">
    <link rel="stylesheet" href="../plugins/alert/alert.css">
    
    <!-- DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.4.0/css/responsive.bootstrap4.min.css"/>

    <!-- Google Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Work+Sans:wght@300;400;500;600;700&family=Space+Grotesk:wght@300;400;500;600;700&family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">
</head>
<body class="bg-background">

    <!-- Modular Sidebar -->
    <?php include 'navigation.php'; ?>

    <!-- Modular Header -->
    <?php include 'header.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content">
        <div class="container-fluid pt-1 px-2 px-md-4">
            
            <!-- Context Header Section -->
            <div class="row align-items-end mb-4 mt-2">
                <div class="col">
                    <span class="text-xs uppercase tracking-[0.2rem] font-bold font-label d-block mb-1" style="font-size: 0.625rem; color: #795900; opacity: 0.8;">ADMINISTRATION</span>
                    <h2 class="font-headline font-weight-bold text-on-surface mb-0 users-page-title">
                        Users Manager
                    </h2>
                </div>
            </div>

            <!-- Bento Dashboard Metrics -->
            <div class="users-metrics-grid">
                <div class="users-metrics-card">
                    <span class="metric-label">Total Staff</span>
                    <div class="d-flex align-items-end justify-content-between">
                        <span class="metric-value">12</span>
                        <span class="metric-growth-badge">+1 this mo</span>
                    </div>
                </div>
                <div class="users-metrics-card">
                    <span class="metric-label">Active Now</span>
                    <div class="d-flex align-items-end justify-content-between">
                        <span class="metric-value">8</span>
                        <div class="d-flex align-items-center mb-1">
                            <span class="badge-pulse mr-2" style="width: 8px; height: 8px; background: var(--primary); border-radius: 50%;"></span>
                            <span class="font-label font-weight-bold text-muted" style="font-size: 0.6rem; letter-spacing: 0.05em;">ON SHIFT</span>
                        </div>
                    </div>
                </div>
                <div class="users-metrics-card">
                    <span class="metric-label">Roles</span>
                    <div class="d-flex align-items-end justify-content-between">
                        <span class="metric-value">5</span>
                        <span class="font-label font-weight-bold text-muted" style="font-size: 0.6rem; letter-spacing: 0.05em;">CATEGORIES</span>
                    </div>
                </div>
                <div class="users-metrics-card">
                    <span class="metric-label">Pending Invites</span>
                    <div class="d-flex align-items-end justify-content-between">
                        <span class="metric-value">2</span>
                        <span class="material-symbols-outlined text-secondary filled-icon" style="font-size: 1.5rem;">mail</span>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <!-- Main Table Section -->
                <div class="col-lg-8">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3 class="font-headline font-weight-bold mb-0 users-section-title">Team Members</h3>
                        <button class="btn btn-add-user d-flex align-items-center" data-toggle="modal" data-target="#addUserModal">
                            <span class="material-symbols-outlined mr-2 add-user-icon">person_add</span>
                            Add New User
                        </button>
                    </div>

                    <div class="users-table-container botanical-shadow-sm">
                        <table class="table users-table" id="usersTable" width="100%" style="border-collapse: separate; border-spacing: 0; width: 100% !important; max-width: 100% !important; margin: 0 !important;">
                            <thead>
                                <tr>
                                    <th class="all">User</th>
                                    <th class="desktop tablet">Role</th>
                                    <th class="desktop tablet">Status</th>
                                    <th class="desktop tablet">Last Login</th>
                                    <th class="no-sort all text-right"></th>
                                </tr>
                            </thead>
                                <tbody>
                                    <!-- Sarah -->
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuD_Za0fhfZL4u0zUdghnFPjo81Ffc9VkuspsA56dBSszuEXneeG1-VfxwOjHVzhHZuIA8X29o9c03WYhdvFR8U7136sDBqI_jzFQeVHLPgS6HfIrwiGmZ-lv_5wrelzYbypOUtPF2fyWcsXcfS0mgTFTsAwDtj0Db0kt4UF1_f5J6Tghu3rvolmzgqT7uQ2nBNcdxxY05KCKfsFwJYoYZTgy2GhGiTinPBQDCEn8lLdwdKSTWeljuFU6kkSXrbB_FqoD-0YlYPYjs_u" class="user-avatar-md mr-3">
                                                <div>
                                                    <p class="font-headline font-weight-bold mb-0" style="font-size: 0.85rem;">Sarah Wanjiku</p>
                                                    <p class="text-muted mb-0" style="font-size: 0.7rem;">sarah.w@jukam.co.ke</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="font-weight-medium text-dark" style="font-size: 0.75rem;">Farm Manager</span></td>
                                        <td>
                                            <div class="status-badge active">
                                                <span></span>
                                                Active
                                            </div>
                                        </td>
                                        <td><span class="text-muted" style="font-size: 0.75rem;">2 mins ago</span></td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link p-0 text-muted" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right botanical-shadow border-0">
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">edit</span> Edit User</a>
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">key</span> Reset Password</a>
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">outgoing_mail</span> Resend Invitation</a>
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">assignment_ind</span> Edit Roles</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item py-2 d-flex align-items-center text-danger" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">block</span> Disable Account</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- Dr David -->
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuC33AmPPYEucqpuFdbpX-CkFVxdc3ietrw6rRwdE0xVOHK-p-uTNajM5Stjr_q0moRfjA95P0xr8CYOYfg2JDww1Qo53NAd3h0ykpxSP92xmVi_7c9PHknYVBRQF1LzcTSSwdTDX6bWgC2tqjjq-p_GDT9mB-2GAvyL8b3-rPexbEKrh4sQXVXjNBMeiXpzdqb9oSU5mNCat2RCjLs6v15IlyfZUxkeQwleoW99GmhwZO3Y90QBuX7GmGVK8xadfmvJCpCJnDtl9mlF" class="user-avatar-md mr-3">
                                                <div>
                                                    <p class="font-headline font-weight-bold mb-0" style="font-size: 0.85rem;">Dr. David Otieno</p>
                                                    <p class="text-muted mb-0" style="font-size: 0.7rem;">d.otieno@jukam.co.ke</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="font-weight-medium text-dark" style="font-size: 0.75rem;">Veterinarian</span></td>
                                        <td>
                                            <div class="status-badge active">
                                                <span></span>
                                                Active
                                            </div>
                                        </td>
                                        <td><span class="text-muted" style="font-size: 0.75rem;">1 hour ago</span></td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link p-0 text-muted" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right botanical-shadow border-0">
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">edit</span> Edit User</a>
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">key</span> Reset Password</a>
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">outgoing_mail</span> Resend Invitation</a>
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">assignment_ind</span> Edit Roles</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item py-2 d-flex align-items-center text-danger" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">block</span> Disable Account</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- John -->
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuA5cB5n2HAi3JBJbZhTmGRnUmosgtcwCqRh7dhOYN2T35YxAoPZob-iUr6FKgVz6YJBOitJIz0c89IezrNbdZOGYV-_NlzYElnZDUfRWFx37IarPUSmAKvrzgpk3gtbKf0VErs51-wUemwJTLONAO4QvbYhz_74UyUae9NVO5ajeQyozFuXT3VRIVxPFucuI6z30Uma7uI87ZV_CM7-jos1axvmCdroPOFA0vysfh2xDZJf6SbomZrZlPuNZpUvh6qpw2nhFoVPR4Lk" class="user-avatar-md mr-3">
                                                <div>
                                                    <p class="font-headline font-weight-bold mb-0" style="font-size: 0.85rem;">John Mulei</p>
                                                    <p class="text-muted mb-0" style="font-size: 0.7rem;">john.m@jukam.co.ke</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="font-weight-medium text-dark" style="font-size: 0.75rem;">Milker</span></td>
                                        <td>
                                            <div class="status-badge leave">
                                                <span></span>
                                                On Leave
                                            </div>
                                        </td>
                                        <td><span class="text-muted" style="font-size: 0.75rem;">3 days ago</span></td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link p-0 text-muted" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right botanical-shadow border-0">
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">edit</span> Edit User</a>
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">key</span> Reset Password</a>
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">outgoing_mail</span> Resend Invitation</a>
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">assignment_ind</span> Edit Roles</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item py-2 d-flex align-items-center text-danger" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">block</span> Disable Account</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- Peter -->
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuCcyD-_uwptL4HMsLXZUDxIbpbkcrX0KNgPPX19CNXJ0p1Y_mE5_d5C2uap3EbDTT1winTkrMrC0bsGPPjeU2PlIYDMwt-74HctwgQYk5wWQCUkuI6d1aMaUBXL8odzhOrzLIXD9oSTLQ09dcQY5fces5XPzNtQ_zSAKTpgmL2sZTInp0TA97D6zFWNg6FnH0_B3Rz5bwFIccpch5ONJJiCvJUaDjjwqkFk2B7GxQflPZPfr9nq5R_aKEWy8mICEdVT46lTWy_D9ZWE" class="user-avatar-md mr-3">
                                                <div>
                                                    <p class="font-headline font-weight-bold mb-0" style="font-size: 0.85rem;">Peter Mwangi</p>
                                                    <p class="text-muted mb-0" style="font-size: 0.7rem;">peter.m@jukam.co.ke</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="font-weight-medium text-dark" style="font-size: 0.75rem;">Driver</span></td>
                                        <td>
                                            <div class="status-badge active">
                                                <span></span>
                                                Active
                                            </div>
                                        </td>
                                        <td><span class="text-muted" style="font-size: 0.75rem;">45 mins ago</span></td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link p-0 text-muted" type="button" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right botanical-shadow border-0">
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">edit</span> Edit User</a>
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">key</span> Reset Password</a>
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">outgoing_mail</span> Resend Invitation</a>
                                                    <a class="dropdown-item py-2 d-flex align-items-center" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">assignment_ind</span> Edit Roles</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item py-2 d-flex align-items-center text-danger" href="#" style="font-size: 0.75rem;"><span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">block</span> Disable Account</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        
                        <!-- Custom Pagination (Dairy System Style) -->
                        <div class="pagination-container py-3" id="customPagination">
                            <span class="text-muted small font-weight-medium" style="font-size: 0.75rem;" id="pageInfo">Page 1 of 1</span>
                            <div class="d-flex align-items-center" id="pageBtnGroup">
                                <button class="page-btn boundary-btn mr-3" id="prevPage">
                                    <span class="material-symbols-outlined" style="font-size: 1.25rem;">chevron_left</span>
                                </button>
                                <div id="numberButtons" class="d-flex align-items-center"></div>
                                <button class="page-btn boundary-btn ml-3" id="nextPage">
                                    <span class="material-symbols-outlined" style="font-size: 1.25rem;">chevron_right</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Side Summary -->
                <div class="col-lg-4 mt-5 mt-lg-0">
                    <div class="role-distribution-card botanical-shadow-sm">
                        <h4 class="font-headline font-weight-bold mb-4" style="font-size: 1rem;">Role Distribution</h4>
                        <div class="role-stats-list">
                            <div class="role-stat-item">
                                <div class="role-stat-header">
                                    <span>Milkers</span>
                                    <span>40%</span>
                                </div>
                                <div class="progress-track">
                                    <div class="progress-bar-fill bg-primary" style="width: 40%;"></div>
                                </div>
                            </div>
                            <div class="role-stat-item">
                                <div class="role-stat-header">
                                    <span>Drivers</span>
                                    <span>25%</span>
                                </div>
                                <div class="progress-track">
                                    <div class="progress-bar-fill" style="width: 25%; background: var(--tertiary);"></div>
                                </div>
                            </div>
                            <div class="role-stat-item">
                                <div class="role-stat-header">
                                    <span>Managers</span>
                                    <span>15%</span>
                                </div>
                                <div class="progress-track">
                                    <div class="progress-bar-fill" style="width: 15%; background: var(--secondary);"></div>
                                </div>
                            </div>
                            <div class="role-stat-item">
                                <div class="role-stat-header">
                                    <span>Vets & Admins</span>
                                    <span>20%</span>
                                </div>
                                <div class="progress-track">
                                    <div class="progress-bar-fill bg-info" style="width: 20%;"></div>
                                </div>
                            </div>
                        </div>

                        <div class="mt-5 pt-4 border-top">
                            <div class="info-alert-box">
                                <span class="material-symbols-outlined text-secondary" style="font-size: 1.25rem;">info</span>
                                <div>
                                    <p class="font-headline font-weight-bold mb-1" style="font-size: 0.75rem;">2 Invites Expiring</p>
                                    <p class="text-muted mb-2" style="font-size: 0.7rem; line-height: 1.4;">Pending milkers haven't joined in 48h. Send a nudge?</p>
                                    <button class="btn btn-link p-0 text-secondary font-weight-bold text-uppercase resend-all-btn" style="font-size: 0.65rem; letter-spacing: 0.05em; text-decoration: none !important;">Resend All</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Global Scripts -->
    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="../plugins/popper.js"></script>
    <script src="../plugins/bootstrap/bootstrap.js"></script>
    <script src="../js/header.js"></script>
    <script src="../plugins/alert/alert.js"></script>

    <!-- Add New User Modal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered user-modal-dialog" role="document">
            <div class="modal-content user-modal-content">
                <!-- Close Button Refined -->
                <button type="button" class="modal-close-trigger" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
                
                <div class="container-fluid p-0">
                    <div class="row no-gutters h-100">
                        <!-- Left Column: Branding -->
                        <div class="col-md-5 modal-branding-column d-none d-md-block">
                            <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuC-1JYD5Q2sbQTCk73oW9VWbDsEFsfU_-I04u0hWO22hDNEFlKdNE4x4yGu8hGm865hG3Q6cZWnii8JDq_vV5J3qLWnRQG3yMmYEcGe8RBb5A9i_pzdQ9s6nzRHZ8cEOa_mXBmDppcNYPbxkFmsIOo1lq4_gC74wdg26wrRW-5n3wm_K7LK-Ne8ZDcLbRSphsuQxKEr0D0tCEBQVBEkam5dQKA5eUx769Pd85iIYYJml9ppuV9XuHgnHBVGR5DYQvF1Td8Ta4yA3ryU" class="modal-branding-img" alt="Pasture">
                            <div class="modal-branding-content">
                                <div>
                                    <span class="system-access-badge">SYSTEM ACCESS</span>
                                    <h2 class="text-white font-headline font-weight-extrabold mb-3" style="font-size: 1.75rem; line-height: 1.1;">Add New User</h2>
                                    <p class="text-white-50 font-weight-light" style="font-size: 1rem; opacity: 0.8;">Expand your dairy management team with granular role control.</p>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="p-2 mr-3" style="background: rgba(255,255,255,0.1); border-radius: 0.75rem; backdrop-filter: blur(8px);">
                                        <span class="material-symbols-outlined text-white">shield_person</span>
                                    </div>
                                    <span class="text-white-50 font-weight-medium small">Secure Admin Gateway</span>
                                </div>
                            </div>
                        </div>

                        <!-- Right Column: Form -->
                        <div class="col-md-7 d-flex flex-column" style="min-height: 560px;">
                            <div class="user-modal-form-section flex-grow-1">
                                <div class="mb-5">
                                    <span class="text-uppercase font-weight-bold" style="font-size: 0.65rem; color: #795900; letter-spacing: 1.5px;">USER INFORMATION</span>
                                    <p class="text-muted small mb-0 mt-1 d-none d-md-block">Enter credentials and permissions for the new staff member.</p>
                                </div>

                                <form class="mt-4" id="addUserForm">
                                    <!-- Profile Photo Upload -->
                                    <div class="photo-upload-wrapper mb-4">
                                        <div class="row align-items-center w-100 no-gutters">
                                            <div class="col-4 col-md-auto">
                                                <div class="photo-preview-container mr-md-4">
                                                    <img src="../images/blankavatar.jpg" id="photoPreview" class="photo-preview-img" alt="Preview">
                                                </div>
                                            </div>
                                            <div class="col-8 col-md">
                                                <p class="text-xs font-weight-bold mb-1" style="color: var(--on-surface-variant); opacity: 0.8; font-size: 0.65rem;">PROFILE PHOTO</p>
                                                <label for="userPhoto" class="photo-upload-btn-label">
                                                    <span class="material-symbols-outlined mr-1" style="font-size: 1rem; vertical-align: middle;">upload</span>
                                                    Upload Photo
                                                </label>
                                                <input type="file" id="userPhoto" accept="image/*" class="d-none">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Row 1: Name & Username -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row align-items-center mb-3 mb-md-4">
                                                <label class="col-4 col-md-12 user-modal-label mb-0 mb-md-2">Full Name</label>
                                                <div class="col-8 col-md-12">
                                                    <input type="text" class="user-modal-input" placeholder="e.g. Samuel Kibet">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row align-items-center mb-3 mb-md-4">
                                                <label class="col-4 col-md-12 user-modal-label mb-0 mb-md-2">Username</label>
                                                <div class="col-8 col-md-12">
                                                    <input type="text" class="user-modal-input" placeholder="e.g. s_kibet">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Row 2: Email & Mobile -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row align-items-center mb-3 mb-md-4">
                                                <label class="col-4 col-md-12 user-modal-label mb-0 mb-md-2">Email Address</label>
                                                <div class="col-8 col-md-12">
                                                    <input type="email" class="user-modal-input" placeholder="samuel.k@jukamdairy.com">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row align-items-center mb-3 mb-md-4">
                                                <label class="col-4 col-md-12 user-modal-label mb-0 mb-md-2">Mobile Number</label>
                                                <div class="col-8 col-md-12">
                                                    <input type="tel" class="user-modal-input" placeholder="e.g. +254 700 000 000">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Row 3: Role & Access -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row align-items-center mb-3 mb-md-4">
                                                <label class="col-4 col-md-12 user-modal-label mb-0 mb-md-2">Select Role</label>
                                                <div class="col-8 col-md-12">
                                                    <div class="position-relative">
                                                        <select class="user-modal-select">
                                                            <option disabled selected>Choose Role</option>
                                                            <option>General Manager</option>
                                                            <option>Veterinarian</option>
                                                            <option>Milker</option>
                                                            <option>Driver</option>
                                                            <option>Admin</option>
                                                        </select>
                                                        <span class="material-symbols-outlined position-absolute" style="right: 12px; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 1.25rem; color: var(--on-surface-variant); opacity: 0.6;">expand_more</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row align-items-center mb-3 mb-md-4">
                                                <label class="col-4 col-md-12 user-modal-label mb-0 mb-md-2">Access Level</label>
                                                <div class="col-8 col-md-12">
                                                    <div class="position-relative">
                                                        <select class="user-modal-select">
                                                            <option disabled selected>Choose Level</option>
                                                            <option>Full Access</option>
                                                            <option>View Only</option>
                                                            <option>Editor</option>
                                                        </select>
                                                        <span class="material-symbols-outlined position-absolute" style="right: 12px; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 1.25rem; color: var(--on-surface-variant); opacity: 0.6;">expand_more</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <!-- Integrated Modal Footer -->
                            <div class="user-modal-footer">
                                <button type="button" class="btn-modal-cancel" data-dismiss="modal">Cancel</button>
                                <button type="button" class="btn-modal-save">Save User</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- DataTables JS -->
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap4.min.js"></script>

    <!-- <script>
        $(document).ready(function() {
            const table = $('#usersTable').DataTable({
                "pageLength": 5,
                "lengthChange": false,
                "searching": true,
                "info": false,
                "paging": true,
                "ordering": true,
                "order": [[0, "asc"]],
                "responsive": true,
                "columnDefs": [
                    { "responsivePriority": 1, "targets": -1 }, // Action button is MAX priority
                    { "responsivePriority": 2, "targets": 0 },  // User is high priority
                    { "responsivePriority": 10, "targets": 1 }, // Role
                    { "responsivePriority": 11, "targets": 2 }, // Status
                    { "responsivePriority": 12, "targets": 3 }, // Last Login
                    { "orderable": false, "targets": "no-sort" }
                ],
                "dom": 't', // Only show the table, we handle search and pagination manually
                "language": {
                    "search": "",
                    "searchPlaceholder": "Search employees..."
                }
            });

            // Map search input
            $('#staffSearch').on('keyup', function() {
                table.search(this.value).draw();
                updatePagination();
            });

            function updatePagination() {
                const info = table.page.info();
                $('#pageInfo').text('Page ' + (info.page + 1) + ' of ' + (info.pages || 1));
                
                let html = '';
                for (let i = 0; i < info.pages; i++) {
                    const activeClass = i === info.page ? 'active' : '';
                    html += `<button class="page-btn ${activeClass}" data-page="${i}">${i + 1}</button>`;
                }
                $('#numberButtons').html(html);
                
                $('#prevPage').prop('disabled', info.page === 0).toggleClass('disabled', info.page === 0);
                $('#nextPage').prop('disabled', info.page >= info.pages - 1 || info.pages === 0).toggleClass('disabled', info.page >= info.pages - 1 || info.pages === 0);
            }

            $('#customPagination').on('click', '.page-btn:not(.boundary-btn)', function() {
                const page = $(this).data('page');
                if (page !== undefined) { 
                    table.page(page).draw('page'); 
                    updatePagination(); 
                }
            });

            $('#prevPage').on('click', function() { 
                table.page('previous').draw('page'); 
                updatePagination(); 
            });

            $('#nextPage').on('click', function() { 
                table.page('next').draw('page'); 
                updatePagination(); 
            });

            // Initial pagination update
            updatePagination();

            // Profile Photo Preview Logic
            $('#userPhoto').on('change', function(e) {
                const file = e.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        $('#photoPreview').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(file);
                }
            });
        });
    </script> -->
</body>
</html>
