Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007F982BB29
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 07:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666637.1037386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOAok-0000Cm-2u; Fri, 12 Jan 2024 06:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666637.1037386; Fri, 12 Jan 2024 06:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOAoj-0000Az-V0; Fri, 12 Jan 2024 06:14:57 +0000
Received: by outflank-mailman (input) for mailman id 666637;
 Fri, 12 Jan 2024 06:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/PwP=IW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rOAoi-0000At-FR
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 06:14:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7450f52-b111-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 07:14:55 +0100 (CET)
Received: from CH0PR03CA0028.namprd03.prod.outlook.com (2603:10b6:610:b0::33)
 by PH8PR12MB7254.namprd12.prod.outlook.com (2603:10b6:510:225::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24; Fri, 12 Jan
 2024 06:14:48 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::8f) by CH0PR03CA0028.outlook.office365.com
 (2603:10b6:610:b0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 06:14:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 06:14:48 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 00:14:03 -0600
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
X-Inumbo-ID: e7450f52-b111-11ee-98f0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtiOiXKUw7ajcKNYe04oSloxYJ6kNrHkq3Wv6L+6kS6o1XWg4UxLv1fNEB5qUX3BS2INY9NLOkGk5rQjNV2jHrU3kbnDmM6/Ka0h4fL1HdexdMsZZ096mOvDWEGsFtaJTgxmms9T90nPXgbIXd5nCcENtdPi68m1Etn0wG+SjIcYWOrlHMb0L3s5QPpZC+IcvtFCVMO3ltcalbx/fRBWXHCerPVSNRWzO6jnrciVBv0qAcZiiJq9Ai+gB2qNETSCNfZAnXuB9D+Cxhnr/twYdsIDr6yRNMoBkEdVL3IOpeFthN+sNCHkwAH5SEXoVOMbdHIr6xIz0QtfQnymSxMxRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqL0kcWJVAkUceJET5Sh5tRkIKjMYXMkn5B0KUkxMa4=;
 b=Ocz9TpTbOBxwkd/fj0RgcinR9+2jRGHUnFgvG1BOHVk4c36z/VV7Bi9+70HzSoVIj/OAZeQFn3vl72RGbUDCndau8KvqsEDIeBR9REzI2R06SPaVfvC0SSLCBsW+SFlZg4rFD7p9NWsNN+17N+zMZoaA24XDOJ1Wy/NqASmd6wK/85D1mIDics+8IOmE6ANuyzGlfcn2jWnBbLgPqQiMn6OthrnnG8Gad2EZ9bRa/t1VUCMFvz0dimfVA3quT/Rzs87q7rFDChkdOrKCozCycVbg5h/8Is98kxhFh9PmLB+yXybRmr5nIvng9c2i2W8LgLnbDpAZL5t6h7dyEatKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqL0kcWJVAkUceJET5Sh5tRkIKjMYXMkn5B0KUkxMa4=;
 b=MuZDLRvTZUwdUj2wjcHo/S+OF61eQxIejj9skcBzVwcVBVGa+J4q/tIavmyWGXgZ03OKx2N/++3hpsMSRSS7ag+h76ut8nmdmwSy3Afg+5U2zcCY/lcRQeOX6wbyLwncRGcg8jO0l93ZUGHD8uqySn61glaKT7Xg9NQVQTO/clc=
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
	"Juergen Gross" <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>
Subject: [RFC XEN PATCH v5 0/5] Support device passthrough when dom0 is PVH on Xen
Date: Fri, 12 Jan 2024 14:13:12 +0800
Message-ID: <20240112061317.418658-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|PH8PR12MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: 318fe11c-b6dc-4a8f-81fb-08dc1335c798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KVTtmMJsEyF8m5Rx/UX7+1662GUXEZyuxfqTZvuyweSiTEtGOmWJAWPqqaIAC7SVaKMQoSIA/TvjPqLz7CJxPElwPEA8dIQFVlmEe5SBVx8HVhhpKM5ArWxwSrxA4rp09cswDI6X8T1GYvAkFK5jKXqJ91jOYc4sR6e8++kfEaYtapeRwsXGvqEr6tm6b0F2S8/bVyXWwQIb1BqdWtj1G6giiXzKGiKEnw+AQh/9mXLic5E2ViWy0Bif1X849x0c2PEOxyfgK8ThF22AV6IGhwPSQrYYjKQguQAik3oDg9O5xGGGuw1VjQ878OreEzV9A1dDfoAGf3wr9lUPg8afyefOlPwdyELPMXs/ZNhvV1W+wNSy1nFI+6FOq52ZyW/vgjwvB4Pai5tHTKVY+PHjIkSkWydoXr29v7u6w/v64C1IPpU+ahrpRtWN67Ie7R8m0ratQUwYHs2/FS9H37C+Brmn6nCzP03Lm/ChwXQwad71DZk+fReU62urIvzYs6JM83CLAu2LUculo30TkqAtOOt0fAAo1ZkDo73Y/ZZVL7b5aWrIZzsYXhx5rHGpSNRzn0KsA4HdQP24gOfMoPkp8tcwm6kw7Vl/HEQFhVC1h9uqVx+gd4vCHuNH/En9Jl7OAjI8AzJp52AM/DcB1cbj7v3MHmhdaKXDUJGnIDF1swPtPM82E5OkLdK/Ol1z5SlRFmoKpXXhqKJaQyyvfdIbZAOsl3Y0lWo1te/i2Eip3pwFBgVA3+Me8/fNp44EyHihXG+UZthxFNuf2fUhlZtttBpxw5I1tvzGFMT7WFUgEao=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(1800799012)(82310400011)(186009)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(82740400003)(336012)(356005)(41300700001)(86362001)(36756003)(70206006)(81166007)(2906002)(36860700001)(83380400001)(47076005)(16526019)(478600001)(1076003)(2616005)(26005)(426003)(7696005)(70586007)(316002)(6666004)(54906003)(966005)(6916009)(5660300002)(8936002)(4326008)(7416002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 06:14:48.1372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 318fe11c-b6dc-4a8f-81fb-08dc1335c798
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7254

Hi All,
This is v5 series to support passthrough when dom0 is PVH
v4->v5 changes:
* patch#1: add pci_lock wrap function vpci_reset_device_state
* patch#2: move the check of self map_pirq to physdev.c, and change to check if the caller has PIRQ flag, and just break for PHYSDEVOP_(un)map_pirq in hvm_physdev_op
* patch#3: return -EOPNOTSUPP instead, and use ASSERT(!has_pirq(currd));
* patch#4: is the patch#5 in v4 because patch#5 in v5 has some dependency on it. And add the handling of errno and add the Reviewed-by Stefano
* patch#5: is the patch#4 in v4. New implementation to add new hypercall XEN_DOMCTL_gsi_permission to grant gsi


v3->v4 changes:
* patch#1: change the comment of PHYSDEVOP_pci_device_state_reset; move printings behind pcidevs_unlock
* patch#2: add check to prevent PVH self map
* patch#3: new patch, The implementation of adding PHYSDEVOP_setup_gsi for PVH is treated as a separate patch
* patch#4: new patch to solve the map_pirq problem of PVH dom0. use gsi to grant irq permission in XEN_DOMCTL_irq_permission.
* patch#5: to be compatible with previous kernel versions, when there is no gsi sysfs, still use irq
v4 link:
https://lore.kernel.org/xen-devel/20240105070920.350113-1-Jiqian.Chen@amd.com/T/#t

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
  x86/pvh: Allow (un)map_pirq when dom0 is PVH
  x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
  libxl: Use gsi instead of irq for mapping pirq
  domctl: Add XEN_DOMCTL_gsi_permission to grant gsi

 tools/include/xenctrl.h      |  5 +++++
 tools/libs/ctrl/xc_domain.c  | 15 +++++++++++++
 tools/libs/light/libxl_pci.c | 41 ++++++++++++++++++++++++++++++++----
 xen/arch/x86/domctl.c        | 31 +++++++++++++++++++++++++++
 xen/arch/x86/hvm/hypercall.c |  9 ++++++++
 xen/arch/x86/physdev.c       | 22 +++++++++++++++++++
 xen/drivers/pci/physdev.c    | 36 +++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c      | 10 +++++++++
 xen/include/public/domctl.h  |  9 ++++++++
 xen/include/public/physdev.h |  7 ++++++
 xen/include/xen/vpci.h       |  6 ++++++
 xen/xsm/flask/hooks.c        |  1 +
 12 files changed, 188 insertions(+), 4 deletions(-)

-- 
2.34.1


