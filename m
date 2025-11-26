Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDFDC8B07C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173113.1498256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIdy-0001Nb-NE; Wed, 26 Nov 2025 16:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173113.1498256; Wed, 26 Nov 2025 16:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIdy-0001IO-Hm; Wed, 26 Nov 2025 16:45:26 +0000
Received: by outflank-mailman (input) for mailman id 1173113;
 Wed, 26 Nov 2025 16:45:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Gki=6C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOIdx-0008EF-B4
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:45:25 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d46dc38-cae7-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 17:45:24 +0100 (CET)
Received: from PH7PR17CA0072.namprd17.prod.outlook.com (2603:10b6:510:325::20)
 by PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 16:45:19 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:325:cafe::f5) by PH7PR17CA0072.outlook.office365.com
 (2603:10b6:510:325::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 16:45:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.0 via Frontend Transport; Wed, 26 Nov 2025 16:45:18 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 10:45:15 -0600
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
X-Inumbo-ID: 4d46dc38-cae7-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xknlO+5Y+ikz9/M3NMN8dA4bRkC8emwglURifbXVqJRYhhpKcfUhiqpyLwqMMckpRuclmLY8/hIqwfJhFkrzCqpkZuMQeZ6CXcLWqLybx0XIVNQJsDRkMNsVTUtLZTta4emVpWqwpwotkeK3kp/5gRQb5q+hsI0AFfxML0uoz9FplLmReQkthPDRLyTSsJyR0mC1Z/e5lzLz8L1DcasmTwNDyXM8mchNxW/YG4VU6SwiocMeTLX5yqOMRJuYbbpOZnS6GOnZYk9Qq+3pDftmW/lu5wsr20yygPnY4dDlxU0ybeymkIzFGurEhmrIloXP7kvTbKu/Dt9PMfDjDYknnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0lddGJ4VxvfpnmaJYHWtrMb1/mSuMob9++57KLq5uU=;
 b=gc6K18G/dAGHKQydO1JsywZADC6CXFEQqlJkzC45aKaH9uFfpNaoMvXOT9xDeSifPmhrk3cHQ4PUoHA9e1AgExFrBVTtj1VrJpqMV3Jw5IcXuteBI2rKcr20JkdyyzEt4LJoYQsMSkrcnlq2docahBT4RBlvvlqH/T2L2JbCAQBUq3ismD2WlgTOE5Izh/G4pWyMtqJfc1G1A281Tb8zvz6hrzLFeCgR+TBZqDW2xXG9sWnwZf6Sj4Mnl56ocHLjKDaHW/XT9EraR5mx0eFUs0SEoi0gLWN0cs9K20zKuNMykxS0rkHPK0bCcqf5c3KT4+mJZ7nWtA5d04MKtlS5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0lddGJ4VxvfpnmaJYHWtrMb1/mSuMob9++57KLq5uU=;
 b=oOVAkCOae1Fq3obc1Qa6xdM4vMCdPyZo/2hlaQF8RLei54WiYLfRK3zZcVvewdJ8yEpCtPI+K0kzJykqjRHlrOR2EiOiProv6PqU0R9yZhi4OTLLJ1ly8Bta0oyOkqWYtnVENSwRlx3yHJ/mNEHUjcC7jyKBqFyPuKFc+/icWCI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>
Subject: [RFC PATCH 09/11] x86: Migrate spec_ctrl vendor checks to x86_vendor_is()
Date: Wed, 26 Nov 2025 17:44:11 +0100
Message-ID: <20251126164419.174487-10-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|PH7PR12MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e97cb69-c542-41ab-5922-08de2d0b2f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BoKTJF4Q8/A+XCsMwYt9Dagkbg79Nz94evXOyAbJkp2KQPK9NcQm6e2jQ+we?=
 =?us-ascii?Q?AAgvGFOn1E6gP2lJEsXrbp5itfpQgKMlp4jlgKmt0vmFIKbEBx9DaJqpvjtf?=
 =?us-ascii?Q?Q9v/zkHfBckLKLvqEY8V4/5fOKuJ5U9Eg5oIh4ugK38ON/No3naRZMVbY/Cy?=
 =?us-ascii?Q?BDY3Cvh4aDuj2uaVkuTke81OKWTxCIizyr2K7AB8Woc1Z+iVMcdFJx4FD7gJ?=
 =?us-ascii?Q?N+Tl4y5fpMc5BVqxUSnjC8gbwEhBm2K1E4Mc7uGXJydTRICxR0ahKBBrn0Ue?=
 =?us-ascii?Q?C5whDDTDbGCfaAMxjCVaAuDzLPwRxlxWrRJuohiPuciY9HuY84tbxYvk6j0O?=
 =?us-ascii?Q?mPmPAtZ3To/e1hQy8ddKT8w5cqmQ1mfziYq68oyMuiDSmyo0yoMJ1DL0217x?=
 =?us-ascii?Q?UELeOijqyGvDTTUh+bReDw7JKRzF+nZHbRStFXJtK5n5vJ+X21uO1ev2bYVA?=
 =?us-ascii?Q?TzpbxZXO1x12j8V2xdRoOzIaZ1cG53KeYAc/h3whYNOa+L8B6Ee++zjGqr+J?=
 =?us-ascii?Q?PS/f8VlgtqFCI23WbSDSe2hRqfSZdoeaLojkBpaz0fRjn/KgtjGPszRO3KY0?=
 =?us-ascii?Q?DU6cac0y1T73rWphntS+lUhCyWNloOaQ4C+/xDnfI8FSvOGbPuUHo16Vil8q?=
 =?us-ascii?Q?bm8XWtLdRzCyF6byR9NGKL2nSeDnq4C2biqmpDI4YU5cf05dSrTTYEbGhwSr?=
 =?us-ascii?Q?it8xgreZ9M9pwsZvrkXha53Z+D4Yqjpz8JrTL1P8Wqms7yCe8V+GzNUxvHDN?=
 =?us-ascii?Q?HjW6IHG1czVD7tZQGo9Nd1MqpSiR7M71/M0NwUp5zjNxRW0uibnIK61SRxKg?=
 =?us-ascii?Q?Qiy9wBpkAOOSaq+v7SSk/3ySBo3DDPHDPrA7oQr23+UbEutXdQemC2fMT+qe?=
 =?us-ascii?Q?5l8pySeW3MxGUSybJDldVuvZIGzfsHzG0/Qn8FCSa3WqTn0loa/D+FHfGnsx?=
 =?us-ascii?Q?Hka5aQxkjJiF1HVqiops8vViLIFD6EWsoKtRqZd5DdU+IV5Jwk1xOnHqeakB?=
 =?us-ascii?Q?PoKOcsfqgI7UmZW/v1Ukn5yowy5OofoIGUgMiMy/xjYIwvBrFenzh069XqlV?=
 =?us-ascii?Q?ov/oDUdvEKbujN7Os+kZLgVpTZMRBbrK5SwvU6LHAdShWa5iNCydVZnEBxid?=
 =?us-ascii?Q?STjPPE+lXoaWuOL5RtLr8urDn3pRtVxR2DmWKbmCllbIo4J4A/mQQPNBlTga?=
 =?us-ascii?Q?dcW5psdWlMbbEc7TKEinHa3B+6LS6ehNOVQmTCgO5g4t0bq+tyxMWq8M4Ypp?=
 =?us-ascii?Q?DYkwGzcsKJQDulZOs1qVz7vn/xE0MZdIqdYVcq0AyCP/9R4So3AV6cBImIbw?=
 =?us-ascii?Q?M7Og5XxCrXdK+u2+KCiW+G4KX95iky6l6KcBHPCuIRyyJ5NXWy45Lo+7sdjN?=
 =?us-ascii?Q?Trhss4/TTkm/f6u/+vWT9ztkIZBTe4QsJ9XorTBDeHKse40TRNUMMfiEJstA?=
 =?us-ascii?Q?adSf2Rq57zn2sPlBMqlN6T14a0ve4zBSvwNH1ym/zpBt+6WivBu4z1ORiJcl?=
 =?us-ascii?Q?cFlC+0ypIkDZEY4hM9nXOM7LhJV60JSisW9gHTkLULKqLkkDZptKqrD4G2h/?=
 =?us-ascii?Q?3FVWdJCV9C8JN7Y/njo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:45:18.8357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e97cb69-c542-41ab-5922-08de2d0b2f01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7282

This is the file with the most dramatic effect in terms of DCE, so
single it out here.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/spec_ctrl.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index e71f62c601..a464c88908 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -388,7 +388,7 @@ int8_t __ro_after_init opt_xpti_domu = -1;
 
 static __init void xpti_init_default(void)
 {
-    if ( (boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
+    if ( (x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
          cpu_has_rdcl_no )
     {
         if ( opt_xpti_hwdom < 0 )
@@ -712,7 +712,7 @@ static bool __init check_smt_enabled(void)
      * At the time of writing, it is almost completely undocumented, so isn't
      * virtualised reliably.
      */
-    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL &&
+    if ( x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_INTEL) &&
          boot_cpu_data.family != 0xf && !cpu_has_hypervisor &&
          !rdmsr_safe(MSR_INTEL_CORE_THREAD_COUNT, &val) )
         return (MASK_EXTR(val, MSR_CTC_CORE_MASK) !=
@@ -738,10 +738,10 @@ static bool __init retpoline_calculations(void)
     unsigned int ucode_rev = this_cpu(cpu_sig).rev;
     bool safe = false;
 
-    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         return true;
 
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+    if ( !x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_INTEL) ||
          boot_cpu_data.family != 6 )
         return false;
 
@@ -938,7 +938,7 @@ static bool __init retpoline_calculations(void)
  */
 static bool __init rsb_is_full_width(void)
 {
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+    if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) ||
          boot_cpu_data.family != 6 )
         return true;
 
@@ -966,7 +966,7 @@ static bool __init should_use_eager_fpu(void)
      * Assume all unrecognised processors are ok.  This is only known to
      * affect Intel Family 6 processors.
      */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+    if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) ||
          boot_cpu_data.family != 6 )
         return false;
 
@@ -1033,7 +1033,7 @@ static bool __init should_use_eager_fpu(void)
  */
 static void __init srso_calculations(bool hw_smt_enabled)
 {
-    if ( !(boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+    if ( !x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         return;
 
     /*
@@ -1099,7 +1099,7 @@ static void __init srso_calculations(bool hw_smt_enabled)
  */
 static bool __init has_div_vuln(void)
 {
-    if ( !(boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+    if ( !x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         return false;
 
     if ( boot_cpu_data.family != 0x17 && boot_cpu_data.family != 0x18 )
@@ -1137,7 +1137,7 @@ static void __init ibpb_calculations(void)
         return;
     }
 
-    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON) )
     {
         /*
          * AMD/Hygon CPUs to date (June 2022) don't flush the RAS.  Future
@@ -1222,7 +1222,7 @@ static __init void l1tf_calculations(void)
     l1d_maxphysaddr = paddr_bits;
 
     /* L1TF is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL &&
+    if ( x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_INTEL) &&
          boot_cpu_data.family == 6 )
     {
         switch ( boot_cpu_data.model )
@@ -1358,7 +1358,7 @@ static __init void l1tf_calculations(void)
 static __init void mds_calculations(void)
 {
     /* MDS is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+    if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) ||
          boot_cpu_data.family != 6 )
         return;
 
@@ -1469,7 +1469,7 @@ static __init void mds_calculations(void)
 static void __init rfds_calculations(void)
 {
     /* RFDS is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+    if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) ||
          boot_cpu_data.family != 6 )
         return;
 
@@ -1535,7 +1535,7 @@ static void __init tsa_calculations(void)
     unsigned int curr_rev, min_rev;
 
     /* TSA is only known to affect AMD processors at this time. */
-    if ( boot_cpu_data.vendor != X86_VENDOR_AMD )
+    if ( !x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_AMD) )
         return;
 
     /* If we're virtualised, don't attempt to synthesise anything. */
@@ -1659,7 +1659,7 @@ static void __init gds_calculations(void)
     bool cpu_has_bug_gds, mitigated = false;
 
     /* GDS is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+    if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) ||
          boot_cpu_data.family != 6 )
         return;
 
@@ -1754,7 +1754,7 @@ static void __init gds_calculations(void)
 static bool __init cpu_has_bug_bhi(void)
 {
     /* BHI is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+    if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) ||
          boot_cpu_data.family != 6 )
         return false;
 
@@ -1878,7 +1878,7 @@ static void __init its_calculations(void)
         return;
 
     /* ITS is only known to affect Intel processors at this time. */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL )
+    if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
         return;
 
     /*
@@ -2181,7 +2181,7 @@ void __init init_speculation_mitigations(void)
          * before going idle is less overhead than flushing on PV entry.
          */
         if ( !opt_rsb_pv && hw_smt_enabled &&
-             (boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
+             x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON) &&
              (boot_cpu_data.family == 0x17 || boot_cpu_data.family == 0x18) )
             setup_force_cpu_cap(X86_FEATURE_SC_RSB_IDLE);
     }
-- 
2.43.0


