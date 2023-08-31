Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19CE78E9B8
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593660.926704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeDc-0006pV-36; Thu, 31 Aug 2023 09:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593660.926704; Thu, 31 Aug 2023 09:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeDb-0006mv-WB; Thu, 31 Aug 2023 09:44:04 +0000
Received: by outflank-mailman (input) for mailman id 593660;
 Thu, 31 Aug 2023 09:44:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YD1y=EQ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qbe4W-0006tw-BN
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:34:40 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e88::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99e3ba4d-47e1-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 11:34:38 +0200 (CEST)
Received: from SJ0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:33a::31)
 by CY5PR12MB6551.namprd12.prod.outlook.com (2603:10b6:930:41::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 09:34:34 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::95) by SJ0PR03CA0026.outlook.office365.com
 (2603:10b6:a03:33a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36 via Frontend
 Transport; Thu, 31 Aug 2023 09:34:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Thu, 31 Aug 2023 09:34:34 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 04:34:23 -0500
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
X-Inumbo-ID: 99e3ba4d-47e1-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k92cN5PlgipFyRJ32ahis5g4FYAMVqHXpau5Rf+U10mpc/+1qDu/Gis0JXdJ8UZ/NHlMeFdVdpy5Q6MjeKsB6UFW/Sfk1yVFQeh9w4dkQTR9266YRkT3LN9LNoL4/ENBeAohQ8uSoKUVAYZaGO0R8Dfmqnv9dxxw+h9Hcs0zrwf0KDf1OlpRhQ/KgTUonSfwJF4KsKK9V4q8jJnhwptkyo65GzUXrBJ6yolYQM7gSjqosblwPfDmpfCYfapt+A9ogbbEXQE44sBbyzjMv/S3lwavN5M4x7LKhZNbg6V9G9iB+lD5optv/R5/lUQNnBYFOkaPwjAYx9M1Bc2mwijs6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbK7uQJAi4F+V8q90U5xPcs4Q6zHnO90JXJwecm4cY8=;
 b=NBayjyZc3qG6hcnE5YOdQFmKrXfIIPtz0qT3DOwg9pqJtksKzDzp/XB1KC231hqI6NxEnWUMdbV4qyrlpeXB15FsyivneVmgu1kLrYtGUhmkuXlGUNpM3WxAXpiMpUeZCwzZIZ1DB7zERjou+D98xgCDeYQWyKSxgZJsDlDix6b+0jo4vrG+XIi6zebStsbe3ZE5tYRkq/b6cpSFthVozMQoH6x4BW4TgrYJTBipABbjV+6NloVTb3CjBngYJ6IVq7zEZabYpSswLHi4p5ZiZVqB8NuyUMx0bWTFh7reRk/lb7xBkrHxF8KUrPfdptzAGm/x3CUS5mPziF62mFW2oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbK7uQJAi4F+V8q90U5xPcs4Q6zHnO90JXJwecm4cY8=;
 b=5UuETFR46bJz8B28pSr3U9SeIQ4MIketeFXIuObAoeyrQKKpcu5B7ixhjjDlcv08xL6QjrLsUOgIBO/tWOkXUxkrHfKTnwvSf8PoAOM3XHQUfPByXLaOIQUbHBLpHoZfjm0n07fdyf6Sf5U5LZWdM/QsdyWJ/6QUtfI2twpwTg4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>, "Dmitry
 Osipenko" <dmitry.osipenko@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, <ernunes@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Akihiko Odaki
	<akihiko.odaki@daynix.com>, Alyssa Ross <hi@alyssa.is>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [QEMU PATCH v4 10/13] virtio-gpu: Resource UUID
Date: Thu, 31 Aug 2023 17:32:49 +0800
Message-ID: <20230831093252.2461282-11-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831093252.2461282-1-ray.huang@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|CY5PR12MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: e28bab9a-91f4-4dba-e765-08dbaa057ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cz/qFE0StWNbTwTbEQxauRg6cFi5JjH4Q3ZwLu14kiY2f/XzLEYC2uiDMcuRq4x4AoDwz/Kd1VjO/ssbQeijuQBciffUQ4SNTpLawnMnL9XAuRFHmx10y+tat0Id2PZuzZpoqFuSNeWkjrbLtSIEFXrPx1ubACRNkS3acgJjwvIUWMfdZct2vmMeqD/CvEb/bl4J4vNGgfQSiSBEwnzeDJQr6LSCEerOj1txi1fLxnd2oc9j6M1FzhfRa8/m37lWNMvdWLXdFwJt/AwxVJ0kIRLZs+Br70kxny2T9BMrKiPPa82L9XXtz/FT2KfFHm65ErTAMoJQG5yq0hdvuZl6FfdXhtpD4HAUQuQ97n4SL41NEcVD2Z0Omj+Gk0KK+CQCwn220XIntVqX6XY4pV3bYm5uKxZJzxQJCbqRk7j8q/eNZtggzrQrUM+rM5cWMRy7w943xOcOdx8bbybTCTpBsMOJdZiCMUXwSrHs6DW4h04hqJWMRdYivspuvEJ65FoMG/bC0OdrZDQmpRcQRFgfO0O+CvJvFIBJ3HH1TUld7mzVZh0eb+QGy7QRAbfqCYUPWhgZ0K9zeTQsRbV3euANaLyZQ4GTWBDCrdg3rj1psYy1o+69C4iMw0yKMGw10iGIgqQ6M32ckb5xXwqpbtBbUBV3bFa+HsdKMsKb9rcMHFI0J+yCEiO+r36KlqHtSskebBETG/kzpGsCqm70tPRNHyvFkouBgBIa7jNRBExxkUE9KGLuZoPQtSq6T1ACTdHcMPvAFSh3JxBbBbVaSvwyA8j2Kwz3YTI65B5GYw/PRhA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(82310400011)(451199024)(1800799009)(186009)(40470700004)(36840700001)(46966006)(426003)(40460700003)(316002)(41300700001)(5660300002)(336012)(4326008)(7416002)(8676002)(47076005)(16526019)(83380400001)(2616005)(86362001)(26005)(36756003)(1076003)(36860700001)(2906002)(40480700001)(8936002)(6666004)(356005)(82740400003)(81166007)(921005)(7696005)(54906003)(70206006)(70586007)(478600001)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:34:34.4129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e28bab9a-91f4-4dba-e765-08dbaa057ca0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6551

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Enable resource UUID feature and implement command resource assign UUID.
This is done by introducing a hash table to map resource IDs to their
UUIDs.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

v1->v2:
   - Separate declarations from code.

 hw/display/trace-events        |  1 +
 hw/display/virtio-gpu-base.c   |  2 ++
 hw/display/virtio-gpu-virgl.c  | 21 +++++++++++++++++
 hw/display/virtio-gpu.c        | 41 ++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h |  4 ++++
 5 files changed, 69 insertions(+)

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
index 4f2b0ba1f3..f44388715c 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -236,6 +236,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
         features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
     }
 
+    features |= (1 << VIRTIO_GPU_F_RESOURCE_UUID);
+
     return features;
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 17b634d4ee..1a996a08fc 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -36,6 +36,7 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
 {
     struct virtio_gpu_resource_create_2d c2d;
     struct virgl_renderer_resource_create_args args;
+    struct virtio_gpu_simple_resource *res;
 
     VIRTIO_GPU_FILL_CMD(c2d);
     trace_virtio_gpu_cmd_res_create_2d(c2d.resource_id, c2d.format,
@@ -53,6 +54,14 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
     args.nr_samples = 0;
     args.flags = VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP;
     virgl_renderer_resource_create(&args, NULL, 0);
+
+    res = g_new0(struct virtio_gpu_simple_resource, 1);
+    if (!res) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
+        return;
+    }
+    res->resource_id = c2d.resource_id;
+    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
 }
 
 static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
@@ -60,6 +69,7 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
 {
     struct virtio_gpu_resource_create_3d c3d;
     struct virgl_renderer_resource_create_args args;
+    struct virtio_gpu_simple_resource *res;
 
     VIRTIO_GPU_FILL_CMD(c3d);
     trace_virtio_gpu_cmd_res_create_3d(c3d.resource_id, c3d.format,
@@ -77,6 +87,14 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
     args.nr_samples = c3d.nr_samples;
     args.flags = c3d.flags;
     virgl_renderer_resource_create(&args, NULL, 0);
+
+    res = g_new0(struct virtio_gpu_simple_resource, 1);
+    if (!res) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
+        return;
+    }
+    res->resource_id = c3d.resource_id;
+    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
 }
 
 static void virgl_resource_destroy(VirtIOGPU *g,
@@ -682,6 +700,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
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
index cc4c1f81bb..770e4747e3 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -966,6 +966,37 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
     virtio_gpu_cleanup_mapping(g, res);
 }
 
+void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
+                                     struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_resource_assign_uuid assign;
+    struct virtio_gpu_resp_resource_uuid resp;
+    QemuUUID *uuid = NULL;
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
+    uuid = g_hash_table_lookup(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id));
+    if (!uuid) {
+        uuid = g_new(QemuUUID, 1);
+        qemu_uuid_generate(uuid);
+        g_hash_table_insert(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id), uuid);
+    }
+
+    memcpy(resp.uuid, uuid, sizeof(QemuUUID));
+    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
+}
+
 void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
                                    struct virtio_gpu_ctrl_command *cmd)
 {
@@ -1014,6 +1045,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
         virtio_gpu_resource_detach_backing(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
+        virtio_gpu_resource_assign_uuid(g, cmd);
+        break;
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
@@ -1393,12 +1427,15 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     QTAILQ_INIT(&g->reslist);
     QTAILQ_INIT(&g->cmdq);
     QTAILQ_INIT(&g->fenceq);
+
+    g->resource_uuids = g_hash_table_new_full(NULL, NULL, NULL, g_free);
 }
 
 static void virtio_gpu_device_unrealize(DeviceState *qdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(qdev);
 
+    g_hash_table_destroy(g->resource_uuids);
     g_clear_pointer(&g->ctrl_bh, qemu_bh_delete);
     g_clear_pointer(&g->cursor_bh, qemu_bh_delete);
     g_clear_pointer(&g->reset_bh, qemu_bh_delete);
@@ -1452,6 +1489,10 @@ void virtio_gpu_reset(VirtIODevice *vdev)
         g_free(cmd);
     }
 
+    if (g->resource_uuids) {
+        g_hash_table_remove_all(g->resource_uuids);
+    }
+
     virtio_gpu_base_reset(VIRTIO_GPU_BASE(vdev));
 }
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index b9adc28071..aa94b1b697 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -208,6 +208,8 @@ struct VirtIOGPU {
         QTAILQ_HEAD(, VGPUDMABuf) bufs;
         VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
     } dmabuf;
+
+    GHashTable *resource_uuids;
 };
 
 struct VirtIOGPUClass {
@@ -285,6 +287,8 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
                                     struct iovec *iov, uint32_t count);
 void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
                                 struct virtio_gpu_simple_resource *res);
+void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
+                                     struct virtio_gpu_ctrl_command *cmd);
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
 void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
 void virtio_gpu_reset(VirtIODevice *vdev);
-- 
2.34.1


