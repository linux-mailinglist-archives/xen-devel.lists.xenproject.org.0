Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFE6302D9E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 22:28:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74508.133967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l49Or-00085F-Vh; Mon, 25 Jan 2021 21:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74508.133967; Mon, 25 Jan 2021 21:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l49Or-00084d-S1; Mon, 25 Jan 2021 21:27:53 +0000
Received: by outflank-mailman (input) for mailman id 74508;
 Mon, 25 Jan 2021 21:27:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9fV7=G4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l49Op-00082l-VW
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 21:27:52 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31ed6c10-a7e6-48b4-b143-58e01f41e1d6;
 Mon, 25 Jan 2021 21:27:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 206D820C56;
 Mon, 25 Jan 2021 21:27:50 +0000 (UTC)
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
X-Inumbo-ID: 31ed6c10-a7e6-48b4-b143-58e01f41e1d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611610070;
	bh=1iOlwII+Idef6Hga9XHHIhnZBrMhh2LQM78/STZV/E4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uvo51snmJjLAv2BHsrx+PeaAEhM7nKran3Gl4SRJTIsmkDYdduRutDe7ioKYb2qgh
	 ClywjaawQvg7mTv46ZYtE2F87KMDSSHZW5cwIAl7JZbwNIJJY7g1ZJT1SNdBuYkArY
	 W+CtGff57Bu/qYqkQWbobE3Ri7suzxPmAD7jicmdG1Ck6zy1SV7J/zGzIYzaUTbHVR
	 qTq8P5rwnFXb5+kJu4hp8GSZ4mcjCrf1m/VomZ9yVYGd/hdMea3vtMKcaug8RalRzY
	 KKtBJG6t+fdZtU2pFaCQTwDcnv4FZpEz8lf8Srqzd8FqUjQmyHd8btvmrguglTySpy
	 DZKbDtWEexTfw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	julien@xen.org,
	wl@xen.org
Subject: [PATCH v4 2/2] xen: add (EXPERT) to one-line descriptions when appropriate
Date: Mon, 25 Jan 2021 13:27:47 -0800
Message-Id: <20210125212747.26676-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>

Add an "(EXPERT)" tag to the one-line description of Kconfig options
that depend on EXPERT.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: andrew.cooper3@citrix.com
CC: george.dunlap@citrix.com
CC: iwj@xenproject.org
CC: jbeulich@suse.com
CC: julien@xen.org
CC: wl@xen.org

---
Changes in v4:
- new patch
---
 xen/arch/x86/Kconfig     |  2 +-
 xen/common/Kconfig       | 12 ++++++------
 xen/common/sched/Kconfig |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 302334d3e4..3f630b89e8 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -103,7 +103,7 @@ config HVM
 	  If unsure, say Y.
 
 config XEN_SHSTK
-	bool "Supervisor Shadow Stacks"
+	bool "Supervisor Shadow Stacks (EXPERT)"
 	depends on HAS_AS_CET_SS && EXPERT
 	default y
 	---help---
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 39451e8350..b49127463d 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -12,7 +12,7 @@ config CORE_PARKING
 	bool
 
 config GRANT_TABLE
-	bool "Grant table support" if EXPERT
+	bool "Grant table support (EXPERT)" if EXPERT
 	default y
 	---help---
 	  Grant table provides a generic mechanism to memory sharing
@@ -151,7 +151,7 @@ config KEXEC
 	  If unsure, say Y.
 
 config EFI_SET_VIRTUAL_ADDRESS_MAP
-    bool "EFI: call SetVirtualAddressMap()" if EXPERT
+    bool "EFI: call SetVirtualAddressMap() (EXPERT)" if EXPERT
     ---help---
       Call EFI SetVirtualAddressMap() runtime service to setup memory map for
       further runtime services. According to UEFI spec, it isn't strictly
@@ -162,7 +162,7 @@ config EFI_SET_VIRTUAL_ADDRESS_MAP
 
 config XENOPROF
 	def_bool y
-	prompt "Xen Oprofile Support" if EXPERT
+	prompt "Xen Oprofile Support (EXPERT)" if EXPERT
 	depends on X86
 	---help---
 	  Xen OProfile (Xenoprof) is a system-wide profiler for Xen virtual
@@ -199,7 +199,7 @@ config XSM_FLASK
 
 config XSM_FLASK_AVC_STATS
 	def_bool y
-	prompt "Maintain statistics on the FLASK access vector cache" if EXPERT
+	prompt "Maintain statistics on the FLASK access vector cache (EXPERT)" if EXPERT
 	depends on XSM_FLASK
 	---help---
 	  Maintain counters on the access vector cache that can be viewed using
@@ -344,7 +344,7 @@ config SUPPRESS_DUPLICATE_SYMBOL_WARNINGS
 	  build becoming overly verbose.
 
 config CMDLINE
-	string "Built-in hypervisor command string" if EXPERT
+	string "Built-in hypervisor command string (EXPERT)" if EXPERT
 	default ""
 	---help---
 	  Enter arguments here that should be compiled into the hypervisor
@@ -377,7 +377,7 @@ config DOM0_MEM
 	  Leave empty if you are not sure what to specify.
 
 config TRACEBUFFER
-	bool "Enable tracing infrastructure" if EXPERT
+	bool "Enable tracing infrastructure (EXPERT)" if EXPERT
 	default y
 	---help---
 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
index 94c9e20139..b6020a83c6 100644
--- a/xen/common/sched/Kconfig
+++ b/xen/common/sched/Kconfig
@@ -1,4 +1,4 @@
-menu "Schedulers"
+menu "Schedulers (EXPERT)"
 	visible if EXPERT
 
 config SCHED_CREDIT
-- 
2.17.1


