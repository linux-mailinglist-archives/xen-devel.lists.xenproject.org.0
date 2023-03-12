Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6287F6B63F3
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 10:23:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508901.783853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvY-0001AE-ER; Sun, 12 Mar 2023 09:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508901.783853; Sun, 12 Mar 2023 09:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvY-00017Z-8i; Sun, 12 Mar 2023 09:23:40 +0000
Received: by outflank-mailman (input) for mailman id 508901;
 Sun, 12 Mar 2023 09:23:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbHvW-0000RV-IW
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 09:23:38 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe59::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9009d5aa-c0b7-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 10:23:36 +0100 (CET)
Received: from MW2PR16CA0017.namprd16.prod.outlook.com (2603:10b6:907::30) by
 SN7PR12MB7227.namprd12.prod.outlook.com (2603:10b6:806:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.22; Sun, 12 Mar
 2023 09:23:31 +0000
Received: from CO1NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::b5) by MW2PR16CA0017.outlook.office365.com
 (2603:10b6:907::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:23:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT099.mail.protection.outlook.com (10.13.175.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 09:23:30 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:23:25 -0500
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
X-Inumbo-ID: 9009d5aa-c0b7-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fmd3v1VPEJzZ5VSxtIGjnVmok2FXPUfSWqRejZerVx3llmuNb0JrOTFaQg7OAFnlvkjzulus36COfinVK60p5aIbf3eoA0dNWy9Gbkt9PhSsYdui11ZwmVHGz1UvjKbFBsh2mu/6VyhPBVR0SjUdDAEMKeQVS0sRK1q8Rfw4Znjk1rOASmkIK2U6tLnX+Kh3dGjzKLd1Nf87SByE2VcO8lvoFjLKO5TlDUjWa8t9XuuoOEXnvcK93cs8ybH6U80WQrzS2NjA3MOGtzhIElqwoX6opbOxSba9eUvf/o68QC7oRSNGKB4kAhLux2/eajb2JRDC/FEQ5HKy9KX9CAuyzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yo3LTX71PNs2g4NoqoVbLWjlsvWLNAFtBIZSAhB5XKo=;
 b=gakOCyzvL5BJZ9f+tq7U4lZTfHGqD5AJH1hEV5A1Bn5dxHahVSnDlzWw7YJI0rZGbNFOYVB72Vs7Dn+7NFmt3+muUsSfjOOSED6wjTnhQ3PCGKDDIi/kIhzry0u8jKgYvJB8ze5kNGOEJ7s2HrHV87fbxD74/REmxK5Xg8VhzBP5X4+VsgE8LtaS1MrsoJYtYq8epeahd3WHiM8cwq97GGey73wxa/tu0ZuD4vtBTgLcDK+k5vNzOO9PecByojLVFdThCP5NNm2GKHZnvZ4vUCJFrwWCu9GqOWnjeE5wOC7OmSK38+4ZIjIkiliKkGoPRFqe0nV37atyNqFVTKPeow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yo3LTX71PNs2g4NoqoVbLWjlsvWLNAFtBIZSAhB5XKo=;
 b=ZKmGPu0woYvxIOIyiY1j9YqqCVabqBeoCfEEZxvc0tQ6XFha1pt3ltkAQim6b4E3z8rVZn9FO0fl2Qp6KoeuAvGUYZrk+8QcJVznYC/qcCe6Esb9hNjV+coib8zzmWhCNSvBCfHxB6XxlqyRsFauMiVzNHXd17gh+DmLySuFtRs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
	<qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
	<burzalodowa@gmail.com>, Honglei Huang <honglei1.huang@amd.com>, Julia Zhang
	<julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, Dmitry Osipenko
	<dmitry.osipenko@collabora.com>
Subject: [RFC QEMU PATCH 03/18] virtio-gpu: Handle resource blob commands
Date: Sun, 12 Mar 2023 17:22:29 +0800
Message-ID: <20230312092244.451465-4-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312092244.451465-1-ray.huang@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT099:EE_|SN7PR12MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 325f08db-a2cc-466a-dc1a-08db22db71d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FdwlsG44QQd8owXN6r45o50t0XDMPHyPVKdphTbIcE9JOkJkPSUm9mHn3nkCLDSNYU80tdTNe1KC40wHo29H/kwTTD+Jy36dN6UfN8PhQpAJ18dsKuPNpZyEF0/lXDwQkKs7FqTfQLPD5nzF+s6M7SSo1AEdiHY14WK9cEYhNRnHDxHqHETddLK+2ykMXqxWCeFI+PmIYaoaKilT25odk1KA6UelGkKxlhUQbI2e6plW4VXLj/lO0iKMCDSqQPt4q/sSkNIO21GUyYj1JbKkGOldOmwaE6tsxgOjFSgEcjY1nBZUML2xC68xnqpI93UEWEI/0+7Ptl+S7EYvs+bPmXJEFG2AkqhSH4iXDt9/xQNG29fp6SOcZ2fITHFJWGN4HJbltABhemJNmJ7exk4T0iJh9tGSGB0UgErryWdPd1wte6sO9RlUfSSWPTzi5z6/NQxaswSbIKc1Gqw1bgx2jrTPPgKpyCai6CcgrLlpCxJ0KvrotxPOf54wpIOExdEGyYojkhSNMRcFfJfcJuN8pTzRPgZce+vlIrMlgXxXD6+HVEfpP98/mBsB8f37YjrKpFSItUTrSr70WKa/kbQrWwsCQ8PcYf497PyAJZxtzNzC4qFNufuqgUMXoPeNZlmbBkbu5hbcTiOiUbm2MYQsmDYwZnI2tC/QDuQdXwZ1D5sAlqqBj/PzMlZgbKBfwxMsayDWTysPIrhLkO4bH1H6dUR6x5CbvyDOC38WRemfhkqVVjqHGHqU5BHJXB+CkxxY
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199018)(46966006)(40470700004)(36840700001)(186003)(356005)(921005)(2906002)(82740400003)(16526019)(2616005)(30864003)(26005)(1076003)(81166007)(5660300002)(8936002)(36860700001)(7416002)(336012)(47076005)(41300700001)(426003)(40460700003)(86362001)(4326008)(40480700001)(8676002)(70586007)(70206006)(82310400005)(7696005)(316002)(83380400001)(36756003)(478600001)(54906003)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:23:30.4543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 325f08db-a2cc-466a-dc1a-08db22db71d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7227

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Support BLOB resources creation, mapping and unmapping by calling the
new stable virglrenderer 0.10 interface. Only enabled when available and
via the blob config. E.g. -device virtio-vga-gl,blob=true

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 hw/display/virtio-gpu-virgl.c        | 168 +++++++++++++++++++++++++++
 hw/display/virtio-gpu.c              |  12 +-
 include/hw/virtio/virtio-gpu-bswap.h |  18 +++
 include/hw/virtio/virtio-gpu.h       |   8 ++
 meson.build                          |   4 +
 5 files changed, 206 insertions(+), 4 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 73cb92c8d5..9b5e3dc782 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -16,6 +16,8 @@
 #include "trace.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-gpu.h"
+#include "hw/virtio/virtio-gpu-bswap.h"
+#include "hw/virtio/virtio-iommu.h"
 
 #include <virglrenderer.h>
 
@@ -398,6 +400,161 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
     g_free(resp);
 }
 
+#ifdef HAVE_VIRGL_RESOURCE_BLOB
+
+static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
+                                           struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_resource_create_blob cblob;
+    int ret;
+
+    VIRTIO_GPU_FILL_CMD(cblob);
+    virtio_gpu_create_blob_bswap(&cblob);
+    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblob.size);
+
+    if (cblob.resource_id == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
+                      __func__);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    res = virtio_gpu_find_resource(g, cblob.resource_id);
+    if (res) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
+                      __func__, cblob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    res = g_new0(struct virtio_gpu_simple_resource, 1);
+    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
+
+    res->resource_id = cblob.resource_id;
+    res->blob_size = cblob.size;
+
+    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
+        ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
+                                            cmd, &res->addrs, &res->iov,
+                                            &res->iov_cnt);
+        if (ret != 0) {
+            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+            return;
+        }
+    }
+
+    if (cblob.blob_mem == VIRTIO_GPU_BLOB_MEM_GUEST) {
+        virtio_gpu_init_udmabuf(res);
+    }
+    const struct virgl_renderer_resource_create_blob_args virgl_args = {
+        .res_handle = cblob.resource_id,
+        .ctx_id = cblob.hdr.ctx_id,
+        .blob_mem = cblob.blob_mem,
+        .blob_id = cblob.blob_id,
+        .blob_flags = cblob.blob_flags,
+        .size = cblob.size,
+        .iovecs = res->iov,
+        .num_iovs = res->iov_cnt,
+    };
+    ret = virgl_renderer_resource_create_blob(&virgl_args);
+    if (ret) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl blob create error: %s\n",
+                      __func__, strerror(-ret));
+        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+    }
+}
+
+static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
+                                        struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_resource_map_blob mblob;
+    int ret;
+    uint64_t size;
+    struct virtio_gpu_resp_map_info resp;
+
+    VIRTIO_GPU_FILL_CMD(mblob);
+    virtio_gpu_map_blob_bswap(&mblob);
+
+    if (mblob.resource_id == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
+                      __func__);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    res = virtio_gpu_find_resource(g, mblob.resource_id);
+    if (!res) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
+                      __func__, mblob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    ret = virgl_renderer_resource_map(res->resource_id, &res->mapped, &size);
+    if (ret) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
+                      __func__, strerror(-ret));
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    memory_region_init_ram_device_ptr(&res->region, OBJECT(g), NULL, size, res->mapped);
+    memory_region_add_subregion(&g->parent_obj.hostmem, mblob.offset, &res->region);
+    memory_region_set_enabled(&res->region, true);
+
+    memset(&resp, 0, sizeof(resp));
+    resp.hdr.type = VIRTIO_GPU_RESP_OK_MAP_INFO;
+    virgl_renderer_resource_get_map_info(mblob.resource_id, &resp.map_info);
+    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
+}
+
+int virtio_gpu_virgl_resource_unmap(VirtIOGPU *g,
+                                    struct virtio_gpu_simple_resource *res)
+{
+    if (!res->mapped) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped %d\n",
+                      __func__, res->resource_id);
+        return VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+    }
+
+    memory_region_set_enabled(&res->region, false);
+    memory_region_del_subregion(&g->parent_obj.hostmem, &res->region);
+    object_unparent(OBJECT(&res->region));
+
+    res->mapped = NULL;
+    return virgl_renderer_resource_unmap(res->resource_id);
+}
+
+static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
+                                        struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_resource_unmap_blob ublob;
+    VIRTIO_GPU_FILL_CMD(ublob);
+    virtio_gpu_unmap_blob_bswap(&ublob);
+
+    if (ublob.resource_id == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
+                      __func__);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    res = virtio_gpu_find_resource(g, ublob.resource_id);
+    if (!res) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
+                      __func__, ublob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    virtio_gpu_virgl_resource_unmap(g, res);
+}
+
+#endif /* HAVE_VIRGL_RESOURCE_BLOB */
+
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
                                       struct virtio_gpu_ctrl_command *cmd)
 {
@@ -464,6 +621,17 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_GET_EDID:
         virtio_gpu_get_edid(g, cmd);
         break;
+#ifdef HAVE_VIRGL_RESOURCE_BLOB
+    case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:
+        virgl_cmd_resource_create_blob(g, cmd);
+        break;
+    case VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB:
+        virgl_cmd_resource_map_blob(g, cmd);
+        break;
+    case VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB:
+        virgl_cmd_resource_unmap_blob(g, cmd);
+        break;
+#endif /* HAVE_VIRGL_RESOURCE_BLOB */
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 7b592f998d..95d1347a2e 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -33,8 +33,6 @@
 
 #define VIRTIO_GPU_VM_VERSION 1
 
-static struct virtio_gpu_simple_resource*
-virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
 static struct virtio_gpu_simple_resource *
 virtio_gpu_find_check_resource(VirtIOGPU *g, uint32_t resource_id,
                                bool require_backing,
@@ -115,7 +113,7 @@ static void update_cursor(VirtIOGPU *g, struct virtio_gpu_update_cursor *cursor)
                   cursor->resource_id ? 1 : 0);
 }
 
-static struct virtio_gpu_simple_resource *
+struct virtio_gpu_simple_resource *
 virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
 {
     struct virtio_gpu_simple_resource *res;
@@ -875,6 +873,10 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
 static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
                                        struct virtio_gpu_simple_resource *res)
 {
+    if (res->mapped) {
+        virtio_gpu_virgl_resource_unmap(g, res);
+    }
+
     virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
     res->iov = NULL;
     res->iov_cnt = 0;
@@ -1324,10 +1326,12 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
             return;
         }
 
+#ifndef HAVE_VIRGL_RESOURCE_BLOB
         if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
-            error_setg(errp, "blobs and virgl are not compatible (yet)");
+            error_setg(errp, "Linked virglrenderer does not support blob resources");
             return;
         }
+#endif
     }
 
     if (!virtio_gpu_base_device_realize(qdev,
diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/virtio-gpu-bswap.h
index 9124108485..dd1975e2d4 100644
--- a/include/hw/virtio/virtio-gpu-bswap.h
+++ b/include/hw/virtio/virtio-gpu-bswap.h
@@ -63,10 +63,28 @@ virtio_gpu_create_blob_bswap(struct virtio_gpu_resource_create_blob *cblob)
 {
     virtio_gpu_ctrl_hdr_bswap(&cblob->hdr);
     le32_to_cpus(&cblob->resource_id);
+    le32_to_cpus(&cblob->blob_mem);
     le32_to_cpus(&cblob->blob_flags);
+    le32_to_cpus(&cblob->nr_entries);
+    le64_to_cpus(&cblob->blob_id);
     le64_to_cpus(&cblob->size);
 }
 
+static inline void
+virtio_gpu_map_blob_bswap(struct virtio_gpu_resource_map_blob *mblob)
+{
+    virtio_gpu_ctrl_hdr_bswap(&mblob->hdr);
+    le32_to_cpus(&mblob->resource_id);
+    le64_to_cpus(&mblob->offset);
+}
+
+static inline void
+virtio_gpu_unmap_blob_bswap(struct virtio_gpu_resource_unmap_blob *ublob)
+{
+    virtio_gpu_ctrl_hdr_bswap(&ublob->hdr);
+    le32_to_cpus(&ublob->resource_id);
+}
+
 static inline void
 virtio_gpu_scanout_blob_bswap(struct virtio_gpu_set_scanout_blob *ssb)
 {
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index eafce75b04..caca834680 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -55,6 +55,9 @@ struct virtio_gpu_simple_resource {
     int dmabuf_fd;
     uint8_t *remapped;
 
+    MemoryRegion region;
+    void *mapped;
+
     QTAILQ_ENTRY(virtio_gpu_simple_resource) next;
 };
 
@@ -245,6 +248,9 @@ void virtio_gpu_base_fill_display_info(VirtIOGPUBase *g,
                         struct virtio_gpu_resp_display_info *dpy_info);
 
 /* virtio-gpu.c */
+struct virtio_gpu_simple_resource *
+virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
+
 void virtio_gpu_ctrl_response(VirtIOGPU *g,
                               struct virtio_gpu_ctrl_command *cmd,
                               struct virtio_gpu_ctrl_hdr *resp,
@@ -289,5 +295,7 @@ void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
 void virtio_gpu_virgl_reset(VirtIOGPU *g);
 int virtio_gpu_virgl_init(VirtIOGPU *g);
 int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);
+int virtio_gpu_virgl_resource_unmap(VirtIOGPU *g,
+                                    struct virtio_gpu_simple_resource *res);
 
 #endif
diff --git a/meson.build b/meson.build
index 5c6b5a1c75..be74b653b6 100644
--- a/meson.build
+++ b/meson.build
@@ -774,6 +774,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
                      method: 'pkg-config',
                      required: get_option('virglrenderer'),
                      kwargs: static_kwargs)
+  config_host_data.set('HAVE_VIRGL_RESOURCE_BLOB',
+		       cc.has_function('virgl_renderer_resource_create_blob',
+				       prefix: '#include <virglrenderer.h>',
+				       dependencies: virgl))
 endif
 blkio = not_found
 if not get_option('blkio').auto() or have_block
-- 
2.25.1


