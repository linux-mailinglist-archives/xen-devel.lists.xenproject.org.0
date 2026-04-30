Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNNQLqBW82mLzgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 15:18:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB104A3509
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 15:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298144.1573681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIQrh-0001bu-TZ; Thu, 30 Apr 2026 12:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298144.1573681; Thu, 30 Apr 2026 12:51:37 +0000
Received: from [127.0.0.1] (helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIQrh-0001Yn-QA; Thu, 30 Apr 2026 12:51:37 +0000
Received: by outflank-mailman (input) for mailman id 1298144;
 Thu, 30 Apr 2026 12:51:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wIQre-0001YD-GY
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 12:51:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIQra-005gLh-RX
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 14:51:30 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f35049-2eae-0a2a0a5409dd-0a2a4502d1f0-26
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 14:51:30 +0200
Received: from [40.107.200.65]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f35050-af86-0a2a45020019-286bc8413f95-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 14:51:29 +0200
Received: from BN9P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::32)
 by IA1PR12MB7663.namprd12.prod.outlook.com (2603:10b6:208:424::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 12:51:23 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:10a:cafe::f5) by BN9P221CA0020.outlook.office365.com
 (2603:10b6:408:10a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 12:51:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 12:51:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 07:51:22 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 05:51:22 -0700
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Thu, 30 Apr 2026 07:51:20 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvaBVywlwhfPpI88zUPtEDCNhtZxj7qTDOsozYydv2P+bONz2xwjZfWwdLk2EoGew7V6oK/4lxtZdQxQ4Dp0eAFDujBa68UhdaBsS1yvsY7kz5nr4RuHP5eKwOLIFriKizeV7x5tYos0VJ4SCBr3fls+1LSOjk1yuUVmRXtssBO+dvVUzLzsK4CCJHmsYRKqc/cDB/icnNMmnZUe7C85zFyJW27IhoScL9QBRt5/iKivfqS4KaXsm+FCXqLtPL9vHUye32MgkhMvc0QM9ZykTCBivt4TZgqBAGw6et7i6roUFdFoFZVN6t2Qjn1prsQbbfyPnIFS6p24M7gH2I3L+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YCO5UKjNJP5UOoj3rYV3rGfJdTy+pPmVxC0pvAcvis=;
 b=bKDKuRGVwq9uZTJgwk/ZfUpFj5dFhmUbnHAS7gckEag9RsBYijr+dDh+8jJgH6sZvHMZfcvMBkHkY/HJEaDGaHx0rgzsuBgdASNCiaP1uiUsi6FDFfeUbs7jjJWBoNxV7FFPhPeqKt8KHxdfxUDHC0Ar2K+iZeUO0WRKAh5qTEYzEZ3Pi+NSGUI/mBP8b1WCXD1hrbJkNvvihp5hTkPI8YFzIX/PgEO0Db60k2G9DB3zLnnRrXeDVx35FV25tz+VXjztHK3SlrICmGH16TjdfqgFqDHbAOCI8ZNluyrutRejJ3tMGWEBFYgC3EslZs/n95o/2/4UrnnWZlE9mw3B9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YCO5UKjNJP5UOoj3rYV3rGfJdTy+pPmVxC0pvAcvis=;
 b=eg5rD+vYVLyPGiBS+nW3sPaenqzzs2MRkqczmGLLt8GHNxSopP6sBP4xRJVMlgBcM5BQAnmUDJMwIT5eMXtISBeXjG6ThHJtjsYQ1A65DYjaZkyTdeXeG6ToEkb6seYOxoErbVMuzUHGD1e7gViMGvytNg7LdF1jSTflznikQvA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in generic pdx_to_page/page_to_pdx
Date: Thu, 30 Apr 2026 14:51:02 +0200
Message-ID: <20260430125103.401811-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430125103.401811-1-michal.orzel@amd.com>
References: <20260430125103.401811-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|IA1PR12MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c39c95-59b2-40c3-3ee6-08dea6b72ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Ppu52g47T4U52UtUyCsQSCLmp/cPAgIejx/hD3De8OcV+z0llRquhPqCZMC83m2y/WzokENn0PlsPM2t+VFqqbvflLyXn4rOSZ3ypVXBjIvDC6JNJ4UpwO7+nymZjXqOkqSI+IfnQrnnG3NE9o3u7HXFeYyMv2xWMUFCSo2mqlSrJTSKqk2o5blNjdYpYuHEbCK4yzbHe9JwsdeBP5nT+mbi8YgSYc26KgtCIgjpdivgxWf7An7H+4J7EpYEQFZrGW87Yy8c7PLDNOgCWBTK8nSQ4TMApAxCJenoBaWbVyOK0nj256DEPlCAyRZ1M6yh1NctEpN+ZP7GHuP27Ljww+kn8Bzv4OiDkoqr7FRryrJO6Nquu6IbC88025klSnIVTxOT1scjMQ4xyiEukN9kr6MXVIvzhyqY559HB74SuQ/3qP8cgGmVQMaMEDcsoxQ1h995GcxHFg04KOI972B4GMnNHA6apUmB7bTFtDqncU5dmXSgMfTEgS8N6dB+FA3chVHpoWnk/X1KqnNkFkTq92Q5RhWaz6NIx3+cavh2CP1JM3fMr3ncyIbR0I1e5yH/3btLOe9GsLehvZHI5i8UdQRsczCi1BWRSMeMHOBLwpRAb6gWVDpzup4A09AZK50y2poqfSjTne61qPuWlZDXY3r6JEVeKS1K6OAsCeZHS1mBhnbptk5ggJVJfR1EJfqMtAeHpP1XwCReNXxwIaahIzMctjvuLO+jAxGrE8Gb3twjiNcp6zf+4uh7GYiG6uWnPz+OVgesPtTS2+Qj0N2S7g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9KK/JxHke4udpLXmUFB4bhTAtPqsoJmFoFTIGwkRwnE5ARcEPXTKwWp14914me/d33m1OtZen1aTREMnFLVBhh4MZZAc1rizClm6oiEeteZ1nGlHl9DE2SsdiDnthi0VlL2Rl9DB33BZJsqNxW5tJP3Y3QMZjsog3UuvASjy0A4Njpl58Kw0rCA/JVEfUwq0hG1bmqDTZIMA4hDRL8Q5B3ZdRgbf5k2TQwJTuWbLAWz/y63Nx6kYWxxwR8kMFoHkFexloibo7++imFVBzZy0TQv60QgQM5IeBGbjv8XuiE0UL+qy0SxRZQAY3u3ahjRCLpJGdpcyDvwnRwQ9jnI0ZnrmwAYbF3Q8/6sbJG14DQ6rMTP41Fq3o8alfVCns7v+2Umk9zMjukWPM9EZXxU90VOi4JVs4I7etlOTVN+I01Ak5PKap7Cbmyv0FxHip/e4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 12:51:22.6925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c39c95-59b2-40c3-3ee6-08dea6b72ec9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7663
X-purgate-ID: tlsNG-720697/1777553489-B2969161-826374CE/0/0
X-purgate-type: clean
X-purgate-size: 7403
X-Rspamd-Queue-Id: EBB104A3509
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]

The generic pdx_to_page() and page_to_pdx() macros in xen/pdx.h assume
the frame table starts at PDX 0, which is only true on x86. ARM
uses a non-zero frametable_base_pdx to offset into the frame table (PPC also
defines it).

Fix the generic macros to subtract/add frametable_base_pdx, defaulting
to 0 when the arch does not define it. This makes the generic macros
correct for all architectures, even though they are only used on x86
today.

While at it, consolidate the arch-specific PDX definitions
(frametable_base_pdx and PDX_GROUP_SHIFT) from the arch mm.h headers
into new asm/pdx.h headers for ARM and PPC. The asm/pdx.h is included
earlier in xen/pdx.h via __has_include, making these definitions available
before they are needed.

Also decouple the __has_include(<asm/pdx.h>) check from the PFN-to-PDX
translation override mechanism. Previously, the existence of asm/pdx.h
was taken to mean the arch provides custom pdx_to_pfn / pfn_to_pdx
implementations. This conflation would prevent ARM and PPC from having
asm/pdx.h (for frametable_base_pdx) without also being forced to define
the translation helpers. Replace the __has_include gate with an explicit
ARCH_DEFINES_PDX_XLATE sentinel that only x86 defines.

No functional change.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - new patch
---
 xen/arch/arm/include/asm/mm.h  |  5 -----
 xen/arch/arm/include/asm/pdx.h | 21 +++++++++++++++++++++
 xen/arch/arm/mm.c              |  1 +
 xen/arch/ppc/include/asm/mm.h  |  5 -----
 xen/arch/ppc/include/asm/pdx.h | 12 ++++++++++++
 xen/arch/ppc/mm-radix.c        |  1 +
 xen/arch/x86/include/asm/pdx.h |  6 ++++++
 xen/include/xen/pdx.h          | 17 ++++++++++++-----
 8 files changed, 53 insertions(+), 15 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/pdx.h
 create mode 100644 xen/arch/ppc/include/asm/pdx.h

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 72a692862420..8180b1e12baf 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -181,11 +181,6 @@ struct page_info
 
 #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
 
-/* PDX of the first page in the frame table. */
-extern unsigned long frametable_base_pdx;
-
-#define PDX_GROUP_SHIFT SECOND_SHIFT
-
 /* Boot-time pagetable setup */
 extern void setup_pagetables(void);
 /* Check that the mapping flag has no W and X together */
diff --git a/xen/arch/arm/include/asm/pdx.h b/xen/arch/arm/include/asm/pdx.h
new file mode 100644
index 000000000000..651df4b210dc
--- /dev/null
+++ b/xen/arch/arm/include/asm/pdx.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef ARM_PDX_H
+#define ARM_PDX_H
+
+#include <asm/lpae.h>
+
+#define PDX_GROUP_SHIFT SECOND_SHIFT
+
+#define ARCH_HAS_FRAMETABLE_BASE_PDX
+extern unsigned long frametable_base_pdx;
+
+#endif /* ARM_PDX_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 6eddbcf912ee..faef0efb327c 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -16,6 +16,7 @@
 #include <xen/static-shmem.h>
 #include <xen/vmap.h>
 
+#include <asm/pdx.h>
 #include <asm/setup.h>
 
 #include <xsm/xsm.h>
diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.h
index 402d06bdaa9f..d55393ff2aa4 100644
--- a/xen/arch/ppc/include/asm/mm.h
+++ b/xen/arch/ppc/include/asm/mm.h
@@ -163,9 +163,6 @@ struct page_info
 #define FRAMETABLE_VIRT_START  (XEN_VIRT_START + GB(32))
 #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
 
-/* PDX of the first page in the frame table. */
-extern unsigned long frametable_base_pdx;
-
 /* Convert between machine frame numbers and page-info structures. */
 #define mfn_to_page(mfn)                                            \
     (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
@@ -220,8 +217,6 @@ static inline void put_page_and_type(struct page_info *page)
 #define set_gpfn_from_mfn(mfn, pfn) BUG_ON("unimplemented")
 #define mfn_to_gfn(d, mfn) ({ BUG_ON("unimplemented"); _gfn(0); })
 
-#define PDX_GROUP_SHIFT XEN_PT_SHIFT_LVL_3
-
 static inline unsigned long domain_get_maximum_gpfn(struct domain *d)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/ppc/include/asm/pdx.h b/xen/arch/ppc/include/asm/pdx.h
new file mode 100644
index 000000000000..4290c7bc9c36
--- /dev/null
+++ b/xen/arch/ppc/include/asm/pdx.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PPC_PDX_H
+#define PPC_PDX_H
+
+#include <asm/page.h>
+
+#define PDX_GROUP_SHIFT XEN_PT_SHIFT_LVL_3
+
+#define ARCH_HAS_FRAMETABLE_BASE_PDX
+extern unsigned long frametable_base_pdx;
+
+#endif /* PPC_PDX_H */
diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index d5385ec9dd4b..2eddd86822e0 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -10,6 +10,7 @@
 
 #include <asm/early_printk.h>
 #include <asm/page.h>
+#include <asm/pdx.h>
 #include <asm/processor.h>
 #include <asm/regs.h>
 #include <asm/msr.h>
diff --git a/xen/arch/x86/include/asm/pdx.h b/xen/arch/x86/include/asm/pdx.h
index 6be7e1185eb1..5e660be17e39 100644
--- a/xen/arch/x86/include/asm/pdx.h
+++ b/xen/arch/x86/include/asm/pdx.h
@@ -3,8 +3,12 @@
 #ifndef X86_PDX_H
 #define X86_PDX_H
 
+#ifndef CONFIG_PDX_NONE
+
 #include <asm/alternative.h>
 
+#define ARCH_DEFINES_PDX_XLATE
+
 /*
  * Introduce a macro to avoid repeating the same asm goto block in each helper.
  * Note the macro is strictly tied to the code in the helpers.
@@ -59,6 +63,8 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
 
 #undef PDX_ASM_GOTO_SKIP
 
+#endif /* !CONFIG_PDX_NONE */
+
 #endif /* X86_PDX_H */
 
 /*
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 856fc3e8a0e6..59c257651953 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -132,8 +132,9 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn);
  */
 bool __mfn_valid(unsigned long mfn);
 
-#define page_to_pdx(pg)  ((pg) - frame_table)
-#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
+#define page_to_pdx(pg) \
+    ((unsigned long)((pg) - frame_table) + frametable_base_pdx)
+#define pdx_to_page(pdx) gcc11_wrap(frame_table + ((pdx) - frametable_base_pdx))
 
 #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
 #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
@@ -244,6 +245,14 @@ static inline paddr_t directmapoff_to_maddr_xlate(unsigned long offset)
 
 #endif /* CONFIG_PDX_OFFSET_COMPRESSION */
 
+#if __has_include(<asm/pdx.h>)
+# include <asm/pdx.h>
+#endif
+
+#ifndef ARCH_HAS_FRAMETABLE_BASE_PDX
+#define frametable_base_pdx 0
+#endif
+
 #ifdef CONFIG_PDX_NONE
 
 /* Without PDX compression we can skip some computations */
@@ -283,9 +292,7 @@ static inline void pfn_pdx_compression_reset(void)
  *
  * Do not use _xlate suffixed functions, always use the non _xlate variants.
  */
-#if __has_include(<asm/pdx.h>)
-# include <asm/pdx.h>
-#else
+#ifndef ARCH_DEFINES_PDX_XLATE
 # define pdx_to_pfn pdx_to_pfn_xlate
 # define pfn_to_pdx pfn_to_pdx_xlate
 # define maddr_to_directmapoff maddr_to_directmapoff_xlate
-- 
2.43.0


