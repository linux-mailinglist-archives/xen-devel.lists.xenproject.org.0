Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C292945C4
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 02:00:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9810.25987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1Ye-0000XG-4Y; Wed, 21 Oct 2020 00:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9810.25987; Wed, 21 Oct 2020 00:00:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1Yd-0000VY-IA; Wed, 21 Oct 2020 00:00:47 +0000
Received: by outflank-mailman (input) for mailman id 9810;
 Wed, 21 Oct 2020 00:00:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kV1Yb-0007y0-Op
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:45 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 595ad608-21a7-43ab-88ee-7caa93da50e1;
 Wed, 21 Oct 2020 00:00:21 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0104522409;
 Wed, 21 Oct 2020 00:00:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kV1Yb-0007y0-Op
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:45 +0000
X-Inumbo-ID: 595ad608-21a7-43ab-88ee-7caa93da50e1
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 595ad608-21a7-43ab-88ee-7caa93da50e1;
	Wed, 21 Oct 2020 00:00:21 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0104522409;
	Wed, 21 Oct 2020 00:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603238420;
	bh=m+Bt7REJylp9ULKwq9LZGyEvinEHkPdrUMKBkY9SP1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jX+GYe87igyQpmmN/NchkyD42TfqbUQm5HY8r+tHC61pezuzIKrvDYXP9Df/kE2QQ
	 i34mFJMECnZMJebv/BJ9MnyeK8W7dxYYQnDw1Ycs0yQEs4+qruDa78KQ/XAOvXkY+S
	 sHJ+eA4Z9MG+k7n/Jmp2uzpDgEHv9wLS0VBO8y5E=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	ian.jackson@eu.citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	wl@xen.org,
	Bertrand.Marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 12/14] kernel-doc: public/xen.h
Date: Tue, 20 Oct 2020 17:00:09 -0700
Message-Id: <20201021000011.15351-12-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- remove "enum" comments
- use oneline comments even for nested struct members
---
 xen/include/public/xen.h | 566 +++++++++++++++++++++++++--------------
 1 file changed, 369 insertions(+), 197 deletions(-)

diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index e373592c33..420b5f56cd 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -81,14 +81,62 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 
 #endif
 
-/*
- * HYPERCALLS
- */
-
-/* `incontents 100 hcalls List of hypercalls
- * ` enum hypercall_num { // __HYPERVISOR_* => HYPERVISOR_*()
+/**
+ * DOC: HYPERCALLS
+ *
+ * List of hypercalls
+ *
+ * - __HYPERVISOR_set_trap_table
+ * - __HYPERVISOR_mmu_update
+ * - __HYPERVISOR_set_gdt
+ * - __HYPERVISOR_stack_switch
+ * - __HYPERVISOR_set_callbacks
+ * - __HYPERVISOR_fpu_taskswitch
+ * - __HYPERVISOR_sched_op_compat
+ * - __HYPERVISOR_platform_op
+ * - __HYPERVISOR_set_debugreg
+ * - __HYPERVISOR_get_debugreg
+ * - __HYPERVISOR_update_descriptor
+ * - __HYPERVISOR_memory_op
+ * - __HYPERVISOR_multicall
+ * - __HYPERVISOR_update_va_mapping
+ * - __HYPERVISOR_set_timer_op
+ * - __HYPERVISOR_event_channel_op_compat
+ * - __HYPERVISOR_xen_version
+ * - __HYPERVISOR_console_io
+ * - __HYPERVISOR_physdev_op_compat
+ * - __HYPERVISOR_grant_table_op
+ * - __HYPERVISOR_vm_assist
+ * - __HYPERVISOR_update_va_mapping_otherdomain
+ * - __HYPERVISOR_iret
+ * - __HYPERVISOR_vcpu_op
+ * - __HYPERVISOR_set_segment_base
+ * - __HYPERVISOR_mmuext_op
+ * - __HYPERVISOR_xsm_op
+ * - __HYPERVISOR_nmi_op
+ * - __HYPERVISOR_sched_op
+ * - __HYPERVISOR_callback_op
+ * - __HYPERVISOR_xenoprof_op
+ * - __HYPERVISOR_event_channel_op
+ * - __HYPERVISOR_physdev_op
+ * - __HYPERVISOR_hvm_op
+ * - __HYPERVISOR_sysctl
+ * - __HYPERVISOR_domctl
+ * - __HYPERVISOR_kexec_op
+ * - __HYPERVISOR_tmem_op
+ * - __HYPERVISOR_argo_op
+ * - __HYPERVISOR_xenpmu_op
+ * - __HYPERVISOR_dm_op
+ * - __HYPERVISOR_hypfs_op
+ * - __HYPERVISOR_arch_0
+ * - __HYPERVISOR_arch_1
+ * - __HYPERVISOR_arch_2
+ * - __HYPERVISOR_arch_3
+ * - __HYPERVISOR_arch_4
+ * - __HYPERVISOR_arch_5
+ * - __HYPERVISOR_arch_6
+ * - __HYPERVISOR_arch_7
  */
-
 #define __HYPERVISOR_set_trap_table        0
 #define __HYPERVISOR_mmu_update            1
 #define __HYPERVISOR_set_gdt               2
@@ -142,8 +190,6 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define __HYPERVISOR_arch_6               54
 #define __HYPERVISOR_arch_7               55
 
-/* ` } */
-
 /*
  * HYPERCALL COMPATIBILITY.
  */
@@ -167,8 +213,8 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define __HYPERVISOR_dom0_op __HYPERVISOR_platform_op
 #endif
 
-/*
- * VIRTUAL INTERRUPTS
+/**
+ * DOC: VIRTUAL INTERRUPTS
  *
  * Virtual interrupts that a guest OS may receive from Xen.
  *
@@ -176,21 +222,42 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
  * global VIRQ. The former can be bound once per VCPU and cannot be re-bound.
  * The latter can be allocated only once per guest: they must initially be
  * allocated to VCPU0 but can subsequently be re-bound.
+ *
+ * - VIRQ_TIMER:      V. Timebase update, and/or requested timeout.
+ * - VIRQ_DEBUG:      V. Request guest to dump debug info.
+ * - VIRQ_CONSOLE:    G. (DOM0) Bytes received on emergency console.
+ * - VIRQ_DOM_EXC:    G. (DOM0) Exceptional event for some domain.
+ * - VIRQ_TBUF:       G. (DOM0) Trace buffer has records available.
+ * - VIRQ_DEBUGGER:   G. (DOM0) A domain has paused for debugging.
+ * - VIRQ_XENOPROF:   V. XenOprofile interrupt: new sample available
+ * - VIRQ_CON_RING:   G. (DOM0) Bytes received on console
+ * - VIRQ_PCPU_STATE: G. (DOM0) PCPU state changed
+ * - VIRQ_MEM_EVENT:  G. (DOM0) A memory event has occurred
+ * - VIRQ_ARGO:       G. Argo interdomain message notification
+ * - VIRQ_ENOMEM:     G. (DOM0) Low on heap memory
+ * - VIRQ_XENPMU:     V.  PMC interrupt
+ * - VIRQ_ARCH_0
+ * - VIRQ_ARCH_1
+ * - VIRQ_ARCH_2
+ * - VIRQ_ARCH_3
+ * - VIRQ_ARCH_4
+ * - VIRQ_ARCH_5
+ * - VIRQ_ARCH_6
+ * - VIRQ_ARCH_7
  */
-/* ` enum virq { */
-#define VIRQ_TIMER      0  /* V. Timebase update, and/or requested timeout.  */
-#define VIRQ_DEBUG      1  /* V. Request guest to dump debug info.           */
-#define VIRQ_CONSOLE    2  /* G. (DOM0) Bytes received on emergency console. */
-#define VIRQ_DOM_EXC    3  /* G. (DOM0) Exceptional event for some domain.   */
-#define VIRQ_TBUF       4  /* G. (DOM0) Trace buffer has records available.  */
-#define VIRQ_DEBUGGER   6  /* G. (DOM0) A domain has paused for debugging.   */
-#define VIRQ_XENOPROF   7  /* V. XenOprofile interrupt: new sample available */
-#define VIRQ_CON_RING   8  /* G. (DOM0) Bytes received on console            */
-#define VIRQ_PCPU_STATE 9  /* G. (DOM0) PCPU state changed                   */
-#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occurred          */
-#define VIRQ_ARGO       11 /* G. Argo interdomain message notification       */
-#define VIRQ_ENOMEM     12 /* G. (DOM0) Low on heap memory       */
-#define VIRQ_XENPMU     13 /* V.  PMC interrupt                              */
+#define VIRQ_TIMER      0
+#define VIRQ_DEBUG      1
+#define VIRQ_CONSOLE    2
+#define VIRQ_DOM_EXC    3
+#define VIRQ_TBUF       4
+#define VIRQ_DEBUGGER   6
+#define VIRQ_XENOPROF   7
+#define VIRQ_CON_RING   8
+#define VIRQ_PCPU_STATE 9
+#define VIRQ_MEM_EVENT  10
+#define VIRQ_ARGO       11
+#define VIRQ_ENOMEM     12
+#define VIRQ_XENPMU     13
 
 /* Architecture-specific VIRQ definitions. */
 #define VIRQ_ARCH_0    16
@@ -201,16 +268,17 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define VIRQ_ARCH_5    21
 #define VIRQ_ARCH_6    22
 #define VIRQ_ARCH_7    23
-/* ` } */
 
 #define NR_VIRQS       24
 
-/*
- * ` enum neg_errnoval
- * ` HYPERVISOR_mmu_update(const struct mmu_update reqs[],
- * `                       unsigned count, unsigned *done_out,
- * `                       unsigned foreigndom)
- * `
+/**
+ * DOC: HYPERVISOR_mmu_update
+ *
+ * enum neg_errnoval
+ * HYPERVISOR_mmu_update(const struct mmu_update reqs[],
+ *                       unsigned count, unsigned *done_out,
+ *                       unsigned foreigndom)
+ *
  * @reqs is an array of mmu_update_t structures ((ptr, val) pairs).
  * @count is the length of the above array.
  * @pdone is an output parameter indicating number of completed operations
@@ -222,8 +290,9 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
  *                     x == 0 => PFD == DOMID_SELF
  *                     x != 0 => PFD == x - 1
  *
+ *
  * Sub-commands: ptr[1:0] specifies the appropriate MMU_* command.
- * -------------
+ *
  * ptr[1:0] == MMU_NORMAL_PT_UPDATE:
  * Updates an entry in a page table belonging to PFD. If updating an L1 table,
  * and the new table entry is valid/present, the mapped frame must belong to
@@ -354,16 +423,16 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define MMU_PT_UPDATE_NO_TRANSLATE 3 /* checked '*ptr = val'. ptr is MA.      */
                                      /* val never translated.                 */
 
-/*
- * MMU EXTENDED OPERATIONS
+/**
+ * DOC: MMU EXTENDED OPERATIONS
  *
- * ` enum neg_errnoval
- * ` HYPERVISOR_mmuext_op(mmuext_op_t uops[],
- * `                      unsigned int count,
- * `                      unsigned int *pdone,
- * `                      unsigned int foreigndom)
- */
-/* HYPERVISOR_mmuext_op() accepts a list of mmuext_op structures.
+ * enum neg_errnoval
+ * HYPERVISOR_mmuext_op(mmuext_op_t uops[],
+ *                      unsigned int count,
+ *                      unsigned int *pdone,
+ *                      unsigned int foreigndom)
+ *
+ * HYPERVISOR_mmuext_op() accepts a list of mmuext_op structures.
  * A foreigndom (FD) can be specified (or DOMID_SELF for none).
  * Where the FD has some effect, it is described below.
  *
@@ -418,7 +487,6 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
  * cmd: MMUEXT_[UN]MARK_SUPER
  * mfn: Machine frame number of head of superpage to be [un]marked.
  */
-/* ` enum mmuext_cmd { */
 #define MMUEXT_PIN_L1_TABLE      0
 #define MMUEXT_PIN_L2_TABLE      1
 #define MMUEXT_PIN_L3_TABLE      2
@@ -439,7 +507,6 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define MMUEXT_FLUSH_CACHE_GLOBAL 18
 #define MMUEXT_MARK_SUPER       19
 #define MMUEXT_UNMARK_SUPER     20
-/* ` } */
 
 #ifndef __ASSEMBLY__
 struct mmuext_op {
@@ -468,24 +535,25 @@ typedef struct mmuext_op mmuext_op_t;
 DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 #endif
 
-/*
- * ` enum neg_errnoval
- * ` HYPERVISOR_update_va_mapping(unsigned long va, u64 val,
- * `                              enum uvm_flags flags)
- * `
- * ` enum neg_errnoval
- * ` HYPERVISOR_update_va_mapping_otherdomain(unsigned long va, u64 val,
- * `                                          enum uvm_flags flags,
- * `                                          domid_t domid)
- * `
- * ` @va: The virtual address whose mapping we want to change
- * ` @val: The new page table entry, must contain a machine address
- * ` @flags: Control TLB flushes
+/**
+ * DOC: HYPERVISOR_update_va_mapping
+ *
+ * enum neg_errnoval
+ * HYPERVISOR_update_va_mapping(unsigned long va, u64 val,
+ *                              enum uvm_flags flags)
+ *
+ * enum neg_errnoval
+ * HYPERVISOR_update_va_mapping_otherdomain(unsigned long va, u64 val,
+ *                                          enum uvm_flags flags,
+ *                                          domid_t domid)
+ *
+ * @va: The virtual address whose mapping we want to change
+ * @val: The new page table entry, must contain a machine address
+ * @flags: Control TLB flushes
  */
 /* These are passed as 'flags' to update_va_mapping. They can be ORed. */
 /* When specifying UVMF_MULTI, also OR in a pointer to a CPU bitmap.   */
 /* UVMF_LOCAL is merely UVMF_MULTI with a NULL bitmap pointer.         */
-/* ` enum uvm_flags { */
 #define UVMF_NONE           (xen_mk_ulong(0)<<0) /* No flushing at all.   */
 #define UVMF_TLB_FLUSH      (xen_mk_ulong(1)<<0) /* Flush entire TLB(s).  */
 #define UVMF_INVLPG         (xen_mk_ulong(2)<<0) /* Flush only one entry. */
@@ -493,13 +561,14 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 #define UVMF_MULTI          (xen_mk_ulong(0)<<2) /* Flush subset of TLBs. */
 #define UVMF_LOCAL          (xen_mk_ulong(0)<<2) /* Flush local TLB.      */
 #define UVMF_ALL            (xen_mk_ulong(1)<<2) /* Flush all TLBs.       */
-/* ` } */
 
-/*
- * ` int
- * ` HYPERVISOR_console_io(unsigned int cmd,
- * `                       unsigned int count,
- * `                       char buffer[]);
+/**
+ * DOC: HYPERVISOR_console_io
+ *
+ * int
+ * HYPERVISOR_console_io(unsigned int cmd,
+ *                       unsigned int count,
+ *                       char buffer[]);
  *
  * @cmd: Command (see below)
  * @count: Size of the buffer to read/write
@@ -522,29 +591,43 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 #define CONSOLEIO_write         0
 #define CONSOLEIO_read          1
 
-/*
+/**
+ * DOC: VMASST_CMD_enable and VMASST_CMD_disable
  * Commands to HYPERVISOR_vm_assist().
  */
 #define VMASST_CMD_enable                0
 #define VMASST_CMD_disable               1
 
-/* x86/32 guests: simulate full 4GB segment limits. */
+/**
+ * DOC: VMASST_TYPE_4gb_segments
+ * x86/32 guests: simulate full 4GB segment limits.
+ */
 #define VMASST_TYPE_4gb_segments         0
 
-/* x86/32 guests: trap (vector 15) whenever above vmassist is used. */
+/**
+ * DOC: VMASST_TYPE_4gb_segments_notify
+ * x86/32 guests: trap (vector 15) whenever above vmassist is used.
+ */
 #define VMASST_TYPE_4gb_segments_notify  1
 
-/*
+/**
+ * DOC: VMASST_TYPE_writable_pagetables
+ *
  * x86 guests: support writes to bottom-level PTEs.
  * NB1. Page-directory entries cannot be written.
  * NB2. Guest must continue to remove all writable mappings of PTEs.
  */
 #define VMASST_TYPE_writable_pagetables  2
 
-/* x86/PAE guests: support PDPTs above 4GB. */
+/**
+ * DOC: VMASST_TYPE_pae_extended_cr3
+ * x86/PAE guests: support PDPTs above 4GB.
+ */
 #define VMASST_TYPE_pae_extended_cr3     3
 
-/*
+/**
+ * DOC: VMASST_TYPE_architectural_iopl
+ *
  * x86 guests: Sane behaviour for virtual iopl
  *  - virtual iopl updated from do_iret() hypercalls.
  *  - virtual iopl reported in bounce frames.
@@ -552,14 +635,18 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
  */
 #define VMASST_TYPE_architectural_iopl   4
 
-/*
+/**
+ * DOC: VMASST_TYPE_runstate_update_flag
+ *
  * All guests: activate update indicator in vcpu_runstate_info
  * Enable setting the XEN_RUNSTATE_UPDATE flag in guest memory mapped
  * vcpu_runstate_info during updates of the runstate information.
  */
 #define VMASST_TYPE_runstate_update_flag 5
 
-/*
+/**
+ * DOC: VMASST_TYPE_m2p_strict
+ *
  * x86/64 guests: strictly hide M2P from user mode.
  * This allows the guest to control respective hypervisor behavior:
  * - when not set, L4 tables get created with the respective slot blank,
@@ -578,10 +665,15 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 /* Domain ids >= DOMID_FIRST_RESERVED cannot be used for ordinary domains. */
 #define DOMID_FIRST_RESERVED xen_mk_uint(0x7FF0)
 
-/* DOMID_SELF is used in certain contexts to refer to oneself. */
+/**
+ * DOC: DOMID_SELF
+ * DOMID_SELF is used in certain contexts to refer to oneself.
+ */
 #define DOMID_SELF           xen_mk_uint(0x7FF0)
 
-/*
+/**
+ * DOC: DOMID_IO
+ *
  * DOMID_IO is used to restrict page-table updates to mapping I/O memory.
  * Although no Foreign Domain need be specified to map I/O pages, DOMID_IO
  * is useful to ensure that no mappings to the OS's own heap are accidentally
@@ -594,7 +686,9 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
  */
 #define DOMID_IO             xen_mk_uint(0x7FF1)
 
-/*
+/**
+ * DOC: DOMID_XEN
+ *
  * DOMID_XEN is used to allow privileged domains to map restricted parts of
  * Xen's heap space (e.g., the machine_to_phys table).
  * This only makes sense as
@@ -605,38 +699,55 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
  */
 #define DOMID_XEN            xen_mk_uint(0x7FF2)
 
-/*
- * DOMID_COW is used as the owner of sharable pages */
+/**
+ * DOC: DOMID_COW
+ * DOMID_COW is used as the owner of sharable pages
+ */
 #define DOMID_COW            xen_mk_uint(0x7FF3)
 
-/* DOMID_INVALID is used to identify pages with unknown owner. */
+/**
+ * DOC: DOMID_INVALID
+ * DOMID_INVALID is used to identify pages with unknown owner.
+ */
 #define DOMID_INVALID        xen_mk_uint(0x7FF4)
 
-/* Idle domain. */
+/**
+ * DOC: DOMID_IDLE
+ * Idle domain.
+ */
 #define DOMID_IDLE           xen_mk_uint(0x7FFF)
 
-/* Mask for valid domain id values */
+/**
+ * DOC: DOMID_MASK
+ * Mask for valid domain id values
+ */
 #define DOMID_MASK           xen_mk_uint(0x7FFF)
 
 #ifndef __ASSEMBLY__
 
 typedef uint16_t domid_t;
 
-/*
+/**
+ * struct mmu_update - HYPERVISOR_mmu_update
+ *
  * Send an array of these to HYPERVISOR_mmu_update().
  * NB. The fields are natural pointer/address size for this architecture.
  */
 struct mmu_update {
-    uint64_t ptr;       /* Machine address of PTE. */
-    uint64_t val;       /* New contents of PTE.    */
+    /** @ptr: Machine address of PTE. */
+    uint64_t ptr;
+    /** @val: New contents of PTE. */
+    uint64_t val;
 };
 typedef struct mmu_update mmu_update_t;
 DEFINE_XEN_GUEST_HANDLE(mmu_update_t);
 
-/*
- * ` enum neg_errnoval
- * ` HYPERVISOR_multicall(multicall_entry_t call_list[],
- * `                      uint32_t nr_calls);
+/**
+ * struct multicall_entry - HYPERVISOR_multicall
+ *
+ * enum neg_errnoval
+ * HYPERVISOR_multicall(multicall_entry_t call_list[],
+ *                      uint32_t nr_calls);
  *
  * NB. The fields are logically the natural register size for this
  * architecture. In cases where xen_ulong_t is larger than this then
@@ -650,34 +761,40 @@ typedef struct multicall_entry multicall_entry_t;
 DEFINE_XEN_GUEST_HANDLE(multicall_entry_t);
 
 #if __XEN_INTERFACE_VERSION__ < 0x00040400
-/*
+/**
+ * DOC: NR_EVENT_CHANNELS
+ *
  * Event channel endpoints per domain (when using the 2-level ABI):
  *  1024 if a long is 32 bits; 4096 if a long is 64 bits.
  */
 #define NR_EVENT_CHANNELS EVTCHN_2L_NR_CHANNELS
 #endif
 
+/**
+ * struct vcpu_time_info
+ *
+ * Updates to the following values are preceded and followed by an
+ * increment of 'version'. The guest can therefore detect updates by
+ * looking for changes to 'version'. If the least-significant bit of
+ * the version number is set then an update is in progress and the guest
+ * must wait to read a consistent set of values.
+ * The correct way to interact with the version number is similar to
+ * Linux's seqlock: see the implementations of read_seqbegin/read_seqretry.
+ *
+ * Current system time:
+ *   system_time +
+ *   ((((tsc - tsc_timestamp) << tsc_shift) * tsc_to_system_mul) >> 32)
+ * CPU frequency (Hz):
+ *   ((10^9 << 32) / tsc_to_system_mul) >> tsc_shift
+ */
 struct vcpu_time_info {
-    /*
-     * Updates to the following values are preceded and followed by an
-     * increment of 'version'. The guest can therefore detect updates by
-     * looking for changes to 'version'. If the least-significant bit of
-     * the version number is set then an update is in progress and the guest
-     * must wait to read a consistent set of values.
-     * The correct way to interact with the version number is similar to
-     * Linux's seqlock: see the implementations of read_seqbegin/read_seqretry.
-     */
     uint32_t version;
     uint32_t pad0;
-    uint64_t tsc_timestamp;   /* TSC at last update of time vals.  */
-    uint64_t system_time;     /* Time, in nanosecs, since boot.    */
-    /*
-     * Current system time:
-     *   system_time +
-     *   ((((tsc - tsc_timestamp) << tsc_shift) * tsc_to_system_mul) >> 32)
-     * CPU frequency (Hz):
-     *   ((10^9 << 32) / tsc_to_system_mul) >> tsc_shift
-     */
+    /** @tsc_timestamp: TSC at last update of time vals. */
+    uint64_t tsc_timestamp;
+    /** @system_time: Time, in nanosecs, since boot. */
+    uint64_t system_time;
+
     uint32_t tsc_to_system_mul;
     int8_t   tsc_shift;
 #if __XEN_INTERFACE_VERSION__ > 0x040600
@@ -692,18 +809,23 @@ typedef struct vcpu_time_info vcpu_time_info_t;
 #define XEN_PVCLOCK_TSC_STABLE_BIT     (1 << 0)
 #define XEN_PVCLOCK_GUEST_STOPPED      (1 << 1)
 
+/**
+ * struct vcpu_info
+ */
 struct vcpu_info {
-    /*
-     * 'evtchn_upcall_pending' is written non-zero by Xen to indicate
-     * a pending notification for a particular VCPU. It is then cleared
-     * by the guest OS /before/ checking for pending work, thus avoiding
-     * a set-and-check race. Note that the mask is only accessed by Xen
-     * on the CPU that is currently hosting the VCPU. This means that the
-     * pending and mask flags can be updated by the guest without special
-     * synchronisation (i.e., no need for the x86 LOCK prefix).
-     * This may seem suboptimal because if the pending flag is set by
-     * a different CPU then an IPI may be scheduled even when the mask
-     * is set. However, note:
+    /**
+     * @evtchn_upcall_pending:
+     *
+     * it is written non-zero by Xen to indicate a pending notification
+     * for a particular VCPU. It is then cleared by the guest OS
+     * /before/ checking for pending work, thus avoiding a set-and-check
+     * race. Note that the mask is only accessed by Xen on the CPU that
+     * is currently hosting the VCPU. This means that the pending and
+     * mask flags can be updated by the guest without special
+     * synchronisation (i.e., no need for the x86 LOCK prefix).  This
+     * may seem suboptimal because if the pending flag is set by a
+     * different CPU then an IPI may be scheduled even when the mask is
+     * set. However, note:
      *  1. The task of 'interrupt holdoff' is covered by the per-event-
      *     channel mask bits. A 'noisy' event that is continually being
      *     triggered can be masked at source at this very precise
@@ -732,61 +854,69 @@ struct vcpu_info {
 typedef struct vcpu_info vcpu_info_t;
 #endif
 
-/*
- * `incontents 200 startofday_shared Start-of-day shared data structure
+/**
+ * struct shared_info - Start-of-day shared data structure
+ *
  * Xen/kernel shared data -- pointer provided in start_info.
  *
  * This structure is defined to be both smaller than a page, and the
  * only data on the shared page, but may vary in actual size even within
  * compatible Xen versions; guests should not rely on the size
  * of this structure remaining constant.
+ *
+ * A domain can create "event channels" on which it can send and receive
+ * asynchronous event notifications. There are three classes of event that
+ * are delivered by this mechanism:
+ *  1. Bi-directional inter- and intra-domain connections. Domains must
+ *     arrange out-of-band to set up a connection (usually by allocating
+ *     an unbound 'listener' port and avertising that via a storage service
+ *     such as xenstore).
+ *  2. Physical interrupts. A domain with suitable hardware-access
+ *     privileges can bind an event-channel port to a physical interrupt
+ *     source.
+ *  3. Virtual interrupts ('events'). A domain can bind an event-channel
+ *     port to a virtual interrupt source, such as the virtual-timer
+ *     device or the emergency console.
+ *
+ *
+ * @evtchn_pending: pending notifications
+ * @evtchn_mask: mask/unmask notifications
+ *
+ * Event channels are addressed by a "port index". Each channel is
+ * associated with two bits of information:
+ *  1. PENDING -- notifies the domain that there is a pending notification
+ *     to be processed. This bit is cleared by the guest.
+ *  2. MASK -- if this bit is clear then a 0->1 transition of PENDING
+ *     will cause an asynchronous upcall to be scheduled. This bit is only
+ *     updated by the guest. It is read-only within Xen. If a channel
+ *     becomes pending while the channel is masked then the 'edge' is lost
+ *     (i.e., when the channel is unmasked, the guest must manually handle
+ *     pending notifications as no upcall will be scheduled by Xen).
+ *
+ * To expedite scanning of pending notifications, any 0->1 pending
+ * transition on an unmasked channel causes a corresponding bit in a
+ * per-vcpu selector word to be set. Each bit in the selector covers a
+ * 'C long' in the PENDING bitfield array.
+ *
+ *
+ * @wc_version: wallclock time version
+ * @wc_sec: secs offset from Unix epoc
+ * @wc_nsec: nsecs offset from Unix epoc
+ *
+ * Wallclock time: updated by control software or RTC emulation.
+ * Guests should base their gettimeofday() syscall on this
+ * wallclock-base value.
+ * The values of wc_sec and wc_nsec are offsets from the Unix epoch
+ * adjusted by the domain's 'time offset' (in seconds) as set either
+ * by XEN_DOMCTL_settimeoffset, or adjusted via a guest write to the
+ * emulated RTC.
  */
 struct shared_info {
     struct vcpu_info vcpu_info[XEN_LEGACY_MAX_VCPUS];
 
-    /*
-     * A domain can create "event channels" on which it can send and receive
-     * asynchronous event notifications. There are three classes of event that
-     * are delivered by this mechanism:
-     *  1. Bi-directional inter- and intra-domain connections. Domains must
-     *     arrange out-of-band to set up a connection (usually by allocating
-     *     an unbound 'listener' port and avertising that via a storage service
-     *     such as xenstore).
-     *  2. Physical interrupts. A domain with suitable hardware-access
-     *     privileges can bind an event-channel port to a physical interrupt
-     *     source.
-     *  3. Virtual interrupts ('events'). A domain can bind an event-channel
-     *     port to a virtual interrupt source, such as the virtual-timer
-     *     device or the emergency console.
-     *
-     * Event channels are addressed by a "port index". Each channel is
-     * associated with two bits of information:
-     *  1. PENDING -- notifies the domain that there is a pending notification
-     *     to be processed. This bit is cleared by the guest.
-     *  2. MASK -- if this bit is clear then a 0->1 transition of PENDING
-     *     will cause an asynchronous upcall to be scheduled. This bit is only
-     *     updated by the guest. It is read-only within Xen. If a channel
-     *     becomes pending while the channel is masked then the 'edge' is lost
-     *     (i.e., when the channel is unmasked, the guest must manually handle
-     *     pending notifications as no upcall will be scheduled by Xen).
-     *
-     * To expedite scanning of pending notifications, any 0->1 pending
-     * transition on an unmasked channel causes a corresponding bit in a
-     * per-vcpu selector word to be set. Each bit in the selector covers a
-     * 'C long' in the PENDING bitfield array.
-     */
     xen_ulong_t evtchn_pending[sizeof(xen_ulong_t) * 8];
     xen_ulong_t evtchn_mask[sizeof(xen_ulong_t) * 8];
 
-    /*
-     * Wallclock time: updated by control software or RTC emulation.
-     * Guests should base their gettimeofday() syscall on this
-     * wallclock-base value.
-     * The values of wc_sec and wc_nsec are offsets from the Unix epoch
-     * adjusted by the domain's 'time offset' (in seconds) as set either
-     * by XEN_DOMCTL_settimeoffset, or adjusted via a guest write to the
-     * emulated RTC.
-     */
     uint32_t wc_version;      /* Version counter: see vcpu_time_info_t. */
     uint32_t wc_sec;
     uint32_t wc_nsec;
@@ -804,8 +934,9 @@ struct shared_info {
 typedef struct shared_info shared_info_t;
 #endif
 
-/*
- * `incontents 200 startofday Start-of-day memory layout
+#ifdef XEN_HAVE_PV_GUEST_ENTRY
+/**
+ * struct start_info - Start-of-day memory layout
  *
  *  1. The domain is started within contiguous virtual-memory region.
  *  2. The contiguous region ends on an aligned 4MB boundary.
@@ -841,38 +972,64 @@ typedef struct shared_info shared_info_t;
  * 32-bit and runs under a 64-bit hypervisor should _NOT_ use two of the
  * pages preceding pt_base and mark them as reserved/unused.
  */
-#ifdef XEN_HAVE_PV_GUEST_ENTRY
 struct start_info {
     /* THE FOLLOWING ARE FILLED IN BOTH ON INITIAL BOOT AND ON RESUME.    */
-    char magic[32];             /* "xen-<version>-<platform>".            */
-    unsigned long nr_pages;     /* Total pages allocated to this domain.  */
-    unsigned long shared_info;  /* MACHINE address of shared info struct. */
-    uint32_t flags;             /* SIF_xxx flags.                         */
-    xen_pfn_t store_mfn;        /* MACHINE page number of shared page.    */
-    uint32_t store_evtchn;      /* Event channel for store communication. */
+    /** @magic: "xen-<version>-<platform>". */
+    char magic[32];
+    /** @nr_pages: Total pages allocated to this domain. */
+    unsigned long nr_pages;
+    /** @shared_info: MACHINE address of shared info struct. */
+    unsigned long shared_info;
+    /** flags: SIF_xxx flags. */
+    uint32_t flags;
+    /** @store_mfn: MACHINE page number of shared page. */
+    xen_pfn_t store_mfn;
+    /** @store_evtchn: Event channel for store communication. */
+    uint32_t store_evtchn;
     union {
         struct {
-            xen_pfn_t mfn;      /* MACHINE page number of console page.   */
-            uint32_t  evtchn;   /* Event channel for console page.        */
+            /** @console.domU.mfn: MACHINE page number of console page. */
+            xen_pfn_t mfn;
+            /** @console.domU.evtchn: Event channel for console page. */
+            uint32_t evtchn;
         } domU;
         struct {
-            uint32_t info_off;  /* Offset of console_info struct.         */
-            uint32_t info_size; /* Size of console_info struct from start.*/
+            /** @console.dom0.info_off: Offset of console_info struct. */
+            uint32_t info_off;
+            /** @info_size: Size of console_info struct from start. */
+            uint32_t info_size;
         } dom0;
     } console;
     /* THE FOLLOWING ARE ONLY FILLED IN ON INITIAL BOOT (NOT RESUME).     */
-    unsigned long pt_base;      /* VIRTUAL address of page directory.     */
-    unsigned long nr_pt_frames; /* Number of bootstrap p.t. frames.       */
-    unsigned long mfn_list;     /* VIRTUAL address of page-frame list.    */
-    unsigned long mod_start;    /* VIRTUAL address of pre-loaded module   */
-                                /* (PFN of pre-loaded module if           */
-                                /*  SIF_MOD_START_PFN set in flags).      */
-    unsigned long mod_len;      /* Size (bytes) of pre-loaded module.     */
+    /** @pt_base: VIRTUAL address of page directory. */
+    unsigned long pt_base;
+    /** @nr_pt_frames: Number of bootstrap p.t. frames. */
+    unsigned long nr_pt_frames;
+    /** @mfn_list: VIRTUAL address of page-frame list. */
+    unsigned long mfn_list;
+    /**
+     * @mod_start: VIRTUAL address of pre-loaded module.
+     * (PFN of pre-loaded module if SIF_MOD_START_PFN set in flags).
+     */
+    unsigned long mod_start;
+    /** @mod_len: Size (bytes) of pre-loaded module. */
+    unsigned long mod_len;
 #define MAX_GUEST_CMDLINE 1024
     int8_t cmd_line[MAX_GUEST_CMDLINE];
-    /* The pfn range here covers both page table and p->m table frames.   */
-    unsigned long first_p2m_pfn;/* 1st pfn forming initial P->M table.    */
-    unsigned long nr_p2m_frames;/* # of pfns forming initial P->M table.  */
+    /**
+     * @first_p2m_pfn:
+     *
+     * 1st pfn forming initial P->M table from the pfn range that covers
+     * both page table and p->m table frames.
+     */
+    unsigned long first_p2m_pfn;
+    /**
+     * @nr_p2m_frames:
+     *
+     * # of pfns forming initial P->M table from the pfn range that
+     * covers both page table and p->m table frames.
+     */
+    unsigned long nr_p2m_frames;
 };
 typedef struct start_info start_info_t;
 
@@ -883,16 +1040,29 @@ typedef struct start_info start_info_t;
 #endif
 #endif /* XEN_HAVE_PV_GUEST_ENTRY */
 
-/* These flags are passed in the 'flags' field of start_info_t. */
-#define SIF_PRIVILEGED    (1<<0)  /* Is the domain privileged? */
-#define SIF_INITDOMAIN    (1<<1)  /* Is this the initial control domain? */
-#define SIF_MULTIBOOT_MOD (1<<2)  /* Is mod_start a multiboot module? */
-#define SIF_MOD_START_PFN (1<<3)  /* Is mod_start a PFN? */
-#define SIF_VIRT_P2M_4TOOLS (1<<4) /* Do Xen tools understand a virt. mapped */
-                                   /* P->M making the 3 level tree obsolete? */
-#define SIF_PM_MASK       (0xFF<<8) /* reserve 1 byte for xen-pm options */
-
-/*
+/**
+ * DOC: SIF_*
+ *
+ * These flags are passed in the 'flags' field of start_info_t.
+ *
+ * - SIF_PRIVILEGED:       Is the domain privileged?
+ * - SIF_INITDOMAIN:       Is this the initial control domain?
+ * - SIF_MULTIBOOT_MOD:    Is mod_start a multiboot module?
+ * - SIF_MOD_START_PFN:    Is mod_start a PFN?
+ * - SIF_VIRT_P2M_4TOOLS:  Do Xen tools understand a virt. mapped
+ *                         P->M making the 3 level tree obsolete?
+ * - SIF_PM_MASK:          reserve 1 byte for xen-pm options
+ */
+#define SIF_PRIVILEGED    (1<<0)
+#define SIF_INITDOMAIN    (1<<1)
+#define SIF_MULTIBOOT_MOD (1<<2)
+#define SIF_MOD_START_PFN (1<<3)
+#define SIF_VIRT_P2M_4TOOLS (1<<4)
+#define SIF_PM_MASK       (0xFF<<8)
+
+/**
+ * struct xen_multiboot_mod_list
+ *
  * A multiboot module is a package containing modules very similar to a
  * multiboot module array. The only differences are:
  * - the array of module descriptors is by convention simply at the beginning
@@ -908,13 +1078,13 @@ typedef struct start_info start_info_t;
  */
 struct xen_multiboot_mod_list
 {
-    /* Address of first byte of the module */
+    /** @mod_start: Address of first byte of the module */
     uint32_t mod_start;
-    /* Address of last byte of the module (inclusive) */
+    /** @mod_end: Address of last byte of the module (inclusive) */
     uint32_t mod_end;
-    /* Address of zero-terminated command line */
+    /** @cmdline: Address of zero-terminated command line */
     uint32_t cmdline;
-    /* Unused, must be zero */
+    /** @pad: Unused, must be zero */
     uint32_t pad;
 };
 /*
@@ -984,7 +1154,9 @@ typedef struct {
     uint8_t a[16];
 } xen_uuid_t;
 
-/*
+/**
+ * DOC: XEN_DEFINE_UUID
+ *
  * XEN_DEFINE_UUID(0x00112233, 0x4455, 0x6677, 0x8899,
  *                 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff)
  * will construct UUID 00112233-4455-6677-8899-aabbccddeeff presented as
-- 
2.17.1


