Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7D9BD28DC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141973.1476177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fl3-0002GR-W9; Mon, 13 Oct 2025 10:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141973.1476177; Mon, 13 Oct 2025 10:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fl3-0002F1-R6; Mon, 13 Oct 2025 10:26:25 +0000
Received: by outflank-mailman (input) for mailman id 1141973;
 Mon, 13 Oct 2025 10:26:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fc0-0004Rd-CT
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:04 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c22dc77c-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:17:02 +0200 (CEST)
Received: from MW2PR16CA0011.namprd16.prod.outlook.com (2603:10b6:907::24) by
 PH0PR12MB7094.namprd12.prod.outlook.com (2603:10b6:510:21d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 10:16:54 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:907:0:cafe::d3) by MW2PR16CA0011.outlook.office365.com
 (2603:10b6:907::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 10:16:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 10:16:54 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:16:49 -0700
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
X-Inumbo-ID: c22dc77c-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMltJdnWZRRW/XtofYCBHyW5yf0AqBQWHpJSSR5f6izBlWMxvz4az59eky5RmxlaubTxSetMjtbSwT8IfByJF7XHK9Fk+1VqAhf3OjrlZOuceJAwGkAUrNASTp3s/CoxDNkBxI1mfhKuXE4FwkjOp3hIsdnCfNtl/GZckWUHNaOYmY3ZHXt6b7kz+bS3j6/KH3obcnx4jtatSbxL/8980PrPOi5BrOmlcwQ8oDLjzyo33w85K7AB2OehOOdrEikwLEXdKHGNP+jyxIW0ViCQ2XaRG3hxxI9YZ/VHWaxvbaUhymgEbECWrEROVDdt9++wI2jCYjRdBgqtxN7hSnbWhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPIM3VARJIsEgUCBHN9Euwao07xeck6Zq/ldW6g3xnQ=;
 b=qR/jg2NC9e09SNgeYZMjfhmAyE8bbGBwPnlhq9l8KHONBZNEv7fjWeRZzdyOYRWd7nsrU4EgvqAb7YjYzOHZD0cCMW9XkNvw7lTTmdCihiY5G7646Au5jlab798M2CMxImiqMuUmFb0yk/DGilwDMDHjKhY+/Yotznzewmql0BXNVDHqFJ9OC97fB9twpT8Uyhku7Vl/lQEC1iaMGkj8ECpm2r/wTlP0z8HYEnmUCE0I9jusO1yLs6K+5Rel19RIk0u+SGxZttPOATymzk9eUSvJQFGSkEz2/9z83krWEHsn+YG+tnYeJgL2nQGYOZn/MJ8U4eXkf9KfpStMSki/0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPIM3VARJIsEgUCBHN9Euwao07xeck6Zq/ldW6g3xnQ=;
 b=D0XwXfzf+21RgJFKfHCducLm3H8G8iPMQml8YytLjAvJRECRKifERbH5Ka1xlVJsPY8ey20WFh1+SoQG3dUFa/sZfnAI5dWxA33r6MzRhuKH+FXGwVKxG9TrPqSCUWuspnz3PAj0OGhLpmoSxuM1dHYKRtWchbu2EEZlsAVddzs=
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
 Stabellini" <sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v3 09/28] xen/vm_event: consolidate CONFIG_VM_EVENT
Date: Mon, 13 Oct 2025 18:15:21 +0800
Message-ID: <20251013101540.3502842-10-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|PH0PR12MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cb030e-767b-49d0-7070-08de0a41a21a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uy1q1WI/ULA2H3XpKn/K0ATg5plf9UAOlXFa/5+50Xq35sKelzdCCL8eOzMb?=
 =?us-ascii?Q?9MaRnYyJAj7rVAnchZN8GYK+QWKT+cP65UWM/8f5hlBAEOkIudmvUyaCQPPC?=
 =?us-ascii?Q?p3qPKtEYgr8yElz/AONbT58Sz/lFAo6tKi59ko/nNvvXYQL4Ynvw+Tecsstp?=
 =?us-ascii?Q?9JBElKwZbELdie9fYOHyK3M5X2wb1/G9oCfFi9jSeBec0Vvk/FhgRGSvtpSV?=
 =?us-ascii?Q?tKGMs8+dM1gUIUKmOLG+VaPlEas7a+9fo1UbACFNl9cvbcGqFBssJNZVw6wh?=
 =?us-ascii?Q?oQ8+UaLR3qVh43Y0J4dKcKMH0kaw8tD+IjDjwsgLsK+Dswc/m4jer9uAifK3?=
 =?us-ascii?Q?ORsDv///19EtvMNAyo3od7o3RvXjf5yyyDElCn27vSZ+z5+WroPij3Y92G1p?=
 =?us-ascii?Q?iomYXEVJP9WeJh7YfS9+8jFhihsrWvfJzqmooLaE0Xu12Ntlu35CXjzCkXXD?=
 =?us-ascii?Q?O7wcuho7QfZrHs6PVLw891rSLkdIDy0p0H+6hwa3J63MrUvbZtKluatO+mjV?=
 =?us-ascii?Q?y3Rkju/2mSEpfKatXkoI43DjxDuiI1sv6xodYOMYS6q0coxUqEALSDEGvFLr?=
 =?us-ascii?Q?UnSuBdE9LBqgybwoarriSEjX1U6yYHC/JIU+TWmwcS5kMYUwQFNWPiqYl8q2?=
 =?us-ascii?Q?+MzbSNYqER3yddS1M3PmC+cFPsCjywGBD6BME0Flot8a1WY+NUBzh/g+LfUl?=
 =?us-ascii?Q?ZGpKo+J5KWlVyFKuxQegAY3IZmWbIG8skEW81h/dg8lx12xk+W2KvQfL/i+L?=
 =?us-ascii?Q?OAOKz/cKZDVylISf4xsOg7er3GXv2UUvvL/UtZhf24IRVul7qhhcylORqBd1?=
 =?us-ascii?Q?RdK11I3ZUqH4B+1j91UVuhPcVbXLET+xR2VFNfun6Xj+xDfoMmJD4B7NYoKI?=
 =?us-ascii?Q?Fb8/Te+2zPuPC8Sv5YzPCBXxEVrJXQACU1nhpJwT81hBGYKBSUGGYhYTKSC4?=
 =?us-ascii?Q?3UzWsrPoOxJ5T87E6bc4d9zMVDnTmVtasxySk3yCI4YfOVDjauoYVYNa6xjK?=
 =?us-ascii?Q?r+1TPq6mhoCAEwo71952NlUieOXOdeClyRnHzcee3xKSalOxUqM92aTKksL9?=
 =?us-ascii?Q?BnI1fLW7QGhK4hoeiMWlbYXinw8BJQKRpResRsddKlP196K3vAdPY+EGP5HJ?=
 =?us-ascii?Q?uEYfPeYffLS5ULCIPS9pRN2GNROWKqX4Y/RQAwbRcQP+ZZIFNaDQiGKdfJUt?=
 =?us-ascii?Q?dv71ECfOrbKz1wjJyHljodmJjHj9EODDC8zOKp3UvRtlT4U6zl2HAG+EN3ER?=
 =?us-ascii?Q?T/FcaRL0qYcHhFx4tHOzq9cBf8Wp85EHXqj2ma9agp421GzjvUZSmqS83rD4?=
 =?us-ascii?Q?zK9bN0bOmiU1g2Mt+1LD8U9P29QmIvDHQ6ixsH7opQH/HkaSZetrTPtkWSm4?=
 =?us-ascii?Q?Hpi3o4FjVFTt593mF6p29EHJESkZ248gke+RDN/W2wGhluM9ipN5G//s2NRf?=
 =?us-ascii?Q?5EU90/PAwxRN1CWveKLYrMQtcinvk0unXnh21MSqsr/dWoNUZtbU3j8h72/Q?=
 =?us-ascii?Q?EZMZbxNwVlrp9oVhZqZ6yDLAmy5iOWmsNlv9up+83Mbkb1/+jX1pLIQUptjh?=
 =?us-ascii?Q?4szQCBDK4uP8gA5ad4s=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:16:54.0649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cb030e-767b-49d0-7070-08de0a41a21a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7094

File hvm/vm_event.c and x86/vm_event.c are the extend to vm_event handling
routines, and its compilation shall be guarded by CONFIG_VM_EVENT too.
Futhermore, features about monitor_op and memory access are both based on
vm event subsystem, so monitor.o/mem_access.o shall be wrapped under
CONFIG_VM_EVENT.

Although CONFIG_VM_EVENT is right now forcibly enabled on x86 via
MEM_ACCESS_ALWAYS_ON, we could disable it through disabling
CONFIG_MGMT_HYPERCALLS later. So we remove MEM_ACCESS_ALWAYS_ON and
make VM_EVENT=y on default only on x86 to retain the same.

In consequence, a few switch-blocks need in-place stubs in do_altp2m_op()
to pass compilation when ALTP2M=y and VM_EVENT=n(, hence MEM_ACCESS=n), like
HVMOP_altp2m_set_mem_access, etc.
And the following functions still require stubs to pass compilation:
- vm_event_check_ring()
- p2m_mem_access_check()
- xenmem_access_to_p2m_access()

The following functions are developed on the basis of vm event framework, or
only invoked by vm_event.c/monitor.c/mem_access.c, so they all shall be
wrapped with CONFIG_VM_EVENT (otherwise they will become unreachable and
violate Misra rule 2.1 when VM_EVENT=n):
- hvm_toggle_singlestep
- hvm_fast_singlestep
- hvm_enable_msr_interception
  - hvm_function_table.enable_msr_interception
- hvm_has_set_descriptor_access_existing
  - hvm_function_table.set_descriptor_access_existing
- arch_monitor_domctl_op
- arch_monitor_allow_userspace
- arch_monitor_get_capabilities
- hvm_emulate_one_vm_event
- hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,read_io,write_io}_discard

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- split out XSM changes
- remove unnecessary stubs
- move "struct p2m_domain" declaration ahead of the #ifdef
---
v2 -> v3:
- move .enable_msr_interception and .set_descriptor_access_exiting together
- with the introduction of "vm_event_is_enabled()", all hvm_monitor_xxx()
stubs are no longer needed
- change to use in-place stubs in do_altp2m_op()
- no need to add stub for monitor_traps(), __vm_event_claim_slot(),
vm_event_put_request() and vm_event_vcpu_pause()
- remove MEM_ACCESS_ALWAYS_ON
- return default p2m_access_rwx for xenmem_access_to_p2m_access() when
VM_EVENT=n
- add wrapping for hvm_emulate_one_vm_event/
hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,read_io,write_io}_discard
---
 xen/arch/x86/Makefile                 |  2 +-
 xen/arch/x86/hvm/Kconfig              |  1 -
 xen/arch/x86/hvm/Makefile             |  4 +-
 xen/arch/x86/hvm/emulate.c            | 58 ++++++++++++++-------------
 xen/arch/x86/hvm/hvm.c                | 21 ++++++++++
 xen/arch/x86/hvm/svm/svm.c            |  8 +++-
 xen/arch/x86/hvm/vmx/vmx.c            | 10 +++++
 xen/arch/x86/include/asm/hvm/hvm.h    |  9 ++++-
 xen/arch/x86/include/asm/mem_access.h |  9 +++++
 xen/arch/x86/include/asm/monitor.h    |  9 +++++
 xen/common/Kconfig                    |  7 +---
 xen/include/xen/mem_access.h          | 10 +++++
 xen/include/xen/vm_event.h            |  7 ++++
 13 files changed, 116 insertions(+), 39 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 0f91ffcb9d..615cd101b8 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -76,7 +76,7 @@ obj-y += usercopy.o
 obj-y += x86_emulate.o
 obj-$(CONFIG_TBOOT) += tboot.o
 obj-y += hpet.o
-obj-y += vm_event.o
+obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 5cb9f29042..e6b388dd0e 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -3,7 +3,6 @@ menuconfig HVM
 	default !PV_SHIM
 	select COMPAT
 	select IOREQ_SERVER
-	select MEM_ACCESS_ALWAYS_ON
 	help
 	  Interfaces to support HVM domains.  HVM domains require hardware
 	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 6ec2c8f2db..952db00dd7 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -16,7 +16,7 @@ obj-y += io.o
 obj-y += ioreq.o
 obj-y += irq.o
 obj-y += mmio.o
-obj-y += monitor.o
+obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += mtrr.o
 obj-y += nestedhvm.o
 obj-y += pmtimer.o
@@ -26,7 +26,7 @@ obj-y += save.o
 obj-y += stdvga.o
 obj-y += vioapic.o
 obj-y += vlapic.o
-obj-y += vm_event.o
+obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += vmsi.o
 obj-y += vpic.o
 obj-y += vpt.o
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index fe75b0516d..d56ef02baf 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1615,6 +1615,7 @@ static int cf_check hvmemul_blk(
     return rc;
 }
 
+#ifdef CONFIG_VM_EVENT
 static int cf_check hvmemul_write_discard(
     enum x86_segment seg,
     unsigned long offset,
@@ -1717,6 +1718,7 @@ static int cf_check hvmemul_cache_op_discard(
 {
     return X86EMUL_OKAY;
 }
+#endif /* CONFIG_VM_EVENT */
 
 static int cf_check hvmemul_cmpxchg(
     enum x86_segment seg,
@@ -2750,33 +2752,6 @@ static const struct x86_emulate_ops hvm_emulate_ops = {
     .vmfunc        = hvmemul_vmfunc,
 };
 
-static const struct x86_emulate_ops hvm_emulate_ops_no_write = {
-    .read          = hvmemul_read,
-    .insn_fetch    = hvmemul_insn_fetch,
-    .write         = hvmemul_write_discard,
-    .cmpxchg       = hvmemul_cmpxchg_discard,
-    .rep_ins       = hvmemul_rep_ins_discard,
-    .rep_outs      = hvmemul_rep_outs_discard,
-    .rep_movs      = hvmemul_rep_movs_discard,
-    .rep_stos      = hvmemul_rep_stos_discard,
-    .read_segment  = hvmemul_read_segment,
-    .write_segment = hvmemul_write_segment,
-    .read_io       = hvmemul_read_io_discard,
-    .write_io      = hvmemul_write_io_discard,
-    .read_cr       = hvmemul_read_cr,
-    .write_cr      = hvmemul_write_cr,
-    .read_xcr      = hvmemul_read_xcr,
-    .write_xcr     = hvmemul_write_xcr,
-    .read_msr      = hvmemul_read_msr,
-    .write_msr     = hvmemul_write_msr_discard,
-    .cache_op      = hvmemul_cache_op_discard,
-    .tlb_op        = hvmemul_tlb_op,
-    .cpuid         = x86emul_cpuid,
-    .get_fpu       = hvmemul_get_fpu,
-    .put_fpu       = hvmemul_put_fpu,
-    .vmfunc        = hvmemul_vmfunc,
-};
-
 /*
  * Note that passing VIO_no_completion into this function serves as kind
  * of (but not fully) an "auto select completion" indicator.  When there's
@@ -2887,6 +2862,34 @@ int hvm_emulate_one(
     return _hvm_emulate_one(hvmemul_ctxt, &hvm_emulate_ops, completion);
 }
 
+#ifdef CONFIG_VM_EVENT
+static const struct x86_emulate_ops hvm_emulate_ops_no_write = {
+    .read          = hvmemul_read,
+    .insn_fetch    = hvmemul_insn_fetch,
+    .write         = hvmemul_write_discard,
+    .cmpxchg       = hvmemul_cmpxchg_discard,
+    .rep_ins       = hvmemul_rep_ins_discard,
+    .rep_outs      = hvmemul_rep_outs_discard,
+    .rep_movs      = hvmemul_rep_movs_discard,
+    .rep_stos      = hvmemul_rep_stos_discard,
+    .read_segment  = hvmemul_read_segment,
+    .write_segment = hvmemul_write_segment,
+    .read_io       = hvmemul_read_io_discard,
+    .write_io      = hvmemul_write_io_discard,
+    .read_cr       = hvmemul_read_cr,
+    .write_cr      = hvmemul_write_cr,
+    .read_xcr      = hvmemul_read_xcr,
+    .write_xcr     = hvmemul_write_xcr,
+    .read_msr      = hvmemul_read_msr,
+    .write_msr     = hvmemul_write_msr_discard,
+    .cache_op      = hvmemul_cache_op_discard,
+    .tlb_op        = hvmemul_tlb_op,
+    .cpuid         = x86emul_cpuid,
+    .get_fpu       = hvmemul_get_fpu,
+    .put_fpu       = hvmemul_put_fpu,
+    .vmfunc        = hvmemul_vmfunc,
+};
+
 void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
     unsigned int errcode)
 {
@@ -2949,6 +2952,7 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
 
     hvm_emulate_writeback(&ctx);
 }
+#endif /* CONFIG_VM_EVENT */
 
 void hvm_emulate_init_once(
     struct hvm_emulate_ctxt *hvmemul_ctxt,
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 48a293069b..e3dacc909b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -50,6 +50,7 @@
 #include <asm/hvm/vm_event.h>
 #include <asm/hvm/vpt.h>
 #include <asm/i387.h>
+#include <asm/mem_access.h>
 #include <asm/mc146818rtc.h>
 #include <asm/mce.h>
 #include <asm/monitor.h>
@@ -4861,15 +4862,20 @@ static int do_altp2m_op(
         break;
 
     case HVMOP_altp2m_set_mem_access:
+#ifdef CONFIG_VM_EVENT
         if ( a.u.mem_access.pad )
             rc = -EINVAL;
         else
             rc = p2m_set_mem_access(d, _gfn(a.u.mem_access.gfn), 1, 0, 0,
                                     a.u.mem_access.access,
                                     a.u.mem_access.view);
+#else
+        rc = -EOPNOTSUPP;
+#endif
         break;
 
     case HVMOP_altp2m_set_mem_access_multi:
+#ifdef CONFIG_VM_EVENT
         if ( a.u.set_mem_access_multi.pad ||
              a.u.set_mem_access_multi.opaque > a.u.set_mem_access_multi.nr )
         {
@@ -4898,9 +4904,13 @@ static int do_altp2m_op(
                                        &a, u.set_mem_access_multi.opaque) )
                 rc = -EFAULT;
         }
+#else
+        rc = -EOPNOTSUPP;
+#endif
         break;
 
     case HVMOP_altp2m_get_mem_access:
+#ifdef CONFIG_VM_EVENT
         if ( a.u.mem_access.pad )
             rc = -EINVAL;
         else
@@ -4915,6 +4925,9 @@ static int do_altp2m_op(
                 rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
             }
         }
+#else
+        rc = -EOPNOTSUPP;
+#endif
         break;
 
     case HVMOP_altp2m_change_gfn:
@@ -5030,6 +5043,7 @@ static int compat_altp2m_op(
     switch ( a.cmd )
     {
     case HVMOP_altp2m_set_mem_access_multi:
+#ifdef CONFIG_VM_EVENT
 #define XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list(_d_, _s_); \
         guest_from_compat_handle((_d_)->pfn_list, (_s_)->pfn_list)
 #define XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list(_d_, _s_); \
@@ -5038,6 +5052,7 @@ static int compat_altp2m_op(
                                              &a.u.set_mem_access_multi);
 #undef XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list
 #undef XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list
+#endif
         break;
 
     default:
@@ -5056,6 +5071,7 @@ static int compat_altp2m_op(
     switch ( a.cmd )
     {
     case HVMOP_altp2m_set_mem_access_multi:
+#ifdef CONFIG_VM_EVENT
         if ( rc == -ERESTART )
         {
             a.u.set_mem_access_multi.opaque =
@@ -5065,6 +5081,9 @@ static int compat_altp2m_op(
                                        &a, u.set_mem_access_multi.opaque) )
                 rc = -EFAULT;
         }
+#else
+        rc = -EOPNOTSUPP;
+#endif
         break;
 
     default:
@@ -5283,6 +5302,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
     return rc;
 }
 
+#ifdef CONFIG_VM_EVENT
 void hvm_toggle_singlestep(struct vcpu *v)
 {
     ASSERT(atomic_read(&v->pause_count));
@@ -5292,6 +5312,7 @@ void hvm_toggle_singlestep(struct vcpu *v)
 
     v->arch.hvm.single_step = !v->arch.hvm.single_step;
 }
+#endif /* CONFIG_VM_EVENT */
 
 #ifdef CONFIG_ALTP2M
 void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 679ca3dacd..c8506c25c4 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -299,6 +299,7 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
         __clear_bit(msr * 2 + 1, msr_bit);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
@@ -306,6 +307,7 @@ static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
     for_each_vcpu ( d, v )
         svm_intercept_msr(v, msr, MSR_INTERCEPT_WRITE);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static void svm_save_dr(struct vcpu *v)
 {
@@ -826,6 +828,7 @@ static void cf_check svm_set_rdtsc_exiting(struct vcpu *v, bool enable)
     vmcb_set_general2_intercepts(vmcb, general2_intercepts);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check svm_set_descriptor_access_exiting(
     struct vcpu *v, bool enable)
 {
@@ -843,6 +846,7 @@ static void cf_check svm_set_descriptor_access_exiting(
 
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static unsigned int cf_check svm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
 {
@@ -2457,9 +2461,11 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .fpu_dirty_intercept  = svm_fpu_dirty_intercept,
     .msr_read_intercept   = svm_msr_read_intercept,
     .msr_write_intercept  = svm_msr_write_intercept,
+#ifdef CONFIG_VM_EVENT
     .enable_msr_interception = svm_enable_msr_interception,
-    .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
     .set_descriptor_access_exiting = svm_set_descriptor_access_exiting,
+#endif
+    .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
     .get_insn_bytes       = svm_get_insn_bytes,
 
     .nhvm_vcpu_initialise = nsvm_vcpu_initialise,
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a40af1db66..1996e139a0 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1520,6 +1520,7 @@ static void cf_check vmx_set_rdtsc_exiting(struct vcpu *v, bool enable)
     vmx_vmcs_exit(v);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check vmx_set_descriptor_access_exiting(
     struct vcpu *v, bool enable)
 {
@@ -1534,6 +1535,7 @@ static void cf_check vmx_set_descriptor_access_exiting(
     vmx_update_secondary_exec_control(v);
     vmx_vmcs_exit(v);
 }
+#endif /* CONFIG_VM_EVENT */
 
 static void cf_check vmx_init_hypercall_page(void *p)
 {
@@ -2413,6 +2415,7 @@ static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
         printk_once(XENLOG_WARNING "EOI for %02x but SVI=%02x\n", vector, old_svi);
 }
 
+#ifdef CONFIG_VM_EVENT
 static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
@@ -2420,6 +2423,7 @@ static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
     for_each_vcpu ( d, v )
         vmx_set_msr_intercept(v, msr, VMX_MSR_W);
 }
+#endif /* CONFIG_VM_EVENT */
 
 #ifdef CONFIG_ALTP2M
 
@@ -2871,7 +2875,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
     .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+#ifdef CONFIG_VM_EVENT
     .enable_msr_interception = vmx_enable_msr_interception,
+#endif
 #ifdef CONFIG_ALTP2M
     .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
@@ -3079,9 +3085,11 @@ const struct hvm_function_table * __init start_vmx(void)
 
     vmx_function_table.caps.singlestep = cpu_has_monitor_trap_flag;
 
+#ifdef CONFIG_VM_EVENT
     if ( cpu_has_vmx_dt_exiting )
         vmx_function_table.set_descriptor_access_exiting =
             vmx_set_descriptor_access_exiting;
+#endif
 
     /*
      * Do not enable EPT when (!cpu_has_vmx_pat), to prevent security hole
@@ -3152,8 +3160,10 @@ void __init vmx_fill_funcs(void)
     if ( !cpu_has_xen_ibt )
         return;
 
+#ifdef CONFIG_VM_EVENT
     vmx_function_table.set_descriptor_access_exiting =
         vmx_set_descriptor_access_exiting;
+#endif
 
     vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
     vmx_function_table.process_isr            = vmx_process_isr;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index f02183691e..473cf24b83 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -192,7 +192,10 @@ struct hvm_function_table {
     void (*handle_cd)(struct vcpu *v, unsigned long value);
     void (*set_info_guest)(struct vcpu *v);
     void (*set_rdtsc_exiting)(struct vcpu *v, bool enable);
+#ifdef CONFIG_VM_EVENT
     void (*set_descriptor_access_exiting)(struct vcpu *v, bool enable);
+    void (*enable_msr_interception)(struct domain *d, uint32_t msr);
+#endif
 
     /* Nested HVM */
     int (*nhvm_vcpu_initialise)(struct vcpu *v);
@@ -224,8 +227,6 @@ struct hvm_function_table {
                                 paddr_t *L1_gpa, unsigned int *page_order,
                                 uint8_t *p2m_acc, struct npfec npfec);
 
-    void (*enable_msr_interception)(struct domain *d, uint32_t msr);
-
 #ifdef CONFIG_ALTP2M
     /* Alternate p2m */
     void (*altp2m_vcpu_update_p2m)(struct vcpu *v);
@@ -433,10 +434,12 @@ static inline bool using_svm(void)
 
 #define hvm_long_mode_active(v) (!!((v)->arch.hvm.guest_efer & EFER_LMA))
 
+#ifdef CONFIG_VM_EVENT
 static inline bool hvm_has_set_descriptor_access_exiting(void)
 {
     return hvm_funcs.set_descriptor_access_exiting;
 }
+#endif
 
 static inline void hvm_domain_creation_finished(struct domain *d)
 {
@@ -679,10 +682,12 @@ static inline int nhvm_hap_walk_L1_p2m(
         v, L2_gpa, L1_gpa, page_order, p2m_acc, npfec);
 }
 
+#ifdef CONFIG_VM_EVENT
 static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
 }
+#endif
 
 static inline bool hvm_is_singlestep_supported(void)
 {
diff --git a/xen/arch/x86/include/asm/mem_access.h b/xen/arch/x86/include/asm/mem_access.h
index 1a52a10322..c786116310 100644
--- a/xen/arch/x86/include/asm/mem_access.h
+++ b/xen/arch/x86/include/asm/mem_access.h
@@ -14,6 +14,7 @@
 #ifndef __ASM_X86_MEM_ACCESS_H__
 #define __ASM_X86_MEM_ACCESS_H__
 
+#ifdef CONFIG_VM_EVENT
 /*
  * Setup vm_event request based on the access (gla is -1ull if not available).
  * Handles the rw2rx conversion. Boolean return value indicates if event type
@@ -25,6 +26,14 @@
 bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
                           struct npfec npfec,
                           struct vm_event_st **req_ptr);
+#else
+static inline bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
+                                        struct npfec npfec,
+                                        struct vm_event_st **req_ptr)
+{
+    return false;
+}
+#endif /* CONFIG_VM_EVENT */
 
 /* Check for emulation and mark vcpu for skipping one instruction
  * upon rescheduling if required. */
diff --git a/xen/arch/x86/include/asm/monitor.h b/xen/arch/x86/include/asm/monitor.h
index 3c64d8258f..1cd169f8f0 100644
--- a/xen/arch/x86/include/asm/monitor.h
+++ b/xen/arch/x86/include/asm/monitor.h
@@ -32,6 +32,7 @@ struct monitor_msr_bitmap {
     DECLARE_BITMAP(high, 8192);
 };
 
+#ifdef COMFIG_VM_EVENT
 static inline
 void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
 {
@@ -102,6 +103,7 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
 
     return capabilities;
 }
+#endif /* CONFIG_VM_EVENT */
 
 int arch_monitor_domctl_event(struct domain *d,
                               struct xen_domctl_monitor_op *mop);
@@ -123,7 +125,14 @@ static inline void arch_monitor_cleanup_domain(struct domain *d) {}
 
 #endif
 
+#ifdef CONFIG_VM_EVENT
 bool monitored_msr(const struct domain *d, u32 msr);
+#else
+static inline bool monitored_msr(const struct domain *d, u32 msr)
+{
+    return false;
+}
+#endif
 bool monitored_msr_onchangeonly(const struct domain *d, u32 msr);
 
 #endif /* __ASM_X86_MONITOR_H__ */
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 807b213e8b..95cbb451bf 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -170,13 +170,10 @@ config HAS_VMAP
 config LIBFDT
 	bool
 
-config MEM_ACCESS_ALWAYS_ON
-	bool
-
 config VM_EVENT
-	def_bool MEM_ACCESS_ALWAYS_ON
-	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
+	bool "Memory Access and VM events"
 	depends on HVM
+	default X86
 	help
 
 	  Framework to configure memory access types for guests and receive
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 4de651038d..7f2400ceed 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -74,9 +74,19 @@ typedef enum {
 } p2m_access_t;
 
 struct p2m_domain;
+#ifdef CONFIG_VM_EVENT
 bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
                                  xenmem_access_t xaccess,
                                  p2m_access_t *paccess);
+#else
+static inline bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
+                                               xenmem_access_t xaccess,
+                                               p2m_access_t *paccess)
+{
+    *paccess = p2m_access_rwx;
+    return true;
+}
+#endif
 
 /*
  * Set access type for a region of gfns.
diff --git a/xen/include/xen/vm_event.h b/xen/include/xen/vm_event.h
index 27d0c74216..1b76ce632e 100644
--- a/xen/include/xen/vm_event.h
+++ b/xen/include/xen/vm_event.h
@@ -51,7 +51,14 @@ struct vm_event_domain
 };
 
 /* Returns whether a ring has been set up */
+#ifdef CONFIG_VM_EVENT
 bool vm_event_check_ring(struct vm_event_domain *ved);
+#else
+static inline bool vm_event_check_ring(struct vm_event_domain *ved)
+{
+    return false;
+}
+#endif /* CONFIG_VM_EVENT */
 
 /* Returns 0 on success, -ENOSYS if there is no ring, -EBUSY if there is no
  * available space and the caller is a foreign domain. If the guest itself
-- 
2.34.1


