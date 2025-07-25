Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 899CCB1188F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057290.1425224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBxW-0002HW-Hb; Fri, 25 Jul 2025 06:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057290.1425224; Fri, 25 Jul 2025 06:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBxW-0002FD-EJ; Fri, 25 Jul 2025 06:31:10 +0000
Received: by outflank-mailman (input) for mailman id 1057290;
 Fri, 25 Jul 2025 06:31:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yuhP=2G=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ufBxU-0002DR-Qz
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:31:08 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2415::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f100e8e5-6920-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:31:06 +0200 (CEST)
Received: from MW4PR04CA0155.namprd04.prod.outlook.com (2603:10b6:303:85::10)
 by MN2PR12MB4406.namprd12.prod.outlook.com (2603:10b6:208:268::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Fri, 25 Jul
 2025 06:31:01 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::c3) by MW4PR04CA0155.outlook.office365.com
 (2603:10b6:303:85::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Fri,
 25 Jul 2025 06:31:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 06:31:00 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Jul 2025 01:30:57 -0500
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
X-Inumbo-ID: f100e8e5-6920-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cASk6jDdBGlYv0cGz3RCSUFS2COPuCvcyLG+t4FAOy+W2lLLiDRXR/0BKgEVLwfAYyvDRYgUkxU5UUhLl/K2Xga7pwNLXpB6yGJ2TDVa6g4R4MpH8KMhBBwYWPb5Ax+GPL3xkQWEfUc0flo0fyB0iChr4ArJ9/boWVUnH/Q3c0UMORGcSxVMu5M5Xp3uRTbiWB5+x+AYh384NRCHNuJ/N7n+tSvr74WjSucpqIsZ0DekX1Hl+GL8EIWjhuY61klQfeqtD5f+h5AH25dclteUhJodddK4u8onOBGyu44+yG4GkaAQVPXLfQbQiZJhGJ9YUve4tlgJVkqs8SvOfYrW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3la4L9avYw8M23SeipwcrmU9KtNu4nuG1PgFj4C0Jfg=;
 b=df2m2EFIl4wKyUJDY4ECjl4lrQTkAEou7+hmyMCT/cu0zIEuu8gJFnJ6d1N6jW8FVL4/tg5KPLH7bvln4aXqysDofk4HaCkL4tyOn2IBqrJLs/8yit/y2V8KOfEmkzzPh5npWbZ6wkIRoPZ3wJBUFHAhbzfEf/msfZQKiAfrWPWu1jt9dGFi83MQJkIPIyNhWMyqq/frO0nEbJt/Fae+AmRpgY54egitcU7o3tna55xfRPoKhXucOsaY0e9eMD0QlGzW0LwPoCQk4zAxKcGtkjXMgR8VtW8S9fzROYcUQH/dYz6dQ1+d+8hUazhMF3+BawSACZdmIj6xTZ2mv4Vl7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3la4L9avYw8M23SeipwcrmU9KtNu4nuG1PgFj4C0Jfg=;
 b=JP3KgJviQT/xtYz0cTg5Vy+VAYrf/BlZxkWH0hteITjHWZbILdEK/TBv2qWZEx2d4ba7uKNQOqNBmVzhd081Yh/wLNiA2KIuSNFUSnp3kayZd3rJhqkJkHIqEf3glK+MLXAGBlLJk7r2RRIzbuNaIe2GQYocy7r9etXmctl5jeE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <stefano.stabellini@amd.com>
CC: Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v1] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
Date: Fri, 25 Jul 2025 14:30:39 +0800
Message-ID: <20250725063039.2526488-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|MN2PR12MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a4271cf-ed85-4390-27e6-08ddcb44d270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hhByGv7QmfMgNmPi5OqSZNYmz96aZFnBu/SSxw0OG7miZmzHeIKlMiinNeVi?=
 =?us-ascii?Q?thKxEomC3xdebtVEq4PA0IDxYs8nFxB5U90NWr9WfWi90Do0zqtmUnuj2MYG?=
 =?us-ascii?Q?+CyCPZHwXDwH1UW+vHRlopJu2GZaRvMtP/VB8nwy4NlwyOqirwLCqE0UDDzZ?=
 =?us-ascii?Q?egwOQJ61W8yxcUkxjHk9o8xjTd1d95LodJLutmU9/fbvJ5L+QqRpV7xZiRKT?=
 =?us-ascii?Q?3KAg59YSYsx/Bh5xuWxhN8JrxwjnYzBsNJhwg6UDnFKBzpno5MonvQG+Ns0r?=
 =?us-ascii?Q?qlqyoubrEecSye8mkTxdjXu13DphMHo0Kwj8cA0DEq3hwgnCJ6QmDJe/JJdh?=
 =?us-ascii?Q?6CtBm6iJ6uUkkhIM5EKZ2jlNCCPZfTH9Rlcg1K0TvvoC3E51LBPWZjgKsEWo?=
 =?us-ascii?Q?VuuvH0moJYcChAIs83loe1Lbr5lVsMpSYG2W3fjtLve3AlaU0AKuo4nfOfcO?=
 =?us-ascii?Q?4BhAV0AsyoawMOlh6+Mt0Gr6K9C/16JmtUA/CGCMcrxb0+dA8/J6vRsgiQha?=
 =?us-ascii?Q?RFUQacSnAQUibJBA5caK1F4UHQp690BLDfmRbQpN8+qO3kDFA27O3Pthe4TK?=
 =?us-ascii?Q?/Tk9Udr7VIod9Tjz7n0On8+oUqzmzIa1/EvnU09nCFvpWEllMySVdPjdnkVQ?=
 =?us-ascii?Q?cdA+dxhd6hrdCQsVbMwVtpsu715wJypMaErv9kuEDb3LtwIqJVSb28smqR63?=
 =?us-ascii?Q?E+slfIAmiPjSxwBE7eg7yzR3d3V6zbt4zDCdW9dgv2QZ7broIiUuTmA+0UCe?=
 =?us-ascii?Q?rzwMw0v4T/rlilbRpT05xTzw9lTRXSnrSc2M+Tv8F8d7RYdDgry7kIyZWieE?=
 =?us-ascii?Q?SmgsqppdvHfRZLCpGCM8O67zuFwdBLVxWN2faG6UDL2tu3fhUO9+bXmfHcXA?=
 =?us-ascii?Q?4ZMChfSvixVepD/YNBsTwjm7NoMQwuyYZvTCJWwUMehEjR2BXrbTrCgcet24?=
 =?us-ascii?Q?r9PegoYYwYLahFq3H/XsKHVLfrGyciuI9gfFQjcvsJBsrlVczShUCBoGjqLu?=
 =?us-ascii?Q?vpsEVuSp2/lwKm3diolyU9xWGEHqmQ2wGeLv0fRH/jqHNk8yGXAqJE6zoL9U?=
 =?us-ascii?Q?F3RwxYCtL0Bb6437zDFB/bqKW8d5oc03hljvVVQZbH74m9YwKTULNJ3NPGZ9?=
 =?us-ascii?Q?Jl3IibSz7INxp643Jv9YctTaRsK5rcFiAKfU6jWjHumxarUeBE8457UTjgQQ?=
 =?us-ascii?Q?geaPO5CXgWy0aCNzVEFmsi9WRuetiXSzY8PQjl/A2DRTCX9WdBoG5YI2JBPi?=
 =?us-ascii?Q?tkQGLcjHQ5YTwIEqOI5wEQRhk0cpuzDph4AIC0zGMAtZbwI01WMN6uLOio5x?=
 =?us-ascii?Q?XtaZEGXthzT92xXCsfdN101AwYoIZ2OdAfHNxezIR2dzoP7PIWcjVnEogVEZ?=
 =?us-ascii?Q?p8HxJl6dquDI7EitENVdXBCxgcfFe/DRBEEF6htRCQ1j2BoeFM1jK5sSlENy?=
 =?us-ascii?Q?NYyLmtcIJon/GKGLgIfYU+fE2QftJNCTNpdjLVjf5X58homfsnvMZqqlVF5v?=
 =?us-ascii?Q?XyOTcUtNZvENauoviOaYedTlxDYomNSDWKPi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:31:00.3905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4271cf-ed85-4390-27e6-08ddcb44d270
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4406

In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
a few functions, like domctl_lock_acquire/release() undefined, causing linking
to fail.
To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
/hypercall-defs section, with this adjustment, we also need to remove
redundant vnuma_destroy() stub definition to not break compilation.
Above change will leave dead code in the shim binary temporarily and will be
fixed with the introduction of CONFIG_DOMCTL.

Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/x86/Makefile        | 2 +-
 xen/common/Makefile          | 5 +----
 xen/include/hypercall-defs.c | 4 +---
 xen/include/xen/domain.h     | 4 ----
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 5aab30a0c4..7676d7cdd8 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -28,6 +28,7 @@ obj-y += delay.o
 obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
 obj-y += domain.o
+obj-y += domctl.o
 obj-bin-y += dom0_build.init.o
 obj-y += domain_page.o
 obj-y += e820.o
@@ -79,7 +80,6 @@ obj-y += vm_event.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 endif
diff --git a/xen/common/Makefile b/xen/common/Makefile
index c316957fcb..756ddf52c3 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
 obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
+obj-y += domctl.o
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
@@ -69,10 +70,6 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
 
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
-ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
-endif
-
 extra-y := symbols-dummy.o
 
 obj-$(CONFIG_COVERAGE) += coverage/
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index c1081d87a2..e1f6d25b4a 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -197,8 +197,8 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #ifdef CONFIG_SYSCTL
 sysctl(xen_sysctl_t *u_sysctl)
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 paging_domctl_cont(xen_domctl_t *u_domctl)
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
@@ -278,9 +278,7 @@ hvm_op                             do       do       do       do       do
 #ifdef CONFIG_SYSCTL
 sysctl                             do       do       do       do       do
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl                             do       do       do       do       do
-#endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
 #endif
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index e10baf2615..33dd90357c 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -182,11 +182,7 @@ struct vnuma_info {
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


