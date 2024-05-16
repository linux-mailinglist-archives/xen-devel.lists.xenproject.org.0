Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4308C742D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 11:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722959.1127381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7XnP-0007dU-A0; Thu, 16 May 2024 09:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722959.1127381; Thu, 16 May 2024 09:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7XnP-0007c5-7I; Thu, 16 May 2024 09:53:07 +0000
Received: by outflank-mailman (input) for mailman id 722959;
 Thu, 16 May 2024 09:53:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hz7T=MT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7XnN-0007bz-Pg
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 09:53:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15b61a2f-136a-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 11:53:03 +0200 (CEST)
Received: from PA7P264CA0369.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:37c::8)
 by BY5PR12MB4226.namprd12.prod.outlook.com (2603:10b6:a03:203::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 09:52:59 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10a6:102:37c:cafe::81) by PA7P264CA0369.outlook.office365.com
 (2603:10a6:102:37c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Thu, 16 May 2024 09:52:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 09:52:56 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 04:52:49 -0500
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
X-Inumbo-ID: 15b61a2f-136a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ggzsajg6AryCSFveiDLB6yaP9lK0dr1L5t7B3d/RU7c5Yewa+pfpCWHWrbuY5EspuTLbahuaTpN5OGDFQf2f2NhJnkCPlJ94tJSgOhkr5KJ1xcsQ2DTfFrB4HNRZn5uY4n3tU3nnGemBjWZAzCCeMKEvl6C1rSDccGUHs36Avi7JAoeScSvDuDh5PCleAH4XMGpX9WKnb41mS3T+U2O9fZLxRbFiNvYtgnPRCf3UcSYHdg7QjJg08oCNitxVlavsKhwEu1qoQ7/qLQohiU1if3P0alaAhYI5hTj/zKVsCWozjCVp4dhtTuX5ZePG7cDpsuz2s/1l4/qW791i9141Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U576NGSoFyCkRp52I/6MmY0fAnRgoGTDI9GuJhwTsVk=;
 b=d7XdHG9LbJhd3FVBz8u2xMLK3sBRnsr+qBpLvFxzWiMPwc0NJisi1tjKTe0QOAIIPDCcu2CHVxiBhC4yChZuR/LRknZDj8RKmL1JiyX+4L59r06/VjQfcQHfUrMYPEWIwnugI5vL9prPxojU2zkrue8Y2HPO3upeIg2Lk0DgPaCeLdNiEXUXeoSyAG9J9F+QHBMS5Rf9WM4Dg+yUjyEOgohIeRx9Fi/8Iue/6dxUvb3EOV+tFP2KuK1rlKQTDeojt/mzB9ZnSGUIiWIffb0XFx5PhQYN2Jf4okG6bDW88Id+rFhieoW/yZ4pyD3CsfsQNxSbHaSy6HwuFegNV53aIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U576NGSoFyCkRp52I/6MmY0fAnRgoGTDI9GuJhwTsVk=;
 b=OYCi99igHOJKg2/rv7xbXW3zhwb7CMkZdhX7VihOvQgM04DIAVGv0P+wgSQrtVKBj3p3gl1/KI5cVeJLC6wC4aneIIYIrGuRCg2D/AuR0N6u1MTt5NxyPRui6P1ZCA0/eqaoFLOJRHFidk+KBakz3WQ0EXnjB0dKKQAvQyn2NRc=
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
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Anthony
 PERARD" <anthony.perard@cloud.com>, Juergen Gross <jgross@suse.com>, "Daniel
 P . Smith" <dpsmith@apertussolutions.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>
Subject: [XEN PATCH v8 0/5] Support device passthrough when dom0 is PVH on Xen
Date: Thu, 16 May 2024 17:52:30 +0800
Message-ID: <20240516095235.64128-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|BY5PR12MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: 00e3306b-f881-40fc-8261-08dc758df690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|7416005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sk2Q7nXAKBbdqxstER/EWx5vxgP7SRjU+8Ts7nC+APCuaf3vRmJy4Y1r1Z/z?=
 =?us-ascii?Q?Lj5lQwtH8kErOeNAI8UY9xArf9WZdzD54JquFOGsXjS3PsjRUhrNOPhrK5hL?=
 =?us-ascii?Q?1r7/eKryAj++7xHiR+O5Z7KBV7JQBgwOkglnwvql8/p0m5L+3Bx+K/Dgnmpg?=
 =?us-ascii?Q?rSdQiZXeigqHOYcOuJSCPREcywTi3wlkH8G+8aJUPAnvKeIp17HxxWttoAbe?=
 =?us-ascii?Q?D7vx9cQ6jtFmWBM65/GecXP9sgnjcHD2BtNoz3EIAS1KbS5/M91rJ+Gbt7Ca?=
 =?us-ascii?Q?Nc4EGpSjyudWoLXABE2lZcqOnQmBwJxUoGSU4GTgs8GOR+0FHzLoWWh47YVr?=
 =?us-ascii?Q?wBDC8slNbFiKVkZBBuKjtmfTCvHY7uvY5tcGB1gT6vj7+wDQFZkcccN628O0?=
 =?us-ascii?Q?+h/AboPhRHm0jDfAlzAm9k8bFkkcTtTsMmnMtorE0sGa1faQtBHtaAEPQoKy?=
 =?us-ascii?Q?uNr9W94tjW1nfQgQeXIvQjwh2XtZA7IQvDlaajdd4N2oQRwVFytw0gywTNw4?=
 =?us-ascii?Q?QAVUOQd0ooLZakUdG2XMqqxBlSk4LCl8Tnw1gRyyzvOjINIRMIlRusH9JXwC?=
 =?us-ascii?Q?mciIwiBHOWYPMjFAit1NQn7IwlD8fsDPFRIi6qRJsNixcNvpyW7HPRFfI5DU?=
 =?us-ascii?Q?G9yS+a2+Qgdq9pqpSXFLhoxYs/zV2Et4+uFH7DEsOzB+OjY9MGryQM5Oq/dQ?=
 =?us-ascii?Q?VllXtaNB4D6aLw4K7sFu+5+4IUXpJajO9b7rMYmcWyrSylSi8FoS4Q9xguOt?=
 =?us-ascii?Q?29cc0b3iP5UEOY8r7fR6FbbekU0eDloz/Z6b/BqtJkB2zWBgDPMNQLQDSv8w?=
 =?us-ascii?Q?Fxlix45c0PgxbHLyH/CPJrVfFK+TIPwU7sZD3HwuntJ7h60e1N7rUbm5MwSM?=
 =?us-ascii?Q?maNc6uVorK1upChEnInTV4dKvjB1iWtEPOwp5EbKDEL0buRnPoVC0NZXSJNV?=
 =?us-ascii?Q?3PcdljdLuZTd8le4MITwstG4CQQZlBxv7dWTF1A4D1oPtvUY/b/IRc6TxmGr?=
 =?us-ascii?Q?HmbF8AilJTOgfoLngIHItNYgkrO4xlThKlyfy9RRTiG3drWOPy/5TnFGHyMG?=
 =?us-ascii?Q?D7ltrE0K8lJw1ZCXg5s1xdSs7vwhIq/dD+UcsBhnlvivmvvCXHkAVS6qd09y?=
 =?us-ascii?Q?7eo71tb8TW2rst69/310rt/eV6CB/YXSEexK/rJWmbWOSF6eLhBnK+AEo71D?=
 =?us-ascii?Q?krVMjeacKoz7cvSfvdBSDFoAFUyppDiIMgN5TmRRRqlemcgU1SUoPl8+enoO?=
 =?us-ascii?Q?d23ga0E1WA+vaTZfb54sSwwwAIglXQIOf34ftcdV4T5pcoa64rViv86EJ6QP?=
 =?us-ascii?Q?tuqf8YDS2yKt81ZrmSbnKZO+ockFMAMAZTfBxWqr7m0XqA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(7416005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 09:52:56.6647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e3306b-f881-40fc-8261-08dc758df690
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4226

Hi All,
This is v8 series to support passthrough when dom0 is PVH
v6->v7 changes:
* patch#2: Add the domid check(domid == DOMID_SELF) to prevent self map when guest doesn't use pirq.
           That check was missed in the previous version.
* patch#4: Due to changes in the implementation of obtaining gsi in the kernel. Change to add a new function
           to get gsi by passing in the sbdf of pci device.
* patch#5: Remove the parameter "is_gsi", when there exist gsi, in pci_add_dm_done use a new function
           pci_device_set_gsi to do map_pirq and grant permission. That gets more intuitive code logic.


Best regards,
Jiqian Chen



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
 xen/arch/x86/domctl.c                 | 31 +++++++++++++
 xen/arch/x86/hvm/hypercall.c          |  8 ++++
 xen/arch/x86/physdev.c                | 24 ++++++++++
 xen/drivers/pci/physdev.c             | 36 +++++++++++++++
 xen/drivers/vpci/vpci.c               | 10 +++++
 xen/include/public/domctl.h           |  9 ++++
 xen/include/public/physdev.h          |  7 +++
 xen/include/xen/vpci.h                |  6 +++
 xen/xsm/flask/hooks.c                 |  1 +
 19 files changed, 261 insertions(+)

-- 
2.34.1


