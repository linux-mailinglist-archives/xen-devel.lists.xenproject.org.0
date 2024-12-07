Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD8B9E7FA6
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2024 11:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850678.1265065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJsVW-0002dZ-PV; Sat, 07 Dec 2024 10:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850678.1265065; Sat, 07 Dec 2024 10:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJsVW-0002c5-Mi; Sat, 07 Dec 2024 10:57:54 +0000
Received: by outflank-mailman (input) for mailman id 850678;
 Sat, 07 Dec 2024 10:57:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hlXb=TA=amd.com=Julia.Zhang@srs-se1.protection.inumbo.net>)
 id 1tJsVU-0001tQ-Sk
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2024 10:57:53 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2406::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a04e331-b48a-11ef-a0d5-8be0dac302b0;
 Sat, 07 Dec 2024 11:57:52 +0100 (CET)
Received: from MN2PR19CA0065.namprd19.prod.outlook.com (2603:10b6:208:19b::42)
 by DM4PR12MB7501.namprd12.prod.outlook.com (2603:10b6:8:113::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Sat, 7 Dec
 2024 10:57:45 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:208:19b:cafe::20) by MN2PR19CA0065.outlook.office365.com
 (2603:10b6:208:19b::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.16 via Frontend Transport; Sat,
 7 Dec 2024 10:57:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Sat, 7 Dec 2024 10:57:44 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 7 Dec
 2024 04:57:40 -0600
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
X-Inumbo-ID: 1a04e331-b48a-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdDe97pi0tc8ZHZA4Tp6eA1fulBtz6474uH156UNLqzXOXYNDdmZCfco/pJTD6U3HwBUgty6a4/nuNhBtA3bfmFobXdz3xPs542HnZKPLgJU6tX9X2huknnvP8tNVFQqbP8meCdFpkZbEdPujDVpVjuTbVq6ZIyJLOeh+zpGrxEZ54jXg5O7FJRwl7xDDibxcKNofjChG3hq9Lc1b625yEErR/jkzeRMHyqjoFEySGEeLK3BGjl57xzaKf4OVY2KHC1zERTjuuYPBgSL6/s9OgUmC5BTo2bl/Kj9yJ633+5NOz3AM/zCbU2dZ9Epr5GJVpky6hvxNxMYQEnCDRLGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB2v3p8xVBkoFTtj/OssK3eq3aeYBld67hSPE7XCRYE=;
 b=VrJdvEqSaFXdWuNz6YRJEcWBqb7loTgEJbBVP6387HHAqK57q16/kuoDFRxFfs/VwIQJ8Bpf1kVzh+0GO9AlZkZMUKGQvB6qupwVidBWpn+rXADBe4qHOheQrQvkaCJr+I9joePVkaCgeVczVgwd6xrbtd26dl31UAkkKxfTQyLRHNCtWPRW/4XqOPOqbJvPYZ6uBhVeKmFyn+jove30o9RRwlYF2cYaYqiVj2wRqcBw9wt8hysxgp/8uB+omWrpdo2+nVqQPnn426l/uU+nuFNbDTWXNyJZDrxV7wRiKm0iaZHQSlqM6SCOBZdtsBF7sBfKhFn/c2LDw9zjHjn5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB2v3p8xVBkoFTtj/OssK3eq3aeYBld67hSPE7XCRYE=;
 b=bxMe+UBrFAPVtVlkMpBC5s3RhhrgLFmT+xrtuHSRWI2cTJIPlzB5iTjeQ0LJrT9PJbjShJ7Mi24oRfojYpq1rPmSb1yy8xAukdcFegY0/fw9pS0LOtG311cGDWCOsz+6AdZnlMqv32l8FC6v5CFQXC0UwvR3KlyTcjT5H6cC+v8=
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
Subject: [PATCH 3/3] virtio-gpu: add a new command to get p2pdma_distance
Date: Sat, 7 Dec 2024 18:55:40 +0800
Message-ID: <20241207105537.542441-4-julia.zhang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|DM4PR12MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: de85b411-cd99-41cf-2525-08dd16adfac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+qa/yUL1d3QdPp0XvV+rfvpR0waCVpnNrP2Z6qcNRnuryjjeNRBJEERL51uj?=
 =?us-ascii?Q?weuuOZV0jJk4gAOVI+FF9DpMav+r8yJ+jTfT7TQw2/SuNtn9p7QYq8/yLHvm?=
 =?us-ascii?Q?gNgeUCpn/3pKsRlZZUf6AaVmaM7LR9lRITZchEKI4X64sfTT+dFwgFxymw59?=
 =?us-ascii?Q?O0rpDGUzZEVn0nDQ22n8DfAMbM8sr2dntAAImKsn7t3B6aHXjGuwRs+ikRn6?=
 =?us-ascii?Q?MOOjgV7CHgr8eF3YHZaMpsJPItEqNjcdl3vq9X7Q42/uQkVK6aSjsKO8n6bz?=
 =?us-ascii?Q?3Cei0JOIkPYNfVOzzrbk5erVR0WE5CsQUDYQqX5IQkF9fCZ84+y9sorxD5DP?=
 =?us-ascii?Q?oqLzpoGzat5dqyFcTCY+z22i41A/uNL/20g//KB1GOd2uKXb/AWpRCO+Xfh5?=
 =?us-ascii?Q?qeVE0WARvWXwtwEdpiVOwD5j6nCt0GHos5BcfJLXRj4T2BXJ1ghU8/1V5MBB?=
 =?us-ascii?Q?2nNQxjph0tE4wklH5qIilcCuXDPhOWROzxzuDK1Gdqru/Ne5kZCCO4F51RRe?=
 =?us-ascii?Q?GDvdwSHyE+Slk6XAbEPEu59PYZ5q9DwUjoDN6d7X4j6xNegfYcnWI2QGUU5c?=
 =?us-ascii?Q?ygLk8E4qXSnXQD6KBHAVDQxhVvp2BwauMBMObTOuGMifABQku11YFchgcOfx?=
 =?us-ascii?Q?zidK9Iz7MVW5yY+gA4gWTYGRlbh/JwnRF6MYZXhjEec217h3xjpMGJUlqjtJ?=
 =?us-ascii?Q?skbYAO8y4mW/8llD1hGYDQPWeUfQIA0tWELTEyZ6CN9yAEucVVwShpvcvCzU?=
 =?us-ascii?Q?M18584lDBHx9/ZOE69Uogfq8PYKUOa7zRhAQj6mgmQAhc5aLvxNNYD7a/ETN?=
 =?us-ascii?Q?tPvbT/9TdZ5OwVNVQ4tZRKb4U7vNjzVI4tsNXasbtLCSwJ6wUEdhwQmcj7BC?=
 =?us-ascii?Q?1ayHO8N3wZdXGVOqfw0HHcpYoxrDrLjGBWlLFwC9RYntowFneZ0u8U1DbZs+?=
 =?us-ascii?Q?IvMdAFS/9+QOPfybWhdVH75ctPjWXSVk6t5r1DFRhMFfu3taG+umnAalNfGm?=
 =?us-ascii?Q?OSosjeCioNmoUSqIE/L8WJJqQ03Ll8nyjoDOEmDM5jmDbokdxnxzq/lCg5oz?=
 =?us-ascii?Q?3kqrJoIBCQzqwGOwmI+LSoIL8kfWAR0B4SE//9pGnd4/Js9ImiwK9eCxPjEU?=
 =?us-ascii?Q?qtWlFHIX6Yn7vj4kXqWnjXKRWtFCZIHcJTHfHljBIPxa7HDthoa0FQQg5L6C?=
 =?us-ascii?Q?giwEzdlvr4w0lc7IRa/ugFCUwVohifqj3TeZ7ea6etVKlc+IrWC6UOOVW19z?=
 =?us-ascii?Q?AXdx6PwTle1ZvHQB9tf3Y6Bca/rOWOxcbzN7HxhamiHRS5vh+VuQOImCMN1h?=
 =?us-ascii?Q?5N1Jk7vqe2bY9IDf0yLFvo55zna62oJmfFJkVirK1lycmtBoutpgdnL8Rodh?=
 =?us-ascii?Q?fYcWSUeGnu8RH4/SlLcWQyXq7B3fYDilwWREqg555DavrEbW/CPxJfsryI44?=
 =?us-ascii?Q?RcK8IQgi9OTEh6ABpiBud4DN4+tlJ+t1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 10:57:44.8361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de85b411-cd99-41cf-2525-08dd16adfac7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7501

To implement passthrough dGPU prime in guest, virtio-gpu need to check
p2pdma_distance of two GPUs. This adds a new command for guest to pass
virtual pci notations of two pci devices to host and send xen privcmd to
calculate physical p2pdma_distance.

Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
 hw/display/virtio-gpu-virgl.c               | 47 +++++++++++++++++++++
 hw/i386/xen/xen-hvm.c                       |  6 +++
 include/hw/virtio/virtio-gpu-bswap.h        | 12 ++++++
 include/hw/xen/xen.h                        |  3 ++
 include/standard-headers/linux/virtio_gpu.h | 19 +++++++++
 5 files changed, 87 insertions(+)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 07faeb1834..eb9b193ade 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -16,6 +16,12 @@
 #include "qemu/iov.h"
 #include "trace.h"
 #include "hw/virtio/virtio.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/virtio/virtio-pci.h"
+#include "hw/virtio/virtio-bus.h"
+#include "hw/xen/xen.h"
+
 #include "hw/virtio/virtio-gpu.h"
 #include "hw/virtio/virtio-gpu-bswap.h"
 #include "hw/virtio/virtio-gpu-pixman.h"
@@ -188,6 +194,44 @@ virtio_gpu_virgl_unmap_resource_blob(VirtIOGPU *g,
 
     return 0;
 }
+
+static void virgl_cmd_p2pdma_distance(VirtIOGPU *g,
+				      struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_device_p2pdma_distance cmd_p;
+    struct virtio_gpu_resp_distance resp;
+    PCIDevice *client = NULL, *provider = NULL;
+    int ret;
+
+    VIRTIO_GPU_FILL_CMD(cmd_p);
+    virtio_gpu_p2pdma_distance_bswap(&cmd_p);
+
+    ret = pci_qdev_get_device(cmd_p.provider_bus, cmd_p.provider_slot, cmd_p.provider_func, &provider);
+
+    if (ret) {
+	    qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl get physical device error: %s\n",
+			  __func__, strerror(-ret));
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        return;
+    }
+
+    ret = pci_qdev_get_device(cmd_p.client_bus, cmd_p.client_slot, cmd_p.client_func, &client);
+    if (ret) {
+	    qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl get physical device error: %s\n",
+			  __func__, strerror(-ret));
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        return;
+    }
+
+    int distance = xen_p2pdma_distance(provider->hostaddr.bus, provider->hostaddr.slot,
+				       provider->hostaddr.function,client->hostaddr.bus,
+				       client->hostaddr.slot, client->hostaddr.function);
+
+    memset(&resp, 0, sizeof(resp));
+    resp.hdr.type = VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE;
+    resp.distance = distance;
+    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
+}
 #endif
 
 static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
@@ -913,6 +957,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_SUBMIT_3D:
         virgl_cmd_submit_3d(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_P2PDMA_DISTANCE:
+	virgl_cmd_p2pdma_distance(g, cmd);
+	break;
     case VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D:
         virgl_cmd_transfer_to_host_2d(g, cmd);
         break;
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index d3df488c48..c8dd27dad7 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -604,6 +604,12 @@ static bool xen_check_stubdomain(struct xs_handle *xsh)
     return is_stubdom;
 }
 
+int xen_p2pdma_distance(uint32_t bus, uint32_t slot, uint32_t func,
+			uint32_t c_bus, uint32_t c_slot, uint32_t c_func)
+{
+	return xc_physdev_p2pdma_distance(xen_xc, bus, slot, func, c_bus, c_slot, c_func);
+}
+
 void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 {
     MachineState *ms = MACHINE(pcms);
diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/virtio-gpu-bswap.h
index dd1975e2d4..b5c0c0adcd 100644
--- a/include/hw/virtio/virtio-gpu-bswap.h
+++ b/include/hw/virtio/virtio-gpu-bswap.h
@@ -78,6 +78,18 @@ virtio_gpu_map_blob_bswap(struct virtio_gpu_resource_map_blob *mblob)
     le64_to_cpus(&mblob->offset);
 }
 
+static inline void
+virtio_gpu_p2pdma_distance_bswap(struct virtio_gpu_device_p2pdma_distance *p2p_dist)
+{
+    virtio_gpu_ctrl_hdr_bswap(&p2p_dist->hdr);
+    le32_to_cpus(&p2p_dist->provider_bus);
+    le32_to_cpus(&p2p_dist->provider_slot);
+    le32_to_cpus(&p2p_dist->provider_func);
+    le32_to_cpus(&p2p_dist->client_bus);
+    le32_to_cpus(&p2p_dist->client_bus);
+    le32_to_cpus(&p2p_dist->client_bus);
+}
+
 static inline void
 virtio_gpu_unmap_blob_bswap(struct virtio_gpu_resource_unmap_blob *ublob)
 {
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index ecb89ecfc1..fe1d628327 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -48,4 +48,7 @@ qemu_irq *xen_interrupt_controller_init(void);
 
 void xen_register_framebuffer(struct MemoryRegion *mr);
 
+int xen_p2pdma_distance(uint32_t bus, uint32_t slot, uint32_t func,
+			uint32_t c_bus, uint32_t c_slot, uint32_t c_func);
+
 #endif /* QEMU_HW_XEN_H */
diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
index 6459fdb9fb..2e55dcc2fe 100644
--- a/include/standard-headers/linux/virtio_gpu.h
+++ b/include/standard-headers/linux/virtio_gpu.h
@@ -95,6 +95,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_SUBMIT_3D,
 	VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
 	VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
+	VIRTIO_GPU_CMD_P2PDMA_DISTANCE,
 
 	/* cursor commands */
 	VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
@@ -108,6 +109,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_OK_EDID,
 	VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
 	VIRTIO_GPU_RESP_OK_MAP_INFO,
+	VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE,
 
 	/* error responses */
 	VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -429,6 +431,23 @@ struct virtio_gpu_set_scanout_blob {
 	uint32_t offsets[4];
 };
 
+/* VIRTIO_GPU_CMD_P2PDMA_DISTANCE */
+struct virtio_gpu_device_p2pdma_distance {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 provider_bus;
+	__le32 provider_slot;
+	__le32 provider_func;
+	__le32 client_bus;
+	__le32 client_slot;
+	__le32 client_func;
+};
+
+/* VIRTIO_GPU_RESP_DISTANCE */
+struct virtio_gpu_resp_distance {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 distance;
+};
+
 /* VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB */
 struct virtio_gpu_resource_map_blob {
 	struct virtio_gpu_ctrl_hdr hdr;
-- 
2.34.1


