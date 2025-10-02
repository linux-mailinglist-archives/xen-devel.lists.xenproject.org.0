Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D662DBB41A6
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 15:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135861.1472801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Jn2-0000rT-DW; Thu, 02 Oct 2025 13:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135861.1472801; Thu, 02 Oct 2025 13:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Jn2-0000py-Am; Thu, 02 Oct 2025 13:56:12 +0000
Received: by outflank-mailman (input) for mailman id 1135861;
 Thu, 02 Oct 2025 13:56:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oua8=4L=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v4Jn1-0000cT-6h
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 13:56:11 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c0e1c1d-9f97-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 15:56:10 +0200 (CEST)
Received: from PH8PR15CA0006.namprd15.prod.outlook.com (2603:10b6:510:2d2::14)
 by BL1PR12MB5803.namprd12.prod.outlook.com (2603:10b6:208:393::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 13:55:59 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::6a) by PH8PR15CA0006.outlook.office365.com
 (2603:10b6:510:2d2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Thu,
 2 Oct 2025 13:55:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 2 Oct 2025 13:55:58 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Oct
 2025 06:55:57 -0700
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
X-Inumbo-ID: 8c0e1c1d-9f97-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZLtZfWDRKa8v9HpEldTju8eCwK4exQsf3AfskLna6HD68ovCnV7HAkGOHGeh0yeHtdQod465NDFK6FkYpFKltOkgtk9Qvaa/JyLqxaWaX8JgPzcKRGzjEUJF3sJAfxRDGEjFdYrwi7fstLqtAf0k00k2hvwEABQbH41mSd4+wvKmUy5BrLuFJTw7/wIA73HmNsRsYVmn405YAg44B42cqJZh+qeC3wNzUr9VoNfZbbz0ivGOfHUOA5xVYiOkfeQN0hwyC44HHcoQQqzabeSI6YtG8qPhN9Zw+G7USHbT5euvCgrkEcEJq7p8XstUIJqoOBpLhUKyRrVWkXW+sM/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1F0c76oApIucIy9Rt+2Zft8XHzgKLKIorNjQ2faBZ/Y=;
 b=vZQhe06Bvx6iYa+LGyRArT7a3hF7qVQ4A2hALc8QojlGKWTMu74cNSbUKy8geIHYsC40Z5a2Ptue5WO4gxcYSTBRZzzocLHXByZq2IFSyuHTerWZE2tR5Di0IGd4Lu9k9GyU4NuJj/ZzEj68b3wNk4PLNJ0ma8G6ONnIazS5soRoQvMrCfAWRLZSxoNS+ny0gVxdSgLtbp0bHTRJRkvTJ+uwS8RQ0SJc1s8sbcqhJPX8XkvWxrwTE+kHIBohnf1ft10Sdol7CPzzcNCdo9i0JqgyTY1EhAUtp7wHC8o2C4T1TGy/e3soyOZxAjr5nPQrLtBqACDyvJqaLu0Ps11/Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F0c76oApIucIy9Rt+2Zft8XHzgKLKIorNjQ2faBZ/Y=;
 b=Tc1STqXlGx7otBPZDoofrF6b9lH4b6zSXxT3mgMxtG8Gx9Ou5I7v8K2aMTnCLjgNHmFTEfZGakbxqcY1hcs56f2HAt9eUx7aCOx7HZimOqyoNUhwfN+w3JE0L+fyQ4AabX8fTCaZcyPzBGwQGy+3EBr2Td4hPpd3S59gVksaGHQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [XTF PATCH v2 1/2] x86: Remove Xen as a hard requirement to run XTF.
Date: Thu, 2 Oct 2025 15:55:33 +0200
Message-ID: <20251002135542.28076-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002135542.28076-1-alejandro.garciavallejo@amd.com>
References: <20251002135542.28076-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|BL1PR12MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: a48b341b-12cd-4ac5-43d3-08de01bb6a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kkDOQS7n4zSgdmOcIVm12qHyqcKVMOg3xwbewrsThAPvASCuHCl6N6XcEHDn?=
 =?us-ascii?Q?M+7mOfUeBo0qwP4MmaBTlzDO8VWmk888o4r3TSMbStQMfZ4ZJba75hDgLkGb?=
 =?us-ascii?Q?Vn5tQ1JU6h/DPwwimMB7P2d60qt8eyeTlbtv4AeTxoLssKZg+Acs6YlTSLq3?=
 =?us-ascii?Q?6zIu01uRJ+6K0kzLQqNmND3o5yrLtOds+q/IaaHH4fKuT5X9eelbjRkvHDWP?=
 =?us-ascii?Q?h1A4+30KU0SaHtthVIIN2P7GpsLGyiPwOYFLbj2U6tUesLmZaEE2mgA3qwGT?=
 =?us-ascii?Q?yrUjzfcZZZyS2DP/iC9MgWzhanomXKLYexnL/VxsQBozsO53e/8UV7Tu9fkT?=
 =?us-ascii?Q?VfWOikibWbat+MJ+8nTtITpVoZjqo0TwpFQTx4V7lHzB15Tn4AV3CnwDx9o1?=
 =?us-ascii?Q?TDS/gKK+wI/Z7NX7ARkRjRQdJB0tYD52tgsBqzF9SmjgaLIhVOgPgclXvO/S?=
 =?us-ascii?Q?P0n2+Y44TOeLCeAordltMSE1Z3aI1WgBI0i9G23fWQF9C3LuqOGf6BH8KjTt?=
 =?us-ascii?Q?vdRMbyvZQrIRHgZnoHLsk0oHovt7WsdHM9yY7hCh2sr8eLgttrVqDEIseylY?=
 =?us-ascii?Q?8Fm4rMQDfpqNcNN3eGLcPWWZwUfmJUvERvjzJSLmmeldtQdNPkGBNCT71pKc?=
 =?us-ascii?Q?XgtgQl/zCXGwF9eO1B/dO3HKiwKOalwtm/54cYuaS6dbjQv/QytDLIeD82qu?=
 =?us-ascii?Q?ixk/yQEulCNK8NN8+0Tr9szGo4Ba2HxW3Hp7FkAb1XVJpLy+Oc4UelRlP5H2?=
 =?us-ascii?Q?IkmRNQs2zzvN0lrDoDL63eMf/1Uke0yO1avxjpfzAqxc1isLuT3WNLnMKHiv?=
 =?us-ascii?Q?5HkI1WELXjHoyud/+jcTOzBN97Ly2CT0mBcjlNc9mpWTf8+ENEuK5kJE04jC?=
 =?us-ascii?Q?o5SNiljf71Qds+qUDnZxwLa3qpMpVN53kUhH8tWUwuKfvKUBUgMD2QhEj/fg?=
 =?us-ascii?Q?2PQmc18rAv73uBAFtxBTVRTk5brc55uI2Z7DuHcIblqP2imeJ64jaTeQGiuL?=
 =?us-ascii?Q?rRIQYzgbF0sV/nBe4FuOMVZ4yNqdLDus0hSW2ORjzW4S6P/EZIgz+9Y78j4d?=
 =?us-ascii?Q?JJppYJZpa7DntjpMcD0qZIpv2vnwVhCTu/8moF/odICJD7n+ew9waXS7oEZJ?=
 =?us-ascii?Q?/Z3xbjlRVfgt+Gil3R3vJCAzgk2effANjERpezRTSAn1Uv/gFrUrVTXktiE7?=
 =?us-ascii?Q?jaPJuSjXLJi2YZWR1k7kiCyBhLLHngsbuFf17W2Nc8iW/BSa13K6XxO+H5p4?=
 =?us-ascii?Q?GqxHJkD31cF/6K9Kvq5XbTKU90X9emddo9m6C0sHaTnLMaRMzk8Gvlbs3ScI?=
 =?us-ascii?Q?vvUOvptcAv2Jj46Y8CCCTOwDgQnjatQYeIg9Bj/Lxnmr+c7ziWRjVvzwgoa9?=
 =?us-ascii?Q?31gdKUufS2XjdrchRpxh3c1GACRHlYVc9POcExdhgPSAWposoaX5+fMMndCH?=
 =?us-ascii?Q?Fd4UXoB+2LK9syYUBKmvFzOCYzT7u75BTq+jgcd4y9RmXMoDO+VBBU9IyTkl?=
 =?us-ascii?Q?tlWpHMB2en4Yx18Y+8rdiclbtFlWxFIk0myjQoof7cqvtDYEq9bvBYFI9n1+?=
 =?us-ascii?Q?uBrfJLESYKwmxBZ7sc4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 13:55:58.6889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a48b341b-12cd-4ac5-43d3-08de01bb6a53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5803

If Xen isn't detected on CPUID, then:

 * Skip setting up Xenbus/PV-console/shared_info/hypercalls/qemu-debug.
 * Register COM1 as an output callback.
 * Attempt a QEMU exit via the ISA debug exit device

This patch enables running XTF on QEMU-TCG/KVM out of the box. And a
minor tweaks to set up baud rate make it work on real hardware too.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
I can't really integrate the checks on find_xen_leaves() as I intended because
many functions just don't need it (prepping xenbus, for instance), so I've left
things as they were in v1. It does work this way.

v2:
  * Use new now available rep_outsb() helper for the com1 writer
  * Make find_xen_leaves() fallible, and add an extra boolean to preserve
    the panic behaviour where it still matters.
---
 arch/x86/setup.c | 53 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index ba6f9c3..be42c84 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -102,12 +102,13 @@ static void collect_cpuid(cpuid_count_fn_t cpuid_fn)
  * Find the Xen CPUID leaves.  They may be at 0x4000_0000, or at 0x4000_0100
  * if Xen is e.g. providing a viridian interface to the guest too.
  */
-static unsigned int find_xen_leaves(void)
+static unsigned int find_xen_leaves(bool assert_found)
 {
+#define XEN_LEAVES_NOT_FOUND (-1U)
     static unsigned int leaves;
 
     if ( leaves )
-        return leaves;
+        goto out;
 
     for ( unsigned int l = XEN_CPUID_FIRST_LEAF;
           l < XEN_CPUID_FIRST_LEAF + 0x10000; l += 0x100 )
@@ -126,7 +127,13 @@ static unsigned int find_xen_leaves(void)
         }
     }
 
-    panic("Unable to locate Xen CPUID leaves\n");
+    leaves = XEN_LEAVES_NOT_FOUND;
+
+out:
+    if ( assert_found && (leaves == XEN_LEAVES_NOT_FOUND) )
+        panic("Unable to locate Xen CPUID leaves\n");
+
+    return leaves;
 }
 
 /*
@@ -140,7 +147,7 @@ static void init_hypercalls(void)
     if ( IS_DEFINED(CONFIG_HVM) )
     {
         uint32_t eax, ebx, ecx, edx;
-        unsigned int base = find_xen_leaves();
+        unsigned int base = find_xen_leaves(true);
 
         cpuid(base + 2, &eax, &ebx, &ecx, &edx);
         wrmsr(ebx, _u(hypercall_page));
@@ -248,6 +255,11 @@ static void qemu_console_write(const char *buf, size_t len)
     rep_outsb(buf, len, 0x12);
 }
 
+static void com1_console_write(const char *buf, size_t len)
+{
+    rep_outsb(buf, len, 0x3f8);
+}
+
 static void xen_console_write(const char *buf, size_t len)
 {
     hypercall_console_write(buf, len);
@@ -255,10 +267,18 @@ static void xen_console_write(const char *buf, size_t len)
 
 void arch_setup(void)
 {
-    if ( IS_DEFINED(CONFIG_HVM) && !pvh_start_info )
-        register_console_callback(qemu_console_write);
+    bool has_xen_hypervisor =
+        find_xen_leaves(IS_DEFINED(CONFIG_PV)) != XEN_LEAVES_NOT_FOUND;
 
-    register_console_callback(xen_console_write);
+    if ( has_xen_hypervisor )
+    {
+        if ( IS_DEFINED(CONFIG_HVM) && !pvh_start_info )
+            register_console_callback(qemu_console_write);
+
+        register_console_callback(xen_console_write);
+    }
+    else
+        register_console_callback(com1_console_write);
 
     collect_cpuid(IS_DEFINED(CONFIG_PV) ? pv_cpuid_count : cpuid_count);
 
@@ -266,15 +286,18 @@ void arch_setup(void)
 
     arch_init_traps();
 
-    init_hypercalls();
-
-    if ( !is_initdomain() )
+    if ( has_xen_hypervisor )
     {
-        setup_pv_console();
-        setup_xenbus();
-    }
+        init_hypercalls();
 
-    map_shared_info();
+        if ( !is_initdomain() )
+        {
+            setup_pv_console();
+            setup_xenbus();
+        }
+
+        map_shared_info();
+    }
 }
 
 int arch_get_domid(void)
@@ -282,7 +305,7 @@ int arch_get_domid(void)
     if ( IS_DEFINED(CONFIG_HVM) )
     {
         uint32_t eax, ebx, ecx, edx;
-        unsigned int base = find_xen_leaves();
+        unsigned int base = find_xen_leaves(true);
 
         cpuid_count(base + 4, 0, &eax, &ebx, &ecx, &edx);
 
-- 
2.43.0


