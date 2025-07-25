Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77280B1186A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057229.1425185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBnc-0006Gf-Pw; Fri, 25 Jul 2025 06:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057229.1425185; Fri, 25 Jul 2025 06:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBnc-0006DL-Ky; Fri, 25 Jul 2025 06:20:56 +0000
Received: by outflank-mailman (input) for mailman id 1057229;
 Fri, 25 Jul 2025 06:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ufBjF-0007jJ-SH
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:16:25 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20626.outbound.protection.outlook.com
 [2a01:111:f403:2405::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e34304a8-691e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:16:24 +0200 (CEST)
Received: from SJ0PR05CA0114.namprd05.prod.outlook.com (2603:10b6:a03:334::29)
 by PH7PR12MB7869.namprd12.prod.outlook.com (2603:10b6:510:27e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 06:16:20 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::fe) by SJ0PR05CA0114.outlook.office365.com
 (2603:10b6:a03:334::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.6 via Frontend Transport; Fri,
 25 Jul 2025 06:16:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 06:16:19 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 01:16:15 -0500
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
X-Inumbo-ID: e34304a8-691e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTaBr2iEGvBvnO7LHeBNkUSb7X8MAUcHiWgxPhb+as+HfxN2YOUCqs9M+pKdw2DvGShwlRa8IdCMWpsyFna46p9N5dHesFPWOxPcnL5dqWjtlhWUiA3gEXb/M6tljJOmJTXoDCsI1K0se9c5/BodIkeiebri31rNV0rCxPISFfAu3uC+OK7LogIrjWdCI1vaYSaipQEKAAJt5Ne7g1FtWBNiHlnLDJysFJ+WuJsO16is74Wl+qZpmXqWnYQHKDXuZdgbwpmPt0wlNa9t5to2cMoDrgxQ+FEwbe50RBMQx1FkpQYv1AgkryZWG2zeUpHJq6Le+OGf75EMmotq9JPGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNTTQW7KbLsmij49sd7KJEzywhJ6hR4QqGOe3FB6ihI=;
 b=KJLSloQctqDNQRZFdKJbet9+ro9+MAkOlgIXR+KzHy5huwMnpotfelv7ydVjnIGfKaHyZoS27FVhMonqHrtinalOsZ+mfm6t+6dRh3FIEODzPC5nkHpbtAqwpUN09AMfBhGUhXqQ24sJv88163wWA6tVJrRuhAYbnbsbHXfT1uZsvzN9L6/NSBPINFRalpTt+7VI7JDptyl6bo0Om2mqlUxIAECLNt1MvCVH47N/QujvQI+2cgGn+GZdP8hSYzi/y9J6GDAYoep4L/MZVd66eIyvuqRWoDrHwrXedJ8CQQcbXd/OpUYTCbFdhzocDvlmiBqhr5E4B6GVs/srSk6zKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNTTQW7KbLsmij49sd7KJEzywhJ6hR4QqGOe3FB6ihI=;
 b=yiKAs4Y+P7e4faV4JDhUOh6cnnfN0Jgx6b6tfg4RQkVL5PbPk5UOjx94245zm+uS/vJ5cJv3Wf1/vbQyxIc+08CqMgH1j6XGmADEi8Gu3mN7OBv0ZFWI1JiWgynMmJ4lKVP7KRbJIWTbQb21VIQBhcD9PDKkaORb0blIZg2vQSc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Jan Beulich" <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 11/11] xen/platform_op: Wrap around platform_op hypercall
Date: Fri, 25 Jul 2025 14:15:30 +0800
Message-ID: <20250725061530.309953-12-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725061530.309953-1-Jiqian.Chen@amd.com>
References: <20250725061530.309953-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|PH7PR12MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc77e30-8e3b-4ca4-0496-08ddcb42c598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXRvamFVWUVxbldqUS9RdXgydDI5aGxTY0c4NHFVY1RPOGp3NWpSVklvOUhu?=
 =?utf-8?B?NGw1d2JXOUVSWGkwcnhDYlpHRStpdjFhQWtFeEh0SjhYNVprWDJhR21id2xS?=
 =?utf-8?B?NUpVYjQ0dXFiME1CdGVodWtHYnJYTnRraW5FU2RoYW5jRHpBTWpYZUdyRzlT?=
 =?utf-8?B?WmlwOUVQOFozdjZ3cFRlUkU3dVdJL3hic3FPQ25sWVhOMjZBeVZydzhnazVr?=
 =?utf-8?B?cHYrZitJenRpdGxNMGozUHRrZythbE1Bdys2Zy8raHplQ255bkNFT3JGVWFl?=
 =?utf-8?B?VjRUZzY1OGZqVUpxcTFsd0MzWWt5N2lMVSsvOWdqNTgrenc0UVFFSFI5R1ZI?=
 =?utf-8?B?MFdmYXBGRHM4Z2JWMHdwa3lVOVdFckdkYWk3UC94eGtwRGxUTFdCejMyT2lK?=
 =?utf-8?B?bkNWV2VGNE9hWitURFdtRzl2NVNrWklYWUJOdWZFZTJBTWcydzdTb2JXVkha?=
 =?utf-8?B?Z1JMVE9ocXk5M0hTSS9oOG5tSU5IMVlqK214Wlduc2wyVTFSQW5WZHlUVVgy?=
 =?utf-8?B?c0xMQ01jN0dQL1Y3MkpPVTVPd1RCeFI3TW5JSlk0U09vdEdiNk9BdXhCWmts?=
 =?utf-8?B?K2dFTEYxbGtQNkFSNVJKZnA0Y2RndzdVT3hiRzVqdStTZmpJVlVSbGRselhr?=
 =?utf-8?B?d3NVcnNsQnErMkxOazIrWVhCbEY4SllVMFF4WER3bkM3aHJoaHNZa3RjYzg0?=
 =?utf-8?B?MmppUEpkZDROcWVkL3ZxZlEwUHJxbThoZWVINjBVZHNqTy9xTDhnUFRVYWVh?=
 =?utf-8?B?YWtXcFM2d0xZOXd6Um9kRUZRajVaY1BtUitWbXVQdkhtakVJWHdqM0lTVUIy?=
 =?utf-8?B?bnZqaGp1WHFUU1hMZFM3SHIxNFNxN2NyYWRySGhqa3FxVmk1KzZzM0xGWVNW?=
 =?utf-8?B?TzU2MDVML2hxeVVXZFBNOGFJeWxBeUduSFp1bkc1MFF1eUx5M2JwWTlYTHRF?=
 =?utf-8?B?VWpJWHdzT1ByWVdZSlgwOWRjaEpSV3phSG5nRk0yRWlieEFOZEowRUxqK254?=
 =?utf-8?B?ZTlTQTdtcko5RjVOakJ6dlozMVJXSFpnM054dEREWHJRZ0p0NVBqVERkb21H?=
 =?utf-8?B?YU5mVDFjdVFLam1kMk9TajQyYzRhSHNLSFlBYjNzZCtjbTVxUFkzMlJhUFI3?=
 =?utf-8?B?MXFnZElpTkZJTll3Tml3TE1zUTBSMnhxK3NQWjdBWTJJd0tHQUpZbVA3L1lC?=
 =?utf-8?B?WjRsT25MUEM1cCtlMHhENXpyZjlHNWo0ajZJUnc5Tmg4QnlCcHlyeHFhNDRi?=
 =?utf-8?B?Z3JiZ0N1UEdMOWpKWXl1ajlRSVlpdEtoek9TM2xNYjVjY2Q5cGowOVV3T1hx?=
 =?utf-8?B?VjMzRU5hVUFvOERwSzgxODV6OTZEVGp2dmFEMVY4VFQydzZNMDBIVFRLY21z?=
 =?utf-8?B?NlBKSjdhNW8rNFQyOUFuRzlkQjNDZi9nZktTb0RxL1RPc01ZUXBQR2FKaDc2?=
 =?utf-8?B?dDUxMm9Fc0VNZVA3QTJwWXM2S2ZPZnhCVXExYUREYTdWOUs2eHQybnBWL0hX?=
 =?utf-8?B?MmF0Z0VwQjI4QVZNSmtzemZKbFd1V3haVkgzLzN0OFdocDN3WTV6TjJGa3lq?=
 =?utf-8?B?SjNnWDNmZTJxQ0hpVU4yTnZqK21VWFkwQjBHdFJzTFIwYkNXK3dmRU81bk9o?=
 =?utf-8?B?M0ZXMkRZOFVpZ3puSzFtdHJtS3hkajAwSko3RU1wOVNvZERZV054Z0RCbWpt?=
 =?utf-8?B?bHlEZkRLS2ZsUXVuU29lTWVJNXBsK3k2WkNqajV1MzlQQVdzZWlUbEhESHUx?=
 =?utf-8?B?Q2MxZUY5SlJvRlVPRmJOWjhUYmlZS1lZYVBnMGUxNitZYUJKQUZMNnN5Z3E1?=
 =?utf-8?B?cGVLampkNUNYZm9qWDQwRm1Sc1FYRmRQQTZ1OG5kOHdPdzQ4b1pPc05RQk00?=
 =?utf-8?B?d3dOdStPZWlNMm9sN1hZK3RzbElCQkFkSDBmUjM5cVdSL09DaWZ0eGhxM2ZC?=
 =?utf-8?B?TUJNU1kvZ29hZm1pL3N6YXhUd0ZGSFRsZXZQTjZaMHYya0FIQ0ltQjcyNi9E?=
 =?utf-8?B?ZGo3bXdFREdtM2g0UFpNUUtIZkRwNjdQaUJTZXp3VTB4Z0dlZEpTK2xJS0g3?=
 =?utf-8?Q?HNHmho?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:16:19.8494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc77e30-8e3b-4ca4-0496-08ddcb42c598
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7869

Wrap platform_op hypercall definition and platform_hypercall.o of arm and
x86 with CONFIG_PLATFORM_OP, and since PV_SHIM_EXCLUSIVE needs sorting in
the future, move them out of PV_SHIM_EXCLUSIVE condition at the same time.

And need to make PLATFORM_OP with help info. It shall at least provide
"# CONFIG_PLATFORM_OP is not set" in preset configs for PV shim on x86.
With that, all dependent option get covered and could be deleted.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: Stefano Stabellini <sstabellini@kernel.org>
cc: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <bertrand.marquis@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Jan Beulich <jbeulich@suse.com>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/arm/Makefile                 | 2 +-
 xen/arch/x86/Makefile                 | 2 ++
 xen/arch/x86/configs/pvshim_defconfig | 1 +
 xen/common/Kconfig                    | 3 +++
 xen/include/hypercall-defs.c          | 6 ++++--
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index f833cdf2078b..4f9290fe6345 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -42,7 +42,7 @@ obj-$(CONFIG_VM_EVENT) += mem_access.o
 obj-y += mm.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += p2m.o
-obj-y += platform.o
+obj-$(CONFIG_PLATFORM_OP) += platform.o
 obj-y += platform_hypercall.o
 obj-y += physdev.o
 obj-y += processor.o
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 5aab30a0c4a4..e180ab1a0409 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -80,6 +80,8 @@ obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
+endif
+ifeq ($(CONFIG_PLATFORM_OP),y)
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 endif
diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
index c58c29adb0bf..e9ede13250d8 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -25,3 +25,4 @@ CONFIG_EXPERT=y
 # CONFIG_DEBUG is not set
 # CONFIG_GDBSX is not set
 # CONFIG_SYSCTL is not set
+# CONFIG_PLATFORM_OP is not set
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 1a8f5ec93364..13b544cbb1d5 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -630,6 +630,9 @@ config SYSCTL
 config PLATFORM_OP
 	bool "Enable Platform Operation hypercall"
 	default y
+	help
+	  This option shall only be disabled on some dom0less systems, or
+	  PV shim on x86, to reduce Xen footprint.
 
 endmenu
 
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index c1081d87a252..96ad6efacd5a 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -150,7 +150,7 @@ update_va_mapping(unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags)
 physdev_op_compat(physdev_op_compat_t *uop)
 update_va_mapping_otherdomain(unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags, domid_t domid)
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_PLATFORM_OP
 platform_op(compat_platform_op_t *u_xenpf_op)
 #endif
 #ifdef CONFIG_KEXEC
@@ -200,6 +200,8 @@ sysctl(xen_sysctl_t *u_sysctl)
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
 paging_domctl_cont(xen_domctl_t *u_domctl)
+#endif
+#ifdef CONFIG_PLATFORM_OP
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
 #ifdef CONFIG_HVM
@@ -236,7 +238,7 @@ stack_switch                       do:2     do:2     -        -        -
 set_callbacks                      compat   do       -        -        -
 fpu_taskswitch                     do       do       -        -        -
 sched_op_compat                    do       do       -        -        dep
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_PLATFORM_OP
 platform_op                        compat   do       compat   do       do
 #endif
 set_debugreg                       do       do       -        -        -
-- 
2.34.1


