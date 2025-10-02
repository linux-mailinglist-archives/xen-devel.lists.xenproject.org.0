Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96ABBB419E
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 15:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135860.1472791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Jn1-0000fL-7X; Thu, 02 Oct 2025 13:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135860.1472791; Thu, 02 Oct 2025 13:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Jn1-0000cU-4C; Thu, 02 Oct 2025 13:56:11 +0000
Received: by outflank-mailman (input) for mailman id 1135860;
 Thu, 02 Oct 2025 13:56:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oua8=4L=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v4Jmz-0000cN-9R
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 13:56:09 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ab7b49f-9f97-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 15:56:06 +0200 (CEST)
Received: from PH8PR15CA0024.namprd15.prod.outlook.com (2603:10b6:510:2d2::9)
 by SA1PR12MB7443.namprd12.prod.outlook.com (2603:10b6:806:2b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 13:56:01 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::59) by PH8PR15CA0024.outlook.office365.com
 (2603:10b6:510:2d2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.16 via Frontend Transport; Thu,
 2 Oct 2025 13:55:56 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 2 Oct 2025 13:55:59 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Oct
 2025 06:55:58 -0700
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
X-Inumbo-ID: 8ab7b49f-9f97-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNjBg9Jpx4GLSlXc556qp9c3MhlFWqwMsa+JV2lJ4fjm/Sv4Aig/8tDHj7d9hVPz+myrRywKjDn4lV4oqVBcA6vj1RHcZN1HLGR7wmLkbpJsnnxndafLI+w/nXFr8mMXIrxL57L7K7FhkHCnsfzn53v9zaG4EaizBTSoEtUHoMbwFLs1sU2oyDouINtwF/twfCS6IhEdBiNstJeccT4nBhDlVC5I4PuOr/9/1qWZNe9V/9vxmR5ZNkQsBm7HI+eXGU7NCPjltN2PVRr2ck61RzRu86zqJmbmot5pi5JL5d6VMFnwb/n0E9BoLeoZrj/FiQZiiU0LPsPk6I+ZFTGLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrkCPxfsenLoTP5XQkO+LdpiBn8mkFqedF7ORoCKf2s=;
 b=Uw5Z5gPwDrgw3D5jDdUzRTdPsk5KtacZJ7GSBv/0bLM8Ac7/v72Gkwp3037+5oZhyvcno2rf86NY2xkd8x5cF+ZrMuVHxXytEiFqUmLBt6Bn+5jxFI8XxQiXEFIhdMWbB3dLHwEcKusyOY/Qij33EhBdSOb8TycmcaEqwCObQxb7Zh4OrNqDMAbhtRq6nbXfacEKJTb/WNhBbdr4CLZ1KcQU1tp1GEeEq8NrZjaID5L9dLS+QUnIfqWSnvBy4JZ/ydBGmRK4Q/CZpgbxmJa1PgU/6d6Ud52ZPnEXQ64rbSHOk2slMWjUib/SLfYv8rK1fTSSiuNOEojiAkjSmK7Euw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrkCPxfsenLoTP5XQkO+LdpiBn8mkFqedF7ORoCKf2s=;
 b=OYzlkeFl4ehuJexp+crh27d0ZI5ZuvMMQYeoD8QErchKlEtNwrm8K/e6z/zeCcgbFPAEFHViscL2dYAPeeacEpPOqWWBp9Tk2fzaVXXD3/zt7k5ZGAWW5TcxGnBdECHCaN751chKW7WCRllWlE21G1vVEMZTifbGPX1oME1KJIc=
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
Subject: [XTF PATCH v2 2/2] x86: Allow exiting QEMU in TCG/QEMU
Date: Thu, 2 Oct 2025 15:55:34 +0200
Message-ID: <20251002135542.28076-3-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|SA1PR12MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aff8f9e-fbf2-4020-1174-08de01bb6b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lrgJx0jf1+QZ5U+TCVf1mHoSFhHtqcJqH49WR/nBH3RKWxSwsb2DIEEVuxZp?=
 =?us-ascii?Q?9buocV0ibyeufybfFY5MjVGnsC88O+LK9rjsQgOVt6O9BRcuxlAFizyOEbvX?=
 =?us-ascii?Q?k8cFVuS14FDuX+MjwWHwg89Jzb0DWJRLgvfBfYIelRdWnwj5VSiZCYX/5AST?=
 =?us-ascii?Q?CghlOSMw+ASGPPNh6exs7BPYE8xexE/o+xHNnFGmTEz3uAH3XMidQv+47zYn?=
 =?us-ascii?Q?QFkqGaGFppXaeokRY2+wHDMctKFgb3ZYJbM2J/BkfPawcDt7lLWtxXz0gRcU?=
 =?us-ascii?Q?vbLS2HQrTduuy9PXIPulK+RGaNtKNQiAr/E+01QNPmR5HlnSDi+PVEjVw6zB?=
 =?us-ascii?Q?x96MzHvAAFGMFGHA+f43M4VgpSl5Hjn8PfYB6EKyI6dNAHSdSQVlhNJ8HOxN?=
 =?us-ascii?Q?IjE0Dpqw4L25vRQOG/4X/VfwN9qXKtkQJ6KBNq3DfneS+mNs2bvPHJScc9mS?=
 =?us-ascii?Q?zNxLTn0dWC4UYfjgPplqZ2sqKWYMBmHS5sSYvOqB83dqSlosWOCy89+1lPf+?=
 =?us-ascii?Q?58x+q5ULV8RhqFodmqmLzUQNk7DOZXYAJ0TwXOrqRI0NH6uQaawKQmsTdkBv?=
 =?us-ascii?Q?0Garb83irJu19kCCTeyJAtRux1c3sFBMuCdys1IOEdS2rJwM2mUAhoxXLL+E?=
 =?us-ascii?Q?k08TEiMwn6BEMKB0ldW+7hsibxEFzIp8BqA1tUw5/c8tT51Dr2jF3gnpF61V?=
 =?us-ascii?Q?92kI7sRlTibyC2PjPKw0ChmOj/sgK2CX4aAVo6AG8kjd8YbqDuKierj4Pwve?=
 =?us-ascii?Q?wPz6aebVopySsMuTwn3SSQ0vgwjpMWqr5n+Ze8pL8L85qSFFMVZ1E7cmCKwW?=
 =?us-ascii?Q?0nAnEBWAOYV2gi8Ch//o9NHyroFVdFNYFjsKfroPeB6Ii0KaAsT9pbEmkuK1?=
 =?us-ascii?Q?5NFU0rJ0u6OPZfAeenaaUA3c4W1wISpUPo4GbT7xQqEz24cGOzhsvgZJYJxq?=
 =?us-ascii?Q?5ufegjCJWV35zDovi7jFhgggiYLv+i1ApbN+sslHp7cVhZLM7P4KLKejXgb3?=
 =?us-ascii?Q?ikJnLBanwgSpw08wwELVwcI2fv1FJtJz+yCWl1l4HDIF1RMGQ91KquG6d0+g?=
 =?us-ascii?Q?NFYxb9odvR1ll1M8Owwlt+xNixRps/XH7zcKwtL9krYfkuU/HP9CUBHiYLPn?=
 =?us-ascii?Q?JtFIBOFk1F98pG96quK9D7hx2ILyJma3YHdhzKt3b0ctpUxUJDRdhK+mGAOL?=
 =?us-ascii?Q?om8wl0Pun4XRkhsacMbtJSyI47c+GcEc/2VXgfGHtLJUlFRlGUL8o52KhMCE?=
 =?us-ascii?Q?JQG7equ641yn0R6EaohHqtfnECOkcLv9pUbxUAclMh3aMgc+v8HpouEBcZEY?=
 =?us-ascii?Q?e3/pY7Hx5ave7iGhfBnoUnYysrov85Vldn8GoaFfA6acYyp1DRb0msv1oThe?=
 =?us-ascii?Q?FyVwzR/X5NgiNnUlwv5xJVadKvKqqArcEDfmTSKkeYusyRfk0fb1Gjc+vX5E?=
 =?us-ascii?Q?+ElUf4nrXT1okzFHRuislPhcRUfAVT7bWeBs7dim5+/sQrmh6R7zu+2+KJ3l?=
 =?us-ascii?Q?le15rDXSfsWZaQzR+PvJDIrs5tbxLXcgh6kUaODvEGQOVTNEolP8W5K5jsJ9?=
 =?us-ascii?Q?7oKo7/dH/3mWrAdDxiQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 13:55:59.9131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aff8f9e-fbf2-4020-1174-08de01bb6b0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7443

If QEMU has a debug isa-debug-exit device, we can simply write to it
to exit rather than spinning after a failed hypercall.

While at it, reorder an out-of-order include.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 arch/x86/hvm/traps.c    | 16 +++++++++++++++-
 arch/x86/pv/traps.c     |  5 +++++
 common/lib.c            |  2 +-
 common/report.c         |  8 +++++---
 include/xtf/framework.h |  3 +++
 5 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/x86/hvm/traps.c b/arch/x86/hvm/traps.c
index ad7b8cb..b8c4d0c 100644
--- a/arch/x86/hvm/traps.c
+++ b/arch/x86/hvm/traps.c
@@ -1,5 +1,6 @@
-#include <xtf/traps.h>
+#include <xtf/hypercall.h>
 #include <xtf/lib.h>
+#include <xtf/traps.h>
 
 #include <arch/idt.h>
 #include <arch/lib.h>
@@ -139,6 +140,19 @@ void arch_init_traps(void)
                virt_to_gfn(__end_user_bss));
 }
 
+void arch_shutdown(unsigned int reason)
+{
+    hypercall_shutdown(reason);
+
+    /*
+     * Not running under Xen. Attempt exit via the QEMU ISA debug exit device on
+     * its default port.
+     *
+     * QEMU's rc is (reason << 1) | 1, if "-device isa-debug-exit" is set.
+     */
+    outb(reason, 0x501);
+}
+
 void __noreturn arch_crash_hard(void)
 {
     /*
diff --git a/arch/x86/pv/traps.c b/arch/x86/pv/traps.c
index 66ef40e..913bab2 100644
--- a/arch/x86/pv/traps.c
+++ b/arch/x86/pv/traps.c
@@ -206,6 +206,11 @@ void arch_init_traps(void)
         panic("Failed to unmap page at NULL: %d\n", rc);
 }
 
+void arch_shutdown(unsigned int reason)
+{
+    hypercall_shutdown(reason);
+}
+
 void __noreturn arch_crash_hard(void)
 {
     /*
diff --git a/common/lib.c b/common/lib.c
index 7f1813f..f4de22e 100644
--- a/common/lib.c
+++ b/common/lib.c
@@ -25,7 +25,7 @@ void __noreturn panic(const char *fmt, ...)
 
     printk("******************************\n");
 
-    hypercall_shutdown(SHUTDOWN_crash);
+    arch_shutdown(SHUTDOWN_crash);
     arch_crash_hard();
 }
 
diff --git a/common/report.c b/common/report.c
index ffdf098..158876e 100644
--- a/common/report.c
+++ b/common/report.c
@@ -1,6 +1,8 @@
+#include <xtf/framework.h>
 #include <xtf/lib.h>
 #include <xtf/report.h>
-#include <xtf/hypercall.h>
+
+#include <xen/sched.h>
 
 enum test_status {
     STATUS_RUNNING, /**< Test not yet completed.       */
@@ -124,8 +126,8 @@ bool xtf_status_reported(void)
 void xtf_exit(void)
 {
     xtf_report_status();
-    hypercall_shutdown(SHUTDOWN_poweroff);
-    panic("xtf_exit(): hypercall_shutdown(SHUTDOWN_poweroff) returned\n");
+    arch_shutdown(SHUTDOWN_poweroff);
+    panic("xtf_exit(): arch_shutdown(SHUTDOWN_poweroff) returned\n");
 }
 
 /*
diff --git a/include/xtf/framework.h b/include/xtf/framework.h
index 95de195..e852882 100644
--- a/include/xtf/framework.h
+++ b/include/xtf/framework.h
@@ -16,6 +16,9 @@ void arch_setup(void);
 /* Set up test-specific configuration. */
 void test_setup(void);
 
+/* Stop the machine. See SHUTDOWN_poweroff et al for reasons */
+void arch_shutdown(unsigned int reason);
+
 /*
  * In the case that normal shutdown actions have failed, contain execution as
  * best as possible.
-- 
2.43.0


