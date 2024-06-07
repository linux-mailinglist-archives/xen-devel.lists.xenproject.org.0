Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D28FFDDD
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 10:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736378.1142441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUhe-0001I1-34; Fri, 07 Jun 2024 08:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736378.1142441; Fri, 07 Jun 2024 08:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUhd-0001Es-VL; Fri, 07 Jun 2024 08:12:01 +0000
Received: by outflank-mailman (input) for mailman id 736378;
 Fri, 07 Jun 2024 08:12:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Avvd=NJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sFUhc-0001Em-Br
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 08:12:00 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9aefbb61-24a5-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 10:11:57 +0200 (CEST)
Received: from MW4PR04CA0086.namprd04.prod.outlook.com (2603:10b6:303:6b::31)
 by DS7PR12MB8082.namprd12.prod.outlook.com (2603:10b6:8:e6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 08:11:53 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:303:6b:cafe::8e) by MW4PR04CA0086.outlook.office365.com
 (2603:10b6:303:6b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.20 via Frontend
 Transport; Fri, 7 Jun 2024 08:11:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.0 via Frontend Transport; Fri, 7 Jun 2024 08:11:52 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 03:11:47 -0500
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
X-Inumbo-ID: 9aefbb61-24a5-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6Axbb1mDNgYIzX9bHRfoWdPO4e7Rq+mUFvtkoIPs4646EvQ4FDhqpc6xkBLaU/X2Q4g3bSKD/xv8hBIycI5qXyneEEa08Mc2x4NDuggTlugUPC3sK7FZs9sQHeBW5aSk7s+FmmIbKC3sIhzeP6/cyL0gmX0xbbCVnPZo9Ct4x7gvQOF/M7pGLhaYsWe4uUZ8RURo3FpQnS+qFOW6bWFYHwJthTVOIgYiUNhTb04MUn0t8pOCdF0PmR4cW7bLfr8kZz5Hg1d7E+qUN1JXjpnzxc5ftaciQMFxEm6umH8pe/Bhm3NKsx0FPRAGW0T6f8mpVXc20uO01A+mh1LT9TVcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRE6J0/9ZV6hCTTCA9dA5xx0jXVpcWBRVLkSxISEQzw=;
 b=BQRgN8unK9nn0WKTBNMzjdMTfJm4Pp+u57yEmtjO2XUkqM2YUE3JFBhy7/oyjYQMk0fhn+Vuu1eqD4wF2zJogzF1uEPWvGVHBBAzZk9lyfAg3y8Fh1OAewrdCdyP/xkYk4H1tRPWMnxbdQGoeLC44SBsLD9r7IH5eEnlFadP0n1sELC758gK6sNjjPjwVGMCm0h0Q7Dhwn5lfZ6WGDN4RAcX1lUGQGlCuA8Oag0Y4JTyHh17ttNiybGD/V2mpQgBVzIcqQHOntA6yvjkpeOs1KPSJ0ynGISWUQp86IW5xcP2SxDqf9637j6PjLbPyj4TdWCTC5/sTryOfCB2RNl1kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRE6J0/9ZV6hCTTCA9dA5xx0jXVpcWBRVLkSxISEQzw=;
 b=i17+Ee2EVOhC/Oc5HbvK7+ZGzLk2vLeUOGbLrDLEQvhxgWi/XVUCkgK4pjNixxedhDfbKm1KIpEP3qBKcM7aGP5+GPFVlG6sf57HBR9vhZuqN0kKYtES3BEZtHw81onPaY+lVw3EsE+44ccwh8Is2BOX/DDxQXJhT4HDUJLyL/o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [XEN PATCH v9 0/5] Support device passthrough when dom0 is PVH on Xen
Date: Fri, 7 Jun 2024 16:11:22 +0800
Message-ID: <20240607081127.126593-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|DS7PR12MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ee6df7-8fda-4ebd-98df-08dc86c97ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|7416005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YZ11R5NH28vBMATX4C8RcJYv48ThjAqVD+vwCvJJ0LbWaVBzmjqB1O9SS5I9?=
 =?us-ascii?Q?SyMkv+AnF/8wV+ehgTgKrYT1HOFc4Z2Th3ONpEYKUsnZ/OnPeugSeU6COnM6?=
 =?us-ascii?Q?CjP2xTbE4hUmtIZV42WNX2DDNCY9L1z6ydXNv+BeUxWdJBAC/6nnvJtDQX9I?=
 =?us-ascii?Q?EltfMzlFFNMOvwyCFnFdbAYvFAhwz8E7N6JtHI3XvYZh3MyGuwbqyo3uy+tA?=
 =?us-ascii?Q?Ci/ctmP80Y1H/DPS1Tj3wOV3igZKSxNN+aGat+i603LKJr1t/u8p4YVysfWQ?=
 =?us-ascii?Q?F77PcaAWEYZkicGuPWdEFlAZtOy5/AUHI6gZ7+9vHo1L712Ec6i21U+LFzUu?=
 =?us-ascii?Q?JQdfe/3EMv9Za8viFOIOdLwPxq1Qh8Ql52GU99cMuGP2xt/67lJpvAD0or+v?=
 =?us-ascii?Q?Tc8yFXE3x4m0JpqJ3kDfftJoXOJDHvaSw34gV6iy48aRIWVTERQvJ/T5fv6R?=
 =?us-ascii?Q?7gY5YtNuDMmwIMx4IHMl180tDMOVMByuVLhYiZlSfS74bJwRDJZyWRWuZRVG?=
 =?us-ascii?Q?6hkRgawpsbhje5zAhIj8QExX7EIPUr0iqg/P0PSmEc7fBLvT3LKeq0VHcxad?=
 =?us-ascii?Q?kzu9tG2joEYMpKTKlTFvq7xMczkNZM+3A4ysKxd9O1ZKhsc1fiu6DLB+K2TN?=
 =?us-ascii?Q?1loY+dyKnPtjQ88a2NnrxHclGDvJ5gNFkjc0KSXM5iL7jZkmg3t+Ut7UsTpA?=
 =?us-ascii?Q?KHqgeTAvMDCRDRGKKZWJykXt5DMQKJ9iLu2aA9XFF+dlo1WYg0ggtdvCl7qy?=
 =?us-ascii?Q?Ltr/zi7cFEzTrdfLEtt0/EBB9Xu2jTZ5ThhAfzJbUo/ZhT2oJNcKek0TePd/?=
 =?us-ascii?Q?SEg18wjCbAD3B6MaddMPHA24Xjw+7op9fK/S5aPA2t/mHlid5pnwfM1hUTcA?=
 =?us-ascii?Q?c6tXn+3DPueTqkAt0L3df1tLNM40Vn4PMhdBMEbQpubMg07ZFop9VJWbeNaw?=
 =?us-ascii?Q?XNz/5GgxwwtUtr3nod2z/IWeN3P9thCXcNEuOz+2ZZVFUIRz/+2m6TmreNsb?=
 =?us-ascii?Q?TABmwcggzKWepJBjj7By8vrGKc1wGRbkaXedDA/oDp1QODywKqNH/zSd9RcN?=
 =?us-ascii?Q?mysRqeZhjp8n3G18cHdIO19U0Eex8D9pJqLAdxooanL9khnjAdTo7gw0qinR?=
 =?us-ascii?Q?h4DfYC1p5OhqPzp+UVebf+17Rj3NGLngJmuVmBY/a8FqLaxGK4k/TN5gpki9?=
 =?us-ascii?Q?C4vIDFvsBCVjKUJOdrtRWYEY/Jfiw4rDneuGlJFRnVrYDFivT3NuQ1huM6ia?=
 =?us-ascii?Q?maBEnlOGi02xF9FzDdxdwBxlUcovnn8PvbS2I/86LgtAtttXhoIwaQspnwAv?=
 =?us-ascii?Q?X425NoxHhpNcfBh8Rrsy8ePahYZFCWGA3jGVCcFmB50qqC/CeFPqZfctxn1Q?=
 =?us-ascii?Q?Lgi0vxo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(7416005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 08:11:52.0543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ee6df7-8fda-4ebd-98df-08dc86c97ced
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8082

Hi All,
This is v9 series to support passthrough when dom0 is PVH
v8->v9 changes:
* patch#1: Move pcidevs_unlock below write_lock, and remove "ASSERT(pcidevs_locked());" from vpci_reset_device_state;
           Add pci_device_state_reset_type to distinguish the reset types.
* patch#2: Add a comment above PHYSDEVOP_map_pirq to describe why need this hypercall.
           Change "!is_pv_domain(d)" to "is_hvm_domain(d)", and "map.domid == DOMID_SELF" to "d == current->domian".
* patch#3: Remove the check of PHYSDEVOP_setup_gsi, since there is same checke in below.
* patch#5: Change the commit message to describe more why we need this new hypercall.
           Add comment above "if ( is_pv_domain(current->domain) || has_pirq(current->domain) )" to explain why we need this check.
		   Add gsi_2_irq to transform gsi to irq, instead of considering gsi == irq.
		   Add explicit padding to struct xen_domctl_gsi_permission.


Best regards,
Jiqian Chen



v7->v8 changes:
* patch#2: Add the domid check(domid == DOMID_SELF) to prevent self map when guest doesn't use pirq.
           That check was missed in the previous version.
* patch#4: Due to changes in the implementation of obtaining gsi in the kernel. Change to add a new function
           to get gsi by passing in the sbdf of pci device.
* patch#5: Remove the parameter "is_gsi", when there exist gsi, in pci_add_dm_done use a new function
           pci_device_set_gsi to do map_pirq and grant permission. That gets more intuitive code logic.


v6->v7 changes:
* patch#4: Due to changes in the implementation of obtaining gsi in the kernel. Change to add a new function
           to get gsi from irq, instead of gsi sysfs.
* patch#5: Fix the issue with variable usage, rc->r.


v5->v6 changes:
* patch#1: Add Reviewed-by Stefano and Stewart. Rebase code and change old function vpci_remove_device,
           vpci_add_handlers to vpci_deassign_device, vpci_assign_device
* patch#2: Add Reviewed-by Stefano
* patch#3: Remove unnecessary "ASSERT(!has_pirq(currd));"
* patch#4: Fix some coding style issues below directory tools
* patch#5: Modified some variable names and code logic to make code easier to be understood, which to use
           gsi by default and be compatible with older kernel versions to continue to use irq


v4->v5 changes:
* patch#1: add pci_lock wrap function vpci_reset_device_state
* patch#2: move the check of self map_pirq to physdev.c, and change to check if the caller has PIRQ flag, and
           just break for PHYSDEVOP_(un)map_pirq in hvm_physdev_op
* patch#3: return -EOPNOTSUPP instead, and use ASSERT(!has_pirq(currd));
* patch#4: is the patch#5 in v4 because patch#5 in v5 has some dependency on it. And add the handling of errno
           and add the Reviewed-by Stefano
* patch#5: is the patch#4 in v4. New implementation to add new hypercall XEN_DOMCTL_gsi_permission to grant gsi


v3->v4 changes:
* patch#1: change the comment of PHYSDEVOP_pci_device_state_reset; move printings behind pcidevs_unlock
* patch#2: add check to prevent PVH self map
* patch#3: new patch, The implementation of adding PHYSDEVOP_setup_gsi for PVH is treated as a separate patch
* patch#4: new patch to solve the map_pirq problem of PVH dom0. use gsi to grant irq permission in
           XEN_DOMCTL_irq_permission.
* patch#5: to be compatible with previous kernel versions, when there is no gsi sysfs, still use irq
v4 link:
https://lore.kernel.org/xen-devel/20240105070920.350113-1-Jiqian.Chen@amd.com/T/#t

v2->v3 changes:
* patch#1: move the content out of pci_reset_device_state and delete pci_reset_device_state; add
           xsm_resource_setup_pci check for PHYSDEVOP_pci_device_state_reset; add description for
		   PHYSDEVOP_pci_device_state_reset;
* patch#2: du to changes in the implementation of the second patch on kernel side(that it will do setup_gsi and
           map_pirq when assigning a device to passthrough), add PHYSDEVOP_setup_gsi for PVH dom0, and we need
		   to support self mapping.
* patch#3: du to changes in the implementation of the second patch on kernel side(that adds a new sysfs for gsi
           instead of a new syscall), so read gsi number from the sysfs of gsi.
v3 link:
https://lore.kernel.org/xen-devel/20231210164009.1551147-1-Jiqian.Chen@amd.com/T/#t

v2 link:
https://lore.kernel.org/xen-devel/20231124104136.3263722-1-Jiqian.Chen@amd.com/T/#t
Below is the description of v2 cover letter:
This series of patches are the v2 of the implementation of passthrough when dom0 is PVH on Xen.
We sent the v1 to upstream before, but the v1 had so many problems and we got lots of suggestions.
I will introduce all issues that these patches try to fix and the differences between v1 and v2.

Issues we encountered:
1. pci_stub failed to write bar for a passthrough device.
Problem: when we run \u201csudo xl pci-assignable-add <sbdf>\u201d to assign a device, pci_stub will call
pcistub_init_device() -> pci_restore_state() -> pci_restore_config_space() ->
pci_restore_config_space_range() -> pci_restore_config_dword() -> pci_write_config_dword()\u201d, the pci config
write will trigger an io interrupt to bar_write() in the xen, but the
bar->enabled was set before, the write is not allowed now, and then when 
bar->Qemu config the
passthrough device in xen_pt_realize(), it gets invalid bar values.

Reason: the reason is that we don't tell vPCI that the device has been reset, so the current cached state in
pdev->vpci is all out of date and is different from the real device state.

Solution: to solve this problem, the first patch of kernel(xen/pci: Add xen_reset_device_state
function) and the fist patch of xen(xen/vpci: Clear all vpci status of device) add a new hypercall to reset the
state stored in vPCI when the state of real device has changed.
Thank Roger for the suggestion of this v2, and it is different from
v1 (https://lore.kernel.org/xen-devel/20230312075455.450187-3-ray.huang@amd.com/), v1 simply allow domU to write
pci bar, it does not comply with the design principles of vPCI.

2. failed to do PHYSDEVOP_map_pirq when dom0 is PVH
Problem: HVM domU will do PHYSDEVOP_map_pirq for a passthrough device by using gsi. See
xen_pt_realize->xc_physdev_map_pirq and pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq will call
into Xen, but in hvm_physdev_op(), PHYSDEVOP_map_pirq is not allowed.

Reason: In hvm_physdev_op(), the variable "currd" is PVH dom0 and PVH has no X86_EMU_USE_PIRQ flag, it will fail
at has_pirq check.

Solution: I think we may need to allow PHYSDEVOP_map_pirq when "currd" is dom0 (at present dom0 is PVH). The
second patch of xen(x86/pvh: Open PHYSDEVOP_map_pirq for PVH dom0) allow PVH dom0 do PHYSDEVOP_map_pirq. This v2
patch is better than v1, v1 simply remove the has_pirq check
(xen https://lore.kernel.org/xen-devel/20230312075455.450187-4-ray.huang@amd.com/).

3. the gsi of a passthrough device doesn't be unmasked
 3.1 failed to check the permission of pirq
 3.2 the gsi of passthrough device was not registered in PVH dom0

Problem:
3.1 callback function pci_add_dm_done() will be called when qemu config a passthrough device for domU.
This function will call xc_domain_irq_permission()-> pirq_access_permitted() to check if the gsi has corresponding
mappings in dom0. But it didn\u2019t, so failed. See XEN_DOMCTL_irq_permission->pirq_access_permitted, "current"
is PVH dom0 and it return irq is 0.
3.2 it's possible for a gsi (iow: vIO-APIC pin) to never get registered on PVH dom0, because the devices of PVH
are using MSI(-X) interrupts. However, the IO-APIC pin must be configured for it to be able to be mapped into a domU.

Reason: After searching codes, I find "map_pirq" and "register_gsi" will be done in function
vioapic_write_redirent->vioapic_hwdom_map_gsi when the gsi(aka ioapic's pin) is unmasked in PVH dom0.
So the two problems can be concluded to that the gsi of a passthrough device doesn't be unmasked.

Solution: to solve these problems, the second patch of kernel(xen/pvh: Unmask irq for passthrough device in PVH dom0)
call the unmask_irq() when we assign a device to be passthrough. So that passthrough devices can have the mapping of
gsi on PVH dom0 and gsi can be registered. This v2 patch is different from the
v1( kernel https://lore.kernel.org/xen-devel/20230312120157.452859-5-ray.huang@amd.com/,
kernel https://lore.kernel.org/xen-devel/20230312120157.452859-5-ray.huang@amd.com/ and
xen https://lore.kernel.org/xen-devel/20230312075455.450187-5-ray.huang@amd.com/),
v1 performed "map_pirq" and "register_gsi" on all pci devices on PVH dom0, which is unnecessary and may cause
multiple registration.

4. failed to map pirq for gsi
Problem: qemu will call xc_physdev_map_pirq() to map a passthrough device\u2019s gsi to pirq in function
xen_pt_realize(). But failed.

Reason: According to the implement of xc_physdev_map_pirq(), it needs gsi instead of irq, but qemu pass irq to it and
treat irq as gsi, it is got from file /sys/bus/pci/devices/xxxx:xx:xx.x/irq in function xen_host_pci_device_get().
But actually the gsi number is not equal with irq. On PVH dom0, when it allocates irq for a gsi in
function acpi_register_gsi_ioapic(), allocation is dynamic, and follow the principle of applying first, distributing
first. And if you debug the kernel codes(see function __irq_alloc_descs), you will find the irq number is allocated
from small to large by order, but the applying gsi number is not, gsi 38 may come before gsi 28, that causes gsi 38
get a smaller irq number than gsi 28, and then gsi != irq.

Solution: we can record the relation between gsi and irq, then when userspace(qemu) want to use gsi, we can do a
translation. The third patch of kernel(xen/privcmd: Add new syscall to get gsi from irq) records all the relations
in acpi_register_gsi_xen_pvh() when dom0 initialize pci devices, and provide a syscall for userspace to get the gsi
from irq. The third patch of xen(tools: Add new function to get gsi from irq) add a new function
xc_physdev_gsi_from_irq() to call the new syscall added on kernel side.
And then userspace can use that function to get gsi. Then xc_physdev_map_pirq() will success. This v2 patch is the
same as v1( kernel https://lore.kernel.org/xen-devel/20230312120157.452859-6-ray.huang@amd.com/ and
xen https://lore.kernel.org/xen-devel/20230312075455.450187-6-ray.huang@amd.com/)

About the v2 patch of qemu, just change an included head file, other are similar to the
v1 ( qemu https://lore.kernel.org/xen-devel/20230312092244.451465-19-ray.huang@amd.com/), just call
xc_physdev_gsi_from_irq() to get gsi from irq.


Jiqian Chen (5):
  xen/vpci: Clear all vpci status of device
  x86/pvh: Allow (un)map_pirq when dom0 is PVH
  x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
  tools: Add new function to get gsi from dev
  domctl: Add XEN_DOMCTL_gsi_permission to grant gsi

 tools/include/xen-sys/Linux/privcmd.h |  7 +++
 tools/include/xencall.h               |  2 +
 tools/include/xenctrl.h               |  7 +++
 tools/libs/call/core.c                |  5 +++
 tools/libs/call/libxencall.map        |  2 +
 tools/libs/call/linux.c               | 15 +++++++
 tools/libs/call/private.h             |  9 ++++
 tools/libs/ctrl/xc_domain.c           | 15 +++++++
 tools/libs/ctrl/xc_physdev.c          |  4 ++
 tools/libs/light/libxl_pci.c          | 63 +++++++++++++++++++++++++++
 xen/arch/x86/domctl.c                 | 38 ++++++++++++++++
 xen/arch/x86/hvm/hypercall.c          |  8 ++++
 xen/arch/x86/include/asm/io_apic.h    |  2 +
 xen/arch/x86/io_apic.c                | 21 +++++++++
 xen/arch/x86/mpparse.c                |  3 +-
 xen/arch/x86/physdev.c                | 24 ++++++++++
 xen/drivers/pci/physdev.c             | 43 ++++++++++++++++++
 xen/drivers/vpci/vpci.c               |  9 ++++
 xen/include/public/domctl.h           | 10 +++++
 xen/include/public/physdev.h          |  7 +++
 xen/include/xen/pci.h                 | 16 +++++++
 xen/include/xen/vpci.h                |  6 +++
 xen/xsm/flask/hooks.c                 |  1 +
 23 files changed, 315 insertions(+), 2 deletions(-)

-- 
2.34.1


