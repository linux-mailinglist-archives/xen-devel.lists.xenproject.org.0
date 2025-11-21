Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3F5C77C04
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:49:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168299.1494390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLt3-0005n0-TI; Fri, 21 Nov 2025 07:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168299.1494390; Fri, 21 Nov 2025 07:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLt3-0005kK-PS; Fri, 21 Nov 2025 07:48:57 +0000
Received: by outflank-mailman (input) for mailman id 1168299;
 Fri, 21 Nov 2025 07:48:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMLt2-0004J2-V4
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:48:56 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8786f71e-c6ae-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 08:48:55 +0100 (CET)
Received: from MW4PR04CA0359.namprd04.prod.outlook.com (2603:10b6:303:8a::34)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 07:48:50 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::e4) by MW4PR04CA0359.outlook.office365.com
 (2603:10b6:303:8a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 07:48:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 07:48:48 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 20 Nov 2025 23:48:45 -0800
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
X-Inumbo-ID: 8786f71e-c6ae-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMxve1N23XJzOYtzYvnJO+kdhe/KqPBOlpr2nfG6V5KN8TTKpvabztpkU5f1kljchpPDJANZbMn29Yjf6xHw2hvoAwlcH9mSGYLiTsl8JUP4fH2HMAneVrQU+6sAJszL3dB1Ee7poRi7LPkxx7ya/rU6n1WE+N/lseRI5GLvaUOsZd/3G848JMVjxoo7lIFdLrY4ySK1FcQ/FGdwsARIpxfAoRqL7wbF4DcvwdRi8xzAmH4mwFWpnQScLblMdN8NObKqhJDyFxDsDe35Ie5RAQqAUKbFRGLYBuwJPU7rc8E8PP5xMzlWy+PA9adQHu7rRWx7heFRCBSZzjv685qdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUuzBE9RcMMeytLn2CbJEvmAPRA65e3Hsh1y4X3/Y4k=;
 b=sSyaMxu2cUhamk9LTmdXLSttpkDew7Nskf9gbZolVFZL9VhiSRN3DyUtfQVgykx3c5sHm364lvTBVJ/m4Pzq4UFDlPmhOq/cHpP92zbEw//xgZRCj8GmupWT8SZfXc0bJ4ynYXU42oNTrd4x04YLVR0teFkYd2Tdd41pk9kNayyYDU6kkQ2QL2+0nC7V53XDPEzvbzKaGJwnquI02eSQFMGYqf7YfXJsoyyz4+/zWI2WtFKWXfEZ/iMfxwZs+SIT3gliYWNy3ungCRxBaJBYSl+cvH8+prwad9dUWPRHCYnQ3NpCaP/CXLVpEsXP+CL1OO8L3CxsTFWEOoQ/KekH+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUuzBE9RcMMeytLn2CbJEvmAPRA65e3Hsh1y4X3/Y4k=;
 b=tJf0NE6QXYc7dtPpx3BM07r6Q0vfG0F9+Dium3yOethmaVkd7dnncPkkI61SOcOYcIg5XaC3/sOIP89kmfWh02BJi87UOUH2T2pZAeavyPGmHbHe7QTHSoc6lbFOh8WFgM2i9FrAoGS67Juz3lv17CbYvrGBI5anKyO7H5cF7ZU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Alexandru
 Isaila" <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>
Subject: [PATCH v2 6/7] xen/mem_access: wrap memory access when VM_EVENT=n
Date: Fri, 21 Nov 2025 15:48:02 +0800
Message-ID: <20251121074803.312568-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121074803.312568-1-Penny.Zheng@amd.com>
References: <20251121074803.312568-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|MN2PR12MB4469:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a6dc22-2692-4375-7ab5-08de28d2683c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o9on+oajL6VnK8uaHFH+Z0H1C3Hu6lhKqV2stvvJ0zzUXVVCgqqsAsc0hNQB?=
 =?us-ascii?Q?WA+fSph9JYchShwSNH90Cnxq+bKY112xnkOXGRDDxYI+XmHr2HCucbKyf5ih?=
 =?us-ascii?Q?ibt0eo/hGmRCnbD9kF5RgFj3iMN4bsk7MdquPn2N9l6SqF7B9uHcnkEVt558?=
 =?us-ascii?Q?Jy0hABcfKPIR/GxdP/8+cGi1JSaLOZ57jq/lTIWyUPBfDFkJDFXLqJtyLCjt?=
 =?us-ascii?Q?Csn6sjWMQxdNd29Z2zF86aKTKzORE860LwFW+j1wl/TJQrZ9A+9znRqRU+fY?=
 =?us-ascii?Q?7eaFwgblSFJNhqnoV1daoZbZe20ZuXjx7uVX+U7fMYZTPq4/s2ELm0JiW+0L?=
 =?us-ascii?Q?TOEmVdUz/tfWYO+jMZ0cCpo/qIEQgGAcpPZgqGLewgnJ2pnbnQb6OJDbh3Sp?=
 =?us-ascii?Q?rhAzu5tSufSN6tpOVTv0OH1rVZ8qX72a5Du5oWF6oL6dgPXBFYTJ4uPhDO9x?=
 =?us-ascii?Q?tbc6kkAduZV3HX3/aBHjjQfSfy9YxLjh8O43hnoPmrDuVOpqHGsGzDnoQr5Z?=
 =?us-ascii?Q?zzue7y2ljB3jRcINlQdsrUv0h8wQygJ5ztWLXEfumHovcYhBLWF6c7c8FT3M?=
 =?us-ascii?Q?KsbYGgC/KUwFnsEwLvLYDFnIMf0QcClAI6OrMWbkuXfn7+lmLK2tLYQ3G/an?=
 =?us-ascii?Q?Ae2rUqdnWcRdXOxw4QX3aFY2wlk6rpQsMNAJzNlxRpzdXKMoGQjAnr/O2bKn?=
 =?us-ascii?Q?3vZguj+YnS8pLsPYwIfJY83+EcSM86TenAb2ZgX8Sg/c77BEB/kdaXMmI4Ba?=
 =?us-ascii?Q?yDktMm7DNdmkS+HggpRVx2uetCqyofnmV+lzhmJ4vrQahjjKGbmp0klSty0d?=
 =?us-ascii?Q?bhzlNvV2eVRXCICFqVB31p+W6BWJfNwBvmme6LTAe6POrkjHXVIpf068ojRs?=
 =?us-ascii?Q?WnyoIIbArImO5vDcFPkrJzJfH5GJTD/bTekrb5Tcza4R+ArkbFIvgush2Tz8?=
 =?us-ascii?Q?n2/vhMoZvPvUWXIAaHlZ63H6Le7R5D02nFNFYk5aBTRaKEoU7UdF2veDBqM9?=
 =?us-ascii?Q?NfobTwISj+kto2fURstawfLP8brVn4GXKCEEMY9uVL87908EkhhbcBijNrpI?=
 =?us-ascii?Q?pKxJY2yYJVbsoe5XPt6G1Rbd4GB1MQfUdk+hp/qeatVqz4eppOcK2cVLfe/F?=
 =?us-ascii?Q?qcDVlPrQRYVTHGHbTZIm+f7LzlDPBL7rbLJU/52RA+H7ox49w7TeuGAxikaP?=
 =?us-ascii?Q?JTpQ5OcChgW5tKIpRgA13D3rWkMUAzfrg/0V6FmEoBzTw43v7XQbsqDu2zic?=
 =?us-ascii?Q?HOPi3l74oLz4Cgtfr6lfyj+e63HlcJQ9GeZV+rD/mpiud+PT0p8HckCjU62C?=
 =?us-ascii?Q?MN/3GqqvGQhXKq0wdAWM2OKvGLZU8bugsQY0o5q/aOFJfpM0lEPXQA9G6wtL?=
 =?us-ascii?Q?tgsD/CuaKuHLoLhUY/+R6lX9Ap5GqfZvw+ujny+5vkVF5GcQ5dbjqodUrTGR?=
 =?us-ascii?Q?XGnRpSzf5nMEtlWGoZAlQOqud12Ezqne5rtM6BCUVOD7bf3VKedFvTH6jq5r?=
 =?us-ascii?Q?jxOpNCh1naXXYJ5JQid1JG16xXlvBNNVv0JiXEuSUAPujpLVV08ztq/jmJoM?=
 =?us-ascii?Q?KfO1L9PPQ4HVrNzZKG0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 07:48:48.8878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a6dc22-2692-4375-7ab5-08de28d2683c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469

Feature memory access is based on vm event subsystem, and it could be disabled
in the future. So a few switch-blocks in do_altp2m_op() need
vm_event_is_enabled() condition check to pass compilation when ALTP2M=y and
VM_EVENT=n(, hence MEM_ACCESS=n), like HVMOP_altp2m_set_mem_access, etc.
Function p2m_mem_access_check() still needs stub when VM_EVENT=n to
pass compilation.
Although local variable "req_ptr" still remains NULL throughout its lifetime,
with the change of NULL assignment, we will face runtime undefined error only
when CONFIG_USBAN is on. So we strengthen the condition check via adding
vm_event_is_enabled() for the special case.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- a comment next to the excessive condition
- use vm_event_is_enabled() instead
- avoid heavy churn by using the inverted condition plus break
---
 xen/arch/x86/hvm/hvm.c                | 24 +++++++++++++++++++++++-
 xen/arch/x86/include/asm/mem_access.h | 10 ++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index aa14101241..0103f5c6ba 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2080,7 +2080,11 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
 #endif
     }
 
-    if ( req_ptr )
+    /*
+     * Excessive condition is to avoid runtime undefined error only
+     * when CONFIG_USBAN=y
+     */
+    if ( req_ptr && vm_event_is_enabled(curr) )
     {
         if ( monitor_traps(curr, sync, req_ptr) < 0 )
             rc = 0;
@@ -4802,6 +4806,12 @@ static int do_altp2m_op(
         break;
 
     case HVMOP_altp2m_set_mem_access:
+        if ( !vm_event_is_enabled(current) )
+        {
+            rc = -EOPNOTSUPP;
+            break;
+        }
+
         if ( a.u.mem_access.pad )
             rc = -EINVAL;
         else
@@ -4811,6 +4821,12 @@ static int do_altp2m_op(
         break;
 
     case HVMOP_altp2m_set_mem_access_multi:
+        if ( !vm_event_is_enabled(current) )
+        {
+            rc = -EOPNOTSUPP;
+            break;
+        }
+
         if ( a.u.set_mem_access_multi.pad ||
              a.u.set_mem_access_multi.opaque > a.u.set_mem_access_multi.nr )
         {
@@ -4842,6 +4858,12 @@ static int do_altp2m_op(
         break;
 
     case HVMOP_altp2m_get_mem_access:
+        if ( !vm_event_is_enabled(current) )
+        {
+            rc = -EOPNOTSUPP;
+            break;
+        }
+
         if ( a.u.mem_access.pad )
             rc = -EINVAL;
         else
diff --git a/xen/arch/x86/include/asm/mem_access.h b/xen/arch/x86/include/asm/mem_access.h
index 257ed33de1..790bed81e8 100644
--- a/xen/arch/x86/include/asm/mem_access.h
+++ b/xen/arch/x86/include/asm/mem_access.h
@@ -14,6 +14,7 @@
 #ifndef __ASM_X86_MEM_ACCESS_H__
 #define __ASM_X86_MEM_ACCESS_H__
 
+#ifdef CONFIG_VM_EVENT
 /*
  * Setup vm_event request based on the access (gla is -1ull if not available).
  * Handles the rw2rx conversion. Boolean return value indicates if event type
@@ -25,6 +26,15 @@
 bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
                           struct npfec npfec,
                           struct vm_event_st **req_ptr);
+#else
+static inline bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
+                                        struct npfec npfec,
+                                        struct vm_event_st **req_ptr)
+{
+    *req_ptr = NULL;
+    return false;
+}
+#endif /* CONFIG_VM_EVENT */
 
 /* Check for emulation and mark vcpu for skipping one instruction
  * upon rescheduling if required. */
-- 
2.34.1


