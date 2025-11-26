Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F4C8B073
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173107.1498195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIdp-0008Gj-7I; Wed, 26 Nov 2025 16:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173107.1498195; Wed, 26 Nov 2025 16:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIdp-0008EL-4B; Wed, 26 Nov 2025 16:45:17 +0000
Received: by outflank-mailman (input) for mailman id 1173107;
 Wed, 26 Nov 2025 16:45:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Gki=6C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOIdn-0008EF-9A
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:45:15 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4767d395-cae7-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 17:45:13 +0100 (CET)
Received: from CH2PR16CA0010.namprd16.prod.outlook.com (2603:10b6:610:50::20)
 by IA0PPFA8EB66EE9.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bde) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 16:45:06 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::8f) by CH2PR16CA0010.outlook.office365.com
 (2603:10b6:610:50::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 16:45:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 16:45:05 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 10:45:03 -0600
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
X-Inumbo-ID: 4767d395-cae7-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCs+89NMtpliXkQz9rlOQmKzFhoDjPi+4JN2KIFfKu+NLEJ5nElkJS4UcG5flEql5wYJORR0KjwlU5Rc+sWoQtxmz6yB2HQ0OEOG/DFyMc03RxncrF2uLOJgMbEpMsUUj501p3IfnIWOewHGTZXE4lqfQll9PswcjzFE1M7O+WXC9Q1l7iW0QFLsMSrtC0A2FJiKi1PATPi3Pp6HVBePDidN6bQCs7DjCxw5A9texI67TAvMklKBnuoWAA3TB5aZULsYoFNdkWsSJSqw/2AtvH7O8kwSE9z2uwIMgt9ZghrvkO0hZP4onsT8NNrv65ADUiFOSCEN8ISGxvyP+ZM4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5D4behCI0RBi4mZ6O/W8pbCZlgQA+Y65FpPmLA7efDA=;
 b=i0Ss9P5fQ66ZP1tOc9KFayTxs0E9OfCMVWrqeLpEtk6UHTmRtjhYvVJAT0OoRWsVTsE/Uk6nvjMbcWue4EJGh5rgdVX4rwsUvK95xWlJ1zYCxnj07cE+5cb715h2TI8yDJlVL4e4VwY2AugeF0wdxLh60d0mO45SKOZvBFa+m4iUx0K9tIw9ZWSJmuPf3gczT+v/8rBt8JVyluZayMfYUWa55CuOCqDlOIbQRWHLzetjHmhqPr8QQUvSw/Aa5xWSuOgcfxgX1pl7YL3ybSDYhARjeYJ4AHgkDJri0BuW30VaZXBye0bYms2zWz1iL1OEKR8ao/PNUZfau507t4E2vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5D4behCI0RBi4mZ6O/W8pbCZlgQA+Y65FpPmLA7efDA=;
 b=BIG1cIvQ7Lhkjf0HMlprbIqFlDanTTd3oOizFacGOyfeTOkSvQ2HHEJ9J0k+9yrdozHlEkpl2e+okAxVbxk1GnZvNd6v5emUNjAyRvLYvQ9QH+tpAVOtRuJiKf2JIRUsPmnLvp9QrHy1OE78lXF/Z6laZ3dccjmVAoGazdBD4qU=
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
Subject: [RFC PATCH 01/11] x86: Add more granularity to the vendors in Kconfig
Date: Wed, 26 Nov 2025 17:44:03 +0100
Message-ID: <20251126164419.174487-2-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|IA0PPFA8EB66EE9:EE_
X-MS-Office365-Filtering-Correlation-Id: 393f7942-5206-425c-862b-08de2d0b2714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rAJvy0iRCW0rSz35vqGneyLTYzYxfd7kBjiWzjA/8b+GRSTHuLdhzlxGIDDI?=
 =?us-ascii?Q?kRc+Ar3BVRS6xwo/f9l5MG3AZYzJagA1e2kQKmdCtBhZv2YT3ZG+yrcuv4qh?=
 =?us-ascii?Q?ZMAXKS4Wxdv0MGClJQa+iawQaSwhyBNDFURC5cBI+K4IpDXKiOlMMyXu2vwD?=
 =?us-ascii?Q?eFFGK7qL6/NhImLnihXdrbMA2OfDSzMJiWiqYU3ls6UcjUG0LGxnxDoN2+k9?=
 =?us-ascii?Q?y46OgXd3HZ6H+o+aPrGdkQrRWytZ7XbPVLoMivjsDa/WbieLmJ9Ick7BadGN?=
 =?us-ascii?Q?njHFb1ZDXFD0sm6SB5pnTC9fVpcbBOaoEiLyrNkD+7JMHhn4blfin8MqAFg7?=
 =?us-ascii?Q?qC6H4QoRlIV2/WRdLufYz6WKw8p88a3gTNgSzlOEh5VNAEGSG5M3+0oRDXVW?=
 =?us-ascii?Q?qWxf+MTVipA1nSYhJqqBRG3IVicZoCrym3Do7TPvPaSqh67fCPUhc5UDcyEa?=
 =?us-ascii?Q?Z4+Okcm3b8BwPo9qskrgFVyMHA8pQRYXsAabHkWaqkgRt+hLzTTy52Mz9MyP?=
 =?us-ascii?Q?MemPwG0MLXPmxr1j+SAjD754hObmnOK1Mh+NI/7r2FWsOy4ltoEdIA575OUq?=
 =?us-ascii?Q?FLNj5rMM9NgKoi0KcLTaI8Pf8+3uX09D+CBzlXHzWSYcIycXS4JB6Nze/AZW?=
 =?us-ascii?Q?wkGQ+dyjDhtqvnmtYtz3izE/5PrcVWZzalB049a4vF9/dciBuwJg8DeV63bt?=
 =?us-ascii?Q?EM6jOPYAQ0Fvisg8yPSYksKgP7ztdQDzvNUoLDcWHslz2B5PVcYgCvqIutXm?=
 =?us-ascii?Q?GWG+SOu8bji5WW6EtZ69aF9X/qJnFhYbaA608RtBCn8dEX2dhY65Oaj2m/Pk?=
 =?us-ascii?Q?+gxvVdg/v9Q+OodI2WpyR9IucnrWVvGUIzRZOmT2v/J7pEQOHGEGIz3lK0X7?=
 =?us-ascii?Q?Kdzn6ZurnKbc7YdLJohfYS/gkd33vhQOUEYaEASI49GGijrFmuAjOBZlTdFA?=
 =?us-ascii?Q?GWofe/UI1EMnQgD1KBUGLxx6kDUhPxiy8Q1PZvgel7In5EkUbWbthXQrQMOd?=
 =?us-ascii?Q?BFapIwB+AqavfgRs23y342vWIl3fE8gP0+5DGsUmK9Xo6/aCY6lXM1KNAcH5?=
 =?us-ascii?Q?lER40XR0/EgN1b26SYP9nM8RgwJllvl3o6/4Q2/zizWvEtvvikGK2yz5FBn2?=
 =?us-ascii?Q?oBMeIA2dSYVjy8yxZUEi5K2jiTMwx4nwV8KomHN8dddkjg+xwNNqKb3F5Egk?=
 =?us-ascii?Q?j9OlUgNWec8YhYo/XR+z6TimHBL+K6a5eoPtk34ljiEGS1yg+Gb9+q2B8mOj?=
 =?us-ascii?Q?zCd2GqugTmnU/2oVjMGtH+2SHpv5NV41Xbh1OmuPVG9DarrxycZwK1yNRXe7?=
 =?us-ascii?Q?4zV1fOaXL6iREG3UxQFy6ts2VGRfK8Jmo0l58ttLCCxVu/mnC17uNceYWqm2?=
 =?us-ascii?Q?bDt3dSYVNvmAZxCFVtEU0pwNULzVD0BSeVcLpX2FCqUYQz14mArEP6de6uN9?=
 =?us-ascii?Q?KDqwiQUHCAM5ApjUFsCiLz0tBNIAWq5Xjn+Y1uiYxFj/KR2hMacsg4I4/sMA?=
 =?us-ascii?Q?fgH2/0W5rroExD53KvVpd43F2B2P+9VRsuQWPdF5+v6/Lk3IUJkZhyJxpaRL?=
 =?us-ascii?Q?MWWzm3zZqanv5iSxlnQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:45:05.6440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 393f7942-5206-425c-862b-08de2d0b2714
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFA8EB66EE9

This enables very aggressive DCE passes on single-vendor builds in later
patches, as it will allow most vendor checks to become statically chosen
branches. A lot of statics go away and a lot more inlining is allowed.

In order to allow x86_vendor_is() to fold into constants, expand Kconfig
to have the full set of vendors. Adds Hygon, Centaur, Shanghai and the
default path.

Have Hygon depend on AMD, and Centaur+Shanghai depend on Intel.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/Kconfig.cpu         | 45 ++++++++++++++++++++++++++++++++
 xen/arch/x86/cpu/common.c        | 17 +++++++-----
 xen/arch/x86/include/asm/cpuid.h |  7 +++++
 3 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
index 5fb18db1aa..aaf70fb37b 100644
--- a/xen/arch/x86/Kconfig.cpu
+++ b/xen/arch/x86/Kconfig.cpu
@@ -19,4 +19,49 @@ config INTEL
 	  May be turned off in builds targetting other vendors.  Otherwise,
 	  must be enabled for Xen to work suitably on Intel platforms.
 
+config HYGON
+	bool "Support Hygon CPUs"
+	depends on AMD
+	default y
+	help
+	  Detection, tunings and quirks for Hygon platforms.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on Hygon platforms.
+
+
+config CENTAUR
+	bool "Support Centaur CPUs"
+	depends on INTEL
+	default y
+	help
+	  Detection, tunings and quirks for Centaur platforms.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on Centaur platforms.
+
+config SHANGHAI
+	bool "Support Shanghai CPUs"
+	depends on INTEL
+	default y
+	help
+	  Detection, tunings and quirks for Shanghai platforms.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on Shanghai platforms.
+
+config UNKNOWN_CPU
+	bool "Support unknown CPUs"
+	default y
+	help
+	  This option prevents a panic on boot when the host CPU vendor isn't
+	  supported by going into a legacy compatibility mode and not applying
+	  any relevant tunings or quirks.
+
+	  Not selecting this options while selecting multiple vendors doesn't have
+	  any major effect on code size, but while selecting a single vendor
+	  it produces a smaller build especially optimised for size.
+
+	  If unsure, say Y.
+
 endmenu
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 37820a3a08..393c30227f 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -118,7 +118,7 @@ static void cf_check default_init(struct cpuinfo_x86 * c)
 	__clear_bit(X86_FEATURE_SEP, c->x86_capability);
 }
 
-static const struct cpu_dev __initconst_cf_clobber __used default_cpu = {
+static const struct cpu_dev __initconst_cf_clobber default_cpu = {
 	.c_init	= default_init,
 };
 static struct cpu_dev __ro_after_init actual_cpu;
@@ -340,7 +340,8 @@ void __init early_cpu_init(bool verbose)
 	*(u32 *)&c->x86_vendor_id[8] = ecx;
 	*(u32 *)&c->x86_vendor_id[4] = edx;
 
-	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
+	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx) &
+	                X86_ENABLED_VENDORS;
 	switch (c->x86_vendor) {
 	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
 				  actual_cpu = intel_cpu_dev;    break;
@@ -349,12 +350,14 @@ void __init early_cpu_init(bool verbose)
 	case X86_VENDOR_SHANGHAI: actual_cpu = shanghai_cpu_dev; break;
 	case X86_VENDOR_HYGON:    actual_cpu = hygon_cpu_dev;    break;
 	default:
+		if (verbose || !IS_ENABLED(CONFIG_UNKNOWN_CPU))
+			printk(XENLOG_ERR
+			       "Unrecognised or unsupported CPU vendor '%.12s'\n",
+			       c->x86_vendor_id);
+		if (!IS_ENABLED(CONFIG_UNKNOWN_CPU))
+			panic("Cannot run in unknown/compiled-out CPU vendor.\n");
+
 		actual_cpu = default_cpu;
-		if (!verbose)
-			break;
-		printk(XENLOG_ERR
-		       "Unrecognised or unsupported CPU vendor '%.12s'\n",
-		       c->x86_vendor_id);
 	}
 
 	cpuid(0x00000001, &eax, &ebx, &ecx, &edx);
diff --git a/xen/arch/x86/include/asm/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
index f1b9e37a42..bf1c635cdd 100644
--- a/xen/arch/x86/include/asm/cpuid.h
+++ b/xen/arch/x86/include/asm/cpuid.h
@@ -49,6 +49,13 @@ struct cpuid_leaf;
 void guest_cpuid(const struct vcpu *v, uint32_t leaf,
                  uint32_t subleaf, struct cpuid_leaf *res);
 
+#define X86_ENABLED_VENDORS \
+    ((IS_ENABLED(CONFIG_INTEL)    ? X86_VENDOR_INTEL    : 0) | \
+     (IS_ENABLED(CONFIG_AMD)      ? X86_VENDOR_AMD      : 0) | \
+     (IS_ENABLED(CONFIG_CENTAUR)  ? X86_VENDOR_CENTAUR  : 0) | \
+     (IS_ENABLED(CONFIG_SHANGHAI) ? X86_VENDOR_SHANGHAI : 0) | \
+     (IS_ENABLED(CONFIG_HYGON)    ? X86_VENDOR_HYGON    : 0))
+
 #endif /* !__X86_CPUID_H__ */
 
 /*
-- 
2.43.0


