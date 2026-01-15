Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9C5D2386B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204485.1519161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJfY-0000BY-Id; Thu, 15 Jan 2026 09:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204485.1519161; Thu, 15 Jan 2026 09:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJfY-00008Z-EE; Thu, 15 Jan 2026 09:29:32 +0000
Received: by outflank-mailman (input) for mailman id 1204485;
 Thu, 15 Jan 2026 09:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7XDq=7U=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vgJfW-0007JZ-7L
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:29:30 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af19d6ed-f1f4-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 10:29:29 +0100 (CET)
Received: from CH0PR03CA0335.namprd03.prod.outlook.com (2603:10b6:610:11a::31)
 by DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 09:29:21 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::fe) by CH0PR03CA0335.outlook.office365.com
 (2603:10b6:610:11a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 09:29:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 09:29:20 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 15 Jan 2026 03:29:13 -0600
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
X-Inumbo-ID: af19d6ed-f1f4-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+UAL0uVslowv5+vAD0BPjNFTlDjM7h4CkgDKkVG3RgnWQHmgSeOY+dNgtk0UQ5YWzYvFPGBbcVYIm2tMP7DjYQ0OZDqCdNOTgUYZXyJDakg/RnZZUi4cxP/4tnr5qY4bNcSjjccLDcrMvFubHQOLvv9W8sQEdyyK+1WPJ8gpQdCzNI+NCElG9InLovNQbRkFj+1TmVfcdutUM4JFY2HEahjl9pSFssKo3aEuqJSrOygvzIUDEoAq1VXyLEkpOcdlNP6vb/q+xcDi/XacAKoUNil8+gTeTUd22HOf8y1jx+B3j72K6QYLQPA6Noj2+lp+VMt02vso1jSHnaTUG1Shg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GoBJx+OHAGG6+O4+7S1BHBC7d9Er+VdkwujlD93WbE=;
 b=anDHgLtGRTTI0CS1rdVmpXjxZafwWl22vYkd+AV7L29fBSlowps88/HlaojRWLeiSl5r+c6oZ58YAwvUczxRe3tjh1QVdgTriTJNQEcHERhyHeNFktjugWzrKjNIfWh6r/PVXGzC0sJcCitGSJxAJmwcEL/yI1cHptiw3vHc6qldaa1F90OwdYh/6kxGtua9l96hs1F9ZZYo4dn29lvmlKSZNOhqJnJj3L0VnsM44JX5Pjal74j4LMXvysCc9ZajRYIU9/+inOony5fkjZludXMRBFGAPvEvdq6Ew0dIkmrb0ryycfEYX4jyG5BseGa3JPxkc4W+bhuoMYC3bKdmCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GoBJx+OHAGG6+O4+7S1BHBC7d9Er+VdkwujlD93WbE=;
 b=tfd1DvreAqxHjZ0dZw5N2Mi0Je/BF+XPnd7yCYA9+rs4BQoet7fS0x34D5/2cNXHr7FBHBsa/pOCllOiQwN2276MfqcYWKwHqDaORSL4dsWebtuL2xqKoBuf8PTXed0G0ZVs1aJBkmcYv7FKDQGZlkOWCTk+YmdPJ+od9saMqXk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <jason.andryuk@amd.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>
Subject: [PATCH v4 5/6] xen/mem_access: wrap memory access when VM_EVENT=n
Date: Thu, 15 Jan 2026 17:28:40 +0800
Message-ID: <20260115092841.2651224-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092841.2651224-1-Penny.Zheng@amd.com>
References: <20260115092841.2651224-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|DM4PR12MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: 34a7d81f-6e8d-4a61-caa9-08de54189046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LF/0nq/hSNpVruUt9s+tjnfAFMCCPYw+QO9ugSNG2pXuiVLrdl/fO/DvWYDS?=
 =?us-ascii?Q?h5R2sEM3zgfzmheQJFfugXhOs8UxOLnFf92pVm4XI+FBMeJp4SBdjQ70E+gK?=
 =?us-ascii?Q?bgtNHA6MyysIn4qo0BalMbcalPyh+jzX3bY4iVQdTnCQxgYNFM60Eps0rLm5?=
 =?us-ascii?Q?EQoXKdMCILpRyt1/QDXHllhrmsuObTXm+ANqvPev/EeKR9W/pA9Nn6MC+BdT?=
 =?us-ascii?Q?lmJUFllgal5dp8YinkHSPNV7DME+mm/9h5CuL+X/rKnzHpnvl1J9+OJEflsT?=
 =?us-ascii?Q?1FPJlOquZRu+RdnaoZ1ZQ/Qpr0W6KevoyfL2yh8/EZrAV2SoDiKL0oi30cYJ?=
 =?us-ascii?Q?EBr3ttstpu0LKIgaKtEstZQuQ5GvvYdKmnOS8gzAYowgaBmoZ8yGaCzZc/sw?=
 =?us-ascii?Q?ob8PVgKgyrnrvUglI3D0CvGZuPY/BTe82jH06x/wr/sD6PL3Py7mU2ALxMt8?=
 =?us-ascii?Q?tAF7MTK0RydJ9dw9VXxeVVWplwLNyOpOtdf05zl2GBDU8Dg9ATl52pH5g4kS?=
 =?us-ascii?Q?pa43MPKuYk7TFxPklI1I5KslY2Mon07F2xtGgeNwxZ9bFpnFOpq24CjGh7Qs?=
 =?us-ascii?Q?d9QStDiQkTwqSDJTgkoGcm6uFTkgk0sv8r3KhSWfTEoUPsQKNRqy4rzUrYLX?=
 =?us-ascii?Q?S8732ApKt2ZCKrhViFhYabF8umTe0toVDvwUr/DRTioQn5SiJ3GSDeGHn28D?=
 =?us-ascii?Q?xp0lIb3O/3PNrH3gfJ5paeypapC/7rdVCRo1+6ksFwY3PDiB3AzzyVWCUBi5?=
 =?us-ascii?Q?LEhYA3yw6jSohrTQX2xFztNA3DgHV4j6Xydgtlbrep+F4IG7JmclEK3uWG9M?=
 =?us-ascii?Q?EIBD+vI//TTAfnvP7hqCKz7MCrXith1okxZJpLAS3LCTzWIyIFh8TGwm8IeY?=
 =?us-ascii?Q?2VwcOiMr2oAFeLaOJTnIUKmiod7d8w+sftEEnnYy6QK2Ggb5L6LBjS5Sk/jA?=
 =?us-ascii?Q?VocOgEBcV+wOJBKZIsvpxVhyFDUrvgrsSCRFFEY6PUE42/MCa7saGTQA6g0t?=
 =?us-ascii?Q?LkCaIsz0bBg5606NWHgIFYwF0cjTISZtF75dLgCbppajSP/gvAAC1/ILFKTd?=
 =?us-ascii?Q?Lc2bGyDEn4XALTJ3v3leBAcKZi7HsgL1qJ5Pg2LhIYpG69T7SMPEBK2eKZei?=
 =?us-ascii?Q?p/Fu+HJQxGEE6xKAyIo6B25n5gl7Si/x69MMLTVdCbogSK5tAv8YYTqRbFqT?=
 =?us-ascii?Q?njWeawqo6+0HcT33yr/SaBp1h+Um0S1pFZ7wLr4mLJ1tQXILGXV1wlgJFSvy?=
 =?us-ascii?Q?xONOELzXIEkeSSBLVYrsK+usRqeMNIUw3wH0WJNCdCQZU1e9vnehcO1/f9un?=
 =?us-ascii?Q?yI+7G2nYvK+2UPKUvANkRDvQzjXn1cbUJkxvlNIgg1fnRAlenVqRvKGqu0L0?=
 =?us-ascii?Q?6MudathUJfeqMjpy0JoFaM1Z+sS6yEt1Jz9Vn5J5sI50yjGU75yX+m9nInp0?=
 =?us-ascii?Q?cZZJHSNRVAthpbTMkDnS1GDavCL2MOGjxepu3D+StZSLiqpowAYFf2yVnO3r?=
 =?us-ascii?Q?KagcTTwurJ1TTBnbHrfxTTeg0JKYho+q0/TVOy2YQpCTBgq1+lA5vNFK/Yzp?=
 =?us-ascii?Q?TNWnlZN/fT+TLnSdSrBNt+/ulkyNgNz+IfMWsOimNXnh+EzdL0ALijeN+e50?=
 =?us-ascii?Q?mKgNivENlJqk9zvSBAZ4N1nOi2WFkE1Xw2b1INY7JBcTgtLoLIMPCDIMTUcT?=
 =?us-ascii?Q?imgTJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:29:20.8881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a7d81f-6e8d-4a61-caa9-08de54189046
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8451

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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v3:
- a comment next to the excessive condition
- use vm_event_is_enabled() instead
- avoid heavy churn by using the inverted condition plus break
---
v3 - v4:
- refine comment
---
 xen/arch/x86/hvm/hvm.c                | 26 +++++++++++++++++++++++++-
 xen/arch/x86/include/asm/mem_access.h | 10 ++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 07e54890d9..b34cd29629 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -52,6 +52,7 @@
 #include <asm/i387.h>
 #include <asm/mc146818rtc.h>
 #include <asm/mce.h>
+#include <asm/mem_access.h>
 #include <asm/monitor.h>
 #include <asm/msr.h>
 #include <asm/mtrr.h>
@@ -2082,7 +2083,12 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
 #endif
     }
 
-    if ( req_ptr )
+    /*
+     * req_ptr being constant NULL when !CONFIG_VM_EVENT, CONFIG_UBSAN=y
+     * builds have been observed to still hit undefined-ness at runtime.
+     * Hence do a seemingly redundant vm_event_is_enabled() check here.
+     */
+    if ( req_ptr && vm_event_is_enabled(curr) )
     {
         if ( monitor_traps(curr, sync, req_ptr) < 0 )
             rc = 0;
@@ -4804,6 +4810,12 @@ static int do_altp2m_op(
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
@@ -4813,6 +4825,12 @@ static int do_altp2m_op(
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
@@ -4844,6 +4862,12 @@ static int do_altp2m_op(
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


