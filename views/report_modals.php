<!-- Email Delivery Modal -->
<div class="modal fade" id="emailReportModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content botanical-shadow-lg border-0" style="border-radius: 1rem; overflow: hidden;">
            <div class="modal-header bg-white border-bottom-0 pt-4 px-4 pb-0">
                <h5 class="modal-title font-headline font-weight-bold text-primary d-flex align-items-center">
                    <span class="material-symbols-outlined mr-2">mail_lock</span>
                    Email Report Delivery
                </h5>
                <button type="button" class="close text-muted" data-dismiss="modal" aria-label="Close">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>
            <div class="modal-body p-4">
                <form id="emailDeliveryForm">
                    <!-- Recipient Selection -->
                    <div class="form-group mb-4">
                        <label class="config-section-label" style="font-size: 0.65rem;">RECIPIENT USER</label>
                        <select class="form-control config-input" style="height: 50px;" id="emailRecipient">
                            <option value="james@jukam.com">James Kamau (General Manager)</option>
                            <option value="richard@jukam.com">Richard M. (Operations)</option>
                            <option value="sarah@jukam.com">Sarah W. (Quality Control)</option>
                            <option value="audit@jukam.com">External Auditor (External)</option>
                        </select>
                    </div>

                    <!-- Subject -->
                    <div class="form-group mb-4">
                        <label class="config-section-label" style="font-size: 0.65rem;">SUBJECT LINE</label>
                        <input type="text" class="form-control config-input" id="emailSubject" value="Milk Production Report - October 2023">
                    </div>

                    <!-- Body -->
                    <div class="form-group mb-4">
                        <label class="config-section-label" style="font-size: 0.65rem;">MESSAGE BODY</label>
                        <textarea class="form-control config-input" id="emailBody" rows="4" style="height: auto;">Good morning,

Please find the attached Milk Production Report for the month of October 2023 for JUKAM Dairy.

Regards,
System Automated Mailer</textarea>
                    </div>

                    <!-- Attachment Format -->
                    <div class="form-group mb-4">
                        <label class="config-section-label" style="font-size: 0.65rem;">ATTACHMENT FORMAT</label>
                        <div class="d-flex gap-3">
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="mailFmtPdf" name="mailFormat" class="custom-control-input" checked>
                                <label class="custom-control-label font-weight-bold text-xs" for="mailFmtPdf">PDF DOCUMENT</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline ml-3">
                                <input type="radio" id="mailFmtExcel" name="mailFormat" class="custom-control-input">
                                <label class="custom-control-label font-weight-bold text-xs" for="mailFmtExcel">EXCEL SPREADSHEET</label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer bg-light border-top-0 p-4">
                <button type="button" class="btn btn-link text-muted font-weight-bold text-decoration-none" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary px-4 py-2 d-flex align-items-center gap-2" id="sendEmailBtn">
                    <span class="material-symbols-outlined">send</span>
                    Send Report
                </button>
            </div>
        </div>
    </div>
</div>
