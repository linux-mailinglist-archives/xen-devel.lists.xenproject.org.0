Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FBF742A0B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556962.869934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtzy-0002Sb-Bp; Thu, 29 Jun 2023 15:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556962.869934; Thu, 29 Jun 2023 15:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtzy-0002Oh-87; Thu, 29 Jun 2023 15:55:58 +0000
Received: by outflank-mailman (input) for mailman id 556962;
 Thu, 29 Jun 2023 15:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6tI=CR=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qEtzw-0000zX-OG
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:55:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dcad14a-1695-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 17:55:54 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.160.192.186])
 by support.bugseng.com (Postfix) with ESMTPSA id 49A6F4EE0740;
 Thu, 29 Jun 2023 17:55:51 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6dcad14a-1695-11ee-8611-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH 5/5] x86: make parameter names of function declarations consistent
Date: Thu, 29 Jun 2023 17:55:33 +0200
Message-Id: <5ee57d7bcd79daa0314f182ecb73e1eb6d8ecc03.1688049495.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688049494.git.federico.serafini@bugseng.com>
References: <cover.1688049494.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the parameter names of function declarations to be consistent
with the names used in the corresponding function definitions
so as to fix violations of MISRA C:2012 Rule 8.3.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/cpu/mcheck/mce.h           |  2 +-
 xen/arch/x86/cpu/mcheck/x86_mca.h       |  2 +-
 xen/arch/x86/hvm/rtc.c                  |  2 +-
 xen/arch/x86/hvm/svm/nestedhvm.h        |  2 +-
 xen/arch/x86/hvm/vioapic.c              |  2 +-
 xen/arch/x86/include/asm/genapic.h      |  2 +-
 xen/arch/x86/include/asm/guest_pt.h     |  2 +-
 xen/arch/x86/include/asm/hap.h          |  2 +-
 xen/arch/x86/include/asm/hvm/io.h       |  2 +-
 xen/arch/x86/include/asm/hvm/monitor.h  |  2 +-
 xen/arch/x86/include/asm/hvm/svm/vmcb.h |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  4 ++--
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h |  8 +++----
 xen/arch/x86/include/asm/io_apic.h      |  2 +-
 xen/arch/x86/include/asm/irq.h          |  6 ++---
 xen/arch/x86/include/asm/mem_access.h   |  2 +-
 xen/arch/x86/include/asm/mpspec.h       |  2 +-
 xen/arch/x86/include/asm/msi.h          |  4 ++--
 xen/arch/x86/include/asm/p2m.h          |  8 +++----
 xen/arch/x86/include/asm/paging.h       |  2 +-
 xen/arch/x86/include/asm/psr.h          |  2 +-
 xen/arch/x86/include/asm/setup.h        |  2 +-
 xen/arch/x86/include/asm/uaccess.h      |  6 ++---
 xen/arch/x86/include/asm/xstate.h       |  2 +-
 xen/include/xen/lib/x86/cpu-policy.h    | 29 +++++++++++++------------
 25 files changed, 51 insertions(+), 50 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index bea08bdc74..72d8dbc471 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -44,7 +44,7 @@ extern uint8_t cmci_apic_vector;
 extern bool lmce_support;
 
 /* Init functions */
-enum mcheck_type amd_mcheck_init(struct cpuinfo_x86 *c);
+enum mcheck_type amd_mcheck_init(struct cpuinfo_x86 *ci);
 enum mcheck_type intel_mcheck_init(struct cpuinfo_x86 *c, bool bsp);
 
 void amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c);
diff --git a/xen/arch/x86/cpu/mcheck/x86_mca.h b/xen/arch/x86/cpu/mcheck/x86_mca.h
index 18116737af..36b6127a37 100644
--- a/xen/arch/x86/cpu/mcheck/x86_mca.h
+++ b/xen/arch/x86/cpu/mcheck/x86_mca.h
@@ -113,7 +113,7 @@ static inline int mcabanks_test(int bit, struct mca_banks* banks)
     return test_bit(bit, banks->bank_map);
 }
 
-struct mca_banks *mcabanks_alloc(unsigned int nr);
+struct mca_banks *mcabanks_alloc(unsigned int nr_mce_banks);
 void mcabanks_free(struct mca_banks *banks);
 extern struct mca_banks *mca_allbanks;
 
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index c1ab6c7d58..ebb259586a 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -59,7 +59,7 @@ enum rtc_mode {
 static void rtc_copy_date(RTCState *s);
 static void rtc_set_time(RTCState *s);
 static inline int from_bcd(RTCState *s, int a);
-static inline int convert_hour(RTCState *s, int hour);
+static inline int convert_hour(RTCState *s, int raw);
 
 static void rtc_update_irq(RTCState *s)
 {
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index 43245e13de..eb9c416307 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -42,7 +42,7 @@ int cf_check nsvm_vcpu_initialise(struct vcpu *v);
 int cf_check nsvm_vcpu_reset(struct vcpu *v);
 int nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs);
 int cf_check nsvm_vcpu_vmexit_event(struct vcpu *v,
-                                    const struct x86_event *event);
+                                    const struct x86_event *trap);
 uint64_t cf_check nsvm_vcpu_hostcr3(struct vcpu *v);
 bool cf_check nsvm_vmcb_guest_intercepts_event(
     struct vcpu *v, unsigned int vector, int errcode);
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 41e3c4d5e4..4e40d3609a 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -43,7 +43,7 @@
 /* HACK: Route IRQ0 only to VCPU0 to prevent time jumps. */
 #define IRQ0_SPECIAL_ROUTING 1
 
-static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int irq);
+static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin);
 
 static struct hvm_vioapic *addr_vioapic(const struct domain *d,
                                         unsigned long addr)
diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index beeaddf19d..970df8ffe0 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -43,7 +43,7 @@ void cf_check send_IPI_self_legacy(uint8_t vector);
 
 void cf_check init_apic_ldr_flat(void);
 unsigned int cf_check cpu_mask_to_apicid_flat(const cpumask_t *cpumask);
-void cf_check send_IPI_mask_flat(const cpumask_t *mask, int vector);
+void cf_check send_IPI_mask_flat(const cpumask_t *cpumask, int vector);
 const cpumask_t *cf_check vector_allocation_cpumask_flat(int cpu);
 #define GENAPIC_FLAT \
 	.int_delivery_mode = dest_LowestPrio, \
diff --git a/xen/arch/x86/include/asm/guest_pt.h b/xen/arch/x86/include/asm/guest_pt.h
index bde7588342..f616357107 100644
--- a/xen/arch/x86/include/asm/guest_pt.h
+++ b/xen/arch/x86/include/asm/guest_pt.h
@@ -422,7 +422,7 @@ static inline unsigned int guest_walk_to_page_order(const walk_t *gw)
 
 bool
 guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
-                  unsigned long va, walk_t *gw, uint32_t pfec,
+                  unsigned long va, walk_t *gw, uint32_t walk,
                   gfn_t top_gfn, mfn_t top_mfn, void *top_map);
 
 /* Pretty-print the contents of a guest-walk */
diff --git a/xen/arch/x86/include/asm/hap.h b/xen/arch/x86/include/asm/hap.h
index 9d12327b12..05e124ad57 100644
--- a/xen/arch/x86/include/asm/hap.h
+++ b/xen/arch/x86/include/asm/hap.h
@@ -30,7 +30,7 @@ void  hap_vcpu_init(struct vcpu *v);
 int   hap_track_dirty_vram(struct domain *d,
                            unsigned long begin_pfn,
                            unsigned int nr_frames,
-                           XEN_GUEST_HANDLE(void) dirty_bitmap);
+                           XEN_GUEST_HANDLE(void) guest_dirty_bitmap);
 
 extern const struct paging_mode *hap_paging_get_mode(struct vcpu *);
 int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted);
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index 8df33eb6cc..cad082f020 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -90,7 +90,7 @@ bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
                                   struct npfec);
 bool handle_pio(uint16_t port, unsigned int size, int dir);
 void hvm_interrupt_post(struct vcpu *v, int vector, int type);
-void hvm_dpci_eoi(struct domain *d, unsigned int guest_irq);
+void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi);
 void msix_write_completion(struct vcpu *);
 
 #ifdef CONFIG_HVM
diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
index 5276b0af08..02021be47b 100644
--- a/xen/arch/x86/include/asm/hvm/monitor.h
+++ b/xen/arch/x86/include/asm/hvm/monitor.h
@@ -25,7 +25,7 @@ bool hvm_monitor_cr(unsigned int index, unsigned long value,
                     unsigned long old);
 #define hvm_monitor_crX(cr, new, old) \
                         hvm_monitor_cr(VM_EVENT_X86_##cr, new, old)
-bool hvm_monitor_msr(unsigned int msr, uint64_t value, uint64_t old_value);
+bool hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t old_value);
 void hvm_monitor_descriptor_access(uint64_t exit_info,
                                    uint64_t vmx_exit_qualification,
                                    uint8_t descriptor, bool is_write);
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index a1a8a7fd25..91221ff4e2 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -607,7 +607,7 @@ void setup_vmcb_dump(void);
 #define MSR_INTERCEPT_READ    1
 #define MSR_INTERCEPT_WRITE   2
 #define MSR_INTERCEPT_RW      (MSR_INTERCEPT_WRITE | MSR_INTERCEPT_READ)
-void svm_intercept_msr(struct vcpu *v, uint32_t msr, int enable);
+void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags);
 #define svm_disable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_NONE)
 #define svm_enable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_RW)
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index d07fcb2bc9..24bf409d8f 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -656,10 +656,10 @@ bool vmx_msr_is_intercepted(struct vmx_msr_bitmap *msr_bitmap,
                             unsigned int msr, bool is_write) __nonnull(1);
 void virtual_vmcs_enter(const struct vcpu *);
 void virtual_vmcs_exit(const struct vcpu *);
-u64 virtual_vmcs_vmread(const struct vcpu *, u32 encoding);
+u64 virtual_vmcs_vmread(const struct vcpu *, u32 vmcs_encoding);
 enum vmx_insn_errno virtual_vmcs_vmread_safe(const struct vcpu *v,
                                              u32 vmcs_encoding, u64 *val);
-void virtual_vmcs_vmwrite(const struct vcpu *, u32 encoding, u64 val);
+void virtual_vmcs_vmwrite(const struct vcpu *, u32 vmcs_encoding, u64 val);
 enum vmx_insn_errno virtual_vmcs_vmwrite_safe(const struct vcpu *v,
                                               u32 vmcs_encoding, u64 val);
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index dc9db69258..1e4bbc0d78 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -144,9 +144,9 @@ enum vvmcs_encoding_type {
     VVMCS_TYPE_HSTATE,
 };
 
-u64 get_vvmcs_virtual(void *vvmcs, u32 encoding);
+u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding);
 u64 get_vvmcs_real(const struct vcpu *, u32 encoding);
-void set_vvmcs_virtual(void *vvmcs, u32 encoding, u64 val);
+void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val);
 void set_vvmcs_real(const struct vcpu *, u32 encoding, u64 val);
 enum vmx_insn_errno get_vvmcs_virtual_safe(void *vvmcs, u32 encoding, u64 *val);
 enum vmx_insn_errno get_vvmcs_real_safe(const struct vcpu *, u32 encoding,
@@ -180,9 +180,9 @@ int nvmx_handle_vmx_insn(struct cpu_user_regs *regs, unsigned int exit_reason);
 int nvmx_msr_read_intercept(unsigned int msr,
                                 u64 *msr_content);
 
-void nvmx_update_exec_control(struct vcpu *v, u32 value);
+void nvmx_update_exec_control(struct vcpu *v, u32 host_cntrl);
 void nvmx_update_secondary_exec_control(struct vcpu *v,
-                                        unsigned long value);
+                                        unsigned long host_cntrl);
 void nvmx_update_exception_bitmap(struct vcpu *v, unsigned long value);
 void nvmx_switch_guest(void);
 void nvmx_idtv_handling(void);
diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index ef0878b09e..9b22448ef0 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -207,6 +207,6 @@ extern int restore_IO_APIC_setup(struct IO_APIC_route_entry **ioapic_entries,
 unsigned highest_gsi(void);
 
 int ioapic_guest_read( unsigned long physbase, unsigned int reg, u32 *pval);
-int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 pval);
+int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val);
 
 #endif
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 424b0e1af8..f49388a47f 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -112,7 +112,7 @@ void cf_check enable_8259A_irq(struct irq_desc *);
 int i8259A_irq_pending(unsigned int irq);
 void mask_8259A(void);
 void unmask_8259A(void);
-void init_8259A(int aeoi);
+void init_8259A(int auto_eoi);
 void make_8259A_irq(unsigned int irq);
 bool bogus_8259A_irq(unsigned int irq);
 int i8259A_suspend(void);
@@ -141,7 +141,7 @@ struct arch_pirq {
 #define pirq_dpci(pirq) ((pirq) ? &(pirq)->arch.hvm.dpci : NULL)
 #define dpci_pirq(pd) container_of(pd, struct pirq, arch.hvm.dpci)
 
-int pirq_shared(struct domain *d , int irq);
+int pirq_shared(struct domain *d , int pirq);
 
 int map_domain_pirq(struct domain *d, int pirq, int irq, int type,
                            void *data);
@@ -149,7 +149,7 @@ int unmap_domain_pirq(struct domain *d, int pirq);
 int get_free_pirq(struct domain *d, int type);
 int get_free_pirqs(struct domain *, unsigned int nr);
 void free_domain_pirqs(struct domain *d);
-int map_domain_emuirq_pirq(struct domain *d, int pirq, int irq);
+int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq);
 int unmap_domain_pirq_emuirq(struct domain *d, int pirq);
 
 /* Reset irq affinities to match the given CPU mask. */
diff --git a/xen/arch/x86/include/asm/mem_access.h b/xen/arch/x86/include/asm/mem_access.h
index 8957e1181c..1a52a10322 100644
--- a/xen/arch/x86/include/asm/mem_access.h
+++ b/xen/arch/x86/include/asm/mem_access.h
@@ -39,7 +39,7 @@ int p2m_set_suppress_ve(struct domain *d, gfn_t gfn, bool suppress_ve,
 
 struct xen_hvm_altp2m_suppress_ve_multi;
 int p2m_set_suppress_ve_multi(struct domain *d,
-                              struct xen_hvm_altp2m_suppress_ve_multi *suppress_ve);
+                              struct xen_hvm_altp2m_suppress_ve_multi *sve);
 
 int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
                         unsigned int altp2m_idx);
diff --git a/xen/arch/x86/include/asm/mpspec.h b/xen/arch/x86/include/asm/mpspec.h
index 1246eece0b..cf8b360259 100644
--- a/xen/arch/x86/include/asm/mpspec.h
+++ b/xen/arch/x86/include/asm/mpspec.h
@@ -26,7 +26,7 @@ extern void mp_register_lapic_address (u64 address);
 extern void mp_register_ioapic (u8 id, u32 address, u32 gsi_base);
 extern void mp_override_legacy_irq (u8 bus_irq, u8 polarity, u8 trigger, u32 gsi);
 extern void mp_config_acpi_legacy_irqs (void);
-extern int mp_register_gsi (u32 gsi, int edge_level, int active_high_low);
+extern int mp_register_gsi (u32 gsi, int triggering, int polarity);
 #endif /* CONFIG_ACPI */
 
 #define PHYSID_ARRAY_SIZE	BITS_TO_LONGS(MAX_APICS)
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index a53ade95c9..687df5942a 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -82,7 +82,7 @@ struct hw_interrupt_type;
 struct msi_desc;
 /* Helper functions */
 extern int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc);
-extern void pci_disable_msi(struct msi_desc *desc);
+extern void pci_disable_msi(struct msi_desc *msi_desc);
 extern int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off);
 extern void pci_cleanup_msi(struct pci_dev *pdev);
 extern int setup_msi_irq(struct irq_desc *, struct msi_desc *);
@@ -220,7 +220,7 @@ struct arch_msix {
 };
 
 void early_msi_init(void);
-void msi_compose_msg(unsigned vector, const cpumask_t *mask,
+void msi_compose_msg(unsigned vector, const cpumask_t *cpu_mask,
                      struct msi_msg *msg);
 void __msi_set_enable(u16 seg, u8 bus, u8 slot, u8 func, int pos, int enable);
 void cf_check mask_msi_irq(struct irq_desc *);
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 40545f5fa8..67bd3201bc 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -632,7 +632,7 @@ void p2m_change_type_range(struct domain *d,
                            p2m_type_t ot, p2m_type_t nt);
 
 /* Compare-exchange the type of a single p2m entry */
-int p2m_change_type_one(struct domain *d, unsigned long gfn,
+int p2m_change_type_one(struct domain *d, unsigned long gfn_l,
                         p2m_type_t ot, p2m_type_t nt);
 
 /* Synchronously change the p2m type for a range of gfns */
@@ -661,9 +661,9 @@ int set_identity_p2m_entry(struct domain *d, unsigned long gfn,
                            p2m_access_t p2ma, unsigned int flag);
 int clear_identity_p2m_entry(struct domain *d, unsigned long gfn);
 /* HVM-only callers can use these directly: */
-int p2m_add_identity_entry(struct domain *d, unsigned long gfn,
+int p2m_add_identity_entry(struct domain *d, unsigned long gfn_l,
                            p2m_access_t p2ma, unsigned int flag);
-int p2m_remove_identity_entry(struct domain *d, unsigned long gfn);
+int p2m_remove_identity_entry(struct domain *d, unsigned long gfn_l);
 
 /* 
  * Populate-on-demand
@@ -924,7 +924,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
                                 p2m_type_t p2mt, p2m_access_t p2ma);
 
 /* Set a specific p2m view visibility */
-int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int idx,
+int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
                                    uint8_t visible);
 #else /* !CONFIG_HVM */
 struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 403243bfbd..a72a8d63ce 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -246,7 +246,7 @@ paging_fault(unsigned long va, struct cpu_user_regs *regs)
 }
 
 /* Handle invlpg requests on vcpus. */
-void paging_invlpg(struct vcpu *v, unsigned long va);
+void paging_invlpg(struct vcpu *v, unsigned long linear);
 
 /*
  * Translate a guest virtual address to the frame number that the
diff --git a/xen/arch/x86/include/asm/psr.h b/xen/arch/x86/include/asm/psr.h
index c2257da7fc..8ecb7a0eea 100644
--- a/xen/arch/x86/include/asm/psr.h
+++ b/xen/arch/x86/include/asm/psr.h
@@ -81,7 +81,7 @@ int psr_get_info(unsigned int socket, enum psr_type type,
 int psr_get_val(struct domain *d, unsigned int socket,
                 uint32_t *val, enum psr_type type);
 int psr_set_val(struct domain *d, unsigned int socket,
-                uint64_t val, enum psr_type type);
+                uint64_t new_val, enum psr_type type);
 
 void psr_domain_init(struct domain *d);
 void psr_domain_free(struct domain *d);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index ae0dd3915a..29ccacfd7f 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -33,7 +33,7 @@ static inline void vesa_init(void) {};
 
 int construct_dom0(
     struct domain *d,
-    const module_t *kernel, unsigned long kernel_headroom,
+    const module_t *image, unsigned long image_headroom,
     module_t *initrd,
     char *cmdline);
 void setup_io_bitmap(struct domain *d);
diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 684fccd95c..7443519d5b 100644
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -10,10 +10,10 @@
 #include <asm/x86_64/uaccess.h>
 
 unsigned int copy_to_guest_pv(void __user *to, const void *from,
-                              unsigned int len);
-unsigned int clear_guest_pv(void __user *to, unsigned int len);
+                              unsigned int n);
+unsigned int clear_guest_pv(void __user *to, unsigned int n);
 unsigned int copy_from_guest_pv(void *to, const void __user *from,
-                                unsigned int len);
+                                unsigned int n);
 
 /* Handles exceptions in both to and from, but doesn't do access_ok */
 unsigned int copy_to_guest_ll(void __user*to, const void *from, unsigned int n);
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 7ab0bdde89..4fb4312192 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -87,7 +87,7 @@ struct xstate_bndcsr {
 };
 
 /* extended state operations */
-bool __must_check set_xcr0(u64 xfeatures);
+bool __must_check set_xcr0(u64 val);
 uint64_t get_xcr0(void);
 void set_msr_xss(u64 xss);
 uint64_t get_msr_xss(void);
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 6d5e9edd26..bab3eecda6 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -451,23 +451,24 @@ typedef xen_msr_entry_t msr_entry_buffer_t[];
  * Serialise the CPUID leaves of a cpu_policy object into an array of cpuid
  * leaves.
  *
- * @param policy     The cpu_policy to serialise.
- * @param leaves     The array of leaves to serialise into.
- * @param nr_entries The number of entries in 'leaves'.
+ * @param p            The cpu_policy to serialise.
+ * @param leaves       The array of leaves to serialise into.
+ * @param nr_entries_p The number of entries in 'leaves'.
  * @returns -errno
  *
  * Writes at most CPUID_MAX_SERIALISED_LEAVES.  May fail with -ENOBUFS if the
  * leaves array is too short.  On success, nr_entries is updated with the
  * actual number of leaves written.
  */
-int x86_cpuid_copy_to_buffer(const struct cpu_policy *policy,
-                             cpuid_leaf_buffer_t leaves, uint32_t *nr_entries);
+int x86_cpuid_copy_to_buffer(const struct cpu_policy *p,
+                             cpuid_leaf_buffer_t leaves,
+                             uint32_t *nr_entries_p);
 
 /**
  * Unserialise the CPUID leaves of a cpu_policy object into an array of cpuid
  * leaves.
  *
- * @param policy      The cpu_policy to unserialise into.
+ * @param p           The cpu_policy to unserialise into.
  * @param leaves      The array of leaves to unserialise from.
  * @param nr_entries  The number of entries in 'leaves'.
  * @param err_leaf    Optional hint for error diagnostics.
@@ -481,7 +482,7 @@ int x86_cpuid_copy_to_buffer(const struct cpu_policy *policy,
  * No content validation of in-range leaves is performed.  Synthesised data is
  * recalculated.
  */
-int x86_cpuid_copy_from_buffer(struct cpu_policy *policy,
+int x86_cpuid_copy_from_buffer(struct cpu_policy *p,
                                const cpuid_leaf_buffer_t leaves,
                                uint32_t nr_entries, uint32_t *err_leaf,
                                uint32_t *err_subleaf);
@@ -489,22 +490,22 @@ int x86_cpuid_copy_from_buffer(struct cpu_policy *policy,
 /**
  * Serialise the MSRs of a cpu_policy object into an array.
  *
- * @param policy     The cpu_policy to serialise.
- * @param msrs       The array of msrs to serialise into.
- * @param nr_entries The number of entries in 'msrs'.
+ * @param p            The cpu_policy to serialise.
+ * @param msrs         The array of msrs to serialise into.
+ * @param nr_entries_p The number of entries in 'msrs'.
  * @returns -errno
  *
  * Writes at most MSR_MAX_SERIALISED_ENTRIES.  May fail with -ENOBUFS if the
  * buffer array is too short.  On success, nr_entries is updated with the
  * actual number of msrs written.
  */
-int x86_msr_copy_to_buffer(const struct cpu_policy *policy,
-                           msr_entry_buffer_t msrs, uint32_t *nr_entries);
+int x86_msr_copy_to_buffer(const struct cpu_policy *p,
+                           msr_entry_buffer_t msrs, uint32_t *nr_entries_p);
 
 /**
  * Unserialise the MSRs of a cpu_policy object from an array of msrs.
  *
- * @param policy     The cpu_policy object to unserialise into.
+ * @param p          The cpu_policy object to unserialise into.
  * @param msrs       The array of msrs to unserialise from.
  * @param nr_entries The number of entries in 'msrs'.
  * @param err_msr    Optional hint for error diagnostics.
@@ -518,7 +519,7 @@ int x86_msr_copy_to_buffer(const struct cpu_policy *policy,
  *
  * No content validation is performed on the data stored in the policy object.
  */
-int x86_msr_copy_from_buffer(struct cpu_policy *policy,
+int x86_msr_copy_from_buffer(struct cpu_policy *p,
                              const msr_entry_buffer_t msrs, uint32_t nr_entries,
                              uint32_t *err_msr);
 
-- 
2.34.1


