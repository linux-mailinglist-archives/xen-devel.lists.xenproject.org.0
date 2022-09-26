Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D82E5EA83F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 16:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411855.654978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocowz-0005x5-AE; Mon, 26 Sep 2022 14:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411855.654978; Mon, 26 Sep 2022 14:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocowz-0005tO-6i; Mon, 26 Sep 2022 14:19:13 +0000
Received: by outflank-mailman (input) for mailman id 411855;
 Mon, 26 Sep 2022 14:19:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ba90=Z5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ocowx-0005DG-Ne
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 14:19:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30a5c8d3-3da6-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 16:19:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8CD4D21ED4;
 Mon, 26 Sep 2022 14:19:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D18F139BD;
 Mon, 26 Sep 2022 14:19:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BwGjDd60MWOiBgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 26 Sep 2022 14:19:10 +0000
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
X-Inumbo-ID: 30a5c8d3-3da6-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664201950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acJkGEJzQvXK3ntpRB7CEDesvJKyVtqSHHdOsYKLzIg=;
	b=i1dwUiOyCBw7IR7aEH1PBRg4a9gQzwDV01bgDjlihYYT+NCz760Ilh718xzjV+CMcd+1gU
	Ysl9/VyM6OsgmljS7s7h0UDr+PBJX3FQhki4eIpF0+Av66TnrmdN/ZlEiCcnlBWkWVVSNE
	WoPIKXRUUFnLgAouJlYWO//iNsY5ADU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 3/3] xen/pv: support selecting safe/unsafe msr accesses
Date: Mon, 26 Sep 2022 16:18:49 +0200
Message-Id: <20220926141849.21805-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220926141849.21805-1-jgross@suse.com>
References: <20220926141849.21805-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of always doing the safe variants for reading and writing MSRs
in Xen PV guests, make the behavior controllable via Kconfig option
and a boot parameter.

The default will be the current behavior, which is to always use the
safe variant.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 +++++
 arch/x86/xen/Kconfig                          |  9 +++++++
 arch/x86/xen/enlighten_pv.c                   | 24 +++++++++++--------
 3 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 426fa892d311..1bda9cf18fae 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6836,6 +6836,12 @@
 			Crash from Xen panic notifier, without executing late
 			panic() code such as dumping handler.
 
+	xen_msr_safe=	[X86,XEN]
+			Format: <bool>
+			Select whether to always use non-faulting (safe) MSR
+			access functions when running as Xen PV guest. The
+			default value is controlled by CONFIG_XEN_PV_MSR_SAFE.
+
 	xen_nopvspin	[X86,XEN]
 			Disables the qspinlock slowpath using Xen PV optimizations.
 			This parameter is obsoleted by "nopvspin" parameter, which
diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 85246dd9faa1..9b1ec5d8c99c 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -92,3 +92,12 @@ config XEN_DOM0
 	select X86_X2APIC if XEN_PVH && X86_64
 	help
 	  Support running as a Xen Dom0 guest.
+
+config XEN_PV_MSR_SAFE
+	bool "Always use safe MSR accesses in PV guests"
+	default y
+	depends on XEN_PV
+	help
+	  Use safe (not faulting) MSR access functions even if the MSR access
+	  should not fault anyway.
+	  The default can be changed by using the "xen_msr_safe" boot parameter.
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 4e68e047df94..6b0e5d4c485a 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -108,6 +108,16 @@ struct tls_descs {
  */
 static DEFINE_PER_CPU(struct tls_descs, shadow_tls_desc);
 
+static __read_mostly bool xen_msr_safe = IS_ENABLED(CONFIG_XEN_PV_MSR_SAFE);
+
+static int __init parse_xen_msr_safe(char *str)
+{
+	if (str)
+		return strtobool(str, &xen_msr_safe);
+	return -EINVAL;
+}
+early_param("xen_msr_safe", parse_xen_msr_safe);
+
 static void __init xen_pv_init_platform(void)
 {
 	/* PV guests can't operate virtio devices without grants. */
@@ -1010,22 +1020,16 @@ static int xen_write_msr_safe(unsigned int msr, unsigned int low,
 
 static u64 xen_read_msr(unsigned int msr)
 {
-	/*
-	 * This will silently swallow a #GP from RDMSR.  It may be worth
-	 * changing that.
-	 */
 	int err;
 
-	return xen_read_msr_safe(msr, &err);
+	return xen_do_read_msr(msr, xen_msr_safe ? &err : NULL);
 }
 
 static void xen_write_msr(unsigned int msr, unsigned low, unsigned high)
 {
-	/*
-	 * This will silently swallow a #GP from WRMSR.  It may be worth
-	 * changing that.
-	 */
-	xen_write_msr_safe(msr, low, high);
+	int err;
+
+	xen_do_write_msr(msr, low, high, xen_msr_safe ? &err : NULL);
 }
 
 /* This is called once we have the cpu_possible_mask */
-- 
2.35.3


