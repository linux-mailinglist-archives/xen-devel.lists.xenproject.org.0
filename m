Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F05D824EFE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 08:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661982.1031851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeL9-00017z-DW; Fri, 05 Jan 2024 07:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661982.1031851; Fri, 05 Jan 2024 07:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeL9-00012Y-91; Fri, 05 Jan 2024 07:09:59 +0000
Received: by outflank-mailman (input) for mailman id 661982;
 Fri, 05 Jan 2024 07:09:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI+5=IP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rLeL7-0000zs-PS
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 07:09:57 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cd46d48-ab99-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 08:09:55 +0100 (CET)
Received: from PR1P264CA0066.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2ca::20)
 by MW4PR12MB6802.namprd12.prod.outlook.com (2603:10b6:303:20f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Fri, 5 Jan
 2024 07:09:50 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10a6:102:2ca:cafe::d1) by PR1P264CA0066.outlook.office365.com
 (2603:10a6:102:2ca::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15 via Frontend
 Transport; Fri, 5 Jan 2024 07:09:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:09:48 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:09:39 -0600
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
X-Inumbo-ID: 6cd46d48-ab99-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHwFnU0lknjpew7E3XPdqsJATKkk2j+aFceGwhokd8S7LYKKTR7h4RNIu7VlItcLkBLkBF1+wsjYQOMQllKxo9Ac1d50OPnfy807uUZ6IuIGPjEygyAkZq2tWoAWoMXGpihv9iGeba2g9z0XyUlmiQreAjl/JG7S5/BWA2iAAxWxeWY1lR4IdgGZny8yLaQTTOkTnecsL0eTgGtrBByn8P5PpEaLPm4nF2dwKdZh0+pw466g5UK9UdJW/PihZjYeGEhNiOzCFYrQLjhvirPztJhMsiLy6EPkcEtYE4c9+i7ryibvf2SD2iVwgeLZTyyVNAaYfiUzVCKBVgaoRwUbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MaiNespvmscH9FQyQVkPQFpEobitIbsmCE4OfFf8qg=;
 b=VhHZS7uCAbjIOeDb/1oxXw15VEG6NmLtbtJsVF38USTWcM3y6SrnsZbi3KJGgRPjzl6QL1E6BpZQjW545jdXkzXy/yxr0G0cY5NfzdMyc7fyGyrMW74rMRkqZIhwlXXd0larSgcGzZVPiErBrPNJlDDla0GJcDHxypNhpG7pz7aiBU0EIHxbujYiab0U2ZYwSoY+Gyuu9BDVCm/W7wHUn52aaecK87NRKhTNckj6aK+pLl5yz9oaNlqxq87KID0x7W1vRhD6+hW47ueNUkmBoCzB0v6fDo5K8Px6SFp2O/SUZcWT+2eZWVXq5VwLxtmWUdg9ATDX2NDpUCmbLHipGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MaiNespvmscH9FQyQVkPQFpEobitIbsmCE4OfFf8qg=;
 b=RnJUggU4/SbHk8RepxfcbIyAHpGapNq/WcgjDXgpor4++UQpoqJNB2tKC7jl+ze0UdCXxtcIQ/fprHthuGMaXkUVBX+Ck8QVDwVZgJs+T0Xh56KhfZ5doAvqXiKW90UmAuMzyfatPozBLeYAx0cKti3FfP82UxEDBER1Bk7fyg0=
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
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>
Subject: [RFC XEN PATCH v4 0/5] Support device passthrough when dom0 is PVH on Xen
Date: Fri, 5 Jan 2024 15:09:15 +0800
Message-ID: <20240105070920.350113-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|MW4PR12MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: b67d0233-5687-4abc-250e-08dc0dbd4e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RS+L2W+TjL7/WSqmZ091Av20ftV6sXspYDyFDlQOmPa/quky62Afa7xDx8RiwtsJXrGiOKcNvygvXvfEU/R0kIDUfi1f7o2xex/Ay3xTdyCfVL2vEJ3qyWgfb31vXWKyVWbbw0/qfgWCozfVz+/Qeser0u+3c6R7l+sjW72XyI2XC8BOtxUfLcYVGa3zr+9pqYpOEqKBDpMbG0Nkz+XAezJDORB7lXA0WGuZ0c/DhT+HVbosuebGHJpO3LpZJm65LArKyfkqbThoEOaXESqIQxzD9IrBsy9yLa6Vj8EQFSOAcxcGz6F/X52qVma68mDbR9Py1Chu5ICuP749MaxHA4ZjR3OpMdHn2sGdb86/in32V647eqI+YAaEn/5uVLdDE7IFB8maeVwc1p7hRtvgCUdo6INbJpKJ1JcS/vqbazDrMfXuVE98xlxH0jqGom6qVHyLxj7UwqCwfJOfhEHtXCVsvlv0ifydvKoSNLjEGs/d4rOkOJvtN+3n3FwGxgNLTi4h2C6eACZWa0A87nMHs5gpDdNczFDS5CgjqlQfAInyCciUu68i2UrKcBh3RVl1S/o61yR4JA1YS6VnkqhCxkwUtpgYkdjp3d4lysxsotOvJ7yh7gV7xZvxUmqKCT/+dS7Vlm4fiPf/sgUrc25dSlUMPg6XlXzvvFMFYYlBZJntc8YbCpS4kSsNw24s6KkQr9haXNVZ9pQSNxMKuNf+htKezWP7vB9nC2rDFVctwxoRdO1YmrxHVDInJH6bow9PL+V15n7g/JbvOA9J6lLlhfJpKSWFK2bnkOUD5vm+DTc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(46966006)(36840700001)(40470700004)(83380400001)(16526019)(426003)(26005)(2616005)(336012)(82740400003)(36860700001)(1076003)(47076005)(478600001)(966005)(8936002)(8676002)(4326008)(5660300002)(7416002)(7696005)(6666004)(6916009)(316002)(54906003)(2906002)(70206006)(41300700001)(70586007)(86362001)(81166007)(36756003)(356005)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:09:48.4323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b67d0233-5687-4abc-250e-08dc0dbd4e2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6802

Hi All,
This is v4 series to support passthrough when dom0 is PVH
v3->v4 changes:
* patch#1: change the comment of PHYSDEVOP_pci_device_state_reset; move printings behind pcidevs_unlock
* patch#2: add check to prevent PVH self map
* patch#3: new patch, The implementation of adding PHYSDEVOP_setup_gsi for PVH is treated as a separate patch
* patch#4: new patch to solve the map_pirq problem of PVH dom0. use gsi to grant irq permission in XEN_DOMCTL_irq_permission.
* patch#5: to be compatible with previous kernel versions, when there is no gsi sysfs, still use irq

v2->v3 changes:
* patch#1: move the content out of pci_reset_device_state and delete pci_reset_device_state; add xsm_resource_setup_pci check for PHYSDEVOP_pci_device_state_reset; add description for PHYSDEVOP_pci_device_state_reset;
* patch#2: du to changes in the implementation of the second patch on kernel side(that it will do setup_gsi and map_pirq when assigning a device to passthrough), add PHYSDEVOP_setup_gsi for PVH dom0, and we need to support self mapping.
* patch#3: du to changes in the implementation of the second patch on kernel side(that adds a new sysfs for gsi instead of a new syscall), so read gsi number from the sysfs of gsi.
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
Problem: when we run “sudo xl pci-assignable-add <sbdf>” to assign a device, pci_stub will call “pcistub_init_device() -> pci_restore_state() -> pci_restore_config_space() ->
pci_restore_config_space_range() -> pci_restore_config_dword() -> pci_write_config_dword()”, the pci config write will trigger an io interrupt to bar_write() in the xen, but the
bar->enabled was set before, the write is not allowed now, and then when 
bar->Qemu config the
passthrough device in xen_pt_realize(), it gets invalid bar values.

Reason: the reason is that we don't tell vPCI that the device has been reset, so the current cached state in pdev->vpci is all out of date and is different from the real device state.

Solution: to solve this problem, the first patch of kernel(xen/pci: Add xen_reset_device_state
function) and the fist patch of xen(xen/vpci: Clear all vpci status of device) add a new hypercall to reset the state stored in vPCI when the state of real device has changed.
Thank Roger for the suggestion of this v2, and it is different from v1 (https://lore.kernel.org/xen-devel/20230312075455.450187-3-ray.huang@amd.com/), v1 simply allow domU to write pci bar, it does not comply with the design principles of vPCI.

2. failed to do PHYSDEVOP_map_pirq when dom0 is PVH
Problem: HVM domU will do PHYSDEVOP_map_pirq for a passthrough device by using gsi. See xen_pt_realize->xc_physdev_map_pirq and pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq will call into Xen, but in hvm_physdev_op(), PHYSDEVOP_map_pirq is not allowed.

Reason: In hvm_physdev_op(), the variable "currd" is PVH dom0 and PVH has no X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.

Solution: I think we may need to allow PHYSDEVOP_map_pirq when "currd" is dom0 (at present dom0 is PVH). The second patch of xen(x86/pvh: Open PHYSDEVOP_map_pirq for PVH dom0) allow PVH dom0 do PHYSDEVOP_map_pirq. This v2 patch is better than v1, v1 simply remove the has_pirq check(xen https://lore.kernel.org/xen-devel/20230312075455.450187-4-ray.huang@amd.com/).

3. the gsi of a passthrough device doesn't be unmasked
 3.1 failed to check the permission of pirq
 3.2 the gsi of passthrough device was not registered in PVH dom0

Problem:
3.1 callback function pci_add_dm_done() will be called when qemu config a passthrough device for domU.
This function will call xc_domain_irq_permission()-> pirq_access_permitted() to check if the gsi has corresponding mappings in dom0. But it didn’t, so failed. See XEN_DOMCTL_irq_permission->pirq_access_permitted, "current" is PVH dom0 and it return irq is 0.
3.2 it's possible for a gsi (iow: vIO-APIC pin) to never get registered on PVH dom0, because the devices of PVH are using MSI(-X) interrupts. However, the IO-APIC pin must be configured for it to be able to be mapped into a domU.

Reason: After searching codes, I find "map_pirq" and "register_gsi" will be done in function vioapic_write_redirent->vioapic_hwdom_map_gsi when the gsi(aka ioapic's pin) is unmasked in PVH dom0.
So the two problems can be concluded to that the gsi of a passthrough device doesn't be unmasked.

Solution: to solve these problems, the second patch of kernel(xen/pvh: Unmask irq for passthrough device in PVH dom0) call the unmask_irq() when we assign a device to be passthrough. So that passthrough devices can have the mapping of gsi on PVH dom0 and gsi can be registered. This v2 patch is different from the v1( kernel https://lore.kernel.org/xen-devel/20230312120157.452859-5-ray.huang@amd.com/,
kernel https://lore.kernel.org/xen-devel/20230312120157.452859-5-ray.huang@amd.com/ and xen https://lore.kernel.org/xen-devel/20230312075455.450187-5-ray.huang@amd.com/),
v1 performed "map_pirq" and "register_gsi" on all pci devices on PVH dom0, which is unnecessary and may cause multiple registration.

4. failed to map pirq for gsi
Problem: qemu will call xc_physdev_map_pirq() to map a passthrough device’s gsi to pirq in function xen_pt_realize(). But failed.

Reason: According to the implement of xc_physdev_map_pirq(), it needs gsi instead of irq, but qemu pass irq to it and treat irq as gsi, it is got from file /sys/bus/pci/devices/xxxx:xx:xx.x/irq in function xen_host_pci_device_get(). But actually the gsi number is not equal with irq. On PVH dom0, when it allocates irq for a gsi in function acpi_register_gsi_ioapic(), allocation is dynamic, and follow the principle of applying first, distributing first. And if you debug the kernel codes(see function __irq_alloc_descs), you will find the irq number is allocated from small to large by order, but the applying gsi number is not, gsi 38 may come before gsi 28, that causes gsi 38 get a smaller irq number than gsi 28, and then gsi != irq.

Solution: we can record the relation between gsi and irq, then when userspace(qemu) want to use gsi, we can do a translation. The third patch of kernel(xen/privcmd: Add new syscall to get gsi from irq) records all the relations in acpi_register_gsi_xen_pvh() when dom0 initialize pci devices, and provide a syscall for userspace to get the gsi from irq. The third patch of xen(tools: Add new function to get gsi from irq) add a new function xc_physdev_gsi_from_irq() to call the new syscall added on kernel side.
And then userspace can use that function to get gsi. Then xc_physdev_map_pirq() will success. This v2 patch is the same as v1( kernel https://lore.kernel.org/xen-devel/20230312120157.452859-6-ray.huang@amd.com/ and xen https://lore.kernel.org/xen-devel/20230312075455.450187-6-ray.huang@amd.com/)

About the v2 patch of qemu, just change an included head file, other are similar to the v1 ( qemu https://lore.kernel.org/xen-devel/20230312092244.451465-19-ray.huang@amd.com/), just call
xc_physdev_gsi_from_irq() to get gsi from irq.

Jiqian Chen (5):
  xen/vpci: Clear all vpci status of device
  x86/pvh: Allow (un)map_pirq when caller isn't DOMID_SELF
  x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
  domctl: Use gsi to grant/revoke irq permission
  libxl: Use gsi instead of irq for mapping pirq

 tools/libs/light/libxl_pci.c | 21 +++++++++++++++++----
 tools/libs/light/libxl_x86.c |  5 ++++-
 xen/arch/x86/hvm/hypercall.c | 34 ++++++++++++++++++++++++++++++++--
 xen/common/domctl.c          | 12 ++++++++++--
 xen/drivers/pci/physdev.c    | 34 ++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c      |  9 +++++++++
 xen/include/public/physdev.h |  7 +++++++
 xen/include/xen/vpci.h       |  6 ++++++
 8 files changed, 119 insertions(+), 9 deletions(-)

-- 
2.34.1


