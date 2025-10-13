Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162D7BD281C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141918.1476138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fbq-00068r-Bs; Mon, 13 Oct 2025 10:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141918.1476138; Mon, 13 Oct 2025 10:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fbq-000652-3h; Mon, 13 Oct 2025 10:16:54 +0000
Received: by outflank-mailman (input) for mailman id 1141918;
 Mon, 13 Oct 2025 10:16:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fbo-0004Rd-W3
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:16:52 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb3022ba-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:16:51 +0200 (CEST)
Received: from MW2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:907::40) by
 PH8PR12MB6843.namprd12.prod.outlook.com (2603:10b6:510:1ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:16:44 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:907:0:cafe::2c) by MW2PR16CA0027.outlook.office365.com
 (2603:10b6:907::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 10:16:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 10:16:44 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:16:41 -0700
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
X-Inumbo-ID: bb3022ba-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikl+g1IZdmvo1HlMEOYmPeGTpKkEDqyPVZedsDq+XS731s3DCzQchQeyx8llQEXT5Lzk2Z3tCUTp/G7uMPiAjmQnvXZUUIsKnWBXlShRYwt+LlMVQfHpaQhqy0BsjXaMDGEKWkFl7RI297NoiLTWOhUpXCyaHjWe38jLNeJDqHoJU0bUKkswbs/ELrOdXRV/EHgfIyL6vktFmTAieVIKcv8LYZhzhR/uBpiws9y1/vq7hrGevWtVKUk4mNiszP8CD+4j37f7omLgOzl0iMnnKfLb2eJ5tqqCtd/BU8BjxNyb0NIEQoUktlBt9GBRua7xJZuiPwUS+Rribus6EUDaJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5P/L3o/qbALqVZnDueKMxl6Lx0C5p6QQQNdXZZ30H50=;
 b=Wu50uw6I/pKa3bKbpHnZbZFUOQC9LU1u9UEytpPS8cKHy0yZUEjqYLIousWgFWrVXf/C4WKanG95auvutbSwVs+326KJ3BFjDjiReQWBGVPAlo7WWUxCFWPXZddwEQqAl4Kaw0z6l7d+l4JeOQGGD/gRSUveMQskOgz5A7XpV66hStV5Wx7gInh1dtshKq8vIUqtkj8rTS63VcbPH43rmARAJrRbAlBcKLnddVpLf9zsUYfFKhOtn4VoJ4Y9hbVnwgepQeJTx89gWayaLZ312YDhFVEtJBeYtNZvTDMghlbDQImnk+l9Gj8DZkk3UCHa+qJIkLGM4vzERE68t1+hVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5P/L3o/qbALqVZnDueKMxl6Lx0C5p6QQQNdXZZ30H50=;
 b=MWF8B+Ua1brOn7WZzNHBEywkdz8QahUXC/2ZqscYUItFjEGstDVE0LteScd34MJT5zZyfW3wbELMuipK5ceM73TVwMi84uWmZpjdMnorxLgYaYFtYZB9kWHvsR419+KgGCWK88gMc076bjCs6wkTmDvt9IzyWf0REyO/oSawLL4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v3 06/28] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
Date: Mon, 13 Oct 2025 18:15:18 +0800
Message-ID: <20251013101540.3502842-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|PH8PR12MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: 771ce5bd-d6b4-4e1a-50c9-08de0a419c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PUMShJGaUKD2QVijITuKFwLTK2pvDfBd08WX6O3ppSR/qiBEG5o3sRE9bVtq?=
 =?us-ascii?Q?uZFbb0MfHhmcC38ccLHocgxbQqBPX0TLHPT6WCFr5YPnv21H6T9ZnR3xUJH5?=
 =?us-ascii?Q?YPErHybnb2hbiQi5eE+utSAgiBwgT9iwXrYvqgGNn+nW/EuYzRVRmM6EB0AM?=
 =?us-ascii?Q?h8jfyMwkngGO+bJUCexyWlwybXrwziC6XVbB+2OcpSNB2SbZTbuiBBC4D6dd?=
 =?us-ascii?Q?Ccw7RmahD9sBgPy0+HAl8zVXQuUkIDGVgXUKjZjSZ7vd7xY0n2EpFdSYVWkx?=
 =?us-ascii?Q?IDo5VdbiQbd/eVW8yvdRXUF3wMNvtroGRfH5PGUZfx5GKWpbzEMMF/bjjniN?=
 =?us-ascii?Q?LhZk1I56QGHLrwsxDWLkUKi6GgSp1/Q/1C3eIQdJSwz4N/0WpdAkh+b/hJqb?=
 =?us-ascii?Q?ZRvj9FXkLR7NYWUWtRansoKfgzj9c90mXVX0TvKF2zZ0Lw4b/KD6VJJBaUWZ?=
 =?us-ascii?Q?2L9FSYeOKm2m9O4C28+8uZgXi174WZ1+Q4ZsLGzDtwhkGcwRve3XMpFy7q/I?=
 =?us-ascii?Q?h6HIqpx4/zEq8AJULkctBr7ENA2jwiAbduQBKwRzNz0yc151zvGTW7hUfj9X?=
 =?us-ascii?Q?biVjYi8U8vqTFz9fnIGcN+3wsLcOO57m+4kNQlcnFHzLXIm/CpnJq/0/sp6Y?=
 =?us-ascii?Q?M5M1Qtqos/eliGhhSqX2g04ujQnpqNIPYUK+Wpp39BubDVxDJ1f4oAEQo2CU?=
 =?us-ascii?Q?Ztu6dB9o3zkQxETLd6ZQTo8hFWPldShUK6b3nzBsWtZdKSAr8ap13Y+g61lE?=
 =?us-ascii?Q?iJBJdF6uFt4YJVlmJBJLCIyRpErKJ9vpPKivxamP+dnqsxGClkD2WOqhZc+3?=
 =?us-ascii?Q?vWMTBz9VHFkeAxHrkjqV21m9T6mqu6I0PlIpKSI3ORomslgZ3+dujIC35GCj?=
 =?us-ascii?Q?IzNAv8t4jcVwWapddtmf4jk7JvDjWbMlUgjV7IHVXPBA7/Uoze9ELWENAS8k?=
 =?us-ascii?Q?/3VlQqeZswwdp63L7+F/VhIkDcUVzI0nXtCCh9qLazJWK3/qJEREHoUa1RwM?=
 =?us-ascii?Q?yjLCnY4exDU3TbzgriqzykO2Xkfpf0radiGpRhilleCgy8wnAWWdJXXIwca0?=
 =?us-ascii?Q?xIl0PWwwE2FoQekiXsV7lD/y3ZBqQ/QEyiRvJp7INsXv7albPAk4FrAcAyWD?=
 =?us-ascii?Q?wyRIDDtrJpnDjaS4QQBp1VAHzD504TvyT/sykH14lguQqUv5YRkmDmoJGu4F?=
 =?us-ascii?Q?tI2zTPxNZsjFRVZfDQy4tCHhzaYmklGNc87Cx4+nIWbfky6WoWOxtDb1fz3E?=
 =?us-ascii?Q?41Q/j22cZ3maBg52/wjDnAuZR49kxxeuK6+Hz5g76n5bvEg7wERbauFZVakl?=
 =?us-ascii?Q?ivkPUsbfPXavrLyN6EVEB7Y3oPmrjAp5O2LG8eOCGx4MztSH2BG2LWw7Soc4?=
 =?us-ascii?Q?gYdugLzTfhIE1aKmoPqpMZKuM5qBI/U0KzuzwN8DCmxCrhfARlFwuYA4Y12p?=
 =?us-ascii?Q?VzZi5JfxVtKAM+A5zFfW22yBjTeAK1rmQidHrZUql13cqT95K/rfQpbILAG5?=
 =?us-ascii?Q?iqlvCA1YPjr6sT6ewIYC+M1YNOTNsx1GRsu530zKnf13Ghonh6ZQBfvGIIBw?=
 =?us-ascii?Q?x9FkayHM6SipxECa8As=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:16:44.4558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 771ce5bd-d6b4-4e1a-50c9-08de0a419c60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6843

In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
a few functions, like domctl_lock_acquire/release() undefined, causing linking
to fail.
To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
/hypercall-defs section, with this adjustment, we also need to release
redundant vnuma_destroy() stub definition from PV_SHIM_EXCLUSIVE guardian,
to not break compilation
Above change will leave dead code in the shim binary temporarily and will be
fixed once domctl.o's building becomes dependent upon CONFIG_MGMT_HYPERCALLS.

Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- remove paging_domctl hypercall-defs
---
 xen/arch/x86/Makefile        | 2 +-
 xen/common/Makefile          | 5 +----
 xen/include/hypercall-defs.c | 4 +---
 xen/include/xen/domain.h     | 4 ----
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index d252154b05..0f91ffcb9d 100644
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
index 7c32fbd9f1..fdf826f218 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
 obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
+obj-y += domctl.o
 obj-y += domid.o
 obj-y += event_2l.o
 obj-y += event_channel.o
@@ -70,10 +71,6 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
 
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
-ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
-endif
-
 extra-y := symbols-dummy.o
 
 obj-$(CONFIG_COVERAGE) += coverage/
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index ab9fc6dcb8..cd2c801af6 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -200,8 +200,8 @@ sysctl(xen_sysctl_t *u_sysctl)
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
 #ifdef CONFIG_HVM
@@ -280,9 +280,7 @@ hvm_op                             do       do       do       do       do
 #ifdef CONFIG_MGMT_HYPERCALLS
 sysctl                             do       do       do       do       do
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl                             do       do       do       do       do
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


