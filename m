Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB75BD28E3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141983.1476200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlK-000358-SQ; Mon, 13 Oct 2025 10:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141983.1476200; Mon, 13 Oct 2025 10:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlK-000330-Lp; Mon, 13 Oct 2025 10:26:42 +0000
Received: by outflank-mailman (input) for mailman id 1141983;
 Mon, 13 Oct 2025 10:26:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fcl-0004Rd-Rz
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:51 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de091408-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:17:49 +0200 (CEST)
Received: from BN9PR03CA0380.namprd03.prod.outlook.com (2603:10b6:408:f7::25)
 by MN2PR12MB4472.namprd12.prod.outlook.com (2603:10b6:208:267::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:42 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::eb) by BN9PR03CA0380.outlook.office365.com
 (2603:10b6:408:f7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.11 via Frontend Transport; Mon,
 13 Oct 2025 10:17:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:42 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:38 -0700
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
X-Inumbo-ID: de091408-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drlACcDYHqi1UFOwfyvQ9P0sJVi4AI9eFak0u0RSucf2rdR8YnhDwArbE5eZRBeSIKzxrPvsnjBSGPHrLEfkCVGdIcQfLXhxktgunVooc7jHzatv49Q1twXMXY5tteKEEqKGeW1Jci0uzCJldAgCleOqKv9eto4ffrdNXKMCyjQAyeAbOmrbDSmjhbwa7bvMCpSKls9IVSHXlHxr2f/NwvOvFqIqye84Tl77/6OmsHj+QgS1hn6l4FNAhCZLl9s5dQkgiKLwJCmHGDA5Byf4sGV5pA+5gDe87PPZfmymCRKjV1FkDuqLPqyAE/FCfDyQN1NJ3H4No8HuFn4NYDF+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOD2QZuYbeZxYXpYaeJGTrtxe60QMMlvVBWgVwnci/0=;
 b=Gl9RhtkJbb61xY34VkNxHunajMikcYeGjeShf/HoAJiX9soW0OrqvrTGO7dnUdOJcQQEl5Vjd0Gy9U4F3NePgAGtyHQQJ5WFtp3gyWRFZlpx7kr8pyRoebaXs2Dmzi/ZzbOerQBWObcwPGL96T4kgV4P+tihPuPxao+QgUb7jmP5Que0go3f3NkcGTS5Ls/aaiV037I2dhbxG3Ex7UVz2TQi3cu1AN6+uOV2EFVMpJK8b2iIUENiGSCBM3MhVGfsuoh9RsroVtXfHJKi6wZN1gI+dJT4jF6feFfH2t4kIjXpmRzlEoWFVvaF2oOPIUDR4zjDAjfBYiJSclsqIHrpXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOD2QZuYbeZxYXpYaeJGTrtxe60QMMlvVBWgVwnci/0=;
 b=WA5xj2vmVlFxMhY1J6NyGtYlmCVsj9+ncmpKdb9TWsa/1iejok1TbX3kf3802tcUdY2q8kUqRgDqaynaZEXrgbaY3PjXTILmFjoMeDPS6AZOIe61bwjb9SOB182hOnuddGUtybA/FBsE8JfczBFFA8/uZ/7OeDafPdvQcVYPMFk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v3 26/28] xen/domctl: wrap arch-specific domctl-op with CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:38 +0800
Message-ID: <20251013101540.3502842-27-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|MN2PR12MB4472:EE_
X-MS-Office365-Filtering-Correlation-Id: 3abffff3-93f6-402b-6027-08de0a41bf22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mViaeCb62T6P1sC33NWRLZ0uOK1RszlHvqxYg25i+zB0fZrOv4a5+NCMrYLy?=
 =?us-ascii?Q?X40SRDVBUnt1pwqwII4kaPgiF1y7Fdn57M/m2ibs2fs4fYfXIC3jaS0X5i/b?=
 =?us-ascii?Q?Ux0QlQESC9duFu7PVAzJJoOyK5Cy+DMHuaA310FraoKX77s5EKpyJNEpAskw?=
 =?us-ascii?Q?qXPtADMiHuF9ZyoqIXDmGZV6lPwaModC7g25WkJ/eAV/v6GTAmx5LHsqH8ZO?=
 =?us-ascii?Q?/QT/7YH+0S1llkTYmf2KrceQZTYPu1LQOck7TXOQ5dfRpKG44KcOjAPlmvnS?=
 =?us-ascii?Q?u631immA412LjnPndiyeDP2modV4ZspP+wQUFL6H9mYOEpdU2xUl+nMbYpKD?=
 =?us-ascii?Q?JPt8KHjTK5zVNlbkF3ddQFBjMCsbghXfw3W5YrkjWBh96Q3DwSHZ3/+zEQUY?=
 =?us-ascii?Q?jiKguYqSv4Ptj0nmI1P3do5Lp/cpt+YhOoj+rMlNxznYBYegIhFudEU0T0Ak?=
 =?us-ascii?Q?pCgi1B0MMsvrojwqE/3PvO8c650QHQgoCuWJ2dDYTjVJ+VzyuA/u3gAhqIvb?=
 =?us-ascii?Q?AO5FEKxIN2PI0pdXqYUjpqFKLznSSpaL8NQkMtf+2hRpuBNx3fl/bRUz269j?=
 =?us-ascii?Q?bp1nteGLAVrRQ8OTrdYaqWiNnSXOXOihB3tlMK8E4VwCBVz01Clb9kaF+j3c?=
 =?us-ascii?Q?B/XTH8C6SaL5f1bniSKH+6OPi1SiWdzkGnh96QDmnkRCnd+oAF0HdqieDCge?=
 =?us-ascii?Q?o14Zki15WS3DOMez1D/Nh++PKFHeCXc+PqbpHzOxu86beK56kBMDIbwp0Jp2?=
 =?us-ascii?Q?2QI5mUDojyEub0zulzj/IvaZroDBD0azhhEqI7Hl996kf7wSX+UZDGtlPArh?=
 =?us-ascii?Q?1HO7pZvQ5HmeM3J45N971CQqaSJVEbQMVyubJSKJ0TXKex5xVempRAE+znAS?=
 =?us-ascii?Q?p/HnV1c+SaK5Gm9eZ8NerBwOgHJIELHBFCFMiOwyXvPzMO7A5LRbLgZZN069?=
 =?us-ascii?Q?kPeSjIHIGEE8afA+ys/VYh9Ynnk6o9gZsK6JPgl93gUbnb3jXJKnnzvEb569?=
 =?us-ascii?Q?OWmnWbI1Vy4YL20HkGfcayb7RcsL4pW79alGpXvhgUi8PqaX7VkbqmbX509K?=
 =?us-ascii?Q?5JP+WRDu1vLoPme7ROpAdafwLEF1D3vyg7wEAiS9SszJoPZ1GJXxPUR47W82?=
 =?us-ascii?Q?RFpEvGkaajcXcF0yPV8aL1qQdkTNQMLpDxH/duJK8Hi3mdrHUOBGZd4qphQb?=
 =?us-ascii?Q?+4RtAWefiFnx5SPuDHMzRW3ZFq9In0lC0nWQA61JN1UW5hOAEuVnfESULn/t?=
 =?us-ascii?Q?Spol3g003vU2zZfumSE2LO7UGqezDC2xzStplhm6xv75k+jHZfK5xbRA8aoi?=
 =?us-ascii?Q?zfdBaUTr4KOt3sXmASXW4wCM5C3x0iqUN+I6LJLQA7lc5FK1mOx3EIH3KVlx?=
 =?us-ascii?Q?5Q51hMQa+3BrvKy7EH126chre+whi3z9K8q6C9wNH4hseXaNtO3z0OFVppe6?=
 =?us-ascii?Q?QLB/oBWaF8YTUPXPli3yFf3fKb3mYkEUSusMoZ210mRdsU67mCdqD3tyHZP5?=
 =?us-ascii?Q?EuMV6ikAPh+OGYODSNlBnoqfZe2WbWJyA2VXyRoQJLB3cputbWH0OLjJ22yV?=
 =?us-ascii?Q?dfBxq6c4yezYYN+Wn6c=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:42.8606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abffff3-93f6-402b-6027-08de0a41bf22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4472

Function arch_do_domctl() is responsible for arch-specific domctl-op,
and shall be wrapped with CONFIG_MGMT_HYPERCALLS
Tracking its calling chain and the following functions shall be wrapped with
CONFIG_MGMT_HYPERCALLS too. Otherwise they will all become unreachable when
MGMT_HYPERCALLS=n, and hence violating Misra Rule 2.1.
For x86:
- hvm_save_one
- hvm_acpi_power_button
- hvm_acpi_sleep_button
- hvm_debug_op
- mem_sharing_domctl
- make P2M_AUDIT depend on CONFIG_MGMT_HYPERCALLS
- make PG_log_dirty depend on CONFIG_MGMT_HYPERCALLS
- do_vmtrace_op
  - hvm_vmtrace_control
    - hvm_funcs.vmtrace_control
  - hvm_vmtrace_get_option
    - hvm_funcs.vmtrace_get_option
  - hvm_vmtrace_set_option
    - hvm_funcs.vmtrace_set_option
  - hvm_vmtrace_output_position
    - hvm_funcs.vmtrace_output_position
- paging_domctl_cont
- make policy.o/msr.o depend on CONFIG_MGMT_HYPERCALLS
For ARM:
- subarch_do_domctl
We put the guardian in Makefile for the arch-specific domctl.o compilation.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- split out xsm parts
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap default-case and arch_get_domain_info() transiently
---
v2 -> v3:
- add missing guardian in arm/Makefile
- cover RTIT_CTL{,STATUS}_MASK #define-s
- add missing guardian for .vmtrace_output_position
- guard the whole static inline function
- address "violating Misra rule 2.1" in commit message
- remove transient wrapping around default-case and arch_get_domain_info()
---
 xen/Kconfig.debug                  | 2 +-
 xen/arch/arm/Makefile              | 2 +-
 xen/arch/arm/arm32/Makefile        | 2 +-
 xen/arch/arm/arm64/Makefile        | 2 +-
 xen/arch/x86/Makefile              | 2 +-
 xen/arch/x86/hvm/hvm.c             | 2 ++
 xen/arch/x86/hvm/pmtimer.c         | 2 ++
 xen/arch/x86/hvm/vmx/vmx.c         | 4 ++++
 xen/arch/x86/include/asm/hvm/hvm.h | 4 ++++
 xen/arch/x86/include/asm/p2m.h     | 2 +-
 xen/arch/x86/include/asm/paging.h  | 2 +-
 xen/arch/x86/mm/mem_sharing.c      | 2 ++
 xen/include/hypercall-defs.c       | 4 ++--
 xen/lib/x86/Makefile               | 4 ++--
 14 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index a69615cd63..0dd44d2b10 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -15,7 +15,7 @@ if DEBUG || EXPERT
 
 config GDBSX
 	bool "Guest debugging with gdbsx"
-	depends on X86
+	depends on X86 && MGMT_HYPERCALLS
 	default y
 	help
 	  If you want to enable support for debugging guests from dom0 via
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 2aff1a1630..2f4593f5eb 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -20,7 +20,7 @@ obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-y += domain.o
 obj-y += domain_build.init.o
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += efi/
 obj-y += gic.o
diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 531168f58a..f8cbf14211 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -4,7 +4,7 @@ obj-$(CONFIG_MPU) += mpu/
 
 obj-y += cache.o
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += domain.o
 obj-y += entry.o
 obj-y += head.o
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 6491c5350b..6b77a15abe 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -6,7 +6,7 @@ obj-y += cache.o
 obj-y += cpufeature.o
 obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) += bpi.o
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += domain.o
 obj-y += entry.o
 obj-y += head.o
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 615cd101b8..7253ca32af 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -28,7 +28,7 @@ obj-y += delay.o
 obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
 obj-y += domain.o
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-bin-y += dom0_build.init.o
 obj-y += domain_page.o
 obj-y += e820.o
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e3dacc909b..e77b0c03ed 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5259,6 +5259,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int hvm_debug_op(struct vcpu *v, int32_t op)
 {
     int rc = 0;
@@ -5301,6 +5302,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #ifdef CONFIG_VM_EVENT
 void hvm_toggle_singlestep(struct vcpu *v)
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 87a7a01c9f..f080f7561d 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -56,6 +56,7 @@ static void pmt_update_sci(PMTState *s)
         hvm_isa_irq_deassert(s->vcpu->domain, SCI_IRQ);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void hvm_acpi_power_button(struct domain *d)
 {
     PMTState *s = &d->arch.hvm.pl_time->vpmt;
@@ -81,6 +82,7 @@ void hvm_acpi_sleep_button(struct domain *d)
     pmt_update_sci(s);
     spin_unlock(&s->lock);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* Set the correct value in the timer, accounting for time elapsed
  * since the last time we did that. */
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 4394990131..5c2e8a8d92 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2568,6 +2568,7 @@ static bool cf_check vmx_get_pending_event(
     return true;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /*
  * We only let vmtrace agents see and modify a subset of bits in MSR_RTIT_CTL.
  * These all pertain to data-emitted into the trace buffer(s).  Must not
@@ -2700,6 +2701,7 @@ static int cf_check vmtrace_output_position(struct vcpu *v, uint64_t *pos)
     *pos = v->arch.msrs->rtit.output_offset;
     return v->arch.hvm.vmx.ipt_active;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #if defined(CONFIG_MGMT_HYPERCALLS) || defined(CONFIG_MEM_SHARING)
 static int cf_check vmtrace_reset(struct vcpu *v)
@@ -2886,10 +2888,12 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
     .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
 #endif
+#ifdef CONFIG_MGMT_HYPERCALLS
     .vmtrace_control = vmtrace_control,
     .vmtrace_output_position = vmtrace_output_position,
     .vmtrace_set_option = vmtrace_set_option,
     .vmtrace_get_option = vmtrace_get_option,
+#endif
 #if defined(CONFIG_MGMT_HYPERCALLS) || defined(CONFIG_MEM_SHARING)
     .vmtrace_reset = vmtrace_reset,
 #endif
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 9d6cb42d48..a88c69e3ff 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -236,10 +236,12 @@ struct hvm_function_table {
 #endif
 
     /* vmtrace */
+#ifdef CONFIG_MGMT_HYPERCALLS
     int (*vmtrace_control)(struct vcpu *v, bool enable, bool reset);
     int (*vmtrace_output_position)(struct vcpu *v, uint64_t *pos);
     int (*vmtrace_set_option)(struct vcpu *v, uint64_t key, uint64_t value);
     int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *value);
+#endif
 #if defined(CONFIG_MGMT_HYPERCALLS) || defined(CONFIG_MEM_SHARING)
     int (*vmtrace_reset)(struct vcpu *v);
 #endif
@@ -742,6 +744,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
 bool altp2m_vcpu_emulate_ve(struct vcpu *v);
 #endif /* CONFIG_ALTP2M */
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
 {
     if ( hvm_funcs.vmtrace_control )
@@ -776,6 +779,7 @@ static inline int hvm_vmtrace_get_option(
 
     return -EOPNOTSUPP;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #if defined(CONFIG_MGMT_HYPERCALLS) || defined(CONFIG_MEM_SHARING)
 static inline int hvm_vmtrace_reset(struct vcpu *v)
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 9016e88411..3574e2eecd 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -20,7 +20,7 @@
 #include <asm/page.h>    /* for pagetable_t */
 
 /* Debugging and auditing of the P2M code? */
-#if !defined(NDEBUG) && defined(CONFIG_HVM)
+#if !defined(NDEBUG) && defined(CONFIG_HVM) && defined(CONFIG_MGMT_HYPERCALLS)
 #define P2M_AUDIT     1
 #else
 #define P2M_AUDIT     0
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 1b0694bb36..db3e5b8f31 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -55,7 +55,7 @@
 #define PG_translate   0
 #define PG_external    0
 #endif
-#ifdef CONFIG_PAGING
+#if defined(CONFIG_PAGING) && defined(CONFIG_MGMT_HYPERCALLS)
 /* Enable log dirty mode */
 #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
 #else
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index af7b7f2538..6113a271dc 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -2322,6 +2322,7 @@ out:
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int mem_sharing_domctl(struct domain *d, struct xen_domctl_mem_sharing_op *mec)
 {
     int rc;
@@ -2339,6 +2340,7 @@ int mem_sharing_domctl(struct domain *d, struct xen_domctl_mem_sharing_op *mec)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void arch_dump_shared_mem_info(void)
 {
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index cd2c801af6..02d7b93e80 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -197,7 +197,7 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #ifdef CONFIG_MGMT_HYPERCALLS
 sysctl(xen_sysctl_t *u_sysctl)
 #endif
-#if defined(CONFIG_X86) && defined(CONFIG_PAGING)
+#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && defined(CONFIG_MGMT_HYPERCALLS)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
 domctl(xen_domctl_t *u_domctl)
@@ -296,7 +296,7 @@ dm_op                              compat   do       compat   do       do
 hypfs_op                           do       do       do       do       do
 #endif
 mca                                do       do       -        -        -
-#if defined(CONFIG_X86) && defined(CONFIG_PAGING)
+#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && defined(CONFIG_MGMT_HYPERCALLS)
 paging_domctl_cont                 do       do       do       do       -
 #endif
 
diff --git a/xen/lib/x86/Makefile b/xen/lib/x86/Makefile
index 780ea05db1..89fb4bba27 100644
--- a/xen/lib/x86/Makefile
+++ b/xen/lib/x86/Makefile
@@ -1,3 +1,3 @@
 obj-y += cpuid.o
-obj-y += msr.o
-obj-y += policy.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += msr.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += policy.o
-- 
2.34.1


