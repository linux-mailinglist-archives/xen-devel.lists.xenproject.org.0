Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6A795477A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 13:09:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778490.1188554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seupG-0002Y4-JT; Fri, 16 Aug 2024 11:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778490.1188554; Fri, 16 Aug 2024 11:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seupG-0002W3-G7; Fri, 16 Aug 2024 11:08:58 +0000
Received: by outflank-mailman (input) for mailman id 778490;
 Fri, 16 Aug 2024 11:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uc/1=PP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1seupF-0001Oc-92
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 11:08:57 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:200a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec9afd98-5bbf-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 13:08:55 +0200 (CEST)
Received: from BN9P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::28)
 by CYYPR12MB8750.namprd12.prod.outlook.com (2603:10b6:930:be::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 16 Aug
 2024 11:08:49 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:10a:cafe::4a) by BN9P221CA0005.outlook.office365.com
 (2603:10b6:408:10a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23 via Frontend
 Transport; Fri, 16 Aug 2024 11:08:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Fri, 16 Aug 2024 11:08:48 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Aug
 2024 06:08:44 -0500
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
X-Inumbo-ID: ec9afd98-5bbf-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fp/dq7IrhwiDsx/qUTdgRxH4Nqmdm8q/w5WTnN+n3sJgQw95LC9Y25ZkDZ6gH3TgGTUtCXmgVZkqw82lCA6EaGrYMJCnQzELO0njQxFVmP1hK+nM4ydLmvR6Vi/ay1kh596EcfLZOSUiCz7u0riQZq5O34SDdiR4rOA41HvWE4PZDRKUoXNS2HpOxsEnb8muf8aIZR3fk+oFrPX0IRplUTDIXDesDteY4i6+2C6mGuGMxf5M7olfTq8j6t+2tjLomNyyvEwfoJS/UfQ2wkFVTAeAIARKnhZFQ3dPd0qKfvHXCz2hLrEEIOEAcauGe0dsXOo9FjNC8jajCwMt0mJGcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEmijQKrvaaonY0ryNFeoICShxLiMC7FhSWe8KUC0mg=;
 b=VPcTrTBgQ2G+7E0KiDIhL2kIfTx+0L7KW4snaC5FYsLhMsEF8ioJ5NahXjktUkefZlo0Mej1wgg96FUjIPoo9gGqp3ZHsXPcomGxfzj9PfFnIiM9XwMHNixvAfQSaJfQl9Y8X/hi11GU87NXUS/uv4RPjFt3xW2vAGxcxpL7vonLTKRZQaEubBHr8ljHztsuicsGCv7vrdd0/i+AfNUj+/MaMdo+u0PXeFFaGdkvufOtYf3OZzxPQM7QtMhO2MBEtNScd5J9OXZ6LX1NTajQbi9ljXM6LIf/QHbTYRF8//4bzFHj56+MzlvlBvAaT1D76nNcACWfPrKLr3i+iLRv5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEmijQKrvaaonY0ryNFeoICShxLiMC7FhSWe8KUC0mg=;
 b=zeNgXRolwhjky5XuvT27UfM8gPkhwPgxHlJDW1CT0K8DKO43/zCcl26/lcHq1xehdhc5avKkEWPQkgX3Kg2wRHcnivwCW+dpduEb8C6SsEOvp7z8fYvtTK+fLspfpIrGlhDG4OoDhsJakBojUfY8x5NGgcPbKNX51xVebesDVk4=
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
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [XEN PATCH v13 3/6] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Date: Fri, 16 Aug 2024 19:08:17 +0800
Message-ID: <20240816110820.75672-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816110820.75672-1-Jiqian.Chen@amd.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|CYYPR12MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 91041b6b-1b0e-4d14-68d8-08dcbde3cd64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wL+0lLg6AKsqXM1d+3yJcRlTxYamDeEiureb6JxOJTEtELTaMrOudw5NOunJ?=
 =?us-ascii?Q?5gcs5iimbCrovCEGXjm7+6RKLpBcgA2HLUDDNnATASs3ADN80zEykhVimZXy?=
 =?us-ascii?Q?xNTZZ1jAqZ+KIekExBaDF+WeHXVfXQ2BE/DDahmaNaFkI3bFCBNyEsGQbrRZ?=
 =?us-ascii?Q?/Ki2BRY2Lcu0pi2KrcYUlE/yU4cy6c3bbbyY0EpFAMP+mzZg5qcW8FXFXqH0?=
 =?us-ascii?Q?zYx0TThTCA3XuInlxRuuLiYprNvODz/7RkZtUj/TGqjwJW5X1BNrcSn/ss/G?=
 =?us-ascii?Q?pO/EblPb2RCH8GlfLwNZqcbC3dfRO//saMM/Onkgg5ViwFtPo31bH+XZWYKO?=
 =?us-ascii?Q?OjRvhV0ClV6l62xwnmqI+VhijwATQwKDR/A/2yl3UoqWzbLD5xLO5m7cpiZ7?=
 =?us-ascii?Q?OQrMRbGD9D171BrZEIojI+XkgzJqurqlYU51QZPvDCNhXa9pcayZtfn6wQ4a?=
 =?us-ascii?Q?GwAXle/5djZHjWvP40Awvi2t7m1I56GxUPdmutDwUo/RGYI4s60FT6ucXsrr?=
 =?us-ascii?Q?umDE3h+Bdzrnzl0v+HMKDpQq5q1k3N8rhbFcFMjUSxdjtFylvH6HbWf1qk5G?=
 =?us-ascii?Q?ZtFjlyDws3Ni5rv4gnZTh3ipqWnxzYa31903ir7npVbbuhpchohghLxegJgc?=
 =?us-ascii?Q?D9um/jSmzlCnS1cfKHjXd6z7tf35XsXgI9BC/SFZmTXRbRDyt4P2jD7pigJm?=
 =?us-ascii?Q?t19yJHqBTYXA+gRnaylD+v2Ouoq2/bp8eN0tZq51tRC/BBgNPXkZSveC+0z6?=
 =?us-ascii?Q?ghRruoAgSsIwDm+VqLxEWshO0NAsg0ZhUn/dGGILcJPVI2d2A7KabXlVT4zx?=
 =?us-ascii?Q?s9LO1vKgS4aGWcMnp0yuI6w/7remxtQwH2B/kYZdeVrkDmDRFrFvdmTI0j7W?=
 =?us-ascii?Q?InoZvVX3/MyopDdySujRhKHN4XgVu1w7ty0SdFz2+sk+1Sl4SL8T+XoYG2vJ?=
 =?us-ascii?Q?BEEiO0c2DqQWrXbqq1f+0PS1ZeCgeEBUvblvP71FcHIxbi8Q5+PKNQz2By+u?=
 =?us-ascii?Q?IaUGYLEMi/zTyouj4icWmAGi5d/GMKj+TDCcdbQWnFgZmGlb/+gr1XPrmh88?=
 =?us-ascii?Q?FP1NPZDUWhWD3rHCZARdbU6uRDVAFY/W5idjDEiDAGYzdDZQtsUxeH5ZX606?=
 =?us-ascii?Q?FmZZf8UHzVEjk+LER1p/5Emug5RE4KoYOD4hAbSrpg0eb9AennGPulN/5XPr?=
 =?us-ascii?Q?cQK0w2M3v259jKBjH4dyfM3SZPb6KRlVZIgN2ttpk2CYa3W5b1YTj+Qv3WLs?=
 =?us-ascii?Q?FINxustum0pmApA5gQs10OKsCgAQYhxPeapZwGxrpnwhFCFX7pkJtq0sF8a+?=
 =?us-ascii?Q?JSsLIe06SrJ7yy3yyT2BnondfMhXw/9T63yNDyrK/uFDCeAeslLO4HjwLFFC?=
 =?us-ascii?Q?P0psOzY50FgD7C6bPr3Nfw8eT5whPIa4tM22054BXg3Gqc64NQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 11:08:48.0122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91041b6b-1b0e-4d14-68d8-08dcbde3cd64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8750

The gsi of a passthrough device must be configured for it to be
able to be mapped into a hvm domU.
But When dom0 is PVH, the gsis may not get registered(see below
clarification), it causes the info of apic, pin and irq not be
added into irq_2_pin list, and the handler of irq_desc is not set,
then when passthrough a device, setting ioapic affinity and vector
will fail.

To fix above problem, on Linux kernel side, a new code will
need to call PHYSDEVOP_setup_gsi for passthrough devices to
register gsi when dom0 is PVH.

So, add PHYSDEVOP_setup_gsi into hvm_physdev_op for above
purpose.

Clarify two questions:
First, why the gsi of devices belong to PVH dom0 can work?
Because when probe a driver to a normal device, it uses the normal
probe function of pci device, in its callstack, it requests irq
and unmask corresponding ioapic of gsi, then trap into xen and
register gsi finally.
Callstack is(on linux kernel side) pci_device_probe->
request_threaded_irq-> irq_startup-> __unmask_ioapic->
io_apic_write, then trap into xen hvmemul_do_io->
hvm_io_intercept-> hvm_process_io_intercept->
vioapic_write_indirect-> vioapic_hwdom_map_gsi-> mp_register_gsi.
So that the gsi can be registered.

Second, why the gsi of passthrough device can't work when dom0
is PVH?
Because when assign a device to passthrough, it uses the specific
probe function of pciback, in its callstack, it doesn't install a
fake irq handler due to the ISR is not running. So that
mp_register_gsi on Xen side is never called, then the gsi is not
registered.
Callstack is(on linux kernel side) pcistub_probe->pcistub_seize->
pcistub_init_device-> xen_pcibk_reset_device->
xen_pcibk_control_isr->isr_on==0.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/hvm/hypercall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 0b7fc060b4e2..81883c8d4f60 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -82,6 +82,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             return -ENOSYS;
         break;
 
+    case PHYSDEVOP_setup_gsi:
     case PHYSDEVOP_pci_mmcfg_reserved:
     case PHYSDEVOP_pci_device_add:
     case PHYSDEVOP_pci_device_remove:
-- 
2.34.1


