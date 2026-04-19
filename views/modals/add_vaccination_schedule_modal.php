<!-- Vaccination Schedule Modal -->
<div id="vaccinationModal" class="fixed inset-0 z-[9999] overflow-y-auto" style="display: none; width: 100%; height: 100%;" aria-labelledby="modal-title" role="dialog" aria-modal="true">
    <!-- Backdrop Blur -->
    <div class="fixed inset-0 bg-stone-900/40 backdrop-blur-md transition-opacity"></div>
    
    <!-- Modal Container -->
    <div class="flex min-h-full items-center justify-center p-4">
        <div class="relative bg-white w-full max-w-4xl rounded-[2rem] overflow-hidden shadow-2xl flex flex-col md:flex-row min-h-[560px] animate-modal-in">
            
            <!-- Left Sidebar (Botanical Brand) -->
            <div class="md:w-1/3 relative overflow-hidden bg-primary p-10 flex flex-col justify-between text-white" style="background: linear-gradient(135deg, var(--primary), #164318);">
                <!-- Decorative Botanical Background -->
                <div class="absolute inset-0 opacity-20 pointer-events-none">
                    <img class="w-full h-full object-cover mix-blend-overlay" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDFARTsU3dpTtLaqQZZWEzRoQsVTkW2LZYB78FAfz1SBY2W6OIBOldnQliXBIvhRWjAbBhtqw7NZHEF59yxTxZCQkYUl1-1ybbRJQ-UsMRllbSjF9hXSN-c_-rfVCVw_jGbNz67Djy2XtM6bpN-wPhESOQ01sZzn10eHyURHljP_wLaZ0XVyLJw4ExQIEezXyPQRxcHQBoZy5MpYH9h9bkoD98IbLlQpRDyG9x854G4NFV2ze3uhSAN_Kgj7uDSZBnHHexFESZe113y" alt="Botanical Pattern">
                </div>
                
                <div class="relative z-10">
                    <span class="material-symbols-outlined text-5xl mb-6 opacity-90">medical_information</span>
                    <h2 class="text-3xl font-bold font-headline leading-tight">New Health Schedule</h2>
                    <p class="mt-4 text-white/80 leading-relaxed font-body" style="font-size: 0.9rem;">Ensure the vitality of your herd through precise, proactive healthcare planning.</p>
                </div>
                
                <div class="relative z-10 mt-8">
                    <div class="flex items-center gap-3">
                        <div class="w-1.5 h-1.5 rounded-full bg-warning"></div>
                        <p class="text-xs font-semibold uppercase tracking-widest opacity-80">Protocol-First Design</p>
                    </div>
                </div>
            </div>

            <!-- Right Side (Form) -->
            <div class="md:w-2/3 p-10 flex flex-col bg-white">
                <div class="flex justify-between items-start mb-8">
                    <div>
                        <h3 class="text-2xl font-bold font-headline text-on-surface">Vaccination Details</h3>
                        <p class="text-stone-500 text-sm mt-1">Fill in the parameters for the new health record.</p>
                    </div>
                    <button type="button" class="close-modal-btn p-2 hover:bg-stone-100 rounded-full transition-colors text-stone-400">
                        <span class="material-symbols-outlined">close</span>
                    </button>
                </div>

                <form id="vaccinationForm" class="flex-1 space-y-6">
                    <div class="grid grid-cols-2 gap-6">
                        <!-- Disease Selection -->
                        <div class="col-span-2 md:col-span-1 space-y-2">
                            <label class="font-label text-stone-700 uppercase tracking-wider" style="font-size: 0.7rem; font-weight: 700;">Select Disease</label>
                            <div class="relative">
                                <select class="w-full bg-stone-50 border border-stone-100 rounded-xl px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all appearance-none" style="font-size: 0.85rem;">
                                    <option value="" disabled selected>Select Option</option>
                                    <option>Bovine Viral Diarrhea (BVD)</option>
                                    <option>Foot & Mouth Disease</option>
                                    <option>Brucellosis</option>
                                    <option>Anthrax</option>
                                </select>
                                <span class="material-symbols-outlined absolute right-4 top-1/2 -translate-y-1/2 text-stone-400 pointer-events-none">expand_more</span>
                            </div>
                        </div>

                        <!-- Target Animals -->
                        <div class="col-span-2 md:col-span-1 space-y-2">
                            <label class="font-label text-stone-700 uppercase tracking-wider" style="font-size: 0.7rem; font-weight: 700;">Target Animals</label>
                            <div class="relative">
                                <input class="w-full bg-stone-50 border border-stone-100 rounded-xl px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all" placeholder="e.g., Pen ID 04" type="text" style="font-size: 0.85rem;">
                                <span class="material-symbols-outlined absolute right-4 top-1/2 -translate-y-1/2 text-stone-400">groups</span>
                            </div>
                        </div>

                        <!-- Scheduled Date -->
                        <div class="col-span-2 space-y-2">
                            <label class="font-label text-stone-700 uppercase tracking-wider" style="font-size: 0.7rem; font-weight: 700;">Scheduled Date</label>
                            <div class="relative">
                                <input class="w-full bg-stone-50 border border-stone-100 rounded-xl px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all" type="date" style="font-size: 0.85rem;">
                            </div>
                        </div>

                        <!-- Notes -->
                        <div class="col-span-2 space-y-2">
                            <label class="font-label text-stone-700 uppercase tracking-wider" style="font-size: 0.7rem; font-weight: 700;">Notes & Special Instructions</label>
                            <textarea class="w-full bg-stone-50 border border-stone-100 rounded-xl px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all resize-none" placeholder="Additional details..." rows="3" style="font-size: 0.85rem;"></textarea>
                        </div>
                    </div>
                </form>

                <!-- Footer Actions -->
                <div class="mt-10 flex items-center justify-end gap-4">
                    <button type="button" class="close-modal-btn px-6 py-3 text-stone-500 font-semibold hover:bg-stone-50 rounded-xl transition-all" style="font-size: 0.85rem;">
                        Cancel
                    </button>
                    <button type="submit" form="vaccinationForm" class="px-10 py-3 bg-primary text-white font-bold rounded-xl shadow-lg shadow-primary/20 hover:shadow-primary/40 hover:-translate-y-0.5 transition-all" style="font-size: 0.9rem;">
                        Save Schedule
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
@keyframes modalIn {
    from { opacity: 0; transform: scale(0.95) translateY(10px); }
    to { opacity: 1; transform: scale(1) translateY(0); }
}
.animate-modal-in {
    animation: modalIn 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
}
</style>
