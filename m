Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26C2CB7D9E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185123.1507400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuew-0005Zz-Td; Fri, 12 Dec 2025 04:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185123.1507400; Fri, 12 Dec 2025 04:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuew-0005Yg-QB; Fri, 12 Dec 2025 04:21:38 +0000
Received: by outflank-mailman (input) for mailman id 1185123;
 Fri, 12 Dec 2025 04:21:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuS0-0007SS-UV
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:08:16 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e1a4448-d710-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 05:08:15 +0100 (CET)
Received: from MN2PR03CA0005.namprd03.prod.outlook.com (2603:10b6:208:23a::10)
 by IA1PR12MB8539.namprd12.prod.outlook.com (2603:10b6:208:446::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 04:08:10 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::76) by MN2PR03CA0005.outlook.office365.com
 (2603:10b6:208:23a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Fri,
 12 Dec 2025 04:08:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:08:10 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:07:25 -0600
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
X-Inumbo-ID: 2e1a4448-d710-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVVKg9/Kw+eVhdLtv02KYsLTdREQg1Ub5VkLEvgEFLpzxTCwhh1a1Z8nZVBwMKEO89kM2WlEyC7+oMvMU0GzBtQnxuk0xpAo0yQ3M58YJ0G/zQEmJjLJQ/VvI+XEkp7WvNsRvZin+5U02boWFX4KMK9ZvUkiNYV5itTFjGo1+rY8LzVLzjsL7tkU8Z36kon8Km075JVafMWARgTMtVJJcP/+h66PRjfOh8YaQkGlDwWyIRWEY1CMsA3H8/UkjrNjoxZvVeMT+fzbLmABiLRywQrAlRxaYpE2K9h5BymEGLd5RA+Kw90jR46gBOFGSf471EHARmkUq/qsxSXMoGnvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeiH6+Z+OiU86ZAPkaW9D/QiTAcCg9U2zSCm9FXdi9c=;
 b=qjaA8sHQQEWvZyy86FUol40iRgxZem9iIWkDs+hByDnTGAHgkd6dv9Eqa4aeDoR7Z7UHgGHyNH9579zAtZqqnddiK2gsK0rhq/i6496wMLbhBKxxcEK1fbf4g5v7slKCyE1wRm2R+AY/4FwHsnftwZHKYh/nAOtf14SyfVDmSB3296QTCMHBmbV4qlrJS29Ktg2TGeGN0TjebDDY22QXOop2IRtL9eZC1ogFuAxYgxFGIXBkI3Rpd1prPJ7d/cPbUjj/rkwGmXMiEDUKXINioXRJJC8wlTTCbolqv4ZsSQiFQlWtdVfTpyvlpp43pSr9qFayVvNKg9lKMgQM9frd5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeiH6+Z+OiU86ZAPkaW9D/QiTAcCg9U2zSCm9FXdi9c=;
 b=QPZNRx1SRupFBknzoILKF7cKFZ4GSynxCUPNyjkZ7TjoqdAhNznvKTZmFmNdVYr0G2KpH6Xn4IjQi5SgdASR3eu5SH4l8RblxLvpYftIehWg86W0URjznYQjHAzrj93+B/xFiisVu6ALvsWuATmeRBQaPfVMXD8hskM+J3zG7KA=
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
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v5 24/24] xen: decouple PV_SHIM_EXCLUSIVE and MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:02:09 +0800
Message-ID: <20251212040209.1970553-25-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|IA1PR12MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e54e11-07f3-4ca9-8203-08de3934100b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ecAJNwxNGcDDb9CMM7azRAkbgy+3eWiEClL37IOGhg+xlVo8XQI/By1gOnnQ?=
 =?us-ascii?Q?CErzSgrznXStZfBOl2Cx2W1/JXEM23o1Gvcec9VS5H5eGPnttMvgyOEAYgVb?=
 =?us-ascii?Q?190PK2DOxRTyiIJPmb19zY43Q1hxc5d6AW3mCCL0ke720XGb51rqdzvWVZb+?=
 =?us-ascii?Q?hN14ef57IKOyKRfPjTJ/paqa7ENWkfI07jh6uANd9+YV08ZICfcYSDbNRX1N?=
 =?us-ascii?Q?f8nywZChj5zCLneFJsVtv6LlpvmsWECtazcPQBaFKkJpfYoxVjlH4jtRpzO2?=
 =?us-ascii?Q?thLrJSTtmE5BkAcztjEfK7HYLs+fYdVrBD7QuqK56jGTn1++2hqmYW4pM/Fw?=
 =?us-ascii?Q?r4F72grAt7hNXghMhS25lPehO5f+aiIWrkJMw7XViu1P+CewzuS8dxlEGtZq?=
 =?us-ascii?Q?50qVrn6gqOv6glm6pHbAlbbbYZZT5SMkA+TM6mEkgJyWn2Xcj1/e6OG0uPeI?=
 =?us-ascii?Q?tAnqGDTUwRFMEMklMGc6dQKZYoji4tRbMRfSlDUUBuLZCSItwCalPJvoPFaw?=
 =?us-ascii?Q?MvSiRtXuzO+eGFYepQGHMBwBkR2PxsJP0/JKjn2udguuoDdyr74FzYHHSc26?=
 =?us-ascii?Q?D8j1EchzJBFWGOapV+qyCg8prAzO7gE81VvwJ+LlDkKQq0z2lCML4LxUtwn+?=
 =?us-ascii?Q?CPN9xupDWGfRDhpLHEA+/hKBZX2wCDnoGVy5DjMvB/gQh3OgvRigz35rZr6R?=
 =?us-ascii?Q?SfjbctRg3Wg4NS1+WfgewblaZ0fVqnuK4iuF0LRT8Q7qaq9q1tHKP5dn4xeB?=
 =?us-ascii?Q?y7PV0A1eQUniHGRlfhj3eJqAYmJImwomi7yTIWkPjIbMqxMUgb/xmT+NzTI7?=
 =?us-ascii?Q?6yyrMNEDjrKlG4rSwWoNSUPlcGw6W5k1Uireh4ePffC06H2AhzxgUF7odiSH?=
 =?us-ascii?Q?/NnxipMXUHdRzgIRV2UITgjU5gBinsz/624WffQvIkIdxfMpjR7XTf7GsJ+M?=
 =?us-ascii?Q?GTdAdrDsirEWl0KnDDqtSm9FqUM7x5xP1ddYOcmOtMce/0KoiP9bmi3Eq6Qj?=
 =?us-ascii?Q?RYVj8wOYlX3xp8AbpzdS7OQKTf29Mr31/H0hVV0TcnzB0+9lBwPNq7Ap8QWq?=
 =?us-ascii?Q?IT9JXhaK6WP7g2srCwetA6kQDq7UJAeTF1+KRLPxRzlICKvp41BMSMCAQ7FN?=
 =?us-ascii?Q?0u7Ub98/S50tyB9JEtgk+7KBXd0hfgbh++ECByHRIus8D8qBGmTm/tjlrJFC?=
 =?us-ascii?Q?5gPg1qZ3wA//iWbJxK0FBwI9/cG+CrAG3EkiPZ0HQXtCLuJk1pG5cBEor0YW?=
 =?us-ascii?Q?QoLUXS/U2twbuYDZ7b3vgRiD/IAQQLL+nBZyzKbwN9aetPbSlnpjfIXCwxgG?=
 =?us-ascii?Q?EE+8RKke0y7Daq9LAKkak6EjgNqvaVFAryHIjPSQ2TVOh83zuKjOrBLP9D9O?=
 =?us-ascii?Q?Awz3oTYtr4GD1pub0l0YqJgSzFxA1P79FI22biwvuqbnYIljeGmyMo+xn7po?=
 =?us-ascii?Q?IIEhTUniDzoJLQIIk/gFRjoxk31GxOD8ObjJBBm/GINARUu7n3hU24CAkJ74?=
 =?us-ascii?Q?IxGD/T7luILwINCGUOYcDcTT+UAOF6+TdaZIt8/g82btrvY2AN/fi2SmPGsR?=
 =?us-ascii?Q?LoQVc4asJRXQ5M0xOMQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:08:10.3112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e54e11-07f3-4ca9-8203-08de3934100b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8539

We try to decouple PV_SHIM_EXCLUSIVE and MGMT_HYPERCALLS, including getting
rid of "depends on !PV_SHIM_EXCLUSIVE" (and related Makefile constructs)
regarding features guarded under MGMT_HYPERCALLS.
There is little possibility that random config may pick MGMT_HYPERCALLS=y
and PV_SHIM_EXCLUSIVE=y, so we need to add !defined(CONFIG_PV_SHIM_EXCLUSIVE)
constriction on paging_domctl() under XEN_DOMCTL_shadow_op-case to avoid
undefined error.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
v4 -> v5:
- Remove unrelated changes on CONFIG_HVM
- add !defined(CONFIG_PV_SHIM_EXCLUSIVE) constriction on paging_domctl() under
XEN_DOMCTL_shadow_op-case
- refine title and commit message
---
 xen/arch/x86/Makefile        | 2 +-
 xen/arch/x86/domctl.c        | 2 +-
 xen/common/Kconfig           | 1 -
 xen/common/Makefile          | 4 +---
 xen/include/hypercall-defs.c | 4 ----
 xen/include/xen/domain.h     | 4 ----
 6 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index d389787bb3..03650049ce 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -31,6 +31,7 @@ obj-bin-y += dmi_scan.init.o
 obj-y += domain.o
 obj-bin-y += dom0_build.init.o
 obj-y += domain_page.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += e820.o
 obj-y += emul-i8254.o
 obj-y += extable.o
@@ -80,7 +81,6 @@ obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 endif
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 6153e3c07e..235fd3b60f 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -216,7 +216,7 @@ long arch_do_domctl(
     {
 
     case XEN_DOMCTL_shadow_op:
-#ifdef CONFIG_PAGING
+#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
         ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
         if ( ret == -ERESTART )
             return hypercall_create_continuation(
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d59e108652..f57a5f00a3 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -654,7 +654,6 @@ menu "Supported hypercall interfaces"
 
 config MGMT_HYPERCALLS
 	bool "Enable privileged hypercalls for system management"
-	depends on !PV_SHIM_EXCLUSIVE
 	default y
 	help
 	  Management hypercalls provide the means for dom0 to manage the
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 9f59f141a8..a0b0705f72 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
 obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += domid.o
 obj-y += event_2l.o
 obj-y += event_channel.o
@@ -70,9 +71,6 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
 
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
-ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
-endif
 
 obj-$(CONFIG_COVERAGE) += coverage/
 obj-y += sched/
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index c9ee5de99e..e7209f8b63 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -199,10 +199,8 @@ sysctl(xen_sysctl_t *u_sysctl)
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
 #endif
-#endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
@@ -284,10 +282,8 @@ sysctl                             do       do       do       do       do
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 paging_domctl_cont                 do       do       do       do       -
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl                             do       do       do       do       do
 #endif
-#endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
 #endif
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 8aab05ae93..11d2505420 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -185,11 +185,7 @@ struct vnuma_info {
     struct xen_vmemrange *vmemrange;
 };
 
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 void vnuma_destroy(struct vnuma_info *vnuma);
-#else
-static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
-#endif
 
 extern bool vmtrace_available;
 
-- 
2.34.1


