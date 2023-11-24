Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0397A7F71CE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640459.998736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TdQ-00047R-GY; Fri, 24 Nov 2023 10:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640459.998736; Fri, 24 Nov 2023 10:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TdQ-00044f-Co; Fri, 24 Nov 2023 10:42:08 +0000
Received: by outflank-mailman (input) for mailman id 640459;
 Fri, 24 Nov 2023 10:42:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibx+=HF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r6TdP-00044J-7f
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:42:07 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e89::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b6856e1-8ab6-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:42:05 +0100 (CET)
Received: from DM6PR07CA0052.namprd07.prod.outlook.com (2603:10b6:5:74::29) by
 PH7PR12MB5830.namprd12.prod.outlook.com (2603:10b6:510:1d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 10:42:01 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:5:74:cafe::64) by DM6PR07CA0052.outlook.office365.com
 (2603:10b6:5:74::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Fri, 24 Nov 2023 10:42:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.13 via Frontend Transport; Fri, 24 Nov 2023 10:42:00 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 04:41:56 -0600
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
X-Inumbo-ID: 1b6856e1-8ab6-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoaGuMlU/D+vp+DBP6XM6MQ1NIrx31y5zSrPf3jnN478S8xM1/Fut253hYyqr7EOeea2ZJ4MyVP4TBMiFwHpAlpUyE/yoY1/I8sXr7SuVyCEiUUVNwD8DHNq2S8W9u4Qafqpp9yL7XKrPpa2q3fv/AT054zjcSLCuDfws2pQ0VpdBMppCAz4gb3qO/q8DZGFtDfjQ2DBhfyNJK2jlKbzPlwpw2SbK3oArutSK5Zr6GsEX8mSykZ7NAgDFN1O3Gp6pS8xjTDs3EKNVIuF0lTz95r87IC8nkGqopEuI7RXwf35cA43G+rOQ2j00be7yfJwwObeAR6A23BEd6qJfz6JqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAdLDrxElG/nCt7sYNFn/UabtUtI1BcN1/frFv9Hsk4=;
 b=JK/401LNGihRhukidi6l5kb7X5zcOCHYg/j2bB3F/Bx+UoAtSYxvv4pfpImmeIp6BVbTLKA3gk1AOGOWCDTvomVG1isTc+wVJi4OwSXUkGAbdUeRbY03Q9dfgCw6ZCiL0eHS/1HLCDV2oEtG12f1Myyp9lV2DjSdaz+U72zn7zg/60fmHymKZai3uT0ytqcPlkesdGDVdTFgN6+yz3kjshOY7LDAOfIO/WvvX15l+/tOe8Luz5Ju7WCYXdZv6LvQ0N8HuRFcECUzQtTR943Z5G8BsdE22nOpvSE9Tw8m6Dh5qYumO6NwHifd5nJfjwlVpAtXAU+4Qh/optpd23lFUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAdLDrxElG/nCt7sYNFn/UabtUtI1BcN1/frFv9Hsk4=;
 b=IMHdLCUDxI4bvGm6tugKm0r5sy5I741A+CtVzDhvAfbn9WbuwubJMqw/gmQ5L2IVEFxLwoD8CzpxruKdDtSuKkjaYvR57WjtSglv8xLvngp5tVYhcOxnkoQ6+tsbCjqpuvxFcFllBxGBLlFMbfyjQa0RgGDRlHfpAekZKkTFGhM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Alex Deucher
	<Alexander.Deucher@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang
	<Julia.Zhang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [RFC XEN PATCH v2 0/3] Support device passthrough when dom0 is PVH on Xen
Date: Fri, 24 Nov 2023 18:41:33 +0800
Message-ID: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|PH7PR12MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d4c6b5-2e5d-4036-e4ac-08dbecd9fd90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jnGTp0tYURfDQSwL1rHy50gRn8rGmAILUnJoMkLp2Fr5jBl9dz/mxL7EtV5J7x9zf/MsdYdVvrbHLK0Ijc2Ex49TyCgXuz+hg7Q2gUxsL3EGnpZGjsf0ejhwCb95XsdCZHaFIIikoNlmHijU+QG22k+/PpWzSP7v6ehfxAzu0lh4SSvAHngX3dUkyu3agDhz9A/nwabOCVO28/VKX43FR2X31TKRe78KA0x8PAf9zR5AEkXEoneuUGEiYgpn6bJ/6NJGwprqVPAeLR/zf3vWkRpwhUSx8A7zViGKP/3tsXHWbsq6WWy+fsF/GfsHNG/w4VErjIDL1jDHj/J91HxmEBQxQBdST3ph2w37T0O9FxbdQk2wGYofLIre59LQdxsU/l+cM3GgCnA9S/6+R8uNaCdv8KKnJccsk+XKNGDKG9kScw8ZdDNhL29ziOPpyFw8UD0zvZG+OoIbtXRjmbluYMRbzp+M099lE05vMmeQHK79Q6NIw+1cOE3RMBFebDHY01HbDdty/6jRkZlhhzId94i/pjVYfX8oGhg1cepyl1vJnGfiBqkm1ti8wBjWtu2ImYuSrrwMcgfrHp1vJ20IlcNIQ0BfXo3/erqO+spcGui+kJeqoZf6G9l2rm2OXdxC5Lf4gxIntz4QQ0xGBnRp/sW7G6er2pmYqKL488putyXweCRDInHLsRrF9OMF8t5Y7yMgSEMxkocphoBBW3Eax9nFDc+Zxa3MHmwvklWTdq0NU24rx1E34NiQlGEgodp1I9WckFQjJjlIF3HeimrW598S2PsXNxh2a5W+qHVWb/M=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(40470700004)(46966006)(36840700001)(40460700003)(426003)(83380400001)(82740400003)(86362001)(36756003)(356005)(81166007)(47076005)(36860700001)(336012)(70206006)(70586007)(316002)(54906003)(8936002)(4326008)(8676002)(41300700001)(110136005)(5660300002)(1076003)(2906002)(26005)(16526019)(40480700001)(2616005)(478600001)(6666004)(966005)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 10:42:00.8153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d4c6b5-2e5d-4036-e4ac-08dbecd9fd90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5830

Hi All,

This series of patches are the v2 of the implementation of passthrough when dom0 is PVH on Xen.
We sent the v1 to upstream before, but the v1 had so many problems and we got lots of suggestions.
I will introduce all issues that these patches try to fix and the differences between v1 and v2.

v2 on kernel side:
https://lore.kernel.org/lkml/20231124103123.3263471-1-Jiqian.Chen@amd.com/T/#t

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
  x86/pvh: Open PHYSDEVOP_map_pirq for PVH dom0
  tools: Add new function to get gsi from irq

 tools/include/xen-sys/Linux/privcmd.h |  7 +++++++
 tools/include/xencall.h               |  2 ++
 tools/include/xenctrl.h               |  2 ++
 tools/libs/call/core.c                |  5 +++++
 tools/libs/call/libxencall.map        |  2 ++
 tools/libs/call/linux.c               | 14 ++++++++++++++
 tools/libs/call/private.h             |  9 +++++++++
 tools/libs/ctrl/xc_physdev.c          |  4 ++++
 tools/libs/light/libxl_pci.c          |  1 +
 xen/arch/x86/hvm/hypercall.c          |  3 +++
 xen/drivers/passthrough/pci.c         | 21 +++++++++++++++++++++
 xen/drivers/pci/physdev.c             | 14 ++++++++++++++
 xen/drivers/vpci/vpci.c               |  9 +++++++++
 xen/include/public/physdev.h          |  2 ++
 xen/include/xen/pci.h                 |  1 +
 xen/include/xen/vpci.h                |  6 ++++++
 16 files changed, 102 insertions(+)

-- 
2.34.1


