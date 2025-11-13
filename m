Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DABC5583D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 04:17:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160544.1488682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJNpv-00053B-TW; Thu, 13 Nov 2025 03:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160544.1488682; Thu, 13 Nov 2025 03:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJNpv-00050Z-Ov; Thu, 13 Nov 2025 03:17:27 +0000
Received: by outflank-mailman (input) for mailman id 1160544;
 Thu, 13 Nov 2025 03:17:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWJc=5V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vJNpu-0004P7-En
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 03:17:26 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 412c9694-c03f-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 04:17:16 +0100 (CET)
Received: from BN9PR03CA0288.namprd03.prod.outlook.com (2603:10b6:408:f5::23)
 by SA1PR12MB7410.namprd12.prod.outlook.com (2603:10b6:806:2b4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 03:17:10 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:f5:cafe::f6) by BN9PR03CA0288.outlook.office365.com
 (2603:10b6:408:f5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 03:17:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 03:17:09 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 12 Nov 2025 19:17:07 -0800
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
X-Inumbo-ID: 412c9694-c03f-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqgPmJbnNtuJ6ZcFconha4N3tx4WzJxVfW0TTciNvA1tcUuH486uJUaKriWDJ3mcd9YXtdsehBZPcXOXtYxt2NYUpBVfYUigjfgkX7wnFUlw5AVsWvuU1ZfyNZyUTdTzsr1wqHdR/INpsayES/OHQ/eP8LKCrQMLb4W7k0NY3SdWtZCos29gIiEyAgqoipVbfEFfFl4AoTkV6YsEpL7sVIlAD3xMh0UE2gTWoM1eEI3+G0tWbtmfmPMIx57A2lbV1r7NCI2XscOvNbbiXMfJvkuunh8Wi+SHr/vCQgXXZXrfFk7R/HHmwy3m2Fek1mTpnRlcKue/u1eDA8JwgT5Jgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LovvxR5KePvF7Qho1obVT0p6ABqutOpA3RIDRtk+eM=;
 b=vjT0ab0+GtQYkyfnq7x+ZMEJm8+kA4zGubabcpBSyelXKyTIojeOSdHFr5hIL5NCZMYyh65XP2LilcqSQcZY1mhEP2ppXvJdG+U/LKp0TlW84RB4DHi8ZKVlz0ZvEJAL+1VjwC1i9mv+CYnygBpz+T6z7ljbwZa5a/qyIGMwDR/KWpvHs8bPBmxmyo9lQUPtVBqFHL5Fb7rG84yddcpB1d8PU7GgSQnlpnM7m4euk8VXT4EC1kaGbQAeTU9bcd9MuKbN18PhkeFoxsxwsdD+sXRhq8GYZ16AqQhP70C4LqhCZlNVFNu9h4T/9PmH6owFK0rpDzmNvhU07+F0PmPLdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LovvxR5KePvF7Qho1obVT0p6ABqutOpA3RIDRtk+eM=;
 b=juhluuaTvIjzNCMrV7mXbO/P8TSeYLrMNrn5BT4bCccCpgzV1Cywj9iHYzbJfaWBzh7QxSJy3vx7GgTIcWPMTzzStTjiFl13Y9qCE5fxVGenLM/e0bNkSG/Zy8CMgLk+sv0OQ6N4wmS3LmE3atYHtSI33L0i/L9XPWroJED7XQE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, "Alexandru Isaila" <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v1 6/7] xen/mem_access: wrap memory access when VM_EVENT=n
Date: Thu, 13 Nov 2025 11:16:29 +0800
Message-ID: <20251113031630.1465599-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113031630.1465599-1-Penny.Zheng@amd.com>
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|SA1PR12MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d405d3c-89d2-4f87-75c8-08de226321cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1n3pkVSqs+kAFjPK2dEkwUPMma8OaBNJqj/X2Gt6xGpu3SDH9wIkGbRXCNCU?=
 =?us-ascii?Q?Zd9qnL+kbKz53UU8b1OEkCkDqt0rvwkpR/n98Sm1fg4BC3FZDPMXZVyQ83wz?=
 =?us-ascii?Q?9Yly0l799khKNIJ88FwinP4anR63QxBweD2mp4F6AYI+d+0c68sH38mCJGK/?=
 =?us-ascii?Q?2+tbjj6ZUyFM8dsKpWgKCE3pgcw0yjuuANG6K5q9UnSiDPLeweVaT8iEA5Dl?=
 =?us-ascii?Q?OgYHgyh9YCIowEdJgdm0BQYy3Vm70aW/WptLXD7eJ9y0tkPyL++uV648RalM?=
 =?us-ascii?Q?kx8tVOHxYayj+3/nzyCJwjYurvpjq83C/aUdG5uDsOPj853gNMAdxWiETM4f?=
 =?us-ascii?Q?mZE2SWc80CudYpzIwEFABUPwozUTqcRsuSclFADUt+oM04MtjscoXmb+SsSf?=
 =?us-ascii?Q?qg6QUZ03XLelxsteAm9p6jFTTsKQQNCAYBj8L7aUviiGfFQ1EFyrV/+m5QBO?=
 =?us-ascii?Q?qC0HnRRPVGcZ8PWnse6V5SRUq/V1s/AoWuy413lRIb9DOSLSahYPFuZiIA5I?=
 =?us-ascii?Q?v9Q+iRAAEzP6j598zvCsEMWQLma2Q4fVP/XYh8z8T6V5J/5xHqIQ5CosRcUT?=
 =?us-ascii?Q?s7eDzHQZZoKZhmrOja8kv5YBGTKDwsKACdSdIeisN/8Z+nhlFhXCHTX26Jaw?=
 =?us-ascii?Q?6l406k9Y2l21sBIsl/tHJQdJn5ildLa7uV4hypM9DH5cea0D0z7h4A+Iw2Jc?=
 =?us-ascii?Q?9FK0PbQOb5Svv0GownNco1myI/UqcehMtJ865jqbD3yaSksJe+/gT9chnneg?=
 =?us-ascii?Q?qJyIgo6J1+UTEsjDnVDl9bYE9MtE9zGg3MvovUmHjVP7PY9p9dp+pvdaiiEs?=
 =?us-ascii?Q?pePIpVuHrI76dzv1SwlgL4zG5Ql6w8uiuPa11wqIkbTRH80e4pUH1tUg+caR?=
 =?us-ascii?Q?g0MDvdPtH9Rey8QUa3tBERPo6artAWoYWt4tjXuAJXBIbipPZa5oaBnvdNyV?=
 =?us-ascii?Q?uNOJD9Sc7st6nxaYHKptcWXfTAeeoKjNkH0kqVj8iK8rbm83UclhiLuRkg/r?=
 =?us-ascii?Q?tCq1gsKWl04vJsi1ytAJ4Eee+SWjmyaX+0NsddOPcQUslLNggrFqo7NSA6bm?=
 =?us-ascii?Q?PKnxZjM8nfCP4mZ1eXZT8ndCC43gVV+9BwXFEa3VoIFOarthaIGnXfc9h7oo?=
 =?us-ascii?Q?+V7E9KKkGKIstBq8BNyCsvtJj8vL5bRWPUdMkrOgtyHYUACrdNISQZ8YW1x5?=
 =?us-ascii?Q?t1O1y2UT/7/KZqrlN4Luo5Gys+uEFyAO1+UCY2zckfoQ/K7jdera3ycJuv0e?=
 =?us-ascii?Q?zahunfsBGPf+WsZrts6j60LXYw3ly3tHnvKORu2ZDx8TbRgPDN2MHVvzD2IW?=
 =?us-ascii?Q?r2pU0Q8bcpUbXS79oKg9npf+E6u2CPxcermrqlbE3NjN/E+H+tZQZG55HPjS?=
 =?us-ascii?Q?wwOTjkeQv/hS0XhQIE4w9hFGUuJ9VKM6g8xNv5+oPPG+p64PHOp6vraqTzNz?=
 =?us-ascii?Q?9k7uxPotSQiI+Fmnup29qqahReYctzTvzwuKT7HK07xuDjJhJKoqc1X1BNf7?=
 =?us-ascii?Q?Ju4Wn1AesdLlNEqlq4u+w0la08GPBznmsOX4H8snMWy1YP6nXglMB4wavnyz?=
 =?us-ascii?Q?LutIpGfS5L5n3tkHrTI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 03:17:09.6919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d405d3c-89d2-4f87-75c8-08de226321cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7410

Feature memory access is based on vm event subsystem, and it could be disabled
in the future. So a few switch-blocks in do_altp2m_op() need
IS_ENABLED(CONFIG_VM_EVENT) wrapping to pass compilation when ALTP2M=y and
VM_EVENT=n(, hence MEM_ACCESS=n), like HVMOP_altp2m_set_mem_access, etc.
Function p2m_mem_access_check() still needs stub when VM_EVENT=n to
pass compilation.
Although local variable "req_ptr" still remains NULL throughout its lifetime,
with the change of NULL assignment, we will face runtime undefined error only
when CONFIG_USBAN is on. So we strengthen the condition check via adding
vm_event_is_enabled() for the special case.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- a new commit split from previous "xen/vm_event: consolidate CONFIG_VM_EVENT"
- use IS_ENABLED() to replace #ifdef
- remove unnecessary changes in compat_altp2m_op()
- strengthen the condition check to fix runtime undefined error when
CONFIG_USBAN=y
---
 xen/arch/x86/hvm/hvm.c                | 97 +++++++++++++++------------
 xen/arch/x86/include/asm/mem_access.h | 10 +++
 2 files changed, 65 insertions(+), 42 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ebadcf2289..c3417b0593 100644
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
@@ -2081,7 +2082,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
 #endif
     }
 
-    if ( req_ptr )
+    if ( req_ptr && vm_event_is_enabled(curr) )
     {
         if ( monitor_traps(curr, sync, req_ptr) < 0 )
             rc = 0;
@@ -4862,58 +4863,70 @@ static int do_altp2m_op(
         break;
 
     case HVMOP_altp2m_set_mem_access:
-        if ( a.u.mem_access.pad )
-            rc = -EINVAL;
-        else
-            rc = p2m_set_mem_access(d, _gfn(a.u.mem_access.gfn), 1, 0, 0,
-                                    a.u.mem_access.access,
-                                    a.u.mem_access.view);
+        if ( IS_ENABLED(CONFIG_VM_EVENT) )
+        {
+            if ( a.u.mem_access.pad )
+                rc = -EINVAL;
+            else
+                rc = p2m_set_mem_access(d, _gfn(a.u.mem_access.gfn), 1, 0, 0,
+                                        a.u.mem_access.access,
+                                        a.u.mem_access.view);
+        }
         break;
 
     case HVMOP_altp2m_set_mem_access_multi:
-        if ( a.u.set_mem_access_multi.pad ||
-             a.u.set_mem_access_multi.opaque > a.u.set_mem_access_multi.nr )
+        if ( IS_ENABLED(CONFIG_VM_EVENT) )
         {
-            rc = -EINVAL;
-            break;
-        }
+            if ( a.u.set_mem_access_multi.pad ||
+                 a.u.set_mem_access_multi.opaque >
+                    a.u.set_mem_access_multi.nr )
+            {
+                rc = -EINVAL;
+                break;
+            }
 
-        /*
-         * Unlike XENMEM_access_op_set_access_multi, we don't need any bits of
-         * the 'continuation' counter to be zero (to stash a command in).
-         * However, 0x40 is a good 'stride' to make sure that we make
-         * a reasonable amount of forward progress before yielding,
-         * so use a mask of 0x3F here.
-         */
-        rc = p2m_set_mem_access_multi(d, a.u.set_mem_access_multi.pfn_list,
-                                      a.u.set_mem_access_multi.access_list,
-                                      a.u.set_mem_access_multi.nr,
-                                      a.u.set_mem_access_multi.opaque,
-                                      0x3F,
-                                      a.u.set_mem_access_multi.view);
-        if ( rc > 0 )
-        {
-            a.u.set_mem_access_multi.opaque = rc;
-            rc = -ERESTART;
-            if ( __copy_field_to_guest(guest_handle_cast(arg, xen_hvm_altp2m_op_t),
-                                       &a, u.set_mem_access_multi.opaque) )
-                rc = -EFAULT;
+            /*
+             * Unlike XENMEM_access_op_set_access_multi, we don't need any
+             * bits of the 'continuation' counter to be zero (to stash a
+             * command in).
+             * However, 0x40 is a good 'stride' to make sure that we make
+             * a reasonable amount of forward progress before yielding,
+             * so use a mask of 0x3F here.
+             */
+            rc = p2m_set_mem_access_multi(d, a.u.set_mem_access_multi.pfn_list,
+                                          a.u.set_mem_access_multi.access_list,
+                                          a.u.set_mem_access_multi.nr,
+                                          a.u.set_mem_access_multi.opaque,
+                                          0x3F,
+                                          a.u.set_mem_access_multi.view);
+            if ( rc > 0 )
+            {
+                a.u.set_mem_access_multi.opaque = rc;
+                rc = -ERESTART;
+                if ( __copy_field_to_guest(
+                        guest_handle_cast(arg, xen_hvm_altp2m_op_t),
+                        &a, u.set_mem_access_multi.opaque) )
+                    rc = -EFAULT;
+            }
         }
         break;
 
     case HVMOP_altp2m_get_mem_access:
-        if ( a.u.mem_access.pad )
-            rc = -EINVAL;
-        else
+        if ( IS_ENABLED(CONFIG_VM_EVENT) )
         {
-            xenmem_access_t access;
-
-            rc = p2m_get_mem_access(d, _gfn(a.u.mem_access.gfn), &access,
-                                    a.u.mem_access.view);
-            if ( !rc )
+            if ( a.u.mem_access.pad )
+                rc = -EINVAL;
+            else
             {
-                a.u.mem_access.access = access;
-                rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
+                xenmem_access_t access;
+
+                rc = p2m_get_mem_access(d, _gfn(a.u.mem_access.gfn), &access,
+                                        a.u.mem_access.view);
+                if ( !rc )
+                {
+                    a.u.mem_access.access = access;
+                    rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
+                }
             }
         }
         break;
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


