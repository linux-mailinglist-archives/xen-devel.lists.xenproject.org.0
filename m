Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1A3C8B124
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:53:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173211.1498305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIkw-00071i-Bv; Wed, 26 Nov 2025 16:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173211.1498305; Wed, 26 Nov 2025 16:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIkw-0006yz-98; Wed, 26 Nov 2025 16:52:38 +0000
Received: by outflank-mailman (input) for mailman id 1173211;
 Wed, 26 Nov 2025 16:52:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Gki=6C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOIe8-0008EF-VK
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:45:37 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5307346a-cae7-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 17:45:36 +0100 (CET)
Received: from PH7PR17CA0056.namprd17.prod.outlook.com (2603:10b6:510:325::17)
 by CH3PR12MB9251.namprd12.prod.outlook.com (2603:10b6:610:1bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 16:45:20 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:325:cafe::fe) by PH7PR17CA0056.outlook.office365.com
 (2603:10b6:510:325::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 16:45:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.0 via Frontend Transport; Wed, 26 Nov 2025 16:45:19 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 10:45:17 -0600
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
X-Inumbo-ID: 5307346a-cae7-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QH0nRp7x0tkXOaG4YIbQAuLKlhgdJSJL0tZs+wZS92ZoEZZKsV/OlSBtLDQ1KUo96tN2dijqlm/m+grS8ghxxPXO6TxoAqi0Zt30PrS+pDLLGah3mIwECq1c9U3sJZ8M5x/YJSntiOuoGVB5dbs3+zq28wJDCneiEMVDk0qSz29X1YPt+84mLX4erL27mIC1rVRIpUA/WOG4by4wD+IzMNwMr4+1030G/kI879BsjOth1Bf73J7dxJQoUsJ/tFsr2wQHxkgG+jt+NL3Qr8pxMROAYqk+K6I+/3UX5sy2QY3LoisbGgNBG00zfteprqpTjdICCpu1GvCTef5/RmyWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dih/F3i2K7dVVPcAf50v/7NsMvofJgId44IrV1nu46w=;
 b=r3bUUnXJBDTB/dBO4ZPsYKFdlWBlZ9WrVDL9+7FitP6hbDqAqa4Tg4M/4ct0bWQRSYjP/CZRy9utLGVUn+TMTfNoxAvab9ofeekjtgeAi++7lEuc9D6CHqRW9FoNG2B2YhLl86/B3xR4nCYyWi2GNADk09/0cyQWzGT1SAy6gvZ4iaP7IhmENKGNVSnmMkQgcqX8SQIA37oA0xJMf5VJCyZ179zhLF+mCPBV4HcXEJ4l+ADsvmkEDACpBueghxnAiAq69A2cFKQ8wyBNKKXWkziK2JqIk9/3lKwuV0Hr+St5qFHBteMJgP3vVatecMls0ylHvrYrfOxAfn7dE/8luw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dih/F3i2K7dVVPcAf50v/7NsMvofJgId44IrV1nu46w=;
 b=ZUdOhGACDhWtlU/zTY2Lbk0BkDgM06yG7yQCdTnOIZgDMBKxa+/N67HYBhw+iar5h+SwZkv14Br56K3Hv/7Y+iLLPti919vbm5iMggILzXB4QIDVhhq+0j0YZDLvYi96kSlAem98SsLp/ElqqEa+4NNwOgLReCqgCRImTO77kNk=
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
Subject: [RFC PATCH 10/11] x86: Migrate everything under cpu/ to use x86_vendor_is()
Date: Wed, 26 Nov 2025 17:44:12 +0100
Message-ID: <20251126164419.174487-11-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|CH3PR12MB9251:EE_
X-MS-Office365-Filtering-Correlation-Id: bcaa873f-e36b-4872-9370-08de2d0b2f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NnY4YDNtJCBPfjJQC1RW4dEz+HxeUXf4O8ROM7xabn8CBDCOngVtAT2dDLxd?=
 =?us-ascii?Q?Whv4HLWuvhYQ2Y5y8IJEZco2LBlE2yqB5gcrhs9FNfrDRuQBpdeqqYst01SO?=
 =?us-ascii?Q?KuytUWTmccZRxrN3JkItfEQhJURk3WvQd5nSgmBciEjlbdgwze/m34bCfXTq?=
 =?us-ascii?Q?SLF0LEYnOJuxndO3SWeefiSKA7A2RHB72+AJyXpNsjCrWJOGHtWtl+wTkp9h?=
 =?us-ascii?Q?Q6tdx40rMaWdbT2z/DE73Ph0yO/sNOHCSAzpVJGTncmjjDzcje3vL4Lb9OWO?=
 =?us-ascii?Q?1SL2HhzKLTP8ijURK082qT9Yw9ajVRfe6avPXrjV9CTqJ/dKKm7WHNFXZNim?=
 =?us-ascii?Q?0z3vA8mmR0w1PItgthYOIPxUXJBpR+/CImGHMXkl/kPHeCQn1r/dp5VFPHxs?=
 =?us-ascii?Q?CmVPc4yktYShvL0S5IiUyHGA09KR5zMyxGMR/VhTeOg2KphmSy/QDZa1ib0P?=
 =?us-ascii?Q?lWegjT1c3PGaCbSuwe/SOUiQls/g5J4xTeHxX2PxMBi2sBBch8WEAfhK0HCd?=
 =?us-ascii?Q?gTxdAWxXpZsNhaHWPNOABqQhogo4HXytHyfG3LEIvdNel7I316cNHT22oZ3J?=
 =?us-ascii?Q?rA12+Vng8bb+g6gkHMSTRPyHjGAFM1O8bdd0vkgDpTljJg0d1Wm80c1uJ4Zl?=
 =?us-ascii?Q?KCzSKalY0/s4vyWQQiysv/ar74BrvRgmZ/IzxaUCHjjs1HYsyZNZH6jaCBb6?=
 =?us-ascii?Q?eJ9eWFrlQdtmp6UI76TnbHhZ7Q3rwTCf7oTor2aExKP425XwYojJwIpuj0Ks?=
 =?us-ascii?Q?pxMK/SauW/JNlmCTROy/TObz+t7sWakttk7xXWqOSAeYSI7UZxcMIIMpgFzc?=
 =?us-ascii?Q?wuT0sGB3A5nVaNGtDJRVvb8HxwV+iNr/RGvEButzA2QX+fCSStDu4G8HRU5M?=
 =?us-ascii?Q?WRYkYZzY8w4qgtMfx89mXypjccBQDpdzxLMqMJNN+75rZCy0kEL/nVhQpXMy?=
 =?us-ascii?Q?bI/Ig5Qr5jfxyyP5UiOK8RQu18FPA5ZLGkUixlsih6Sge6Mswj+uXqB1tAiF?=
 =?us-ascii?Q?znOAqgp0XO4pID3WpjgGZ9h4F1kFvHi4WKlq4v7R66JWMRPQxC4/zqJ7BjFA?=
 =?us-ascii?Q?PN0ynHvCfynytrQS0Pnt98rg2kjYxPis4uUoLIxA15K9Wwp93hfiq1x6b6m+?=
 =?us-ascii?Q?xIXnf4HQOX+eDUYWNPMz83/UsKrzvRm19FhnVuVAedCJDrvRBEmrdKCvW5nx?=
 =?us-ascii?Q?WNCmNm67KO1wVQZMJ4A455H26iRABEuoiTgVJojhM8IyAQUUxEsYdCJpoGfZ?=
 =?us-ascii?Q?V4OoFx6OKZew9ou9AtduSpN9uzZWTv81zRUo9eRk8kOj8qpOVhUJ84HSi70v?=
 =?us-ascii?Q?uOMJHnMCzYeF6n83NNk8pW8yQm4TJYOKJXrpDezK2OOCqYoeAiZaqfJfgeOe?=
 =?us-ascii?Q?B6t22H3pBYY286POxZRrTcZZSGHkesjOgynJySMT1r64ezoeHPIMVFa9lgee?=
 =?us-ascii?Q?JMki/oTYEdJK7H8yPNf0V7+dXi/cLdGfQ1u3AYSR/9pyObx1eYpKMY4xJh6j?=
 =?us-ascii?Q?gIjE6hEtorPru4OV3sfaJBBwXq9EHAFXdJ0HcnLPBPOXrJgsmM9nbAxLP1TH?=
 =?us-ascii?Q?v6z98f6vhQxheK/M3Zw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:45:19.6368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcaa873f-e36b-4872-9370-08de2d0b2f7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9251

There's nothing special about this folder, but it doing it ahead alleviates the
size of the following patch.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/amd.c                 |  6 +++---
 xen/arch/x86/cpu/common.c              |  2 +-
 xen/arch/x86/cpu/intel_cacheinfo.c     |  5 ++---
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c |  2 +-
 xen/arch/x86/cpu/mcheck/mcaction.c     |  3 ++-
 xen/arch/x86/cpu/mcheck/mce.c          | 14 +++++++-------
 xen/arch/x86/cpu/mcheck/mce_amd.c      |  6 +++---
 xen/arch/x86/cpu/mcheck/mce_intel.c    |  6 +++---
 xen/arch/x86/cpu/mcheck/vmce.c         |  4 ++--
 xen/arch/x86/cpu/microcode/amd.c       |  2 +-
 xen/arch/x86/cpu/microcode/core.c      |  2 +-
 xen/arch/x86/cpu/mtrr/generic.c        |  4 ++--
 xen/arch/x86/cpu/mwait-idle.c          |  4 ++--
 13 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 9b02e1ba67..1205253e13 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -428,7 +428,7 @@ int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)
 	u32 range;
 	u32 ms;
 	
-	if (cpu->x86_vendor != X86_VENDOR_AMD)
+	if (!x86_vendor_is(cpu->x86_vendor, X86_VENDOR_AMD))
 		return 0;
 
 	if (osvw_id >= 0 && cpu_has(cpu, X86_FEATURE_OSVW)) {
@@ -519,8 +519,8 @@ static void check_syscfg_dram_mod_en(void)
 {
 	uint64_t syscfg;
 
-	if (!((boot_cpu_data.x86_vendor == X86_VENDOR_AMD) &&
-		(boot_cpu_data.x86 >= 0x0f)))
+	if (!(x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD) &&
+		    (boot_cpu_data.x86 >= 0x0f)))
 		return;
 
 	rdmsrl(MSR_K8_SYSCFG, syscfg);
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index c0c3606dd2..df81ef9136 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -463,7 +463,7 @@ void __init early_cpu_init(bool verbose)
 		paddr_bits -= (ebx >> 6) & 0x3f;
 	}
 
-	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
+	if (!x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON))
 		park_offline_cpus = opt_mce;
 
 	initialize_cpu_data(0);
diff --git a/xen/arch/x86/cpu/intel_cacheinfo.c b/xen/arch/x86/cpu/intel_cacheinfo.c
index e88faa7545..7dc778cd55 100644
--- a/xen/arch/x86/cpu/intel_cacheinfo.c
+++ b/xen/arch/x86/cpu/intel_cacheinfo.c
@@ -168,9 +168,8 @@ void init_intel_cacheinfo(struct cpuinfo_x86 *c)
 	 * Don't use cpuid2 if cpuid4 is supported. For P4, we use cpuid2 for
 	 * trace cache
 	 */
-	if ((num_cache_leaves == 0 || c->x86 == 15) && c->cpuid_level > 1 &&
-	    c->x86_vendor != X86_VENDOR_SHANGHAI)
-	{
+	if (((num_cache_leaves == 0 || c->x86 == 15) && c->cpuid_level > 1) &&
+	    !x86_vendor_is(c->x86_vendor, X86_VENDOR_SHANGHAI)) {
 		/* supports eax=2  call */
 		unsigned int i, j, n, regs[4];
 		unsigned char *dp = (unsigned char *)regs;
diff --git a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
index 7d48c9ab5f..c2c829a397 100644
--- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
+++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
@@ -191,7 +191,7 @@ static void cf_check mce_amd_work_fn(void *data)
 
 void __init amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c)
 {
-	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
+	if (!x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON))
 		return;
 
 	/* Assume we are on K8 or newer AMD or Hygon CPU here */
diff --git a/xen/arch/x86/cpu/mcheck/mcaction.c b/xen/arch/x86/cpu/mcheck/mcaction.c
index bf7a0de965..a43e3240c3 100644
--- a/xen/arch/x86/cpu/mcheck/mcaction.c
+++ b/xen/arch/x86/cpu/mcheck/mcaction.c
@@ -101,7 +101,8 @@ mc_memerr_dhandler(struct mca_binfo *binfo,
                       * not always precise. In that case, fallback to broadcast.
                       */
                      global->mc_domid != bank->mc_domid ||
-                     (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+                     (x86_vendor_is(boot_cpu_data.x86_vendor,
+                                    X86_VENDOR_INTEL) &&
                       (!(global->mc_gstatus & MCG_STATUS_LMCE) ||
                        !(d->vcpu[mc_vcpuid]->arch.vmce.mcg_ext_ctl &
                          MCG_EXT_CTL_LMCE_EN))) )
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 9bef1da385..40c8c10df9 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -333,8 +333,7 @@ mcheck_mca_logout(enum mca_source who, struct mca_banks *bankmask,
                 ASSERT(mig);
                 mca_init_global(mc_flags, mig);
                 /* A hook here to get global extended msrs */
-                if ( IS_ENABLED(CONFIG_INTEL) &&
-                     boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+                if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
                     intel_get_extended_msrs(mig, mci);
             }
         }
@@ -564,8 +563,8 @@ bool mce_available(const struct cpuinfo_x86 *c)
  */
 unsigned int mce_firstbank(struct cpuinfo_x86 *c)
 {
-    return c->x86 == 6 &&
-           c->x86_vendor == X86_VENDOR_INTEL && c->x86_model < 0x1a;
+    return x86_vendor_is(c->x86_vendor, X86_VENDOR_INTEL) &&
+           c->x86 == 6 && c->x86_model < 0x1a;
 }
 
 static int show_mca_info(int inited, struct cpuinfo_x86 *c)
@@ -1107,7 +1106,7 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
 
         if ( IS_MCA_BANKREG(reg, mci->mcinj_cpunr) )
         {
-            if ( c->x86_vendor == X86_VENDOR_AMD )
+            if ( x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD) )
             {
                 /*
                  * On AMD we can set MCi_STATUS_WREN in the
@@ -1142,7 +1141,7 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
             case MSR_F10_MC4_MISC1:
             case MSR_F10_MC4_MISC2:
             case MSR_F10_MC4_MISC3:
-                if ( c->x86_vendor != X86_VENDOR_AMD )
+                if ( !x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD) )
                     reason = "only supported on AMD";
                 else if ( c->x86 < 0x10 )
                     reason = "only supported on AMD Fam10h+";
@@ -1150,7 +1149,8 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
 
             /* MSRs that the HV will take care of */
             case MSR_K8_HWCR:
-                if ( c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+                if ( x86_vendor_is(c->x86_vendor,
+                                   X86_VENDOR_AMD | X86_VENDOR_HYGON) )
                     reason = "HV will operate HWCR";
                 else
                     reason = "only supported on AMD or Hygon";
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index 25c29eb3d2..e664bf0443 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -160,7 +160,7 @@ mcequirk_lookup_amd_quirkdata(const struct cpuinfo_x86 *c)
 {
     unsigned int i;
 
-    BUG_ON(c->x86_vendor != X86_VENDOR_AMD);
+    BUG_ON(!x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD));
 
     for ( i = 0; i < ARRAY_SIZE(mce_amd_quirks); i++ )
     {
@@ -291,7 +291,7 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
     uint32_t i;
     enum mcequirk_amd_flags quirkflag = 0;
 
-    if ( c->x86_vendor != X86_VENDOR_HYGON )
+    if ( !x86_vendor_is(c->x86_vendor, X86_VENDOR_HYGON) )
         quirkflag = mcequirk_lookup_amd_quirkdata(c);
 
     /* Assume that machine check support is available.
@@ -337,6 +337,6 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
             ppin_msr = MSR_AMD_PPIN;
     }
 
-    return c->x86_vendor == X86_VENDOR_HYGON ?
+    return x86_vendor_is(c->x86_vendor, X86_VENDOR_HYGON) ?
             mcheck_hygon : mcheck_amd_famXX;
 }
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 839a0e5ba9..9f3ae4277b 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -711,8 +711,8 @@ static bool mce_is_broadcast(struct cpuinfo_x86 *c)
      * DisplayFamily_DisplayModel encoding of 06H_EH and above,
      * a MCA signal is broadcast to all logical processors in the system
      */
-    if ( c->x86_vendor == X86_VENDOR_INTEL && c->x86 == 6 &&
-         c->x86_model >= 0xe )
+    if ( x86_vendor_is(c->x86_vendor, X86_VENDOR_INTEL) &&
+         c->x86 == 6 && c->x86_model >= 0xe )
         return true;
     return false;
 }
@@ -1036,7 +1036,7 @@ int vmce_intel_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
         return 1;
     }
 
-    if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
+    if ( !x86_vendor_is(cp->x86_vendor, X86_VENDOR_INTEL) )
         return 0;
 
     if ( bank < GUEST_MC_BANK_NUM )
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index dd1ccecfe5..7f0c413412 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -45,7 +45,7 @@ void vmce_init_vcpu(struct vcpu *v)
     int i;
 
     /* global MCA MSRs init */
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
         v->arch.vmce.mcg_cap = INTEL_GUEST_MCG_CAP;
     else
         v->arch.vmce.mcg_cap = AMD_GUEST_MCG_CAP;
@@ -63,7 +63,7 @@ int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt)
 {
     unsigned long guest_mcg_cap;
 
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
         guest_mcg_cap = INTEL_GUEST_MCG_CAP | MCG_LMCE_P;
     else
         guest_mcg_cap = AMD_GUEST_MCG_CAP;
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 4a7573c885..da5573445e 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -616,7 +616,7 @@ void __init amd_check_entrysign(void)
     unsigned int curr_rev;
     uint8_t fixed_rev;
 
-    if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
+    if ( !x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_AMD) ||
          boot_cpu_data.family < 0x17 ||
          boot_cpu_data.family > 0x1a )
         return;
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index fe47c3a6c1..e931bca95e 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -199,7 +199,7 @@ static struct microcode_patch *parse_blob(const char *buf, size_t len)
 /* Returns true if ucode should be loaded on a given cpu */
 static bool is_cpu_primary(unsigned int cpu)
 {
-    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         /* Load ucode on every logical thread/core */
         return true;
 
diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index c587e9140e..88cf6a5e8e 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -218,9 +218,9 @@ static void __init print_mtrr_state(const char *level)
 			printk("%s  %u disabled\n", level, i);
 	}
 
-	if ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
+	if ((x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD) &&
 	     boot_cpu_data.x86 >= 0xf) ||
-	     boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
+	    x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_HYGON)) {
 		uint64_t syscfg, tom2;
 
 		rdmsrl(MSR_K8_SYSCFG, syscfg);
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index f47fdfb569..c284375b24 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1598,7 +1598,7 @@ static int __init mwait_idle_probe(void)
 	const struct x86_cpu_id *id;
 	const char *str;
 
-	if (boot_cpu_data.vendor != X86_VENDOR_INTEL)
+	if (!x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_INTEL))
 		return -ENODEV;
 
 	id = x86_match_cpu(intel_idle_ids);
@@ -1816,7 +1816,7 @@ bool __init mwait_pc10_supported(void)
 {
 	unsigned int ecx, edx, dummy;
 
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+	if (!x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) ||
 	    !cpu_has_monitor ||
 	    boot_cpu_data.cpuid_level < CPUID_MWAIT_LEAF)
 		return false;
-- 
2.43.0


