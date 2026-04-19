<!-- Lock Screen Modal -->
<div id="lockScreenOverlay" class="lock-screen-overlay" style="display: none;">
    <div class="lock-card botanical-shadow-lg">
        <header class="lock-header">
            <h1 class="font-headline lock-logo">System Locked</h1>
            <div class="lock-accent"></div>
        </header>

        <div class="lock-avatar-wrapper">
            <div class="lock-avatar-container">
                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuBKv6UhRkhViIP3Lc_sEtl_CrVj20_Rf1BVquxC5jY17a2K3bUbRCUoNIP6gt5kWuyqv7CA4j0MmsqDjnx_bwqY4iAa8tH0ZT-qcICKUBIuADOUAG8jK3McNhfJC6s1VVgPNkqnVnVfjL8Efeb_Rd2k6UPjJlhyz1ThZIxNSnZ_OWAUcFyiVeSmymtJ_qUch5Gks0MYdRgSte-J5S6OMx4s1-y471x7fh91ekDaeAY1Sh9Z5rShfmOKPVlIbLJi8_Lb4dGazC0_5D_I" alt="James Kamau" class="lock-avatar">
            </div>
            <div class="lock-badge">
                <span class="material-symbols-outlined">verified_user</span>
            </div>
        </div>

        <div class="lock-identity">
            <h2 class="font-headline lock-name">James Kamau</h2>
            <p class="lock-title">General Manager</p>
        </div>

        <form class="lock-form" onsubmit="return false;">
            <div class="lock-input-group">
                <label class="lock-input-label">Enter password</label>
                <div class="position-relative">
                    <input type="password" class="lock-input" placeholder="••••••••" id="lockPasswordInput">
                    <button type="button" class="lock-visibility-btn" id="lockTogglePassword">
                        <span class="material-symbols-outlined">visibility</span>
                    </button>
                </div>
            </div>

            <div class="lock-actions">
                <button type="submit" class="lock-btn-primary" id="unlockBtn">
                    <span class="material-symbols-outlined">lock_open</span>
                    Unlock
                </button>
                <button type="button" class="lock-btn-outline" id="switchUserBtn">
                    <span class="material-symbols-outlined">group</span>
                    Switch user
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Change Password Modal -->
<div id="passwordModalOverlay" class="password-modal-overlay" style="display: none;">
    <div class="password-modal-container botanical-shadow-lg">
        <!-- Close Button -->
        <button class="password-modal-close" id="passwordModalClose">
            <span class="material-symbols-outlined">close</span>
        </button>

        <div class="password-modal-row">
            <!-- Left Panel: Tips Sidebar -->
            <div class="password-tips-sidebar">
                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDXSc3ZV1b3nubDd9XMHrag4pea-CuLDBW1Bxx_QzOIJWRPrBFDuVPSDXR9TD96bJMHo4o0SMqKRTCNQDRlOUq0pssbrPDvgCSlPOFbqblacu7PLWdkDAVybtWdrk0QTv0KBhh6AhV1fcwSO6pRDgOOBxYTWn-eRcJG0wlZF9R6waclxPuVdK6WBs9e0O3oFksS-l2EdUwKR-PQTZ3txim1uPO4Wizq78WysLJvhyj-LsmVAhX9sQ5Ia-IbhczjsfNGIHSZCe1XHukS" alt="Security Sidebar" class="sidebar-bg-img">
                <div class="sidebar-overlay">
                    <div class="sidebar-header">
                        <img src="<?php echo $base_path ?? ''; ?>images/logo.png" alt="Logo" class="sidebar-logo-img">
                        <span class="sidebar-brand">Jukam Farm</span>
                    </div>
                    <div class="sidebar-content">
                        <h2 class="sidebar-title">Good password practice tips</h2>
                        <ul class="sidebar-tips-list">
                            <li>Use at least 8 characters</li>
                            <li>Mix letters, numbers, and symbols</li>
                            <li>Avoid using common words or birthdays</li>
                            <li>Use a unique password for this account</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Right Panel: Form Area -->
            <div class="password-form-area">
                <h2 class="form-title">Changing your password</h2>

                <!-- User Summary -->
                <div class="user-summary-row mt-4 mb-3">
                    <div class="p-relative">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuBKv6UhRkhViIP3Lc_sEtl_CrVj20_Rf1BVquxC5jY17a2K3bUbRCUoNIP6gt5kWuyqv7CA4j0MmsqDjnx_bwqY4iAa8tH0ZT-qcICKUBIuADOUAG8jK3McNhfJC6s1VVgPNkqnVnVfjL8Efeb_Rd2k6UPjJlhyz1ThZIxNSnZ_OWAUcFyiVeSmymtJ_qUch5Gks0MYdRgSte-J5S6OMx4s1-y471x7fh91ekDaeAY1Sh9Z5rShfmOKPVlIbLJi8_Lb4dGazC0_5D_I" alt="James Kamau" class="summary-avatar">
                        <div class="status-indicator"></div>
                    </div>
                    <div class="ml-3">
                        <h3 class="summary-name">James Kamau</h3>
                        <p class="summary-role">General manager</p>
                    </div>
                </div>

                <!-- Password Form -->
                <form id="changePasswordForm" class="password-form" onsubmit="return false;">
                    <div id="passwordAlertContainer"></div>
                    <div class="pass-field-group">
                        <label class="pass-input-label">Current password</label>
                        <div class="p-relative">
                            <input type="password" class="pass-input" placeholder="••••••••••••" id="currentPassInput">
                            <button type="button" class="pass-visibility-toggle">
                                <span class="material-symbols-outlined">visibility</span>
                            </button>
                        </div>
                    </div>

                    <div class="pass-field-group">
                        <label class="pass-input-label">New password</label>
                        <div class="p-relative">
                            <input type="password" class="pass-input" placeholder="Min. 8 characters" id="newPassInput">
                            <button type="button" class="pass-visibility-toggle">
                                <span class="material-symbols-outlined">visibility</span>
                            </button>
                        </div>
                        <!-- Strength Indicator -->
                        <div class="strength-indicator-row" id="strengthIndicator">
                            <div class="strength-segment"></div>
                            <div class="strength-segment"></div>
                            <div class="strength-segment"></div>
                            <div class="strength-segment"></div>
                        </div>
                    </div>

                    <div class="pass-field-group">
                        <label class="pass-input-label">Confirm new password</label>
                        <div class="p-relative">
                            <input type="password" class="pass-input" placeholder="Repeat new password" id="confirmPassInput">
                            <button type="button" class="pass-visibility-toggle">
                                <span class="material-symbols-outlined">visibility</span>
                            </button>
                        </div>
                    </div>

                    <div class="pass-modal-actions mt-5">
                        <button type="button" class="pass-btn-text" id="cancelPassBtn">Cancel</button>
                        <button type="submit" class="pass-btn-primary" id="submitPassBtn">Change password</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

