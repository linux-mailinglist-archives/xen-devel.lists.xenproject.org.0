Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99DEBBDAFD
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 12:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138042.1473834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5iSI-0002Mc-7c; Mon, 06 Oct 2025 10:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138042.1473834; Mon, 06 Oct 2025 10:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5iSI-0002LO-2h; Mon, 06 Oct 2025 10:28:34 +0000
Received: by outflank-mailman (input) for mailman id 1138042;
 Mon, 06 Oct 2025 10:28:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hel7=4P=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v5iSH-00025a-0a
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 10:28:33 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3054a3ff-a29f-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 12:28:25 +0200 (CEST)
Received: from SJ0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:a03:33a::34)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 10:28:17 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::8f) by SJ0PR03CA0029.outlook.office365.com
 (2603:10b6:a03:33a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 10:28:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 10:28:16 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 03:28:15 -0700
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
X-Inumbo-ID: 3054a3ff-a29f-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7RU2Xez19v92gri4TwOsOVgGOwThejfxJzqT+cDi7zsowC4/ITSLWXDN1+uKQ7m2LJF+mrWsKdi/ZigxVoppSvJ3kQ1ywMvBfZ1rwJNSOBKw8hZM0smvJAEQaAmxRnwA1vKnpntJp6PHeCT1EUHq+nQEAmmhHnthbWuN5v+WF9y+M8m8umCm80hN3jroijg+PkVMltcHotPf9B9YKmXLZSlalJVR31ALOPY/92Ae4HbrYtRwoeeCf41mPt9k1lx/y4iaJKZIFTd4a11vzTx6NxeAeaDz300ijaxH34XCnrQWiJsn3VQ4b0M81KB5Sjh7C+fZFqvAVgSAXUUcD107Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLCpUEK0V9qedPMxM85zA4whQVIbTmvcxPg6YTqoMRQ=;
 b=JrJuTxFdsV8AnoiGk1EmD+fCsJW3NhHYxfne2c6kjRsA6NR8ZNWRKa4fEMzf6lOIEw4jgadn9wTrP6sfCjPyEMb3fAWIotpGz+SBTkXE+/gTi+JdCoFTDnn+rfDDubb+PBTH/dKfSbJrp1694MjGSjfGiYka/KTilZRCVB6LBT9eD7+2pRmhRKocve+pvrqiLpeZsr2EoPbRfh28LQgtKGDvkA5NSiXeOjZS7hgoZS/n+zMqk9OZpxUDBiNORgm25Xb84JSY15Clofu3pKSbgOMxzQN4CKQcAf6yZyJThI3PyrmuwCVmhLlVb2kag2p89dT02PpsL8CucgxXCKKyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLCpUEK0V9qedPMxM85zA4whQVIbTmvcxPg6YTqoMRQ=;
 b=qbEWhTj0lMn8ijX8b1anO+PVmb3bsNRgVzuqIArjAuKO9YIDlmzmUWZ2ufmfoOVqouexpYQcv8BamNbl1+vDXTGadddP+S9TT2v4+G+Hbqz2a9QFktkyxcJM/jxKulejVAkJ612Xn1CP38Ac3JrzUjDSDh9foYESG7SscaX/034=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: [XTF PATCH v3 1/3] x86: Remove Xen as a hard requirement to run XTF.
Date: Mon, 6 Oct 2025 12:25:56 +0200
Message-ID: <20251006102743.3907-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006102743.3907-1-alejandro.garciavallejo@amd.com>
References: <20251006102743.3907-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: ede5ef36-146c-4e2c-378a-08de04c3102a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d/e9+S8y8YLomlTBMo3qG8Pg49daU/DIo/BrMXF86TZW0/Yl6aS++9u33QZi?=
 =?us-ascii?Q?lz/F3YmQGDUwMPVbu2jpX2m1Z0aFNnp6tU+pPPIaPFOhnhZWMTt92foexzSN?=
 =?us-ascii?Q?O308M/DTF0qZoyJ5BjM6L0OdITp7/oG1E5rrGHBW463CdD1+5dVsmVLEI0sz?=
 =?us-ascii?Q?Bif7Lf9s0ByTLPkKYzTRffraKoJxWXPGy2FgoYc+xVoGEQT8eSOrgXJWahuc?=
 =?us-ascii?Q?ZNw5KbRvw5tW/I1Ecb2RPJ0J0+ey3uq8rVzWNc1VQ0dA+kDqtfSHuqt2v3Br?=
 =?us-ascii?Q?1AHUWAsKSdUaEVkKQeJqJq6wddebEggcV0+1kzzl2oX2WTMJmMHd7TF2SwSe?=
 =?us-ascii?Q?90BHivIH57Jv730ZiQ+ka4Kcu6RZ2k2KXLy9/05GpnUjKFwFrMtoAw7OU8nZ?=
 =?us-ascii?Q?cZH6qbqftYo+So3TANf4cOEgMx2s4wzD/GaUG+xe+hZ+HJWT3Qx3UDF1Ar8Q?=
 =?us-ascii?Q?5evkJeolBSzH3d2iPfzOAHZ9aATA6nfHqz1i322gPyq9IL5ceh9+7P/dYw6q?=
 =?us-ascii?Q?NGWypnRp/dDOA6Syac/EhEVfoc8u1leKJRrHCM8RpleY/f4A0VEYo4jDpuZX?=
 =?us-ascii?Q?lsLoPPwDnLecRvtqWqsiHQKnxj+nSlF/ZbexRFTUlYCAgK8xJfuaMqwGDXZO?=
 =?us-ascii?Q?GqIR/qfzb0GHbYLdIbHkmtlWbT4UiWAF9ywDObVR+ERU7ZOXg93uormLX+hV?=
 =?us-ascii?Q?E6IWNNg2XDBVUTja6oPuQhKsex8SZtMPZN/+bPy2mrcVYvOGeSt/apxJQNt4?=
 =?us-ascii?Q?eMwY3hN2kNN9FUVXNfvRWqDIJ/cqpOkGwY44zAMB5Aayh396RDfrtNtvRRta?=
 =?us-ascii?Q?ORIY8DkX+XrIk1L2JFTXjN0EOkdtPtV50G8yEiPYDQ6hiwk08+3jQ3lpDXj8?=
 =?us-ascii?Q?AA78A1lHZUcmXYZDvO8t8eYEveziFK4EJ2Pd9hbVs0crWF8VZaiL2YkSBMCR?=
 =?us-ascii?Q?MFzOjF1hodcy+2aVZjiG1ETbCbUU+jMQghXbnDE1H3qQFYx4GAbV6aAYprDR?=
 =?us-ascii?Q?Wv+VECw+VHtJc4nCwxqbjGJTg5hUtKKjhSJ0JhoofGSVxf1ArKz+MliOGVOE?=
 =?us-ascii?Q?w4abEBjAfJXC3hHPiKatNx5nhSra8uZZpmszJTksRpyI7jPl+THicBjK02Rg?=
 =?us-ascii?Q?Jebz+rMuI35n/reCtEpRw+j1wAHM422mpwm2mVoqd0WT1gCsfuJIV6wmdIMn?=
 =?us-ascii?Q?LywFrxf6tXfFJHBoRXlBozmB7Dx57YxJ012+fNMsULvdCyXB9M384jNJKGKn?=
 =?us-ascii?Q?viNDkfG1bk3SjEtho7e54diMlxtv5lPvIUGtJrxQ480nS4ImfzRIt8HHdORc?=
 =?us-ascii?Q?sfEoObxxnjb77feXC8D1m4IoOOqIkixgrFbz/R8R7UiUC3h02n6ILs4sDoUA?=
 =?us-ascii?Q?43L8+OzkwBmhOjE29V/1gMHC3bW/H8A1bzF8g+ewXWG5cwkk07LLBisK4UBh?=
 =?us-ascii?Q?sjmJrbxGu75RMzOpimCZIyBXbZFPrUZIfOWLeHt+RhW86etZpJZV3ETtBGHR?=
 =?us-ascii?Q?R9knYUqqmPgamaxydBFrI1nlTbOrwBffbT+Y1GTk1d/7YDZv0LVlKSfmzmi1?=
 =?us-ascii?Q?vs8BtMQIPvccDsA9v74=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 10:28:16.8193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ede5ef36-146c-4e2c-378a-08de04c3102a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446

If Xen isn't detected on CPUID, then:

 * Skip setting up Xenbus/PV-console/shared_info/hypercalls/qemu-debug.
 * Register COM1 as an output callback.
 * Attempt a QEMU exit via the ISA debug exit device

This patch enables running XTF on QEMU-TCG/KVM out of the box. And a
minor tweaks to set up baud rate make it work on real hardware too.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v3:
  * Introduce cpu_has_xen. To be used in next patch to skip issuing a
    hypercall when Xen ain't there.
---
 arch/x86/include/arch/cpuid.h |  2 ++
 arch/x86/setup.c              | 55 +++++++++++++++++++++++++----------
 2 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/arch/cpuid.h b/arch/x86/include/arch/cpuid.h
index 364b0b4..518aaf2 100644
--- a/arch/x86/include/arch/cpuid.h
+++ b/arch/x86/include/arch/cpuid.h
@@ -101,6 +101,8 @@ static inline bool cpu_has(unsigned int feature)
 
 #define cpu_has_rtm_always_abort cpu_has(X86_FEATURE_RTM_ALWAYS_ABORT)
 
+extern bool cpu_has_xen;
+
 #endif /* XTF_X86_CPUID_H */
 
 /*
diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index ba6f9c3..929d8aa 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -26,6 +26,7 @@ enum x86_vendor x86_vendor;
 unsigned int max_leaf, max_extd_leaf;
 unsigned int x86_family, x86_model, x86_stepping;
 unsigned int maxphysaddr, maxvirtaddr;
+bool cpu_has_xen = IS_DEFINED(CONFIG_PV);
 
 const char environment_description[] = ENVIRONMENT_DESCRIPTION;
 
@@ -102,12 +103,13 @@ static void collect_cpuid(cpuid_count_fn_t cpuid_fn)
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
@@ -122,11 +124,19 @@ static unsigned int find_xen_leaves(void)
              ((eax - l) >= 2) )
         {
             leaves = l;
+            cpu_has_xen = true;
+
             return l;
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
@@ -140,7 +150,7 @@ static void init_hypercalls(void)
     if ( IS_DEFINED(CONFIG_HVM) )
     {
         uint32_t eax, ebx, ecx, edx;
-        unsigned int base = find_xen_leaves();
+        unsigned int base = find_xen_leaves(true);
 
         cpuid(base + 2, &eax, &ebx, &ecx, &edx);
         wrmsr(ebx, _u(hypercall_page));
@@ -248,6 +258,11 @@ static void qemu_console_write(const char *buf, size_t len)
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
@@ -255,10 +270,17 @@ static void xen_console_write(const char *buf, size_t len)
 
 void arch_setup(void)
 {
-    if ( IS_DEFINED(CONFIG_HVM) && !pvh_start_info )
-        register_console_callback(qemu_console_write);
+    find_xen_leaves(IS_DEFINED(CONFIG_PV));
+
+    if ( cpu_has_xen )
+    {
+        if ( IS_DEFINED(CONFIG_HVM) && !pvh_start_info )
+            register_console_callback(qemu_console_write);
 
-    register_console_callback(xen_console_write);
+        register_console_callback(xen_console_write);
+    }
+    else
+        register_console_callback(com1_console_write);
 
     collect_cpuid(IS_DEFINED(CONFIG_PV) ? pv_cpuid_count : cpuid_count);
 
@@ -266,15 +288,18 @@ void arch_setup(void)
 
     arch_init_traps();
 
-    init_hypercalls();
-
-    if ( !is_initdomain() )
+    if ( cpu_has_xen )
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
@@ -282,7 +307,7 @@ int arch_get_domid(void)
     if ( IS_DEFINED(CONFIG_HVM) )
     {
         uint32_t eax, ebx, ecx, edx;
-        unsigned int base = find_xen_leaves();
+        unsigned int base = find_xen_leaves(true);
 
         cpuid_count(base + 4, 0, &eax, &ebx, &ecx, &edx);
 
-- 
2.43.0


