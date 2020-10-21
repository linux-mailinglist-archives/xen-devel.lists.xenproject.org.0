Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DDD2945C0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 02:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9804.25947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1YV-0000AF-07; Wed, 21 Oct 2020 00:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9804.25947; Wed, 21 Oct 2020 00:00:38 +0000
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
	id 1kV1YU-00008Z-Ca; Wed, 21 Oct 2020 00:00:38 +0000
Received: by outflank-mailman (input) for mailman id 9804;
 Wed, 21 Oct 2020 00:00:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kV1YR-0007y0-Ob
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb288b8f-34a9-4214-9d31-511fb1d9151a;
 Wed, 21 Oct 2020 00:00:19 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93AE12245F;
 Wed, 21 Oct 2020 00:00:18 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kV1YR-0007y0-Ob
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:35 +0000
X-Inumbo-ID: fb288b8f-34a9-4214-9d31-511fb1d9151a
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fb288b8f-34a9-4214-9d31-511fb1d9151a;
	Wed, 21 Oct 2020 00:00:19 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 93AE12245F;
	Wed, 21 Oct 2020 00:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603238419;
	bh=iUURwQfkG0gQB7i5lmO2e9p5o2Tt6lx6q08IvoYLuag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nx9ZVDaZu0Xa3neqPnZT1SFokf/7Ub9rnKqc9NsllrYgJqSS9s2sBgJSxWkfafhHN
	 lZaPoTb8Ye3vRIK9PTRInQHLKLcOmmtoY0MNmEb/l50UTLDi1J+iOlhB4iAULBFbxl
	 TUKsWWnbMWFmVRRgckFX764VyAzsjxnHpbVL+bjs=
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
Subject: [PATCH v2 10/14] kernel-doc: public/vcpu.h
Date: Tue, 20 Oct 2020 17:00:07 -0700
Message-Id: <20201021000011.15351-10-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/vcpu.h | 180 ++++++++++++++++++++++++++++----------
 1 file changed, 136 insertions(+), 44 deletions(-)

diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index 3623af932f..e50471e2b2 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -29,15 +29,20 @@
 
 #include "xen.h"
 
-/*
+/**
+ * DOC: VCPUOP hypercall
+ *
  * Prototype for this hypercall is:
  *  long vcpu_op(int cmd, unsigned int vcpuid, void *extra_args)
- * @cmd        == VCPUOP_??? (VCPU operation).
- * @vcpuid     == VCPU to operate on.
- * @extra_args == Operation-specific extra arguments (NULL if none).
+ *
+ * - @cmd        == VCPUOP_??? (VCPU operation).
+ * - @vcpuid     == VCPU to operate on.
+ * - @extra_args == Operation-specific extra arguments (NULL if none).
  */
 
-/*
+/**
+ * DOC: VCPUOP_initialise
+ *
  * Initialise a VCPU. Each VCPU can be initialised only once. A
  * newly-initialised VCPU will not run until it is brought up by VCPUOP_up.
  *
@@ -48,13 +53,17 @@
  */
 #define VCPUOP_initialise            0
 
-/*
+/**
+ * DOC: VCPUOP_up
+ *
  * Bring up a VCPU. This makes the VCPU runnable. This operation will fail
  * if the VCPU has not been initialised (VCPUOP_initialise).
  */
 #define VCPUOP_up                    1
 
-/*
+/**
+ * DOC: VCPUOP_down
+ *
  * Bring down a VCPU (i.e., make it non-runnable).
  * There are a few caveats that callers should observe:
  *  1. This operation may return, and VCPU_is_up may return false, before the
@@ -70,26 +79,36 @@
  */
 #define VCPUOP_down                  2
 
-/* Returns 1 if the given VCPU is up. */
+/**
+ * DOC: VCPUOP_is_up
+ * Returns 1 if the given VCPU is up.
+ */
 #define VCPUOP_is_up                 3
 
-/*
+#define VCPUOP_get_runstate_info     4
+/**
+ * struct vcpu_runstate_info - VCPUOP_get_runstate_info
+ *
  * Return information about the state and running time of a VCPU.
  * @extra_arg == pointer to vcpu_runstate_info structure.
  */
-#define VCPUOP_get_runstate_info     4
 struct vcpu_runstate_info {
-    /* VCPU's current state (RUNSTATE_*). */
+    /** @state: VCPU's current state (RUNSTATE_*). */
     int      state;
-    /* When was current state entered (system time, ns)? */
-    uint64_t state_entry_time;
-    /*
-     * Update indicator set in state_entry_time:
+    /**
+     * @state_entry_time:
+     *
+     * When was current state entered (system time, ns)?
+     *
+     * XEN_RUNSTATE_UPDATE is the update indicator in state_entry_time:
      * When activated via VMASST_TYPE_runstate_update_flag, set during
      * updates in guest memory mapped copy of vcpu_runstate_info.
      */
 #define XEN_RUNSTATE_UPDATE          (xen_mk_ullong(1) << 63)
-    /*
+    uint64_t state_entry_time;
+    /**
+     * @time:
+     *
      * Time spent in each RUNSTATE_* (ns). The sum of these times is
      * guaranteed not to drift from system time.
      */
@@ -98,16 +117,27 @@ struct vcpu_runstate_info {
 typedef struct vcpu_runstate_info vcpu_runstate_info_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_t);
 
-/* VCPU is currently running on a physical CPU. */
+/**
+ * DOC: RUNSTATE_running
+ * VCPU is currently running on a physical CPU.
+ */
 #define RUNSTATE_running  0
 
-/* VCPU is runnable, but not currently scheduled on any physical CPU. */
+/**
+ * DOC: RUNSTATE_runnable
+ * VCPU is runnable, but not currently scheduled on any physical CPU.
+ */
 #define RUNSTATE_runnable 1
 
-/* VCPU is blocked (a.k.a. idle). It is therefore not runnable. */
+/**
+ * DOC: RUNSTATE_blocked
+ * VCPU is blocked (a.k.a. idle). It is therefore not runnable.
+ */
 #define RUNSTATE_blocked  2
 
-/*
+/**
+ * DOC: RUNSTATE_offline
+ *
  * VCPU is not runnable, but it is not blocked.
  * This is a 'catch all' state for things like hotplug and pauses by the
  * system administrator (or for critical sections in the hypervisor).
@@ -115,7 +145,10 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_t);
  */
 #define RUNSTATE_offline  3
 
-/*
+#define VCPUOP_register_runstate_memory_area 5
+/**
+ * struct vcpu_register_runstate_memory_area - VCPUOP_register_runstate_memory_area
+ *
  * Register a shared memory area from which the guest may obtain its own
  * runstate information without needing to execute a hypercall.
  * Notes:
@@ -127,9 +160,9 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_t);
  *     runstate.state will always be RUNSTATE_running and
  *     runstate.state_entry_time will indicate the system time at which the
  *     VCPU was last scheduled to run.
+ *
  * @extra_arg == pointer to vcpu_register_runstate_memory_area structure.
  */
-#define VCPUOP_register_runstate_memory_area 5
 struct vcpu_register_runstate_memory_area {
     union {
         XEN_GUEST_HANDLE(vcpu_runstate_info_t) h;
@@ -140,38 +173,74 @@ struct vcpu_register_runstate_memory_area {
 typedef struct vcpu_register_runstate_memory_area vcpu_register_runstate_memory_area_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_register_runstate_memory_area_t);
 
-/*
- * Set or stop a VCPU's periodic timer. Every VCPU has one periodic timer
- * which can be set via these commands. Periods smaller than one millisecond
- * may not be supported.
+/**
+ * DOC: VCPUOP_set_periodic_timer
+ *
+ * Set a VCPU's periodic timer. Every VCPU has one periodic timer which
+ * can be set via this command. Periods smaller than one millisecond may
+ * not be supported.
+ *
+ * @arg == vcpu_set_periodic_timer_t
+ */
+#define VCPUOP_set_periodic_timer    6
+/**
+ * DOC: VCPUOP_stop_periodic_timer
+ *
+ * Stop a VCPU's periodic timer.
+ *
+ * @arg == NULL
+ */
+#define VCPUOP_stop_periodic_timer   7
+/**
+ * struct vcpu_set_periodic_timer
  */
-#define VCPUOP_set_periodic_timer    6 /* arg == vcpu_set_periodic_timer_t */
-#define VCPUOP_stop_periodic_timer   7 /* arg == NULL */
 struct vcpu_set_periodic_timer {
     uint64_t period_ns;
 };
 typedef struct vcpu_set_periodic_timer vcpu_set_periodic_timer_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_set_periodic_timer_t);
 
-/*
- * Set or stop a VCPU's single-shot timer. Every VCPU has one single-shot
- * timer which can be set via these commands.
+/**
+ * DOC: VCPUOP_set_singleshot_timer
+ *
+ * Set a VCPU's single-shot timer. Every VCPU has one single-shot timer
+ * which can be set via this command.
+ *
+ * @arg == vcpu_set_singleshot_timer_t
+ */
+#define VCPUOP_set_singleshot_timer  8
+/**
+ * DOC: VCPUOP_stop_singleshot_timer
+ *
+ * Stop a VCPU's single-shot timer.
+ *
+ * arg == NULL
+ */
+#define VCPUOP_stop_singleshot_timer 9
+/**
+ * struct vcpu_set_singleshot_timer
  */
-#define VCPUOP_set_singleshot_timer  8 /* arg == vcpu_set_singleshot_timer_t */
-#define VCPUOP_stop_singleshot_timer 9 /* arg == NULL */
 struct vcpu_set_singleshot_timer {
-    uint64_t timeout_abs_ns;   /* Absolute system time value in nanoseconds. */
-    uint32_t flags;            /* VCPU_SSHOTTMR_??? */
+    /** @timeout_abs_ns: Absolute system time value in nanoseconds. */
+    uint64_t timeout_abs_ns;
+    /** @flags: VCPU_SSHOTTMR_??? */
+    uint32_t flags;
 };
 typedef struct vcpu_set_singleshot_timer vcpu_set_singleshot_timer_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_set_singleshot_timer_t);
 
-/* Flags to VCPUOP_set_singleshot_timer. */
- /* Require the timeout to be in the future (return -ETIME if it's passed). */
+/**
+ * DOC: flags to VCPUOP_set_singleshot_timer.
+ *
+ * VCPU_SSHOTTMR_future: Require the timeout to be in the future
+ *                       (return -ETIME if it's passed).
+ */
 #define _VCPU_SSHOTTMR_future (0)
 #define VCPU_SSHOTTMR_future  (1U << _VCPU_SSHOTTMR_future)
 
-/*
+/**
+ * DOC: VCPUOP_register_vcpu_info
+ *
  * Register a memory location in the guest address space for the
  * vcpu_info structure.  This allows the guest to place the vcpu_info
  * structure in a convenient place, such as in a per-cpu data area.
@@ -179,26 +248,44 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_set_singleshot_timer_t);
  * cross a page boundary.
  *
  * This may be called only once per vcpu.
+ *
+ * @arg == vcpu_register_vcpu_info_t
+ */
+#define VCPUOP_register_vcpu_info   10
+/**
+ * struct vcpu_register_vcpu_info - VCPUOP_register_vcpu_info
  */
-#define VCPUOP_register_vcpu_info   10  /* arg == vcpu_register_vcpu_info_t */
 struct vcpu_register_vcpu_info {
+    /** @mfn: mfn of page to place vcpu_info */
     uint64_t mfn;    /* mfn of page to place vcpu_info */
+    /** @offset: offset within page */
     uint32_t offset; /* offset within page */
-    uint32_t rsvd;   /* unused */
+    /** @rsvd: unused */
+    uint32_t rsvd;
 };
 typedef struct vcpu_register_vcpu_info vcpu_register_vcpu_info_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_register_vcpu_info_t);
 
-/* Send an NMI to the specified VCPU. @extra_arg == NULL. */
+/**
+ * DOC: VCPUOP_send_nmi
+ * Send an NMI to the specified VCPU. @extra_arg == NULL.
+ */
 #define VCPUOP_send_nmi             11
 
-/*
+/**
+ * DOC: VCPUOP_get_physid
+ *
  * Get the physical ID information for a pinned vcpu's underlying physical
  * processor.  The physical ID informmation is architecture-specific.
  * On x86: id[31:0]=apic_id, id[63:32]=acpi_id.
  * This command returns -EINVAL if it is not a valid operation for this VCPU.
+ *
+ * @arg == vcpu_get_physid_t
+ */
+#define VCPUOP_get_physid           12
+/**
+ * struct vcpu_get_physid
  */
-#define VCPUOP_get_physid           12 /* arg == vcpu_get_physid_t */
 struct vcpu_get_physid {
     uint64_t phys_id;
 };
@@ -207,7 +294,9 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_get_physid_t);
 #define xen_vcpu_physid_to_x86_apicid(physid) ((uint32_t)(physid))
 #define xen_vcpu_physid_to_x86_acpiid(physid) ((uint32_t)((physid) >> 32))
 
-/*
+/**
+ * DOC: VCPUOP_register_vcpu_time_memory_area
+ *
  * Register a memory location to get a secondary copy of the vcpu time
  * parameters.  The master copy still exists as part of the vcpu shared
  * memory area, and this secondary copy is updated whenever the master copy
@@ -225,6 +314,9 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_get_physid_t);
  */
 #define VCPUOP_register_vcpu_time_memory_area   13
 DEFINE_XEN_GUEST_HANDLE(vcpu_time_info_t);
+/**
+ * struct vcpu_register_time_memory_area
+ */
 struct vcpu_register_time_memory_area {
     union {
         XEN_GUEST_HANDLE(vcpu_time_info_t) h;
-- 
2.17.1


