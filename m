Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865C180BC35
	for <lists+xen-devel@lfdr.de>; Sun, 10 Dec 2023 17:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651389.1017043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCMr5-0004H5-Lh; Sun, 10 Dec 2023 16:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651389.1017043; Sun, 10 Dec 2023 16:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCMr5-0004FN-IS; Sun, 10 Dec 2023 16:40:35 +0000
Received: by outflank-mailman (input) for mailman id 651389;
 Sun, 10 Dec 2023 16:40:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lAJh=HV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rCMr4-0004FH-4T
 for xen-devel@lists.xenproject.org; Sun, 10 Dec 2023 16:40:34 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d55d123d-977a-11ee-98e8-6d05b1d4d9a1;
 Sun, 10 Dec 2023 17:40:32 +0100 (CET)
Received: from PH8PR07CA0018.namprd07.prod.outlook.com (2603:10b6:510:2cd::15)
 by MW4PR12MB6754.namprd12.prod.outlook.com (2603:10b6:303:1eb::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Sun, 10 Dec
 2023 16:40:28 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::85) by PH8PR07CA0018.outlook.office365.com
 (2603:10b6:510:2cd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Sun, 10 Dec 2023 16:40:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Sun, 10 Dec 2023 16:40:27 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 10 Dec
 2023 10:40:23 -0600
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
X-Inumbo-ID: d55d123d-977a-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDpwZKO09GZar8KKG8evV6Ite88MqZYDr67lYzULqzz2khFYKhtmtQINzc9vCtuGGY9+/yc6vHf55aRHyMQLEfNN72hql7ZNCN49o/dx3Qh5IrDB9xTYpiqalMHXZ77z7zAgPh902S6d8xYBBIMz+tGImPR1WgL/Y6gYLy7tCMsLnibs7HTPhM+q+M6W6N/ZT/VCA7pMMJbSkAN2To1RLiDCXPmt1LGUaYqzmRQ4o8qfbnPVHVKtV/Bg45zma41/Kk0h3nbbEGEsq39lyQdwMgf3pfll8jco3vcoiJDdSz5aF/kQyB8nDmmWp5QREABmw2TZnIYkN6cE5TRSV5S4IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zj0kgcL2T9xEc2oWGYuGh2XmT7rNAzU1TGjRMOmLURs=;
 b=h5F/PZtZfah+Uf3idChDQyhJyqygTWIoAIih55yxokZJxCuZRgdHs7Z5khMFdAfqW9tNkmwMOvQn3OhuIH/oBxT6o32AaG2jnnqURi51cRNBqs1oef1Wk2Z5LcOc1O9Tt+cNxE9GKoNROrAQjiY9JH7ozk3C6QgSTYv1lLBmDnO021iejwjWdslJdnNN3IY78RIWKMOU9/ij5Nr0Q9ceMHeD9hkarWLb+vcYv0SpHWPgerNs7YIIH/wBVd8g04BNG2UIWsbwF1ZIDpxkC+efyFcZ6Y01oJi/OGYJUNWxzah5QAufhqELAOBQTW+LSRjRs0Tm8ZsvKn6RkNZGfh8h1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj0kgcL2T9xEc2oWGYuGh2XmT7rNAzU1TGjRMOmLURs=;
 b=ra42VX2x3mW6oU29FNe47vehNy5Spc3iZpRGyC9pGcfn3fxJoavQyXjinDpxUb1d4/odu7FMLxEjnL4XOCx2Jq/z2Jt4hwWCnPng1jWot5DMQyXiYIs7OjFIvutn4284yrXb790oM+BNapguB8MESfcYhNh5VXGm2Gg2CAP0UVw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Alex Deucher
	<Alexander.Deucher@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang
	<Julia.Zhang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [RFC XEN PATCH v3 0/3] Support device passthrough when dom0 is PVH on Xen
Date: Mon, 11 Dec 2023 00:40:06 +0800
Message-ID: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|MW4PR12MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 766c9f90-542b-4b6d-0176-08dbf99eb743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	28fopN2lGwdleaLu6Ws5bYLQpwHUmJ9lP+vcmsNWDqV32pq7pTNouy+Bef6fqM+KywMtW0uCpbNNebtO6x8VlWNdi+bh/RGSgSylVPAZ6VMaysxC/RsF4iqTNIpVYkWcUAEJE5LXp3vrXPjoTZaZCIK52mcfJFz0FjveefU80G3p19lkF23Cais78OB1yLc8IrRcUHjnj14CYGgUZn/ZcAmri6AJqCsPEGLtLuNoL/WoJc1bPrugYdSKBZ6FyZUNqu7xlHUMk3vMa6xC4w0bKk67vkDfWOzlGND+q2JLKGqg+XGF+ehKMBC1Tk9s/Qx0pbCBzUjhByCwE6Tg0tG2U0VRSc2oB0fYFj8OIHKvjwIrrvM6GxnbAN5Ss1Zc2cBEwEYMS2btE5gAlin092aX4OvPNsJB0yua3fmqwk6aub64NAoYbgimQ4P0z+b+2hOF9pr6BaXYce4M9Ia+J6wzWE0Wmuy7AMPh4nZJA1V9QksEtvdFtSRhbI2Tz1d717yC1bkgxrjQTDMAIaBI81laNaGV/Ca5W6Xsx6GoAPJWjKtu+lDk8NK87g+nd4LSI3j1CCC7a2wJq5hFDyL8lH64zlZFy5xAPqFACzAU6Fp/h8k6uYUFqC+TzGCLB+5YHur6txAOHh6zyZKlvQ64JhPz2cVPwMFIqOAS9z4wiTyBHKSuixOGoDJDDmDB6SmIWdjOfOpGThixDwFpTzll9ztf1WRBaKjsHVz9Jy638mV2pk89teQt+W3my71GBnsU74qR3KMvEXynh/KjXXwqENl5hK554U+i0NZz/Rn8L7kNU6U=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(451199024)(186009)(82310400011)(1800799012)(64100799003)(40470700004)(36840700001)(46966006)(7696005)(36756003)(966005)(478600001)(2906002)(6666004)(1076003)(426003)(83380400001)(26005)(16526019)(336012)(2616005)(4326008)(8936002)(8676002)(5660300002)(110136005)(54906003)(70206006)(70586007)(316002)(82740400003)(81166007)(40480700001)(356005)(86362001)(47076005)(41300700001)(40460700003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2023 16:40:27.7202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 766c9f90-542b-4b6d-0176-08dbf99eb743
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6754

Hi All,
This is v3 series to support passthrough when dom0 is PVH
v2->v3 changes:
* patch#1: move the content out of pci_reset_device_state and delete pci_reset_device_state; add xsm_resource_setup_pci check for PHYSDEVOP_pci_device_state_reset; add description for PHYSDEVOP_pci_device_state_reset;
* patch#2: du to changes in the implementation of the second patch on kernel side(that it will do setup_gsi and map_pirq when assigning a device to passthrough), add PHYSDEVOP_setup_gsi for PVH dom0, and we need to support self mapping.
* patch#3: du to changes in the implementation of the second patch on kernel side(that adds a new sysfs for gsi instead of a new syscall), so read gsi number from the sysfs of gsi.

v3 link of the kernel patch:
https://lore.kernel.org/lkml/20231210161519.1550860-1-Jiqian.Chen@amd.com/T/#t

v2 link:
https://lore.kernel.org/xen-devel/20231124104136.3263722-1-Jiqian.Chen@amd.com/T/#t
Below is the description of v2 cover letter:
This series of patches are the v2 of the implementation of passthrough when dom0 is PVH on Xen.
We sent the v1 to upstream before, but the v1 had so many problems and we got lots of suggestions.
I will introduce all issues that these patches try to fix and the differences between v1 and v2.

Issues we encountered:
1. pci_stub failed to write bar for a passthrough device.
Problem: when we run “sudo xl pci-assignable-add <sbdf>” to assign a device, pci_stub will
call “pcistub_init_device() -> pci_restore_state() -> pci_restore_config_space() ->
pci_restore_config_space_range() -> pci_restore_config_dword() -> pci_write_config_dword()”,
the pci config write will trigger an io interrupt to bar_write() in the xen, but the
bar->enabled was set before, the write is not allowed now, and then when Qemu config the
passthrough device in xen_pt_realize(), it gets invalid bar values.

Reason: the reason is that we don't tell vPCI that the device has been reset, so the current
cached state in pdev->vpci is all out of date and is different from the real device state.

Solution: to solve this problem, the first patch of kernel(xen/pci: Add xen_reset_device_state
function) and the fist patch of xen(xen/vpci: Clear all vpci status of device) add a new
hypercall to reset the state stored in vPCI when the state of real device has changed.
Thank Roger for the suggestion of this v2, and it is different from v1
(https://lore.kernel.org/xen-devel/20230312075455.450187-3-ray.huang@amd.com/), v1 simply allow
domU to write pci bar, it does not comply with the design principles of vPCI.

2. failed to do PHYSDEVOP_map_pirq when dom0 is PVH
Problem: HVM domU will do PHYSDEVOP_map_pirq for a passthrough device by using gsi. See
xen_pt_realize->xc_physdev_map_pirq and pci_add_dm_done->xc_physdev_map_pirq. Then
xc_physdev_map_pirq will call into Xen, but in hvm_physdev_op(), PHYSDEVOP_map_pirq is not allowed.

Reason: In hvm_physdev_op(), the variable "currd" is PVH dom0 and PVH has no X86_EMU_USE_PIRQ flag,
it will fail at has_pirq check.

Solution: I think we may need to allow PHYSDEVOP_map_pirq when "currd" is dom0 (at present dom0 is
PVH). The second patch of xen(x86/pvh: Open PHYSDEVOP_map_pirq for PVH dom0) allow PVH dom0 do
PHYSDEVOP_map_pirq. This v2 patch is better than v1, v1 simply remove the has_pirq check(xen
https://lore.kernel.org/xen-devel/20230312075455.450187-4-ray.huang@amd.com/).

3. the gsi of a passthrough device doesn't be unmasked
 3.1 failed to check the permission of pirq
 3.2 the gsi of passthrough device was not registered in PVH dom0

Problem:
3.1 callback function pci_add_dm_done() will be called when qemu config a passthrough device for domU.
This function will call xc_domain_irq_permission()-> pirq_access_permitted() to check if the gsi has
corresponding mappings in dom0. But it didn’t, so failed. See
XEN_DOMCTL_irq_permission->pirq_access_permitted, "current" is PVH dom0 and it return irq is 0.
3.2 it's possible for a gsi (iow: vIO-APIC pin) to never get registered on PVH dom0, because the
devices of PVH are using MSI(-X) interrupts. However, the IO-APIC pin must be configured for it to be
able to be mapped into a domU.

Reason: After searching codes, I find "map_pirq" and "register_gsi" will be done in function
vioapic_write_redirent->vioapic_hwdom_map_gsi when the gsi(aka ioapic's pin) is unmasked in PVH dom0.
So the two problems can be concluded to that the gsi of a passthrough device doesn't be unmasked.

Solution: to solve these problems, the second patch of kernel(xen/pvh: Unmask irq for passthrough
device in PVH dom0) call the unmask_irq() when we assign a device to be passthrough. So that
passthrough devices can have the mapping of gsi on PVH dom0 and gsi can be registered. This v2 patch
is different from the v1(
kernel https://lore.kernel.org/xen-devel/20230312120157.452859-5-ray.huang@amd.com/,
kernel https://lore.kernel.org/xen-devel/20230312120157.452859-5-ray.huang@amd.com/ and
xen https://lore.kernel.org/xen-devel/20230312075455.450187-5-ray.huang@amd.com/),
v1 performed "map_pirq" and "register_gsi" on all pci devices on PVH dom0, which is unnecessary and
may cause multiple registration.

4. failed to map pirq for gsi
Problem: qemu will call xc_physdev_map_pirq() to map a passthrough device’s gsi to pirq in function
xen_pt_realize(). But failed.

Reason: According to the implement of xc_physdev_map_pirq(), it needs gsi instead of irq, but qemu
pass irq to it and treat irq as gsi, it is got from file /sys/bus/pci/devices/xxxx:xx:xx.x/irq in
function xen_host_pci_device_get(). But actually the gsi number is not equal with irq. On PVH dom0,
when it allocates irq for a gsi in function acpi_register_gsi_ioapic(), allocation is dynamic, and
follow the principle of applying first, distributing first. And if you debug the kernel codes(see
function __irq_alloc_descs), you will find the irq number is allocated from small to large by order,
but the applying gsi number is not, gsi 38 may come before gsi 28, that causes gsi 38 get a smaller
irq number than gsi 28, and then gsi != irq.

Solution: we can record the relation between gsi and irq, then when userspace(qemu) want to use gsi,
we can do a translation. The third patch of kernel(xen/privcmd: Add new syscall to get gsi from irq)
records all the relations in acpi_register_gsi_xen_pvh() when dom0 initialize pci devices, and provide
a syscall for userspace to get the gsi from irq. The third patch of xen(tools: Add new function to get
gsi from irq) add a new function xc_physdev_gsi_from_irq() to call the new syscall added on kernel side.
And then userspace can use that function to get gsi. Then xc_physdev_map_pirq() will success. This v2
patch is the same as v1(
kernel https://lore.kernel.org/xen-devel/20230312120157.452859-6-ray.huang@amd.com/ and
xen https://lore.kernel.org/xen-devel/20230312075455.450187-6-ray.huang@amd.com/)

About the v2 patch of qemu, just change an included head file, other are similar to the v1 (
qemu https://lore.kernel.org/xen-devel/20230312092244.451465-19-ray.huang@amd.com/), just call
xc_physdev_gsi_from_irq() to get gsi from irq.

Jiqian Chen (3):
  xen/vpci: Clear all vpci status of device
  x86/pvh: Add (un)map_pirq and setup_gsi for PVH dom0
  libxl: Use gsi instead of irq for mapping pirq

 tools/libs/light/libxl_pci.c | 18 +++++++++---------
 xen/arch/x86/hvm/hypercall.c |  4 ++++
 xen/drivers/pci/physdev.c    | 35 +++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c      |  9 +++++++++
 xen/include/public/physdev.h |  8 ++++++++
 xen/include/xen/vpci.h       |  6 ++++++
 6 files changed, 71 insertions(+), 9 deletions(-)

-- 
2.34.1


