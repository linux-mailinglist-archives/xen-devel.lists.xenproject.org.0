Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEE2C78161
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 10:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168466.1494510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNG6-0000a4-2C; Fri, 21 Nov 2025 09:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168466.1494510; Fri, 21 Nov 2025 09:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNG5-0000XW-UB; Fri, 21 Nov 2025 09:16:49 +0000
Received: by outflank-mailman (input) for mailman id 1168466;
 Fri, 21 Nov 2025 09:16:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMNG4-0007sJ-9L
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 09:16:48 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce0976d3-c6ba-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 10:16:47 +0100 (CET)
Received: from CH5P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::12)
 by SJ5PPF6785369A4.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::997) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 09:16:42 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::a) by CH5P220CA0008.outlook.office365.com
 (2603:10b6:610:1ef::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 09:16:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 09:16:42 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 01:16:39 -0800
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
X-Inumbo-ID: ce0976d3-c6ba-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exq8mdcRsTcLz2nsCRT6sujhhUTKZSmggTup3/jtd7vyZjX13Tk3kbyGh4X1q4MDWw6Fu2PQGgWRFeB2ly0uj0WFdkP/8T1JOyCjqDIamKpkz7NKz5N9P9Jel4mD3Ml6CukkVnqUm/MmRvMIimkqT3kJue8HgEzPw4jJlCgICvxBGWp6h0hBJp10zuR/RlbwtQTNZ+XuD1mhxJNtY7K4IGSptxvTT3P7J13WwdYB+2maSsFG5sUzM55I3P7QJGcOM/loO2+mEa+k1AmXVgwszj3s8Zpy7bplEiUQp4Krpux743zJhfHXg7GNXl4Jz8Mi3TRIIJNntFvDkiRZ9kmwTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCVQJg06GbuowpJlRPy/MRkQzeiJ2cZeKMM/16EVIsU=;
 b=niNfYW3fMThwZNVeeo0AUpRCC0WtayUN5CTxRdprNdqAFFXKb/dL91bc5SBVKGHoV+0iFJu0oMvXVJcv7P+LEGTObm7P0LCp4axbQ/BHFSjdkgEFesy1o8MpdfAUG5NpRnlMQo/+TEMoIGVZ4WqRyaZO+eF8FjiTBE/Q7boAIr48EHX0HH/LS4CY4JZzFDsOveYQ2u9kUMtLQc8h9+CkItaj18/oX/9eL7HFXiEMay+8RC4iKmbKhFlN0EhNmyg6uRhdzewCi/lzkGa+mBnHXV/3ET5yax0NTjXJlQdOd+Mj7qM+Lh5777uzPgK2CdISpSI+feI7QF1BkBignz0u3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCVQJg06GbuowpJlRPy/MRkQzeiJ2cZeKMM/16EVIsU=;
 b=fMD1AK/dlCM7Euzpedd7n1w2Dx6pNK9wrmf33RaXMPlWu+aVgPkVF+2gAk90ZbEoRcFJAonif3PAa2dn6WEBDlY61dyQdYTNsbn1AflwjYcZobxjyAzLcgyLv5EHzumqcMuw5zEZZ9qh/zygOPM2DQum0zSQU7gK/XpmVy6BV6A=
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
Subject: [PATCH v3 6/7] xen/mem_access: wrap memory access when VM_EVENT=n
Date: Fri, 21 Nov 2025 17:15:53 +0800
Message-ID: <20251121091554.1003315-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121091554.1003315-1-Penny.Zheng@amd.com>
References: <20251121091554.1003315-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|SJ5PPF6785369A4:EE_
X-MS-Office365-Filtering-Correlation-Id: 76279ca3-9a37-4e95-68b2-08de28deaf81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zMC2aX2fmYaMHSAGx3mIsFkZgWBuctKWo31pitDQkdNnIZmQ1wcjzSbHSbuL?=
 =?us-ascii?Q?aHAWlNqn8L88RhBuu9cDYjwNr+tzhDtRIPEMhlw4eGOhTYAWH6Es4qYfo9mN?=
 =?us-ascii?Q?YzF5OnkrPxT/AlGwdVTp46qYRsce56QsudOLNMuwzJGtkQwYVr+2RYpMCYYQ?=
 =?us-ascii?Q?kxZuxXxN/ORLu1iVM8pq7p8GSl6YI/bRV37LCqse9PA/UlVp+76ra+NW6hwZ?=
 =?us-ascii?Q?vK43WRQlpSLn1l4kW//p6mZA42JucAm/Nmz4SFavy7i286qPS6a2RUivO0pi?=
 =?us-ascii?Q?ZV7ReNDESd5aycI1cOHZm/n0qNE6oLGTJN/J4SzzIXj23Q4vAoH1NZekYGc7?=
 =?us-ascii?Q?knKewGnZA4/pk2oMXKaMEm5PWWJYLp5aIrOIdGtCUmQNVu8YxK8n5YfbsBZ7?=
 =?us-ascii?Q?982pNwJw08+g3SBwOU3Gmv1BoRB5EaNOEaNfs5jhPMwP+AgLC0BXw/H6Tb+p?=
 =?us-ascii?Q?T6oQ41fn31A/S/RgihHw42xAOkHTB5xOLGP71VDQzvqmDLOOvBXfwP5VWGrf?=
 =?us-ascii?Q?KR1JLMv+paBZtWiA354SCS8QmaXJ2AW5PL3JAQm3AGY4nlKR0+D+ieXTOlrv?=
 =?us-ascii?Q?EfdpkDggeAg2YslVif6UUUiYEjnVkkdbjqMNIIBUyBAaVm23HJfG3D1lld9n?=
 =?us-ascii?Q?rNqj18Wo6GqE1stKCuS91Jcq39dkOgbwd6XNCQDJCY0OQ+Uf9Ibs4kG7++e2?=
 =?us-ascii?Q?5KTub6yNIivPfI2ekMT5Y9lY9VxmlCnhHKuuueUOGQkWN4QHdCbqdiJlxuAX?=
 =?us-ascii?Q?sG1DnD7xqlNSQR+zM2N+oSr78FL0jB7QEwmF7ssR3N1bEDkBVCO7rSGFXeRm?=
 =?us-ascii?Q?8WV1LyAE+UxEWOlkt35Ew6pNtZyn2q89RZ+o0ETsT1oJ2VaJBkJnCdrlN1Fn?=
 =?us-ascii?Q?vGR6b+jdm1X1uQdGYXkh5XjTg7U3bJ6/5iO/8bfcMqFWf8xit7w1hQ+2Zc1C?=
 =?us-ascii?Q?Qooj+kiGB4AJpby8pzgGWDS8nsVovoUkwMchCcDyN3MnA4AX/KOe61Hb7JE7?=
 =?us-ascii?Q?7gOWBNZESUC227bmVA2jzLempzBGg+UqVMbhy/DT6lORnbBLbxHGy3WsZQbr?=
 =?us-ascii?Q?TOmqk9bB5rGVH+j54yyZlzKHVJxx1U5AcVwPepQOrbc/O5PksbyX4YhAPv2n?=
 =?us-ascii?Q?R3a2cOTzGS+YIsjL2hp1PAnNvenVPJLaBlHk6g3JjpU/bcPgnnU/VH3Mm+nX?=
 =?us-ascii?Q?tjOSuQAqksF1t0ewCTdKXjljTR/pFob500cUiww60/NJcwzrBvbN0YNLUj1V?=
 =?us-ascii?Q?I3DsPyXtwNh6qUjO138D795wxKDr7sCdleX0k25tdstuCsCs6VDNBobM1rkA?=
 =?us-ascii?Q?tOowv6c2YWqCbvEf58/4ClEmFTchHCTSXHJAD4QxQytcQE5D47mDOcx5H+jt?=
 =?us-ascii?Q?E/EfEsJn9FBdkjvtoMBJD46z1uIe5KymoDKU+MS4SbERYRghP10TAoO08iYT?=
 =?us-ascii?Q?AuBUUWEFnEIvcjZiIEc63lU5Zh6maIuusN7WyaoePEn6upklDl49aLcqJBU8?=
 =?us-ascii?Q?Ba3FN6CwO3vln/+kbiLxvT6ujCSIopWLSkW502j81tFSnSRAdj++pQ0Ju90u?=
 =?us-ascii?Q?yPTda5exxsLlythXQro=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 09:16:42.4735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76279ca3-9a37-4e95-68b2-08de28deaf81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6785369A4

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
v1 -> v3:
- a comment next to the excessive condition
- use vm_event_is_enabled() instead
- avoid heavy churn by using the inverted condition plus break
---
 xen/arch/x86/hvm/hvm.c                | 25 ++++++++++++++++++++++++-
 xen/arch/x86/include/asm/mem_access.h | 10 ++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index aa14101241..8509b53585 100644
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
@@ -2080,7 +2081,11 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
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
@@ -4802,6 +4807,12 @@ static int do_altp2m_op(
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
@@ -4811,6 +4822,12 @@ static int do_altp2m_op(
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
@@ -4842,6 +4859,12 @@ static int do_altp2m_op(
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


