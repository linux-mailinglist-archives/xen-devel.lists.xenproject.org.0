Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E84FC789A1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168649.1494640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtL-0005Ii-VU; Fri, 21 Nov 2025 11:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168649.1494640; Fri, 21 Nov 2025 11:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtL-0005H9-Q7; Fri, 21 Nov 2025 11:01:27 +0000
Received: by outflank-mailman (input) for mailman id 1168649;
 Fri, 21 Nov 2025 11:01:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOrc-0008Dv-Hu
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:40 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bcd37fc-c6c9-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 11:59:38 +0100 (CET)
Received: from CH2PR07CA0038.namprd07.prod.outlook.com (2603:10b6:610:5b::12)
 by DS7PR12MB8418.namprd12.prod.outlook.com (2603:10b6:8:e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:59:33 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:5b:cafe::8) by CH2PR07CA0038.outlook.office365.com
 (2603:10b6:610:5b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:59:29 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:59:33 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:59:30 -0800
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
X-Inumbo-ID: 2bcd37fc-c6c9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y795LHqaRSkPETI0WU1hZJvzWj9hi6uvR6B3XZmSLsVw8kUioNCtCBUBzTVuA4t+my7F7f3TX1PiIpvNM8hx+DljU5s15NK7OP/PKtMcydw5RTNG0S4hHYGZGQjegZeRZN0fYO/GEMaUynjX8ezir1HqqwmVthKSE+J3CAEEHOCVkhhPU0Y4Zb5fIknWwnEonv+SFCSMXsw+djh5mFNOHfqM4FDMdUiOfqHbe5yTIJT2QdWzRa91JlKX2rm3A1bGfbB3zKbsiyv0WeQ+vqhBh+BSJ0KaCSi2TFA7WUjT00xWuaaNnP+IJTHl7At1VJRlCdo8gmh9OXCPm6+E+8m2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHVEQoOxexn5927jgQl87XVwlTFpequA1CFs0WVDAOc=;
 b=T9Y9cUQSSOorL3qysJ5IkttF68oK8RMtbW/toLJzV1YmWCm+yOOOw2h3PFp4pYyS8+VHHjymFN6DfqJ58cHboET95Ai51Uph+PqXWgHTfn/JNZqyYBMY7xXZ7I6v6NFwyyDYdiBVCfT7jBb6RZecuiB0uk00FgG5StVDtOyEbmzYKwLt+GFB4sqflN7BGBUz7kHz2I8tDznJeNtS9j3Kqd9iljKmLN9zaPjKr1i++iiLwWB6EIH4NJrMYVTYRDbtIUiofKE8cVOqu+G55DK3bxvm1UdpwmO6b9BtXR1y9/qZNE0/oc9/9rgGAX1ewrI79nId6zniKX5BxIkWlGBeaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHVEQoOxexn5927jgQl87XVwlTFpequA1CFs0WVDAOc=;
 b=DlIeTma2LAtE46q5xigZlQsKxMVwGSuP6Mb1NPYeL78qF/qiZ1ztOdJ97/TM1PTWGKrQDfwerMEdwBBTy8feL5i3k6+uGuVqu/XUnTfE2DIrWu/tSWRhXzLWImmKFNBTwHG95niUzEb+S+n5QEdh3jmoLSIzaJBTPMs2PJTBMdI=
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
Subject: [PATCH v4 24/24] xen: move MGMT_HYPERCALLS out of PV_SHIM_EXCLUSIVE
Date: Fri, 21 Nov 2025 18:58:01 +0800
Message-ID: <20251121105801.1251262-25-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|DS7PR12MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: dec71a68-9a2d-4a12-8258-08de28ed0dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TZ37Ry7dX1DGGGt8mVRegDLWQUKgwUs0uVXD3XBqutNJ8lRsLOmgo8cKzK3b?=
 =?us-ascii?Q?45N2vaZ5BOpuN9y4SOeQunL7sDX4cuOt/UJsRSfwjhQHzJNjiiiONatpQu9U?=
 =?us-ascii?Q?8J37M7zfOw5ycdmeiMzod4fh2AkZfi0Onm+p6p1rvg5cTsdV1k9k7K9obgqf?=
 =?us-ascii?Q?uYVg2CaMbL2dctvvpMdxUB9TA/ifc6AXggykhTeaOmcJI+MQsS+jRu9hF8Kf?=
 =?us-ascii?Q?zUkofgdr5hGu4jHMhi5EVZPNtyHz0QmEZsGrVa8bZm5Qp8DeNz0z0WKT0laj?=
 =?us-ascii?Q?8cDFcAILS5LWjpVWsU77Zkmi/XxYP5JAW1YZ3EQCOURFLIEOWMfOYrwyWb9j?=
 =?us-ascii?Q?7L7+0I08nDnaCJiUJ+UALEFiMsX2t+NofwOkw+ewM2DBA9wdahzwne1pipMZ?=
 =?us-ascii?Q?A1/I3SRPQ5GOBKvBWVhgZvCLGnprNnWrxTKk41YKfjX5a9eTtJB5rGHddw87?=
 =?us-ascii?Q?Upxu8fdjYW6svrkuCqUg9xK0Yk/X8TyLuLRrplPuIqQMn9KicZsdijBjvrNN?=
 =?us-ascii?Q?dt3u/QcbasOKs0L7FAyQXXnaEkcfcxvteSuaQjAkDvHrA1DJYVv+ogim/8/9?=
 =?us-ascii?Q?wMEJz/XH9sUNVzHAK7Xx/gZ5vD4LgzlWkirnJ6dI97eWBZ8+L6ID5U+9zqHO?=
 =?us-ascii?Q?XW/ZuFu2Le1DJ0A1cAdnc7Ev5OvoSm4heAljm2UGuTiaJ9X1aUIt1MEP98/o?=
 =?us-ascii?Q?Z/Y9JDxxJhgMdiByVArjTEBcPyKoy/Lh6loujUKwMmCUuXJBy4GfCBEmlG4P?=
 =?us-ascii?Q?Q/qNVpZFKDZY9GRNAQQaGrOhQISvi3hdSUz1DNLdstlEegla0LPITniY/+g3?=
 =?us-ascii?Q?mNwatBT8gcZNU/+wxmWsRbIE8g1LpHXiOp4pnW1lfOy+epu1DSDoI3osyzR6?=
 =?us-ascii?Q?dzf87BdS07iezX9zH1XGag7in8844ujFo7/THa7x8cOI6sFAD5SQF/BOd9Ja?=
 =?us-ascii?Q?Y5WVxCJBhQeYZy/YFtRJXBCaIhD6iev/hfildIZ3TWxsmK1PGjqXBUyLrH4U?=
 =?us-ascii?Q?uhZJZMznt+jVVGosQGbrVKr/LVblzvi/Fcu7Z1wWY1DbQ6nVf61xXSIzkv9j?=
 =?us-ascii?Q?IGNr1sLVeuwbIAQZbBDoRkYltDGAdVMgknz7M1hwMw0C2HbP322LY//cGyJS?=
 =?us-ascii?Q?NJR5qIXOqkjw1UhN2mNZUQuoMnM18rwxy3LtrYClJxftDU62gShGp7Yc801C?=
 =?us-ascii?Q?q5FF5WfFuoQk1dmTFOe0M1e1g+bcYEdQIM135InS8JudSEcY2A4GKXSgdqna?=
 =?us-ascii?Q?lZb07nb0JC+HzqFbTUGLiu3y+qmlKWe4TGBvH+Dqn4csrP7QlPPpbRm0mSke?=
 =?us-ascii?Q?MnPnxwMe9CIlNBm6qSnJU1RtamP/7V5Q5AR/PN+o5Z8jSBJ8TgpPhz9dyF0D?=
 =?us-ascii?Q?ZsADIQHOaQI7ccH4oaiFvtZN4g7DBUyAxLAZDy705zUbJJOZSHdUTU5cRBoj?=
 =?us-ascii?Q?jXuRePiGPnI1oHQqmKQ0NsY7oaUvt3dBMG4LaToi9wF8Vx9NH3e+zZFe8N2w?=
 =?us-ascii?Q?3KaAyfXfQbgBit3y21+nR6t0Sd8oLKOBENDs3NFEHRr+VcrOCTwdRIEc2Qnn?=
 =?us-ascii?Q?SyIN9wIMKQKTwZa3/WE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:33.5922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dec71a68-9a2d-4a12-8258-08de28ed0dc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8418

As we're aiming at moving away from PV_SHIM_EXCLUSIVE=y, we are
moving MGMT_HYPERCALLS out of it.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
 xen/arch/x86/Makefile             |  2 +-
 xen/arch/x86/hvm/Kconfig          |  1 -
 xen/arch/x86/include/asm/paging.h |  2 +-
 xen/common/Kconfig                |  1 -
 xen/common/Makefile               |  5 +----
 xen/include/hypercall-defs.c      | 10 ++--------
 xen/include/xen/domain.h          |  4 ----
 7 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 006a6e56d3..3aea179838 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -30,6 +30,7 @@ obj-bin-y += dmi_scan.init.o
 obj-y += domain.o
 obj-bin-y += dom0_build.init.o
 obj-y += domain_page.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += e820.o
 obj-y += emul-i8254.o
 obj-y += extable.o
@@ -79,7 +80,6 @@ obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 endif
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 52b22e5d17..3351afc5a1 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -1,6 +1,5 @@
 menuconfig HVM
 	bool "HVM support"
-	depends on !PV_SHIM_EXCLUSIVE
 	default !PV_SHIM
 	select COMPAT
 	select IOREQ_SERVER
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index ba5ba7324e..db3e5b8f31 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -55,7 +55,7 @@
 #define PG_translate   0
 #define PG_external    0
 #endif
-#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE) && defined(CONFIG_MGMT_HYPERCALLS)
+#if defined(CONFIG_PAGING) && defined(CONFIG_MGMT_HYPERCALLS)
 /* Enable log dirty mode */
 #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
 #else
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5aecb88680..d396ac94ab 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -653,7 +653,6 @@ menu "Supported hypercall interfaces"
 
 config MGMT_HYPERCALLS
 	bool "Enable privileged hypercalls for system management"
-	depends on !PV_SHIM_EXCLUSIVE
 	help
 	  Management hypercalls provide the means for dom0 to manage the
 	  overall Xen system and other domains, including sysctl, domctl, etc.
diff --git a/xen/common/Makefile b/xen/common/Makefile
index e0afc89591..45c0bda000 100644
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
@@ -70,10 +71,6 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
 
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
-ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
-endif
-
 extra-y := symbols-dummy.o
 
 obj-$(CONFIG_COVERAGE) += coverage/
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 5343fd7a6f..ae56383bf7 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -196,13 +196,11 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #endif
 #ifdef CONFIG_MGMT_HYPERCALLS
 sysctl(xen_sysctl_t *u_sysctl)
-#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
+#if defined(CONFIG_X86) && defined(CONFIG_PAGING)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
 #endif
-#endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
@@ -281,10 +279,8 @@ hvm_op                             do       do       do       do       do
 #endif
 #ifdef CONFIG_MGMT_HYPERCALLS
 sysctl                             do       do       do       do       do
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl                             do       do       do       do       do
 #endif
-#endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
 #endif
@@ -300,10 +296,8 @@ dm_op                              compat   do       compat   do       do
 hypfs_op                           do       do       do       do       do
 #endif
 mca                                do       do       -        -        -
-#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
-#ifdef CONFIG_MGMT_HYPERCALLS
+#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && defined(CONFIG_MGMT_HYPERCALLS)
 paging_domctl_cont                 do       do       do       do       -
 #endif
-#endif
 
 #endif /* !CPPCHECK */
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index aa86a9f460..6d8cb9690c 100644
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
 
 #ifdef CONFIG_VMTRACE
 extern bool vmtrace_available;
-- 
2.34.1


