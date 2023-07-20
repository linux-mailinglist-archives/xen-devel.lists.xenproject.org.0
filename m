Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F24675ADDD
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 14:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566570.885570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMSSj-0004bL-Hr; Thu, 20 Jul 2023 12:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566570.885570; Thu, 20 Jul 2023 12:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMSSj-0004Zf-EX; Thu, 20 Jul 2023 12:08:53 +0000
Received: by outflank-mailman (input) for mailman id 566570;
 Thu, 20 Jul 2023 12:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5mVk=DG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1qMSSh-0004IL-U2
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 12:08:52 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20607.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ecfa3b6-26f6-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 14:08:49 +0200 (CEST)
Received: from MW3PR06CA0005.namprd06.prod.outlook.com (2603:10b6:303:2a::10)
 by SJ0PR12MB6759.namprd12.prod.outlook.com (2603:10b6:a03:44b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Thu, 20 Jul
 2023 12:08:41 +0000
Received: from CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::44) by MW3PR06CA0005.outlook.office365.com
 (2603:10b6:303:2a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Thu, 20 Jul 2023 12:08:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT108.mail.protection.outlook.com (10.13.175.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.34 via Frontend Transport; Thu, 20 Jul 2023 12:08:41 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 20 Jul
 2023 07:08:36 -0500
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
X-Inumbo-ID: 2ecfa3b6-26f6-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wv/vP5fJoQUUG85kjDRgI4xLWpu3IFwMh71uXQBSIGXonUsAha6h6VnjkV1domcETkFF333vKLcapmSr0Xbtnv4FMDvt6hfkJfEjt2/NoCq/Qn9oVPQzjlqk0gN3GhBqwRrxKwmE+6qRDm5SMn1lmHQQefRARdW5e10VTrry3q6XNoIe8iZ8W02e3MPpQ+3qnieSd/v7ncn9b9AzWqobzTrG6eAE6dgH3B47WMwx+640u3pP+/iweF1IzXmCBCwCf6gs3JEUMsMJ7Aj1nZdn/7ux+cWONCqyno8Hjuyj5otLFlVFb4DvjT3pqu+nfQ4cv1tOXx0CzXZDX+qrekgd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2nnIzFAg5lffgYdIkGPf2VATfRWsO0f+lxrVhiSw00=;
 b=GwvAlVIbDlHKuR3mLgeISOneSAm3+hPhEHZK0KsQkNRSMykSN6smo1XPTITrk0713/0IEbEuMbsEYtbc+oDAruN7C0mVgmYsO1DfN1dYXJawVB69D8XxgFEsJVLkz66TxyLBQ/R39BPRvTDl3uW8ZRHGLNqPEiQOVBAb5ZiIQ1BqqzIEsme1oFeDVYgCmTrOtGVK+xxo3cRfsm+1aKP+E4b1bTjtOXmccs6PGIbtH/bZRJQS0y4AmbZk4ULftI964Sgbn5XaNitsr+K06dCkDnea9A2sRzoqQfH3HRsEp2To8yXpHo9GIANtYh+VNAt84w75wJiguWEsPRfFD6sYGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2nnIzFAg5lffgYdIkGPf2VATfRWsO0f+lxrVhiSw00=;
 b=X2/DGAlTg4kfcBGC6UaO5nhV4i4vKwG/6L3Ny5sBSLiPGazriJV9SaYAXi8ibAPQf75f/GDuuKmT/GkCwudU+O50lkSCtd3h/zKttg+lAutulRbhAP+ntymzSbrIAqcndYQ2xA/5iQ45vOxGBSFmm4zReryv/yEIp7s3gFxyOS4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Robert
 Beckett" <bob.beckett@collabora.com>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Alex Deucher <Alexander.Deucher@amd.com>,
	Christian Koenig <Christian.Koenig@amd.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
	Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang <Julia.Zhang@amd.com>,
	Huang Rui <Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [QEMU PATCH v4 1/1] virtgpu: do not destroy resources when guest suspend
Date: Thu, 20 Jul 2023 20:08:16 +0800
Message-ID: <20230720120816.8751-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720120816.8751-1-Jiqian.Chen@amd.com>
References: <20230720120816.8751-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT108:EE_|SJ0PR12MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: 3979add2-85d1-4123-2c6d-08db891a0ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TF5z2fHXpX3G1PUvhTgnKFcm7zBBlcAfMCjwljsCBLPmS2vC6EK5OGnuLlXVcxtfxdhWb2YPOErx5b7TVO6Ji1x/EdknXN/t7r7jaHW2i2eCkVF/+W5lYMzb0VbReNvxHJq+xWrgSKWfIm/qcYCTNvYqdvmf84fu+2NX8cs0Bg3UMYoRrzgu3eajLsCEG5qYtao6+Q48vv9vSOHkc5Zo2RQ/PNl2m9fGvBGBciVEdntGmbNkLlvwYgPRaAD6cWi+0II7HcTZbAqctywaMf74lyMpWB+yioDFO8X2XUEaB6J+UgBXNq5CwJMjjsQK+7e2awudwxPTcf87vMvyMUfnUZaeJ0IgP67CqCpvRaCXvtLuQRRN4TWBttiC758i3u5qULMXOxgLtjs8v6SQwsmm4ye9LL3Wvod95MYtUwXlO9Wcrz+evbHaf00SoKkCHUjab/h2B39FhKS8a6kV564h6LLzd1ODs89hT49NCPs3IuKPPKfPJSUjMFk6PsGgJgs/Pe/a0FNd1++cPkdc6lCFgHDp1wfVY4ndbmcvowXSzWgISckBgWhAspuMghWPJxB1hMv4sbrxcuTL2aDms6Zl7jB3l4yUi/C2vkUE1Jheo70+vzfqCRC5s7X0d/qMWPfF/Vatt2+XbKzlvarVBgl2gvH97Vwq1QSf5GWJ8LxGt+wwuB2pheZnbA5SPWl8p1fHprsqmeVlMhajUy8f9yaxVmBVV2rARclk/dAy0pP6K1qmAxfWAVvfTwJ2EARgriHzYt7Com6rE2uLfwAyXhJl3g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(40480700001)(356005)(82740400003)(86362001)(81166007)(36756003)(47076005)(2906002)(426003)(8936002)(478600001)(8676002)(7416002)(2616005)(36860700001)(40460700003)(83380400001)(5660300002)(6666004)(7696005)(16526019)(15650500001)(1076003)(186003)(26005)(336012)(54906003)(316002)(4326008)(110136005)(70206006)(70586007)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 12:08:41.1281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3979add2-85d1-4123-2c6d-08db891a0ec0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6759

After suspending and resuming guest VM, you will get
a black screen, and the display can't come back.

This is because when guest did suspending, it called
into qemu to call virtio_gpu_gl_reset. In function
virtio_gpu_gl_reset, it destroyed resources and reset
renderer, which were used for display. As a result,
guest's screen can't come back to the time when it was
suspended and only showed black.

So, this patch adds a new ctrl message
VIRTIO_GPU_CMD_SET_FREEZE_MODE to get notifications from
guest. If guest is during suspending, it sets freeze mode
of virtgpu to freeze_S3, this will prevent destroying
resources and resetting renderer when guest calls into
virtio_gpu_gl_reset. If guest is during resuming, it sets
freeze mode to unfreeze, and then virtio_gpu_gl_reset
will keep its origin actions and has no other impaction.

Due to this implemention needs cooperation with guest,
so it added a new feature flag VIRTIO_GPU_F_FREEZE_S3, so
that guest and host can negotiate whenever freeze_S3 is
supported or not.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 hw/display/virtio-gpu-base.c   |  3 ++
 hw/display/virtio-gpu-gl.c     | 10 ++++++-
 hw/display/virtio-gpu-virgl.c  |  7 +++++
 hw/display/virtio-gpu.c        | 55 ++++++++++++++++++++++++++++++++--
 hw/virtio/virtio.c             |  3 ++
 include/hw/virtio/virtio-gpu.h |  6 ++++
 6 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index a29f191aa8..40ae4f9678 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -215,6 +215,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
     if (virtio_gpu_blob_enabled(g->conf)) {
         features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
     }
+    if (virtio_gpu_freeze_S3_enabled(g->conf)) {
+        features |= (1 << VIRTIO_GPU_F_FREEZE_S3);
+    }
 
     return features;
 }
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index e06be60dfb..cb418dae9a 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -100,7 +100,15 @@ static void virtio_gpu_gl_reset(VirtIODevice *vdev)
      */
     if (gl->renderer_inited && !gl->renderer_reset) {
         virtio_gpu_virgl_reset_scanout(g);
-        gl->renderer_reset = true;
+        /*
+         * If guest is suspending, we shouldn't reset renderer,
+         * otherwise, the display can't come back to the time when
+         * it was suspended after guest was resumed.
+         */
+        if (!virtio_gpu_freeze_S3_enabled(g->parent_obj.conf) ||
+            g->freeze_mode == VIRTIO_GPU_FREEZE_MODE_UNFREEZE) {
+            gl->renderer_reset = true;
+        }
     }
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 73cb92c8d5..fc1971be70 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -464,6 +464,13 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_GET_EDID:
         virtio_gpu_get_edid(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_SET_FREEZE_MODE:
+        if (virtio_gpu_freeze_S3_enabled(g->parent_obj.conf)) {
+            virtio_gpu_cmd_set_freeze_mode(g, cmd);
+        } else {
+            cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        }
+        break;
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 5e15c79b94..dcf83379a8 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -373,6 +373,16 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
     QTAILQ_INSERT_HEAD(&g->reslist, res, next);
 }
 
+void virtio_gpu_cmd_set_freeze_mode(VirtIOGPU *g,
+                         struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_set_freeze_mode sf;
+
+    VIRTIO_GPU_FILL_CMD(sf);
+    virtio_gpu_bswap_32(&sf, sizeof(sf));
+    g->freeze_mode = sf.freeze_mode;
+}
+
 static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
 {
     struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
@@ -986,6 +996,13 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
         virtio_gpu_resource_detach_backing(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_SET_FREEZE_MODE:
+        if (virtio_gpu_freeze_S3_enabled(g->parent_obj.conf)) {
+            virtio_gpu_cmd_set_freeze_mode(g, cmd);
+        } else {
+            cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        }
+        break;
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
@@ -1344,6 +1361,29 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     QTAILQ_INIT(&g->reslist);
     QTAILQ_INIT(&g->cmdq);
     QTAILQ_INIT(&g->fenceq);
+
+    g->freeze_mode = VIRTIO_GPU_FREEZE_MODE_UNFREEZE;
+}
+
+static void virtio_gpu_device_unrealize(DeviceState *qdev)
+{
+    VirtIOGPU *g = VIRTIO_GPU(qdev);
+    struct virtio_gpu_simple_resource *res, *tmp;
+
+    /*
+     * This is to prevent memory leak in the situation that qemu is
+     * destroyed when guest is suspended. This also need hot-plug
+     * support.
+     */
+    if (virtio_gpu_freeze_S3_enabled(g->parent_obj.conf) &&
+        g->freeze_mode == VIRTIO_GPU_FREEZE_MODE_FREEZE_S3) {
+        QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
+            virtio_gpu_resource_destroy(g, res);
+        }
+        virtio_gpu_virgl_reset(g);
+        g->freeze_mode = VIRTIO_GPU_FREEZE_MODE_UNFREEZE;
+    }
+
 }
 
 void virtio_gpu_reset(VirtIODevice *vdev)
@@ -1352,8 +1392,16 @@ void virtio_gpu_reset(VirtIODevice *vdev)
     struct virtio_gpu_simple_resource *res, *tmp;
     struct virtio_gpu_ctrl_command *cmd;
 
-    QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
-        virtio_gpu_resource_destroy(g, res);
+    /*
+     * If guest is suspending, we shouldn't destroy resources,
+     * otherwise, the display can't come back to the time when
+     * it was suspended after guest was resumed.
+     */
+    if (!virtio_gpu_freeze_S3_enabled(g->parent_obj.conf) ||
+        g->freeze_mode == VIRTIO_GPU_FREEZE_MODE_UNFREEZE) {
+        QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
+            virtio_gpu_resource_destroy(g, res);
+        }
     }
 
     while (!QTAILQ_EMPTY(&g->cmdq)) {
@@ -1425,6 +1473,8 @@ static Property virtio_gpu_properties[] = {
                      256 * MiB),
     DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
+    DEFINE_PROP_BIT("freeze_S3", VirtIOGPU, parent_obj.conf.flags,
+                    VIRTIO_GPU_FLAG_FREEZE_S3_ENABLED, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1441,6 +1491,7 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
     vgbc->gl_flushed = virtio_gpu_handle_gl_flushed;
 
     vdc->realize = virtio_gpu_device_realize;
+    vdc->unrealize = virtio_gpu_device_unrealize;
     vdc->reset = virtio_gpu_reset;
     vdc->get_config = virtio_gpu_get_config;
     vdc->set_config = virtio_gpu_set_config;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index eb6347ab5d..2a3c54f2c4 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -240,6 +240,9 @@ qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_GPU_F_CONTEXT_INIT, \
             "VIRTIO_GPU_F_CONTEXT_INIT: Context types and synchronization "
             "timelines supported"),
+    FEATURE_ENTRY(VIRTIO_GPU_F_FREEZE_S3, \
+            "VIRTIO_GPU_F_FREEZE_S3: Freezing virtio-gpu and keeping resources"
+            "alive is supported."),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 2e28507efe..141c48080f 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -90,6 +90,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_EDID_ENABLED,
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
     VIRTIO_GPU_FLAG_BLOB_ENABLED,
+    VIRTIO_GPU_FLAG_FREEZE_S3_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -102,6 +103,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
 #define virtio_gpu_blob_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
+#define virtio_gpu_freeze_S3_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_FREEZE_S3_ENABLED))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
@@ -173,6 +176,7 @@ struct VirtIOGPU {
 
     uint64_t hostmem;
 
+    virtio_gpu_freeze_mode_t freeze_mode;
     bool processing_cmdq;
     QEMUTimer *fence_poll;
     QEMUTimer *print_stats;
@@ -284,5 +288,7 @@ void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
 void virtio_gpu_virgl_reset(VirtIOGPU *g);
 int virtio_gpu_virgl_init(VirtIOGPU *g);
 int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);
+void virtio_gpu_cmd_set_freeze_mode(VirtIOGPU *g,
+                         struct virtio_gpu_ctrl_command *cmd);
 
 #endif
-- 
2.34.1


