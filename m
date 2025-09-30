Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C56CBAC232
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134091.1472107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3W8x-0007R8-JJ; Tue, 30 Sep 2025 08:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134091.1472107; Tue, 30 Sep 2025 08:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3W8x-0007OE-GV; Tue, 30 Sep 2025 08:55:31 +0000
Received: by outflank-mailman (input) for mailman id 1134091;
 Tue, 30 Sep 2025 08:55:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BylR=4J=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v3W8v-0007O8-UN
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:55:30 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34d5486f-9ddb-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 10:55:27 +0200 (CEST)
Received: from CH0P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::27)
 by DS4PR12MB9770.namprd12.prod.outlook.com (2603:10b6:8:29d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Tue, 30 Sep
 2025 08:55:21 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::d6) by CH0P221CA0044.outlook.office365.com
 (2603:10b6:610:11d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 30 Sep 2025 08:55:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 08:55:20 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Sep
 2025 01:55:19 -0700
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
X-Inumbo-ID: 34d5486f-9ddb-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9SuBl/PWld8ImCc9X3apqkYG6YAVEVkz1MD3mP1wFFnmMb4N26UYtIRk2RpzYTe49vH7xSVGw3BacKG8gB3DphnpktM2D+i191glt2OsSJLrc/SLQ3F+IRBhy98k4jIfkJR2rKeLwotdShboeHQEGR9W7tThG/GhMyxrSvyrITfzTGByMw8wubFGn+m6zYbTBjJPBSuDl/MtKx1c+6zYc0a2uLLXwJd4u1Ejer3eDrOvT32ly+WDiRQtAkg0KwNfDvERWXRBHP15eflFH0UMCKKhzGtre/VL46n7cQStEH4Vh9vb8XZ7cdzQrpdu5XWrJbErjQc+HRVEie8+VxjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAx8haWI7p1pYSrwBHbKjbUmVBh/DmnbTbeE0nc1dSY=;
 b=HfgIISIXlcdm+09dEKIq59XuSzrpwNsdsSWRCl228SgCiuIXr3j5QUXy0SNYckHkKsXZ5RIZA6LxFJLYoJcPFceAkE2W8126SCyDXJ0ii/yd9N0KUBFzGElvcRLzlclqtQmTA55hNKnX5j9NOV4DYX7+OfCVTf9piqUDIdI31445HO0V6W+kbe2gF8WBxoQwZqdr6DquqaaVbBAPKwdI4vlJvJGRZqHIIWvo4aM7CFm3CY+HEqD18bYN1PC6v4ADaFmr+1cATfxOKWDdjc8IVQ2c+dDq7uFKoAQnYEemiXrMkI8AXMtLcaGiSQ5dbACkYN3MQ9l+tJAV3aj8HbOR8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAx8haWI7p1pYSrwBHbKjbUmVBh/DmnbTbeE0nc1dSY=;
 b=Vu+HKyMHHhXY5yg14w1Q2PIUMxiNjSswqCH+kwTj6VkaTrol6Fp4u26khB2XY6TDpiz3TLr9BG8kIABkKmpNSg9ieGOwLbN2R0P+FVM48VAdG2POWtRkv7FBVCaqKxngdKQGWQzTOQbtNInXc9uAy+64BWj0MkJdd+lGGUS24+Q=
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
Subject: [XTF PATCH] x86: Remove Xen as a hard requirement to run XTF.
Date: Tue, 30 Sep 2025 10:54:06 +0200
Message-ID: <20250930085412.1643-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|DS4PR12MB9770:EE_
X-MS-Office365-Filtering-Correlation-Id: 738a2211-d07f-43bd-5ea1-08ddffff1621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VfeEe/7pK6iVZQuspNDQwxmtPufGEEM8vDe20oSkSKl0PVyrdB4qJ7cXLWM3?=
 =?us-ascii?Q?5xfQe6hKSOk7Eiy4vGbcUxHrZZda4Lnfd8sm+qS0KcF5FlfuNrO9Ev7gG170?=
 =?us-ascii?Q?bB4nMoPihbuGQ+2T02N9AoP+nO+DRSVKZVt6+gSAA4GCZo937w9ueHT7roVI?=
 =?us-ascii?Q?Oljnrr0Ra1MmUmlTDIWbs9IYF5ps70ItR2Cuc3y2SxIdMQ7h5gFCo1c/yIcJ?=
 =?us-ascii?Q?yvowrrIk4atrUFx+p7y0PK7/0M+mZQgNzlT3ti28PgiA9AZt1jv3Ag2+AYpT?=
 =?us-ascii?Q?XQ86/kM3Z7sKVJgvn5AtJrDenubnxRZVYc96NeU19Mf1gb+atdq15oxx2x3W?=
 =?us-ascii?Q?d7bLqiwLhkttuFx2bKmCiRotRBOg1UqKi0f9LP5RUfRXxDhP1HBJrFiq7QNA?=
 =?us-ascii?Q?dkOYIuq50GbIJTD9lSQuMBlNiaEkoQxXmg03vANHw5Fi4T3kAqVOkSmsZ+GQ?=
 =?us-ascii?Q?PaEmnHsGFBG0VJG+71/3xpOFFAdr9R/VF9+wCFw8rUWGfqRRITKRolceQCPt?=
 =?us-ascii?Q?+nLhf7eDKt/YAP1dDUmYgx5YCp+F5wjXZ9tfvtpRpOtW6Htgo4VTYNqvytPt?=
 =?us-ascii?Q?WG0j+K0dbsWOTgZVtEPB742jxtT8g4AFv8r4+Po5WeQVjFQRaS4Obh3LZO8C?=
 =?us-ascii?Q?sICdFgiE7Flhd2al00wpXINQ4h+13leRCFwwL11Xm5tXQsCAlvU6VXOZsXZM?=
 =?us-ascii?Q?72qdlle6jNTazMfTvx1pli2CHQiWlT322UoCUcgSnqnmUkyWf9Wr0gzwZZ/a?=
 =?us-ascii?Q?DUgr0vbik0Uv6XH0Jq/Lp0pkRThMyxkcH3Vv1uA5dvjXRz0QQfPa+AtbcqPF?=
 =?us-ascii?Q?m9Z4a/etars/3N2xmet7b8lzjXTIayIFsR+Wru/+GtpJQL9gFFzlrMpgpCCy?=
 =?us-ascii?Q?FIUmqi3wVXQRYaUqYATho+CslmQs/N8QGYrLK/OdtS+kwQ7L+SACflB/pqIt?=
 =?us-ascii?Q?8tnFtN/ivFxupluyy01R5jsugN1dsrFXpOHzYVHYKVQ8RMs2fqANUMBD6/oW?=
 =?us-ascii?Q?WeWkHsQ5dcjuxbzuaiXkZ7LtjiHCV6M5tASZQsmkB0ZZCOZBsvUk30NdEeI5?=
 =?us-ascii?Q?zzhD7GXbS8/aaGavyvaRoMGYKrO2te7V41Xpnr2V3snYv+pRh+J1xXhhHDXy?=
 =?us-ascii?Q?KTmgK8aozqbdDdlyniVapqdol5eDNFSyiqnoSa4/ZRaJUdrl7ZrPypu56tyK?=
 =?us-ascii?Q?zJIQEm+vVJaWB0vK30CuSg2iQ0QYCIM40hEdjkfs/5ZyriidFzbJnrUTcU+A?=
 =?us-ascii?Q?2Y2QIhV7oj+uKV5pdqSC3SgDuTNh1oefSbwnJovRE/PRcclRlRk79FFEdFWk?=
 =?us-ascii?Q?gF9BxvwwpgnNPQ9eAs4ER/SZs6plz7n57V1pA5usVyY+l3By5mfUQ226k2AT?=
 =?us-ascii?Q?9399H/SkodvFlKsM8hhJgnUueiCAhyLqqhL8l8zUgyZg+oNj+Itwc0aoSEKO?=
 =?us-ascii?Q?TcynkTX0dtc9VOdJUD7h225EEjl+imiqSsOP7ElQyvwiAnsUpctqrumYuYLy?=
 =?us-ascii?Q?EjoovKT1W5XwbQ5n6NXawVzZ2KeA/TwBts3b8mghrdXMEdi84u2YGeGvV0ks?=
 =?us-ascii?Q?gJNIM92O/NGE+m/pk6g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 08:55:20.8983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 738a2211-d07f-43bd-5ea1-08ddffff1621
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9770

If Xen isn't detected on CPUID, then:

 * Skip setting up Xenbus/PV-console/shared_info/hypercalls/qemu-debug.
 * Register COM1 as an output callback.

This patch enables running XTF on QEMU-TCG/KVM out of the box. And a
minor tweaks to set up baud rate make it work on real hardware too.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
I tested PV and HVM still run fine under Xen, and I did account for
viridian-enlightened guests, though I didn't test them.

---
 arch/x86/setup.c | 68 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 55 insertions(+), 13 deletions(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index 2ac212e..6172c7e 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -31,6 +31,8 @@ const char environment_description[] = ENVIRONMENT_DESCRIPTION;
 
 shared_info_t shared_info __page_aligned_bss;
 
+static bool has_xen_hypervisor;
+
 static void collect_cpuid(cpuid_count_fn_t cpuid_fn)
 {
     unsigned int tmp, eax, ebx, ecx, edx, addr = 0;
@@ -243,11 +245,19 @@ static void map_shared_info(void)
         panic("Failed to map shared_info: %d\n", rc);
 }
 
+static void pio_write(uint16_t port, const char *buf, size_t len)
+{
+    asm volatile("rep; outsb" : "+S" (buf), "+c" (len) : "d" (port));
+}
+
 static void qemu_console_write(const char *buf, size_t len)
 {
-    asm volatile("rep outsb"
-                 : "+S" (buf), "+c" (len)
-                 : "d" (0x12));
+    pio_write(0x12, buf, len);
+}
+
+static void com1_console_write(const char *buf, size_t len)
+{
+    pio_write(0x3f8, buf, len);
 }
 
 static void xen_console_write(const char *buf, size_t len)
@@ -255,12 +265,41 @@ static void xen_console_write(const char *buf, size_t len)
     hypercall_console_write(buf, len);
 }
 
+static bool detect_xen_runtime(void)
+{
+    uint32_t eax, ebx, ecx, edx;
+
+    /* PV tests always run under Xen */
+    if ( IS_DEFINED(CONFIG_PV) )
+        return true;
+
+    /* HVM tests may additionally run on non-Xen hypervisors or baremetal */
+    cpuid_count(0x40000000, 0, &eax, &ebx, &ecx, &edx);
+    if (  ebx == XEN_CPUID_SIGNATURE_EBX &&
+          ecx == XEN_CPUID_SIGNATURE_ECX &&
+          edx == XEN_CPUID_SIGNATURE_EDX )
+        return true;
+
+    /* Viridian guests have the Xen leaves higher up, so check there too */
+    cpuid_count(0x40000100, 0, &eax, &ebx, &ecx, &edx);
+    return ebx == XEN_CPUID_SIGNATURE_EBX &&
+           ecx == XEN_CPUID_SIGNATURE_ECX &&
+           edx == XEN_CPUID_SIGNATURE_EDX;
+}
+
 void arch_setup(void)
 {
-    if ( IS_DEFINED(CONFIG_HVM) && !pvh_start_info )
-        register_console_callback(qemu_console_write);
+    has_xen_hypervisor = detect_xen_runtime();
+
+    if ( has_xen_hypervisor )
+    {
+        if ( IS_DEFINED(CONFIG_HVM) && !pvh_start_info )
+            register_console_callback(qemu_console_write);
 
-    register_console_callback(xen_console_write);
+        register_console_callback(xen_console_write);
+    }
+    else
+        register_console_callback(com1_console_write);
 
     collect_cpuid(IS_DEFINED(CONFIG_PV) ? pv_cpuid_count : cpuid_count);
 
@@ -268,15 +307,18 @@ void arch_setup(void)
 
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

base-commit: 0cbf4c35b06b2b285fc325b8458132e844c5cf0e
-- 
2.43.0


