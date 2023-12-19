Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E038182A8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 08:55:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656538.1024822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUwr-0003TO-SA; Tue, 19 Dec 2023 07:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656538.1024822; Tue, 19 Dec 2023 07:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUwr-0003Qy-Oq; Tue, 19 Dec 2023 07:55:29 +0000
Received: by outflank-mailman (input) for mailman id 656538;
 Tue, 19 Dec 2023 07:55:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oURO=H6=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rFUwq-0000yA-HZ
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 07:55:28 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e83::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7f6b487-9e43-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 08:55:26 +0100 (CET)
Received: from MW4PR04CA0356.namprd04.prod.outlook.com (2603:10b6:303:8a::31)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Tue, 19 Dec
 2023 07:55:22 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:8a:cafe::de) by MW4PR04CA0356.outlook.office365.com
 (2603:10b6:303:8a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Tue, 19 Dec 2023 07:55:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.7 via Frontend Transport; Tue, 19 Dec 2023 07:55:22 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 01:55:14 -0600
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
X-Inumbo-ID: f7f6b487-9e43-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmvHz913hB1TWlEMQDyYE9+o+MZMifSYI/AEtM4RH4BMiczRjzOeeE6HYRBbSjYMXTU+8dYzA+jjZf7/obPrstkTWqB64DPM9o22gXm9aicPYtp0hv0PAUzgDNwrjKFCF9OesiHLndyZsauqdrlYi4SgTel6MiLhkmjZpB9XEcMJke+xjS+xvFt9IXsYWe/dl5LllkiNniyTck7SEN8rGdDrpmL+7oNlNyzl75JIOSDbDfvTD6R5U1TKB7FI0tRSisZ3Lto4VlQ2MUn5LgAWEXLzje+LvK5jWhinJREnQevYqWlaP2E5zT90DD0zHYYS2pbVs31ZNX8xdKOhfPnDbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6wM7XdDLz/vD6HCFSkY/1aVRVdBt1QQMsmUBQSoj30=;
 b=d7e3gb/sOMg46ymeLKqB1gD4I3zELp4uEGKjGwhlwarQDp2pVOYpt8jGdZQLY8Y+776bAPyiiH7K7f9WrEYBiRHOppCHmU8SMKbbM29RP8MM4gf5khkkPwX0Os/MrYm9eKp2OY26oibvYq+ruCODALj+DsO9DvQERJ2BbUboZQeAzKIQk5lyUaWr1Tmxr0UBPddokJ+IeIuz63yuk0r8bPMwei4XCKs2o3UtjJOx459dYU1qYdpPxmz44OLsf1dJkg0JvzLhvw8+8dYZlyPmuG7ttG16yLZDj4q5+IL38YZgISrQD5f2YlY1029A/ceMp/zUbbzN4e/TMNn3i2GAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6wM7XdDLz/vD6HCFSkY/1aVRVdBt1QQMsmUBQSoj30=;
 b=Dz5NnppdXVdZQ2D1d7fl/G5vqoMtjL90QOK1v9ZFa3RnLAtvks43CMG2TYBmB/Gwq0bijuxC0V/fZ4IDRdVErGEKG7MCITqenYgk7L+EgL2OKbreah3bPBl5gn0FYutBPLEXUGVRqNO12Y4R9uZ3aZN+Di5G035xAp2WJnR4os4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Gerd Hoffmann
	<kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, Robert Beckett
	<bob.beckett@collabora.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, <ernunes@redhat.com>, Alyssa Ross
	<hi@alyssa.is>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alex Deucher <alexander.deucher@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH v6 08/11] virtio-gpu: Resource UUID
Date: Tue, 19 Dec 2023 15:53:17 +0800
Message-ID: <20231219075320.165227-9-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231219075320.165227-1-ray.huang@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e63952-2d9e-4901-9f1a-08dc0067da7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7F1yjdWR/CEy1ib18kKEI3rMswtuQLXbhP4gS/VvxwJBvxJqXcx4On8o4e0m9VSvV2v2cFOAtA1/ARBXZI/ZW4xma3O+fNEm/mAC9puLPzJB5OK4Vqyr0yJ3a/q7VrqIc/GURtIsgt7nm2T5rECDEJIHaOuoiNnzj27OnwZN1Xz4/2P6FpuG5eLZfOikadv2M+tbFGo2Tn0/XPrgaultecVuKGdCJzPab5Gu10SrT/LcKFWVS91fqyFXgx42yp7/DjZ++MY34o0d1oTLgfww+8FJn+rFsSAsC5seeiYhcZB6tsLIXdYiqoBg51cVx+e/jumejZorHXT0Z/FJ0gjJQP3gvJ/OMQulxBJ0ldVRNdWtHl8VB/F/Uk/dvVYsuvLlKY5ghg48weiehPQGYtNVNy49TkMUECdSVdWjAxyx3lVbnFOUjWUptEkkicOctnhyiCR+CeucSoXlYWYQXR/GBJeYqr6+JQQAH4itScQoFNxHM//uJDsjtMKaXKw+VoBg4T0AwZgsPq93zrLPsM1zrLkRmLnKSzp/Kx6PXijWINdizA7SpMLp9vbc3Qg1KRhzTpjw+OZdVPhz0yDoSKpSplb29ARBBmbOGMwhVidfBT9M9hlGCeygQqXzxSb5AEWaRewEP2inN5CvHlO03nAHetlwhlO6AiWAhiMbFri8mW7M8Fwjp7wjyRNsyrtlMAi9J22RcURm3ViWqtlMyklGvNyos8G6qt/dmkFiY1I2WOMI1AwtbdGQsbIRkL/vGs6lPHmauyueDN4GCWOApXStJVjMx9oCOJqYPHlRrDxyn/A=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(1800799012)(82310400011)(186009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(921008)(70206006)(70586007)(81166007)(356005)(82740400003)(36756003)(86362001)(16526019)(36860700001)(1076003)(426003)(336012)(26005)(83380400001)(2616005)(7696005)(2906002)(8936002)(316002)(8676002)(110136005)(54906003)(478600001)(7416002)(4326008)(5660300002)(41300700001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 07:55:22.5658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e63952-2d9e-4901-9f1a-08dc0067da7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Enable resource UUID feature and implement command resource assign UUID.
This is done by introducing a hash table to map resource IDs to their
UUIDs.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

Changes in v6:
- Set resource uuid as option.
- Implement optional subsection of vmstate_virtio_gpu_resource_uuid_state
  or virtio live migration.
- Use g_int_hash/g_int_equal instead of the default.
- Move virtio_vgpu_simple_resource initialization in the earlier new patch
  "virtio-gpu: Introduce virgl_gpu_resource structure"

 hw/display/trace-events        |   1 +
 hw/display/virtio-gpu-base.c   |   4 ++
 hw/display/virtio-gpu-virgl.c  |   3 +
 hw/display/virtio-gpu.c        | 119 +++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h |   7 ++
 5 files changed, 134 insertions(+)

diff --git a/hw/display/trace-events b/hw/display/trace-events
index 2336a0ca15..54d6894c59 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -41,6 +41,7 @@ virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" P
 virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
+virtio_gpu_cmd_res_assign_uuid(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 37af256219..6bcee3882f 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -236,6 +236,10 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
         features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
     }
 
+    if (virtio_gpu_resource_uuid_enabled(g->conf)) {
+        features |= (1 << VIRTIO_GPU_F_RESOURCE_UUID);
+    }
+
     return features;
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 5a3a292f79..be9da6e780 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -777,6 +777,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
         /* TODO add security */
         virgl_cmd_ctx_detach_resource(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
+        virtio_gpu_resource_assign_uuid(g, cmd);
+        break;
     case VIRTIO_GPU_CMD_GET_CAPSET_INFO:
         virgl_cmd_get_capset_info(g, cmd);
         break;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 8189c392dc..466debb256 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -958,6 +958,37 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
     virtio_gpu_cleanup_mapping(g, res);
 }
 
+void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
+                                     struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_resource_assign_uuid assign;
+    struct virtio_gpu_resp_resource_uuid resp;
+    QemuUUID *uuid;
+
+    VIRTIO_GPU_FILL_CMD(assign);
+    virtio_gpu_bswap_32(&assign, sizeof(assign));
+    trace_virtio_gpu_cmd_res_assign_uuid(assign.resource_id);
+
+    res = virtio_gpu_find_check_resource(g, assign.resource_id, false, __func__, &cmd->error);
+    if (!res) {
+        return;
+    }
+
+    memset(&resp, 0, sizeof(resp));
+    resp.hdr.type = VIRTIO_GPU_RESP_OK_RESOURCE_UUID;
+
+    uuid = g_hash_table_lookup(g->resource_uuids, &assign.resource_id);
+    if (!uuid) {
+        uuid = g_new(QemuUUID, 1);
+        qemu_uuid_generate(uuid);
+        g_hash_table_insert(g->resource_uuids, &assign.resource_id, uuid);
+    }
+
+    memcpy(resp.uuid, uuid, sizeof(QemuUUID));
+    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
+}
+
 void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
                                    struct virtio_gpu_ctrl_command *cmd)
 {
@@ -1006,6 +1037,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
         virtio_gpu_resource_detach_backing(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
+        virtio_gpu_resource_assign_uuid(g, cmd);
+        break;
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
@@ -1400,6 +1434,57 @@ static int virtio_gpu_blob_load(QEMUFile *f, void *opaque, size_t size,
     return 0;
 }
 
+static int virtio_gpu_resource_uuid_save(QEMUFile *f, void *opaque, size_t size,
+                                         const VMStateField *field,
+                                         JSONWriter *vmdesc)
+{
+    VirtIOGPU *g = opaque;
+    struct virtio_gpu_simple_resource *res;
+    QemuUUID *uuid;
+
+    /* in 2d mode we should never find unprocessed commands here */
+    assert(QTAILQ_EMPTY(&g->cmdq));
+
+    QTAILQ_FOREACH(res, &g->reslist, next) {
+        qemu_put_be32(f, res->resource_id);
+        uuid = g_hash_table_lookup(g->resource_uuids, &res->resource_id);
+        qemu_put_buffer(f, (void *)uuid, sizeof(QemuUUID));
+    }
+    qemu_put_be32(f, 0); /* end of list */
+
+    g_hash_table_destroy(g->resource_uuids);
+
+    return 0;
+}
+
+static int virtio_gpu_resource_uuid_load(QEMUFile *f, void *opaque, size_t size,
+                                         const VMStateField *field)
+{
+    VirtIOGPU *g = opaque;
+    struct virtio_gpu_simple_resource *res;
+    uint32_t resource_id;
+    QemuUUID *uuid = NULL;
+
+    g->resource_uuids = g_hash_table_new_full(g_int_hash, g_int_equal, NULL, g_free);
+    resource_id = qemu_get_be32(f);
+    while (resource_id != 0) {
+        res = virtio_gpu_find_resource(g, resource_id);
+        if (res) {
+            return -EINVAL;
+        }
+
+        res = g_new0(struct virtio_gpu_simple_resource, 1);
+        res->resource_id = resource_id;
+
+        qemu_get_buffer(f, (void *)uuid, sizeof(QemuUUID));
+        g_hash_table_insert(g->resource_uuids, &res->resource_id, uuid);
+
+        resource_id = qemu_get_be32(f);
+    }
+
+    return 0;
+}
+
 static int virtio_gpu_post_load(void *opaque, int version_id)
 {
     VirtIOGPU *g = opaque;
@@ -1475,12 +1560,15 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     QTAILQ_INIT(&g->reslist);
     QTAILQ_INIT(&g->cmdq);
     QTAILQ_INIT(&g->fenceq);
+
+    g->resource_uuids = g_hash_table_new_full(g_int_hash, g_int_equal, NULL, g_free);
 }
 
 static void virtio_gpu_device_unrealize(DeviceState *qdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(qdev);
 
+    g_hash_table_destroy(g->resource_uuids);
     g_clear_pointer(&g->ctrl_bh, qemu_bh_delete);
     g_clear_pointer(&g->cursor_bh, qemu_bh_delete);
     g_clear_pointer(&g->reset_bh, qemu_bh_delete);
@@ -1534,6 +1622,8 @@ void virtio_gpu_reset(VirtIODevice *vdev)
         g_free(cmd);
     }
 
+    g_hash_table_remove_all(g->resource_uuids);
+
     virtio_gpu_base_reset(VIRTIO_GPU_BASE(vdev));
 }
 
@@ -1583,6 +1673,32 @@ const VMStateDescription vmstate_virtio_gpu_blob_state = {
     },
 };
 
+static bool virtio_gpu_resource_uuid_state_needed(void *opaque)
+{
+    VirtIOGPU *g = VIRTIO_GPU(opaque);
+
+    return virtio_gpu_resource_uuid_enabled(g->parent_obj.conf);
+}
+
+const VMStateDescription vmstate_virtio_gpu_resource_uuid_state = {
+    .name = "virtio-gpu/resource_uuid",
+    .minimum_version_id = VIRTIO_GPU_VM_VERSION,
+    .version_id = VIRTIO_GPU_VM_VERSION,
+    .needed = virtio_gpu_resource_uuid_state_needed,
+    .fields = (const VMStateField[]){
+        {
+            .name = "virtio-gpu/resource_uuid",
+            .info = &(const VMStateInfo) {
+                .name = "resource_uuid",
+                .get = virtio_gpu_resource_uuid_load,
+                .put = virtio_gpu_resource_uuid_save,
+            },
+            .flags = VMS_SINGLE,
+        } /* device */,
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 /*
  * For historical reasons virtio_gpu does not adhere to virtio migration
  * scheme as described in doc/virtio-migration.txt, in a sense that no
@@ -1610,6 +1726,7 @@ static const VMStateDescription vmstate_virtio_gpu = {
     },
     .subsections = (const VMStateDescription * []) {
         &vmstate_virtio_gpu_blob_state,
+        &vmstate_virtio_gpu_resource_uuid_state,
         NULL
     },
     .post_load = virtio_gpu_post_load,
@@ -1622,6 +1739,8 @@ static Property virtio_gpu_properties[] = {
     DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
     DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
+    DEFINE_PROP_BIT("resource_uuid", VirtIOGPU, parent_obj.conf.flags,
+                    VIRTIO_GPU_FLAG_RESOURCE_UUID_ENABLED, false),
 #ifdef HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS
     DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, true),
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 584ba2ed73..76b410fe91 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -98,6 +98,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_BLOB_ENABLED,
     VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED,
     VIRTIO_GPU_FLAG_RUTABAGA_ENABLED,
+    VIRTIO_GPU_FLAG_RESOURCE_UUID_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -114,6 +115,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED))
 #define virtio_gpu_rutabaga_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_RUTABAGA_ENABLED))
+#define virtio_gpu_resource_uuid_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_RESOURCE_UUID_ENABLED))
 #define virtio_gpu_hostmem_enabled(_cfg) \
     (_cfg.hostmem > 0)
 
@@ -209,6 +212,8 @@ struct VirtIOGPU {
         QTAILQ_HEAD(, VGPUDMABuf) bufs;
         VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
     } dmabuf;
+
+    GHashTable *resource_uuids;
 };
 
 struct VirtIOGPUClass {
@@ -307,6 +312,8 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
                                     struct iovec *iov, uint32_t count);
 void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
                                 struct virtio_gpu_simple_resource *res);
+void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
+                                     struct virtio_gpu_ctrl_command *cmd);
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
 void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
 void virtio_gpu_reset(VirtIODevice *vdev);
-- 
2.25.1


