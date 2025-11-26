Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6026C8B070
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173112.1498245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIdx-00015r-AT; Wed, 26 Nov 2025 16:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173112.1498245; Wed, 26 Nov 2025 16:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIdx-00013F-74; Wed, 26 Nov 2025 16:45:25 +0000
Received: by outflank-mailman (input) for mailman id 1173112;
 Wed, 26 Nov 2025 16:45:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Gki=6C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOIdv-0008EF-R3
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:45:23 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cf3d2b6-cae7-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 17:45:22 +0100 (CET)
Received: from CH2PR12CA0002.namprd12.prod.outlook.com (2603:10b6:610:57::12)
 by CYXPR12MB9278.namprd12.prod.outlook.com (2603:10b6:930:e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 16:45:13 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::ee) by CH2PR12CA0002.outlook.office365.com
 (2603:10b6:610:57::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 16:45:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 16:45:12 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 10:45:11 -0600
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
X-Inumbo-ID: 4cf3d2b6-cae7-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUvSmG+hgrxY6pO4Bjy7W95GqfPbYqoy4iRou7H+GzQeKdg/VKtncY78nccMaePh8bXecDwi6t/I+mwBYTXz0F3GLHyB126xKcoSPCQFcc2szutz8G8byP4wnbZdIZQFDnmC4CXwogKPk0FK9xs6A26uVnH5ze/JAKPCPiUmT43pyJ6/wGGoxlApHw0QSGkZHGJtSugt3taynKnMv70uDspd5Lk+grmjohsSPttqpsVJus/L7aXTtPM3B2wxPS667ZmJDw4CVBM+mEELeKPpY8hX/K7VL3ucvez/NugT4M3RFqopvO5ZM3sPlG/d2rnDGvjSpVWN3CffAF4LLrpzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfGhzxonqLYTnhgkDtyBekIRlBmOPrOZSX3pn969wP8=;
 b=EBUUw0oYLm+mkm2JbYYQ/ocxFUXBLLbolsSvF58+JcBZzmDhBh1g622FvLbxC1XztKLEKyUvQkxoIb7MZtRrsWJk+50y0rfnuu9WY6gWdEtXU+2imwKJTc5KDev3zYX45dS1jtNeAr7o3dTWP7drU5wdbPsWZuBXjVga+ezz7IMsWuomTLBs299wlZPtDhnMYC3PJkhV2TzpDAT3EDg5eT63IilFVLvTTRqPrdgNwdd/6PYRsQrKRqBgwKMZ6GJfMMwUyDPPNfTKh6hWGL8bqdiDf0cPkK3qlIBTRyXI1xHI5FIRLYe1UpPgG0hZ0AfRWqu1KNjh76FEYw3wQf/yDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfGhzxonqLYTnhgkDtyBekIRlBmOPrOZSX3pn969wP8=;
 b=AHuqs1WZqFRPNYJawaeWGUX5FMKhfZ61Hi/c67IBjyKKLlEodaizoAQaoS/KFPqA5al0ITUrq/vnPs8HSKpPZcqCzyAxpnr+C2cRy/zp6Wj7UTyxXeQMTUXmypFKRZdGU7jRsNUdq1/NkBVDsDMG971YVNZ5ITZP9EzOZIZT17w=
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
Subject: [RFC PATCH 06/11] x86: Migrate switch-based vendor checks to x86_vendor_is()
Date: Wed, 26 Nov 2025 17:44:08 +0100
Message-ID: <20251126164419.174487-7-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|CYXPR12MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1e46f8-292f-4797-88ac-08de2d0b2b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eqvQ8shYFAO+CvisXZi7DyFgijbpjl9/fGcYddfyEizYnfmsrc2KTE/ywYGo?=
 =?us-ascii?Q?kKst8sljoqzwEEzonPJ8BaG7j1IPIlq0qKVswU0ixF902/9z3T/qCFztXUst?=
 =?us-ascii?Q?J4Q/OyLGwqvqsDxUSolmynVTVEbRu9P44V6ojsii1eecxQsphrStTy+e6Nvc?=
 =?us-ascii?Q?LmEBcSSre1Pwf9ti2uJRuQGwplllcqs22+55tp4ZFksc3op6T+XiJjLanq2x?=
 =?us-ascii?Q?zxALje+gsGOqh/2mMCCi5Y3uhmIdRPFnJBi5tkPg5B6Y5d3+PgQW9sHXeLzz?=
 =?us-ascii?Q?vc3DYdtZXHJYpqFfaCg/A8YYjCAsppvM8vn7Rc23cHS03GwH+4rd30BKLcin?=
 =?us-ascii?Q?t+Lp0UFGThZBbQ4Ec7sXBzls7dePASel3eh3ZEEqPl9QBTCtUUa3wl/0259/?=
 =?us-ascii?Q?ZUcVr3FP03/e7LuTXB3NsBG1kctdCYBGurcekh4AR3Qp0dkA2LQa+O93Y2G9?=
 =?us-ascii?Q?FZirYp0rP0zLxK7UEwxATOUea2m5ldvHt+z+VqMC6qHpeM4Kvdnfxw+/5aVm?=
 =?us-ascii?Q?g6C/+SHWxM1TtP5YCkSK3cmIIcZvWbI4SyYGLdq6CRBsVX1nIhxbeyQGG+UD?=
 =?us-ascii?Q?61nQ1VWN+5m6BBNB8mZth8zeNnekiVucZiXFI1Mh1KzRYnxAINrVFHanLpN7?=
 =?us-ascii?Q?OWDY9qr0kEP5P94rvTR+J/dEEmjI2bvWj2FPUGGAQBnQKuTZFiSX5nkisu+l?=
 =?us-ascii?Q?CMLeXSpIXGmigD8E16+0w6RCO+SgoKtZf1O3prfw2cnppl3b4AG1wPflrmk0?=
 =?us-ascii?Q?ZMOyhwD0/x/PtUThI1GXFXzqL901IbaZIV8v0K3oxZITnrDEl5SmMJSTgZ0K?=
 =?us-ascii?Q?rfyTnZlze4KFM1D0MA4jEOAcpZEk/gXmcg0dRPP1s2SUTQsfWM4KkdyDOPLV?=
 =?us-ascii?Q?EEFoK7rn1e1fn6LMSgfJr9oLYPOUacv6FKFgHibHb0sfB17r7jxb4tVgZPZE?=
 =?us-ascii?Q?Q2KRYbPGyyN4H5aE6DbviEVvRJSj1+PYjB4ehhhFsl3Ht1NDnuK3kQ6HdXAT?=
 =?us-ascii?Q?dYI8NTVmJDAjQ/wU9rduCDQ9IZfFgNrNSEp3dPU1sH+JDEFraOtA5C2v0eoj?=
 =?us-ascii?Q?0ReppGXdLKKhg6vfHWMd86LDi3RPo/zqbgdPTpoSNk/ObA6BqC+WWlCbmCJH?=
 =?us-ascii?Q?S/thElED4WIpQ86k7S6i2qk+wz95O+Abig66GJWo37qQqQwv4EcEFbBAiapa?=
 =?us-ascii?Q?4n2VwCaQ/4HYuonkFHse0aAFUVQyAysgnpjk2YFdZnA7pDPAxL7/S2BFzZ7q?=
 =?us-ascii?Q?qYBbQjwSK+PEcP8Z3NyOjepek0kdn0GnaTfq/1Ukc1k8AFjlSQJy9NSL3E4L?=
 =?us-ascii?Q?gvI+LNLYQk7Ideg4l4ibtvpJpLeb3q4T0Vtb5ti0m0PAmx8MBkZ/GY928uXT?=
 =?us-ascii?Q?bHjbmnD9pWqS1964nBq63k75pKWLyxnLAeF4ViI4AJoQNKLYKNAVzKwXzp+j?=
 =?us-ascii?Q?+3ErnXbrz8CE9+Ez9Zb3leELDXK4J50RgaM0izjnAD/wo2c6Naj/humtZsUd?=
 =?us-ascii?Q?1dDKPyazfl29UYW9RUD/QN8INBZg48jCQ45S1NrNPJkfo919nKoB9dB/a8NB?=
 =?us-ascii?Q?uxCCL6jYnVTewnL3kSY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:45:12.8663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1e46f8-292f-4797-88ac-08de2d0b2b62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9278

This enables each branch to be optimised-out when the vendor isn't
enabled in Kconfig and combines N checks into 1 for the strict fallthrough
cases.

Plus, the diffstat looks fantastic and we save tons of vertical space.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 28 ++++++------------
 xen/arch/x86/alternative.c          | 30 ++++++++-----------
 xen/arch/x86/cpu-policy.c           | 31 ++++++++-----------
 xen/arch/x86/cpu/mcheck/mce.c       | 27 +++--------------
 xen/arch/x86/cpu/mcheck/mce.h       | 20 ++++++-------
 xen/arch/x86/cpu/mcheck/non-fatal.c | 20 ++++---------
 xen/arch/x86/cpu/mcheck/vmce.c      | 46 +++++++----------------------
 xen/arch/x86/domain.c               | 12 ++++----
 xen/arch/x86/guest/xen/xen.c        | 19 +++++-------
 xen/arch/x86/nmi.c                  | 18 ++++-------
 xen/arch/x86/traps-setup.c          | 18 +++++------
 11 files changed, 87 insertions(+), 182 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 94e8e11c15..89e2b3d167 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -135,20 +135,17 @@ static int __init cf_check cpufreq_driver_init(void)
 
         ret = -ENOENT;
 
-        switch ( boot_cpu_data.x86_vendor )
+        if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
         {
-        case X86_VENDOR_INTEL:
             for ( i = 0; i < cpufreq_xen_cnt; i++ )
             {
                 switch ( cpufreq_xen_opts[i] )
                 {
                 case CPUFREQ_xen:
-                    ret = IS_ENABLED(CONFIG_INTEL) ?
-                          acpi_cpufreq_register() : -ENODEV;
+                    ret = acpi_cpufreq_register();
                     break;
                 case CPUFREQ_hwp:
-                    ret = IS_ENABLED(CONFIG_INTEL) ?
-                          hwp_register_driver() : -ENODEV;
+                    ret = hwp_register_driver();
                     break;
                 case CPUFREQ_none:
                     ret = 0;
@@ -163,11 +160,10 @@ static int __init cf_check cpufreq_driver_init(void)
                 if ( !ret || ret == -EBUSY )
                     break;
             }
-            break;
-
-        case X86_VENDOR_AMD:
-        case X86_VENDOR_HYGON:
-#ifdef CONFIG_AMD
+        }
+        else if ( x86_vendor_is(boot_cpu_data.x86_vendor,
+                                X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+        {
             for ( i = 0; i < cpufreq_xen_cnt; i++ )
             {
                 switch ( cpufreq_xen_opts[i] )
@@ -193,15 +189,9 @@ static int __init cf_check cpufreq_driver_init(void)
                 if ( !ret || ret == -EBUSY )
                     break;
             }
-#else
-            ret = -ENODEV;
-#endif /* CONFIG_AMD */
-            break;
-
-        default:
-            printk(XENLOG_ERR "Cpufreq: unsupported x86 vendor\n");
-            break;
         }
+        else
+            printk(XENLOG_ERR "Cpufreq: unsupported x86 vendor\n");
 
         /*
          * After successful cpufreq driver registeration, XEN_PROCESSOR_PM_CPPC
diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 9f844241bc..071871c242 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -89,32 +89,28 @@ static bool init_or_livepatch_read_mostly toolchain_nops_are_ideal;
 
 static void __init arch_init_ideal_nops(void)
 {
-    switch ( boot_cpu_data.x86_vendor )
+    if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
     {
-    case X86_VENDOR_INTEL:
         /*
          * Due to a decoder implementation quirk, some specific Intel CPUs
          * actually perform better with the "k8_nops" than with the SDM-
          * recommended NOPs.
          */
-        if ( boot_cpu_data.x86 != 6 )
-            break;
-
-        switch ( boot_cpu_data.x86_model )
+        if ( boot_cpu_data.x86 == 6 )
         {
-        case 0x0f ... 0x1b:
-        case 0x1d ... 0x25:
-        case 0x28 ... 0x2f:
-            ideal_nops = k8_nops;
-            break;
+            switch ( boot_cpu_data.x86_model )
+            {
+            case 0x0f ... 0x1b:
+            case 0x1d ... 0x25:
+            case 0x28 ... 0x2f:
+                ideal_nops = k8_nops;
+                break;
+            }
         }
-        break;
-
-    case X86_VENDOR_AMD:
-        if ( boot_cpu_data.x86 <= 0xf )
-            ideal_nops = k8_nops;
-        break;
     }
+    else if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD) &&
+              (boot_cpu_data.x86 <= 0xf) )
+        ideal_nops = k8_nops;
 
 #ifdef HAVE_AS_NOPS_DIRECTIVE
     if ( memcmp(ideal_nops[ASM_NOP_MAX], toolchain_nops, ASM_NOP_MAX) == 0 )
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 0a7ef15f72..1acd7c5124 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -279,9 +279,8 @@ static void recalculate_misc(struct cpu_policy *p)
 
     p->extd.raw[0x8].d = 0;
 
-    switch ( p->x86_vendor )
+    if ( x86_vendor_is(p->x86_vendor, X86_VENDOR_INTEL) )
     {
-    case X86_VENDOR_INTEL:
         p->basic.l2_nr_queries = 1; /* Fixed to 1 query. */
         p->basic.raw[0x3] = EMPTY_LEAF; /* PSN - always hidden. */
         p->basic.raw[0x9] = EMPTY_LEAF; /* DCA - always hidden. */
@@ -297,10 +296,9 @@ static void recalculate_misc(struct cpu_policy *p)
 
         p->extd.raw[0x8].a &= 0x0000ffff;
         p->extd.raw[0x8].c = 0;
-        break;
-
-    case X86_VENDOR_AMD:
-    case X86_VENDOR_HYGON:
+    }
+    else if ( x86_vendor_is(p->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    {
         zero_leaves(p->basic.raw, 0x2, 0x3);
         memset(p->cache.raw, 0, sizeof(p->cache.raw));
         zero_leaves(p->basic.raw, 0x9, 0xa);
@@ -331,7 +329,6 @@ static void recalculate_misc(struct cpu_policy *p)
         p->extd.raw[0x20] = EMPTY_LEAF; /* Platform QoS */
         p->extd.raw[0x21].b = 0;
         p->extd.raw[0x21].d = 0;
-        break;
     }
 }
 
@@ -416,9 +413,8 @@ static void __init guest_common_default_leaves(struct cpu_policy *p)
 
 static void __init guest_common_max_feature_adjustments(uint32_t *fs)
 {
-    switch ( boot_cpu_data.vendor )
+    if ( x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_INTEL) )
     {
-    case X86_VENDOR_INTEL:
         /*
          * MSR_ARCH_CAPS is just feature data, and we can offer it to guests
          * unconditionally, although limit it to Intel systems as it is highly
@@ -477,9 +473,9 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
          */
         if ( test_bit(X86_FEATURE_RTM, fs) )
             __set_bit(X86_FEATURE_RTM_ALWAYS_ABORT, fs);
-        break;
-
-    case X86_VENDOR_AMD:
+    }
+    else if ( x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_AMD) )
+    {
         /*
          * This bit indicates that the VERW instruction may have gained
          * scrubbing side effects.  With pooling, it means "you might migrate
@@ -488,7 +484,6 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
          * has been around since the 286.
          */
         __set_bit(X86_FEATURE_VERW_CLEAR, fs);
-        break;
     }
 
     /*
@@ -510,9 +505,8 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
 
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
 {
-    switch ( boot_cpu_data.vendor )
+    if ( x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_INTEL) )
     {
-    case X86_VENDOR_INTEL:
         /*
          * IvyBridge client parts suffer from leakage of RDRAND data due to SRBDS
          * (XSA-320 / CVE-2020-0543), and won't be receiving microcode to
@@ -570,9 +564,9 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
             __clear_bit(X86_FEATURE_RTM, fs);
             __set_bit(X86_FEATURE_RTM_ALWAYS_ABORT, fs);
         }
-        break;
-
-    case X86_VENDOR_AMD:
+    }
+    else if ( x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_AMD) )
+    {
         /*
          * This bit indicate that the VERW instruction may have gained
          * scrubbing side effects.  The max policy has it set for migration
@@ -581,7 +575,6 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
          */
         if ( !cpu_has_verw_clear )
             __clear_bit(X86_FEATURE_VERW_CLEAR, fs);
-        break;
     }
 
     /*
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 9277781bff..9bef1da385 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -766,30 +766,11 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
     else if ( cpu_bank_alloc(cpu) )
         panic("Insufficient memory for MCE bank allocations\n");
 
-    switch ( c->x86_vendor )
-    {
-#ifdef CONFIG_AMD
-    case X86_VENDOR_AMD:
-    case X86_VENDOR_HYGON:
+    if ( x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         inited = amd_mcheck_init(c, bsp);
-        break;
-#endif
-
-#ifdef CONFIG_INTEL
-    case X86_VENDOR_INTEL:
-        switch ( c->x86 )
-        {
-        case 6:
-        case 15:
-            inited = intel_mcheck_init(c, bsp);
-            break;
-        }
-        break;
-#endif
-
-    default:
-        break;
-    }
+    else if ( x86_vendor_is(c->x86_vendor, X86_VENDOR_INTEL) &&
+              (c->x86 == 6 || c->x86 == 15) )
+        inited = intel_mcheck_init(c, bsp);
 
     show_mca_info(inited, c);
     if ( inited == mcheck_none || inited == mcheck_unset )
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index 920b075355..14261f925b 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -137,28 +137,26 @@ void x86_mcinfo_dump(struct mc_info *mi);
 
 static inline int mce_vendor_bank_msr(const struct vcpu *v, uint32_t msr)
 {
-    switch (boot_cpu_data.x86_vendor) {
-    case X86_VENDOR_INTEL:
+    if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
+    {
         if (msr >= MSR_IA32_MC0_CTL2 &&
             msr < MSR_IA32_MCx_CTL2(v->arch.vmce.mcg_cap & MCG_CAP_COUNT) )
             return 1;
-        fallthrough;
-
-    case X86_VENDOR_CENTAUR:
-    case X86_VENDOR_SHANGHAI:
-        if (msr == MSR_P5_MC_ADDR || msr == MSR_P5_MC_TYPE)
+        if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_CENTAUR |
+                                                     X86_VENDOR_SHANGHAI) &&
+             (msr == MSR_P5_MC_ADDR || msr == MSR_P5_MC_TYPE) )
             return 1;
-        break;
-
-    case X86_VENDOR_AMD:
+    }
+    else if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD) )
+    {
         switch (msr) {
         case MSR_F10_MC4_MISC1:
         case MSR_F10_MC4_MISC2:
         case MSR_F10_MC4_MISC3:
             return 1;
         }
-        break;
     }
+
     return 0;
 }
 
diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mcheck/non-fatal.c
index a9ee9bb94f..db0ddc5b7b 100644
--- a/xen/arch/x86/cpu/mcheck/non-fatal.c
+++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
@@ -23,25 +23,15 @@ static int __init cf_check init_nonfatal_mce_checker(void)
 	/*
 	 * Check for non-fatal errors every MCE_RATE s
 	 */
-	switch (c->x86_vendor) {
-#ifdef CONFIG_AMD
-	case X86_VENDOR_AMD:
-	case X86_VENDOR_HYGON:
+	if ( x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON) )
 		/* Assume we are on K8 or newer AMD or Hygon CPU here */
 		amd_nonfatal_mcheck_init(c);
-		break;
-#endif
-
-#ifdef CONFIG_INTEL
-	case X86_VENDOR_INTEL:
+	else if ( x86_vendor_is(c->x86_vendor, X86_VENDOR_INTEL) )
 		intel_nonfatal_mcheck_init(c);
-		break;
-#endif
-
-	default:
-		/* unhandled vendor isn't really an error */
+	else
+		 /* unhandled vendor isn't really an error */
 		return 0;
-	}
+
 	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n");
 	return 0;
 }
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index 1a7e92506a..dd1ccecfe5 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -136,27 +136,14 @@ static int bank_mce_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     default:
-        switch ( boot_cpu_data.x86_vendor )
-        {
-#ifdef CONFIG_INTEL
-        case X86_VENDOR_CENTAUR:
-        case X86_VENDOR_SHANGHAI:
-        case X86_VENDOR_INTEL:
+        ret = 0;
+        if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_CENTAUR  |
+                                                     X86_VENDOR_SHANGHAI |
+                                                     X86_VENDOR_INTEL) )
             ret = vmce_intel_rdmsr(v, msr, val);
-            break;
-#endif
-
-#ifdef CONFIG_AMD
-        case X86_VENDOR_AMD:
-        case X86_VENDOR_HYGON:
+        else if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD |
+                                                          X86_VENDOR_HYGON) )
             ret = vmce_amd_rdmsr(v, msr, val);
-            break;
-#endif
-
-        default:
-            ret = 0;
-            break;
-        }
         break;
     }
 
@@ -273,25 +260,12 @@ static int bank_mce_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         break;
 
     default:
-        switch ( boot_cpu_data.x86_vendor )
-        {
-#ifdef CONFIG_INTEL
-        case X86_VENDOR_INTEL:
+        ret = 0;
+        if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
             ret = vmce_intel_wrmsr(v, msr, val);
-            break;
-#endif
-
-#ifdef CONFIG_AMD
-        case X86_VENDOR_AMD:
-        case X86_VENDOR_HYGON:
+        else if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD |
+                                                          X86_VENDOR_HYGON) )
             ret = vmce_amd_wrmsr(v, msr, val);
-            break;
-#endif
-
-        default:
-            ret = 0;
-            break;
-        }
         break;
     }
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 3a21e035f4..f3e4ae4a4d 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -319,9 +319,8 @@ void domain_cpu_policy_changed(struct domain *d)
             if ( cpu_has_htt )
                 edx |= cpufeat_mask(X86_FEATURE_HTT);
 
-            switch ( boot_cpu_data.x86_vendor )
+            if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
             {
-            case X86_VENDOR_INTEL:
                 /*
                  * Intel masking MSRs are documented as AND masks.
                  * Experimentally, they are applied after OSXSAVE and APIC
@@ -336,10 +335,10 @@ void domain_cpu_policy_changed(struct domain *d)
                 edx = cpufeat_mask(X86_FEATURE_APIC);
 
                 mask |= ((uint64_t)edx << 32) | ecx;
-                break;
-
-            case X86_VENDOR_AMD:
-            case X86_VENDOR_HYGON:
+            }
+            else if ( x86_vendor_is(boot_cpu_data.x86_vendor,
+                                    X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+            {
                 mask &= ((uint64_t)ecx << 32) | edx;
 
                 /*
@@ -362,7 +361,6 @@ void domain_cpu_policy_changed(struct domain *d)
                     ecx |= cpufeat_mask(X86_FEATURE_HYPERVISOR);
 
                 mask |= ((uint64_t)ecx << 32) | edx;
-                break;
             }
 
             d->arch.pv.cpuidmasks->_1cd = mask;
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index 77a3a8742a..7802b5f506 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -59,23 +59,18 @@ void asmlinkage __init early_hypercall_setup(void)
         boot_cpu_data.x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
     }
 
-    switch ( boot_cpu_data.x86_vendor )
+    if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL   |
+                                                 X86_VENDOR_CENTAUR |
+                                                 X86_VENDOR_SHANGHAI) )
     {
-    case X86_VENDOR_INTEL:
-    case X86_VENDOR_CENTAUR:
-    case X86_VENDOR_SHANGHAI:
         early_hypercall_insn = 0;
         setup_force_cpu_cap(X86_FEATURE_USE_VMCALL);
-        break;
-
-    case X86_VENDOR_AMD:
-    case X86_VENDOR_HYGON:
+    }
+    else if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD |
+                                                      X86_VENDOR_HYGON) )
         early_hypercall_insn = 1;
-        break;
-
-    default:
+    else
         BUG();
-    }
 }
 
 static void __init find_xen_leaves(void)
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index a0c9194ff0..a35e7109fe 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -216,11 +216,10 @@ void disable_lapic_nmi_watchdog(void)
 {
     if (nmi_active <= 0)
         return;
-    switch (boot_cpu_data.x86_vendor) {
-    case X86_VENDOR_AMD:
+    if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD) )
         wrmsrns(MSR_K7_EVNTSEL0, 0);
-        break;
-    case X86_VENDOR_INTEL:
+    else if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
+    {
         switch (boot_cpu_data.x86) {
         case 6:
             wrmsrns(MSR_P6_EVNTSEL(0), 0);
@@ -230,7 +229,6 @@ void disable_lapic_nmi_watchdog(void)
             wrmsr(MSR_P4_CRU_ESCR0, 0);
             break;
         }
-        break;
     }
     nmi_active = -1;
     /* tell do_nmi() and others that we're not active any more */
@@ -387,13 +385,10 @@ void setup_apic_nmi_watchdog(void)
     if ( nmi_watchdog == NMI_NONE )
         return;
 
-    switch ( boot_cpu_data.x86_vendor )
-    {
-    case X86_VENDOR_AMD:
+    if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD) )
         setup_k7_watchdog();
-        break;
-
-    case X86_VENDOR_INTEL:
+    else if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
+    {
         switch (boot_cpu_data.x86) {
         case 6:
             setup_p6_watchdog((boot_cpu_data.x86_model < 14) 
@@ -404,7 +399,6 @@ void setup_apic_nmi_watchdog(void)
             setup_p4_watchdog();
             break;
         }
-        break;
     }
 
     if ( nmi_perfctr_msr == 0 )
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index d77be8f839..83070b050a 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -243,19 +243,15 @@ static void __init init_ler(void)
      * Intel Pentium 4 is the only known CPU to not use the architectural MSR
      * indicies.
      */
-    switch ( boot_cpu_data.x86_vendor )
+    if ( x86_vendor_is(boot_cpu_data.x86_vendor,
+                       X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON) )
     {
-    case X86_VENDOR_INTEL:
-        if ( boot_cpu_data.x86 == 0xf )
-        {
+        if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) &&
+             (boot_cpu_data.x86 == 0xf) )
             msr = MSR_P4_LER_FROM_LIP;
-            break;
-        }
-        fallthrough;
-    case X86_VENDOR_AMD:
-    case X86_VENDOR_HYGON:
-        msr = MSR_IA32_LASTINTFROMIP;
-        break;
+        else if ( x86_vendor_is(boot_cpu_data.x86_vendor,
+                                X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+            msr = MSR_IA32_LASTINTFROMIP;
     }
 
     if ( msr == 0 )
-- 
2.43.0


