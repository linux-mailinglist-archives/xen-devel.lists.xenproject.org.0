Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED49E7FA4
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2024 11:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850654.1265045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJsUZ-0001S9-5a; Sat, 07 Dec 2024 10:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850654.1265045; Sat, 07 Dec 2024 10:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJsUZ-0001Qb-2h; Sat, 07 Dec 2024 10:56:55 +0000
Received: by outflank-mailman (input) for mailman id 850654;
 Sat, 07 Dec 2024 10:56:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hlXb=TA=amd.com=Julia.Zhang@srs-se1.protection.inumbo.net>)
 id 1tJsUX-00012y-E3
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2024 10:56:53 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [2a01:111:f403:2415::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f63f366d-b489-11ef-99a3-01e77a169b0f;
 Sat, 07 Dec 2024 11:56:51 +0100 (CET)
Received: from BN9PR03CA0241.namprd03.prod.outlook.com (2603:10b6:408:ff::6)
 by DS0PR12MB8041.namprd12.prod.outlook.com (2603:10b6:8:147::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Sat, 7 Dec
 2024 10:56:47 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:ff:cafe::f5) by BN9PR03CA0241.outlook.office365.com
 (2603:10b6:408:ff::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.11 via Frontend Transport; Sat,
 7 Dec 2024 10:56:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Sat, 7 Dec 2024 10:56:47 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 7 Dec
 2024 04:56:42 -0600
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
X-Inumbo-ID: f63f366d-b489-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTWqjXj/cHSYr9UurojeUnLoCM8xnLBh4kp2mmvwj+GNr0RCF09Fod71jpmoo2ed9v3XL2CWtoNOxMcE9CVBxrbm3HGucK6FjnEX+UgU5Cji7ykrh6cO5ayQJBmnThVZYRG1XgjQU6lKM8wBhuV1dKStdrxLJbL8GyJlVnulZ5lq0DRAuAFw/GZPZ4fYDVsq7A03B0Yw3VD5/7qZ6tan8Dx3q5LEdcoZxF/TyIzHGGv+GLxS2UDxqnKffZZyk3PWibkNyW9YbKA+cdhYxM1KrVYTyc1c1QolaqwMzGw8u920NXyLJtFREfD1W/m5K0rtxhdT0N0H8iXB+qnKtMP2YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vj8HPAjMVLVff8tdV9jtHw/j79hcngd7Jdhce14dQI=;
 b=V1aSL+g2kLX4ehPGo7eQuGWq5oFVXx0p69U3atB3mJMHJsO3AwRhGoJmxJA0NU7AKOnPYxcXU/D4lvTH9KNEEzC0od7Qm57sYx02OMLJvyzUEkF/apzlK4IBMF5jy9hu9yEYagLqZo/ym6+CFpZAaZ7prLI1024iSvz9GjuZHaSOc54G/dUmt87cm5H2Bv2pqCdIpJ1pw6OMEfFyuwEmcW3dG1og3bfbX6tp+1D7xxnbxKya5wkPN1jgYWayOM+ozTVGa14VEMVIspUAFUECLvLQSK+WFMCpkXsJQOnJfzYC0Kfp+2A2zBHZlebHOxAyUB6o2aL+JGx1TTV8j8gmDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vj8HPAjMVLVff8tdV9jtHw/j79hcngd7Jdhce14dQI=;
 b=o+VnPY4Z1urWpil7/gCAzKbcgLY1NC8IBY+R0T/vjnghfQPcotWLK2SM7zfawqGVL2cVtY/SbK1yMFiimVWlYLfZGv1pLR2Bthky8stzgB+JCVML1dOAXPjfsITkoKwVO0tXv925ZPLcJomXrHDzs7CnCBQ8qQaiIg8dQdkyxo8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Julia Zhang <julia.zhang@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "Edgar E .
 Iglesias" <edgar.iglesias@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Xenia
 Ragiadakou" <burzalodowa@gmail.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, Penny Zheng
	<penny.zheng@amd.com>, Zhu Lingshan <Lingshan.Zhu@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, <qemu-devel@nongnu.org>
Subject: [PATCH 1/3] virtio-gpu: set hostaddr for virtio iGPU
Date: Sat, 7 Dec 2024 18:55:36 +0800
Message-ID: <20241207105537.542441-2-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241207105537.542441-1-julia.zhang@amd.com>
References: <20241207105537.542441-1-julia.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|DS0PR12MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3410e5-db36-45c2-9616-08dd16add859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WknFN806tZ1knN/IaQhDfbZpeHpc+X5jkDV1ej/vy5RKTgQiTRs1AY4nJQtr?=
 =?us-ascii?Q?xYfUR4j4wSxnYM2vdgCJIdBEVF/SFN/U2ndBjuAJpnOv/CfguQvvYMO/d5pY?=
 =?us-ascii?Q?DkCpdjytlOOTVWn/ZA8TNjhXoX5xPtVcZM7zKQIh9xoBuOiNQD0I+A6KSHhA?=
 =?us-ascii?Q?fvIhtoK0z2CBEWdnbp2yQohXS3MqR2QgCbDS+pDrtZti+1qamZtjTW1RpECu?=
 =?us-ascii?Q?c7Jjdmf/0cRWrSdQs2ngnbmQoJ0Upkofo3UGD9FLZCbP4Ctf4AwWFGC7dLw1?=
 =?us-ascii?Q?Q+vwnjnsILRazWalLfXvzVuVAs4wWaaMlyqdk6dqFyBNRtpb8hCVMT6IUoLv?=
 =?us-ascii?Q?TXF8EyAUNiiR3WILDNACIntp+yAA2SSQ1/EMLhNhz2c7gJaT3kRlTEvOteMv?=
 =?us-ascii?Q?ZOHsg/Z0YJoSAxepWorv0WHgN4KdeJCxF5zBjIwQfSYBdZNkfyiF/BoE5Zor?=
 =?us-ascii?Q?1BrsUuDgJ8HjHmJ4pD0/kkG4Q1g9AWtKoDrrDz0TF0ME2wYgIIZP87iP5tHm?=
 =?us-ascii?Q?ChMl9FNcf0PeTeB6oOYaHeaskiQeuorDf1dTpjEFrA2Ab2K5UVljKZ59K4/b?=
 =?us-ascii?Q?yHHGDeafUeNI7J8v9n3TnpNuvFDjDY144pmAG9HpXqnFq04+43rBP6xdQmDx?=
 =?us-ascii?Q?POi02eiF3c4EU4wrKxDh1P8j21fwrlfOOEraR6zHATNkf/7p6EHNegcbU617?=
 =?us-ascii?Q?qQ+5iAF0kelhW1EBDsnVvPPZwqAk3qKJBvWr125TbZoV6sNGU+33ctzGiXlq?=
 =?us-ascii?Q?QOQfihDHYYnbOuSW7NP/Q8OVOJHItqYHhkCpnN/9gysKkkm6k+iSHrpjVqfF?=
 =?us-ascii?Q?wwUwYBmZ7eUFwUSaB678pIqHRrOvp/pVq2FtrSdfbZ7ys0lEW+nis0BIBSnX?=
 =?us-ascii?Q?H4OMoDv/r87p6ZZbeHMt2XrE+tVsTaX4XJoVz6zqRpp+Fl8CQpiTX8c/01h8?=
 =?us-ascii?Q?NAsWfpQVyaoSDGbqNkPLgBbumkbVW8q9F2frOZSFiBaR5njNQ/zDJHvSprUy?=
 =?us-ascii?Q?Kt0Qfqj91GrVIApwVkktdAxBg/rhZfxesthvkdqtsdyBmiTswZsXTyH+TM5I?=
 =?us-ascii?Q?VxlBnK4ClVXF5Eh6nj9gqcCpuDmhlPlNXsOrP6GlKYSMjOgfz/CWHCkUuRv8?=
 =?us-ascii?Q?HhQtnMoG4i2s0DXPtZMDf/J89vFebAtAExaM8geiezN0vurtRDtkJjVCYKym?=
 =?us-ascii?Q?cn+7ezKUhmC+RVs/LvATyDnOBO1ZnOactmjBxUkQJbrMwU98qLFJailwp7qX?=
 =?us-ascii?Q?PphnsK2qdPPGnHawyx5zwyTDCfaGHsgzGF8z4N0sw24gnwYFFcW1cZNFv/MQ?=
 =?us-ascii?Q?YFFVxVtH08jZHDhuEFSwkZ2pEliuMJu8AxmtzFQ9em9GjP9gtye2Wl5CCm+p?=
 =?us-ascii?Q?ZjwHmTvsutpRo732VIgZ+oG0fhYu+V3TAUDyw9bXUEskfTIk0kqyyFgWi4zD?=
 =?us-ascii?Q?6EUKf1M+0wNJ16D6tvE5ypKVGSxIE0iI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 10:56:47.0600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3410e5-db36-45c2-9616-08dd16add859
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8041

Get physical pci notation from hvm file and set hostaddr for virtio
iGPU. 

Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
 hw/display/virtio-gpu.c        |  6 ++++++
 hw/xen/xen_pt.c                | 10 +++++-----
 hw/xen/xen_pt.h                |  1 -
 include/hw/pci/pci_device.h    |  1 +
 include/hw/virtio/virtio-gpu.h |  2 ++
 5 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index c0570ef856..d68b64ac22 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -26,6 +26,7 @@
 #include "hw/virtio/virtio-gpu-bswap.h"
 #include "hw/virtio/virtio-gpu-pixman.h"
 #include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/qdev-properties.h"
 #include "qemu/log.h"
 #include "qemu/memfd.h"
@@ -1458,6 +1459,8 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(qdev);
     VirtIOGPU *g = VIRTIO_GPU(qdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(qdev));
+    VirtIOPCIProxy *proxy = VIRTIO_PCI(qbus->parent);
 
     if (virtio_gpu_blob_enabled(g->parent_obj.conf)) {
         if (!virtio_gpu_rutabaga_enabled(g->parent_obj.conf) &&
@@ -1508,6 +1511,8 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     QTAILQ_INIT(&g->reslist);
     QTAILQ_INIT(&g->cmdq);
     QTAILQ_INIT(&g->fenceq);
+
+    proxy->pci_dev.hostaddr = g->parent_obj.conf.hostaddr;
 }
 
 static void virtio_gpu_device_unrealize(DeviceState *qdev)
@@ -1669,6 +1674,7 @@ static Property virtio_gpu_properties[] = {
                     VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
     DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
     DEFINE_PROP_UINT8("x-scanout-vmstate-version", VirtIOGPU, scanout_vmstate_version, 2),
+    DEFINE_PROP_PCI_HOST_DEVADDR("hostaddr", VirtIOGPU, parent_obj.conf.hostaddr),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index c0042b3515..8e5ff09b66 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -828,9 +828,9 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
 
     /* register real device */
     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
-               " to devfn 0x%x\n",
+               " to devfn 0x%x, %02x:%02x.%d\n",
                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
-               s->dev.devfn);
+               s->dev.devfn, pci_bus_num(pci_get_bus(&s->dev)), PCI_SLOT(s->dev.devfn), PCI_FUNC(s->dev.devfn));
 
     s->is_virtfn = s->real_device.is_virtfn;
     if (s->is_virtfn) {
@@ -991,7 +991,7 @@ static void xen_pt_unregister_device(PCIDevice *d)
 }
 
 static Property xen_pci_passthrough_properties[] = {
-    DEFINE_PROP_PCI_HOST_DEVADDR("hostaddr", XenPCIPassthroughState, hostaddr),
+    DEFINE_PROP_PCI_HOST_DEVADDR("hostaddr", XenPCIPassthroughState, dev.hostaddr),
     DEFINE_PROP_BOOL("permissive", XenPCIPassthroughState, permissive, false),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -1022,8 +1022,8 @@ static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
     PCIBus *pci_bus = pci_get_bus(pci_dev);
 
     xen_host_pci_device_get(&s->real_device,
-                            s->hostaddr.domain, s->hostaddr.bus,
-                            s->hostaddr.slot, s->hostaddr.function,
+                            s->dev.hostaddr.domain, s->dev.hostaddr.bus,
+                            s->dev.hostaddr.slot, s->dev.hostaddr.function,
                             errp);
     if (*errp) {
         error_append_hint(errp, "Failed to \"open\" the real pci device");
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 095a0f0365..f61a134ff5 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -233,7 +233,6 @@ typedef struct XenPTMSIX {
 struct XenPCIPassthroughState {
     PCIDevice dev;
 
-    PCIHostDeviceAddress hostaddr;
     bool is_virtfn;
     bool permissive;
     bool permissive_warned;
diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
index 8eaf0d58bb..b7acf3822d 100644
--- a/include/hw/pci/pci_device.h
+++ b/include/hw/pci/pci_device.h
@@ -56,6 +56,7 @@ typedef struct PCIReqIDCache PCIReqIDCache;
 
 struct PCIDevice {
     DeviceState qdev;
+    PCIHostDeviceAddress hostaddr;
     bool partially_hotplugged;
     bool has_power;
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 553799b8cc..e385794a06 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -24,6 +24,7 @@
 #include "standard-headers/linux/virtio_gpu.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include "qom/object.h"
+#include "hw/pci/pci.h"
 
 #define TYPE_VIRTIO_GPU_BASE "virtio-gpu-base"
 OBJECT_DECLARE_TYPE(VirtIOGPUBase, VirtIOGPUBaseClass,
@@ -125,6 +126,7 @@ struct virtio_gpu_base_conf {
     uint32_t xres;
     uint32_t yres;
     uint64_t hostmem;
+    PCIHostDeviceAddress hostaddr;
 };
 
 struct virtio_gpu_ctrl_command {
-- 
2.34.1


