Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3812945BE
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 02:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9796.25855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1YB-00081o-3W; Wed, 21 Oct 2020 00:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9796.25855; Wed, 21 Oct 2020 00:00:19 +0000
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
	id 1kV1YA-00081J-W9; Wed, 21 Oct 2020 00:00:18 +0000
Received: by outflank-mailman (input) for mailman id 9796;
 Wed, 21 Oct 2020 00:00:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kV1Y9-0007y0-3G
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60d0a6a7-e295-4694-9898-cc8ffab891de;
 Wed, 21 Oct 2020 00:00:16 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45FD02242F;
 Wed, 21 Oct 2020 00:00:15 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kV1Y9-0007y0-3G
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:17 +0000
X-Inumbo-ID: 60d0a6a7-e295-4694-9898-cc8ffab891de
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 60d0a6a7-e295-4694-9898-cc8ffab891de;
	Wed, 21 Oct 2020 00:00:16 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 45FD02242F;
	Wed, 21 Oct 2020 00:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603238415;
	bh=GUNzRumMSHbwvq+jjIpryPQ6OW8c5fAFKRBl0mSCZ28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A2hg26SnrRkSfiixGzeHd7k87Ufua+YcqZoi9h8pM4WTmc5pZrI7BxMqTC9ivMhqp
	 tuWvtkqpA2xbX3phw49dpbMnuSjx5uibCqqvezrJTn0BPT93Qr5rHAtSK0GPxzOgEb
	 zkw8MGJRLZna5KvY17zOXThQqkaUfqpk/hyohl0Y=
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
Subject: [PATCH v2 05/14] kernel-doc: public/features.h
Date: Tue, 20 Oct 2020 17:00:02 -0700
Message-Id: <20201021000011.15351-5-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/features.h | 78 ++++++++++++++++++++++++++---------
 1 file changed, 59 insertions(+), 19 deletions(-)

diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 1613b2aab8..524d1758c4 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -27,8 +27,8 @@
 #ifndef __XEN_PUBLIC_FEATURES_H__
 #define __XEN_PUBLIC_FEATURES_H__
 
-/*
- * `incontents 200 elfnotes_features XEN_ELFNOTE_FEATURES
+/**
+ * DOC: XEN_ELFNOTE_FEATURES
  *
  * The list of all the features the guest supports. They are set by
  * parsing the XEN_ELFNOTE_FEATURES and XEN_ELFNOTE_SUPPORTED_FEATURES
@@ -41,19 +41,25 @@
  * XENFEAT_dom0 MUST be set if the guest is to be booted as dom0,
  */
 
-/*
- * If set, the guest does not need to write-protect its pagetables, and can
- * update them via direct writes.
+/**
+ * DOC: XENFEAT_writable_page_tables
+ *
+ * If set, the guest does not need to write-protect its pagetables, and
+ * can update them via direct writes.
  */
 #define XENFEAT_writable_page_tables       0
 
-/*
+/**
+ * DOC: XENFEAT_writable_descriptor_tables
+ *
  * If set, the guest does not need to write-protect its segment descriptor
  * tables, and can update them via direct writes.
  */
 #define XENFEAT_writable_descriptor_tables 1
 
-/*
+/**
+ * DOC: XENFEAT_auto_translated_physmap
+ *
  * If set, translation between the guest's 'pseudo-physical' address space
  * and the host's machine address space are handled by the hypervisor. In this
  * mode the guest does not need to perform phys-to/from-machine translations
@@ -61,37 +67,63 @@
  */
 #define XENFEAT_auto_translated_physmap    2
 
-/* If set, the guest is running in supervisor mode (e.g., x86 ring 0). */
+/**
+ * DOC: XENFEAT_supervisor_mode_kernel
+ *
+ * If set, the guest is running in supervisor mode (e.g., x86 ring 0).
+ */
 #define XENFEAT_supervisor_mode_kernel     3
 
-/*
+/**
+ * DOC: XENFEAT_pae_pgdir_above_4gb
+ *
  * If set, the guest does not need to allocate x86 PAE page directories
  * below 4GB. This flag is usually implied by auto_translated_physmap.
  */
 #define XENFEAT_pae_pgdir_above_4gb        4
 
-/* x86: Does this Xen host support the MMU_PT_UPDATE_PRESERVE_AD hypercall? */
+/**
+ * DOC: XENFEAT_mmu_pt_update_preserve_ad
+ * x86: Does this Xen host support the MMU_PT_UPDATE_PRESERVE_AD hypercall?
+ */
 #define XENFEAT_mmu_pt_update_preserve_ad  5
 
-/* x86: Does this Xen host support the MMU_{CLEAR,COPY}_PAGE hypercall? */
+/**
+ * DOC: XENFEAT_highmem_assist
+ * x86: Does this Xen host support the MMU_{CLEAR,COPY}_PAGE hypercall?
+ */
 #define XENFEAT_highmem_assist             6
 
-/*
+/**
+ * DOC: XENFEAT_gnttab_map_avail_bits
+ *
  * If set, GNTTABOP_map_grant_ref honors flags to be placed into guest kernel
  * available pte bits.
  */
 #define XENFEAT_gnttab_map_avail_bits      7
 
-/* x86: Does this Xen host support the HVM callback vector type? */
+/**
+ * DOC: XENFEAT_hvm_callback_vector
+ * x86: Does this Xen host support the HVM callback vector type?
+ */
 #define XENFEAT_hvm_callback_vector        8
 
-/* x86: pvclock algorithm is safe to use on HVM */
+/**
+ * DOC: XENFEAT_hvm_safe_pvclock
+ * x86: pvclock algorithm is safe to use on HVM
+ */
 #define XENFEAT_hvm_safe_pvclock           9
 
-/* x86: pirq can be used by HVM guests */
+/**
+ * DOC: XENFEAT_hvm_pirqs
+ * x86: pirq can be used by HVM guests
+ */
 #define XENFEAT_hvm_pirqs                 10
 
-/* operation as Dom0 is supported */
+/**
+ * DOC: XENFEAT_dom0
+ * operation as Dom0 is supported
+ */
 #define XENFEAT_dom0                      11
 
 /* Xen also maps grant references at pfn = mfn.
@@ -99,13 +131,21 @@
 #define XENFEAT_grant_map_identity        12
  */
 
-/* Guest can use XENMEMF_vnode to specify virtual node for memory op. */
+/**
+ * DOC: XENFEAT_memory_op_vnode_supported
+ * Guest can use XENMEMF_vnode to specify virtual node for memory op.
+ */
 #define XENFEAT_memory_op_vnode_supported 13
 
-/* arm: Hypervisor supports ARM SMC calling convention. */
+/**
+ * DOC: XENFEAT_ARM_SMCCC_supported
+ * arm: Hypervisor supports ARM SMC calling convention.
+ */
 #define XENFEAT_ARM_SMCCC_supported       14
 
-/*
+/**
+ * DOC: XENFEAT_linux_rsdp_unrestricted
+ *
  * x86/PVH: If set, ACPI RSDP can be placed at any address. Otherwise RSDP
  * must be located in lower 1MB, as required by ACPI Specification for IA-PC
  * systems.
-- 
2.17.1


