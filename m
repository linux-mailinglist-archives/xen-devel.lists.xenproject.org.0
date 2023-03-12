Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A52A6B63F6
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 10:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508909.783884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvm-0002gL-Gr; Sun, 12 Mar 2023 09:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508909.783884; Sun, 12 Mar 2023 09:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvm-0002bn-DH; Sun, 12 Mar 2023 09:23:54 +0000
Received: by outflank-mailman (input) for mailman id 508909;
 Sun, 12 Mar 2023 09:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbHvk-00008O-Jg
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 09:23:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 987fd1a3-c0b7-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 10:23:51 +0100 (CET)
Received: from MW4PR04CA0292.namprd04.prod.outlook.com (2603:10b6:303:89::27)
 by BN9PR12MB5307.namprd12.prod.outlook.com (2603:10b6:408:104::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 09:23:44 +0000
Received: from CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::1b) by MW4PR04CA0292.outlook.office365.com
 (2603:10b6:303:89::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:23:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT083.mail.protection.outlook.com (10.13.174.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 09:23:43 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:23:38 -0500
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
X-Inumbo-ID: 987fd1a3-c0b7-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O42/FPcMjk2698dS+fQoJf7NQf071KjZmLhMD7rX8H3iqvhv6zYyO82UHyBEN7C0ZM5fN3e37/PGtSxVK5mJrDWBvZIV2ZXQ0ZACzin7Hmc8aoH2vbkCZD3dIrv4aI54TZErj6QLeuSwgfsuPpS+M9ScGIUxZWns14sjr15dSi4MMrtBIpRJVYNxYFkYFfXEYHHVvbIoonRRD2ZM9eQR1+24SEyymvLxJWL8jMLLvFcdh/f8KmR3Cm2EOQto+ZRZktkjVdsx9qnrmDKNI4P8Zxt6UhFJicHPDXDVaE5TaYMRF5Q+L3plP79Xu7DHri0MFkzm8ycXbNIyyZIGoPk0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rY/N3X0rpQlmiqhja8ALXObsHhGh3tr3xM8xHuQ2IA=;
 b=MqMiuu015yvi4bqt6eAiWO0of06bVGtRFebboXIdiXZeHTYWFjJrq23XdyX7jZzAC0m67jEwkI25WWjRfgSKGybO2LFUN1LWj4LjsmsffA5qwr+xQZozkXLvV2oT4kX9Xk1dobgGYIf2memA3n0Xk9ok7kedbkUcXi63V7UjfqmDYPWd5hSk/gTVSK4CmHK8kBYh9CZx2Oc1WnDeijrliH7JXLYXhM/JvlWsIsaFTRdHI0cZDRJkDKiuMFKBs0hbQ1XOGZ3dpct+XKCp15DQr3Ruaq6LIhd5hpgFRXmVYVzKZkzZ27nyKYXGjgxgk+s+YpfWKrocxqH1jw8MVMqiUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rY/N3X0rpQlmiqhja8ALXObsHhGh3tr3xM8xHuQ2IA=;
 b=Ji6tZH1OZIykR3r/A/VdDQSxcMaWZue1NAFapcGl4WEg7KZgJs38Bf97SXUo+lrUd2hRk92oT1ZA5ZD18IPLPvoBNa2buaHrl9hE9HRYi9rSSGnuLqFvzajwWPVxCUaJ4/WBQUHdtKxM4IehQ3KIX0A3jDetRGNlJPf8knKMJTU=
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
	<julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>
Subject: [RFC QEMU PATCH 06/18] virtio-gpu: Resource UUID
Date: Sun, 12 Mar 2023 17:22:32 +0800
Message-ID: <20230312092244.451465-7-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT083:EE_|BN9PR12MB5307:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ddbb17-bced-46e5-d5c4-08db22db79c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IcMT8UzS3p177JP5MqeksfLMB/9J2nBkGioT7+C4q2YicFn+Vg2Q8CnTnsQx7x6ti13Sqdla9PX9zoIHKC3QdoBt4pXWFzwT2Fe7QWJ7qvHrwz+51gmag31KxxT/PT2XGP2BOeNnGphYDO6VVIJ6lQuNUJy6auagJNp+54zmAIQp6tebLwtms++9GDEWnKXbd+jq3bYt7BTKxNPA3EcfzSxeLUML8uFpf9T5MrL7K4BtaRB/BKglp0GoBd5CEQhQjZ4JI+WfijHUuvyAgack6H9omyeIz5j2kLbrIesD0Ujf9nnwAaFuTfmC1EWOqcR+0DdfIMBeRQGOerYejNMDsv2v5AM8bQGbsNdz+mavV9utU1XsFJLE65+XfIfkIS8suTiXSKBsZ24OBSvkLMUsVFIToBWrMwApc2y2XKzPn1H1JUHrkXfCUEOFe0Ga+OvKZopNOBusIOeAZCV02kQtV51NqTZmTd80iIx7B+PeoKGCNAB4KtEnRAbdRtY/wv+NbvGzVmqZGYmIyYuQhRX+Elvtedjmwc0W8SlPdDhiTiOzSIaLF3hURLUbGv6kL6orMs7bqUNNigXa5VZBfLThyFEQG4yZ5E/VRnleixWQPhWezFgSGV3tD/8s2sHl/Q7jMIw+rIu3iTRehViowCfITJd8AlVMqRKeQGc/RR22jzRUKteBZ2q+0hcsu3IfkRSJJp1UGvKMvTKn/4VGZXilyYgyaOCLr3qm2VbwixXa5xpUBkPpFvEErgP+gz2axEPY
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199018)(36840700001)(46966006)(40470700004)(82740400003)(36860700001)(82310400005)(921005)(356005)(70586007)(2906002)(41300700001)(70206006)(7696005)(8676002)(40480700001)(4326008)(40460700003)(478600001)(316002)(110136005)(86362001)(36756003)(54906003)(81166007)(426003)(47076005)(5660300002)(26005)(1076003)(2616005)(336012)(186003)(16526019)(7416002)(6666004)(8936002)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:23:43.7579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ddbb17-bced-46e5-d5c4-08db22db79c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5307

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Enable resource UUID feature and implement command resource assign UUID.
This is done by introducing a hash table to map resource IDs to their
UUIDs.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/trace-events        |  1 +
 hw/display/virtio-gpu-base.c   |  2 ++
 hw/display/virtio-gpu-virgl.c  | 11 +++++++++
 hw/display/virtio-gpu.c        | 41 ++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h |  4 ++++
 5 files changed, 59 insertions(+)

diff --git a/hw/display/trace-events b/hw/display/trace-events
index 0c0ffcbe42..6632344322 100644
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
index 5cb71e71ad..54792aa501 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -219,6 +219,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
         features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
     }
 
+    features |= (1 << VIRTIO_GPU_F_RESOURCE_UUID);
+
     return features;
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 41712b79ee..a3c388f907 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -45,6 +45,10 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
     args.nr_samples = 0;
     args.flags = VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP;
     virgl_renderer_resource_create(&args, NULL, 0);
+
+    struct virtio_gpu_simple_resource *res = g_new0(struct virtio_gpu_simple_resource, 1);
+    res->resource_id = c2d.resource_id;
+    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
 }
 
 static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
@@ -69,6 +73,10 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
     args.nr_samples = c3d.nr_samples;
     args.flags = c3d.flags;
     virgl_renderer_resource_create(&args, NULL, 0);
+
+    struct virtio_gpu_simple_resource *res = g_new0(struct virtio_gpu_simple_resource, 1);
+    res->resource_id = c3d.resource_id;
+    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
 }
 
 static void virgl_cmd_resource_unref(VirtIOGPU *g,
@@ -621,6 +629,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
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
index 62239dee0f..c7d1e52cb5 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -940,6 +940,37 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
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
@@ -988,6 +1019,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
         virtio_gpu_resource_detach_backing(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
+        virtio_gpu_resource_assign_uuid(g, cmd);
+        break;
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
@@ -1348,12 +1382,15 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
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
     qemu_bh_delete(g->cursor_bh);
     qemu_bh_delete(g->ctrl_bh);
 
@@ -1383,6 +1420,10 @@ void virtio_gpu_reset(VirtIODevice *vdev)
         g_free(cmd);
     }
 
+    if (g->resource_uuids) {
+        g_hash_table_remove_all(g->resource_uuids);
+    }
+
     virtio_gpu_base_reset(VIRTIO_GPU_BASE(vdev));
 }
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index ef02190f97..0a44aea4ee 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -200,6 +200,8 @@ struct VirtIOGPU {
         QTAILQ_HEAD(, VGPUDMABuf) bufs;
         VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
     } dmabuf;
+
+    GHashTable *resource_uuids;
 };
 
 struct VirtIOGPUClass {
@@ -273,6 +275,8 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
                                   uint32_t *niov);
 void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
                                     struct iovec *iov, uint32_t count);
+void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
+                                     struct virtio_gpu_ctrl_command *cmd);
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
 void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
 void virtio_gpu_reset(VirtIODevice *vdev);
-- 
2.25.1


