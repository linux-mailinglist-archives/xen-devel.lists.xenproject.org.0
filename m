Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6981F758F78
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 09:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565615.883921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM1vB-0002vo-HO; Wed, 19 Jul 2023 07:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565615.883921; Wed, 19 Jul 2023 07:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM1vB-0002sn-DX; Wed, 19 Jul 2023 07:48:29 +0000
Received: by outflank-mailman (input) for mailman id 565615;
 Wed, 19 Jul 2023 07:48:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gZ60=DF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1qM1vA-0002sD-89
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 07:48:28 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3506773-2608-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 09:48:25 +0200 (CEST)
Received: from MW4P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::18)
 by CH3PR12MB7545.namprd12.prod.outlook.com (2603:10b6:610:146::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 07:48:20 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::f8) by MW4P220CA0013.outlook.office365.com
 (2603:10b6:303:115::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23 via Frontend
 Transport; Wed, 19 Jul 2023 07:48:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.34 via Frontend Transport; Wed, 19 Jul 2023 07:48:19 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 19 Jul
 2023 02:48:14 -0500
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
X-Inumbo-ID: a3506773-2608-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UN6eSptQJcUMX6fh8WGPYUcYozHpiZ364ti2wzeuFNDKMT69EbACsxs1wQRUmm2aQqJlgyaAdt6c40pz57Ds/x9URcNOiuQDe+hTnq1I8t6r2tOAnjYtDETO9NJwrOjOOUhGwcuMVesaN1Kiz30vl8tdvdStTFhuCbN69O4nBItN/tVubrodX5glSoyeH5XhFuDAapiCw3waUpYC+UdjfyFY/+F/0tTV9UsQ31JHagrbxigjoOCmCMkiIbxU3/M2HX+3aeUTx9l+5wgO338/RUvhsdAes4S0ajJbSikxAtax1WlmO0c8hHm0Oe2+2FePovE5Ltbb+4qZom2bl5zfFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DwcABNuip8QDyZ7N2MHhGDI/3D/IA6QWZuUpx+wHHo=;
 b=RAj0naDhHCjKkRVfR8YO42ht1TT3WerWD1AWyHGMqVXcCbOJXgZ4BAiGduE2p1JSTQNqclVEVkhxb8dRiBWj7/N/kS5oNAtM/QI635Vqeevd9sAiVvB/8ZhE9zhjlRMgJLmCaQNv6uYsWgNg5Bs42BirwwyXVsTyqBvGlsj+a8NZDRZ3frYB0L3mBVX0048y1KnO4Pg5ItRn8gV1Ddy1QjlGDlaWrS/XLiq35Fyg/k2jtCyZUFrLWpsJXB4rFcGViZsfMOFijA00pdZcds/QOTJOz9Q3mpX2LlT0uVMQ6gnUJACDcZB0eAPFYdTIEgRmBLdbfAqnooYwsV5vzRj1fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DwcABNuip8QDyZ7N2MHhGDI/3D/IA6QWZuUpx+wHHo=;
 b=4IoIbKjqg8RaVZJrgOlEKp55ryJh3X91txbxZfzMJjhk68Y/QTQWdZhTGsN8vjXJQUXF+Q9B/0/0+HL50mzoabYeRsv4i/5RCF83M6qIpiXvr9i6vWI0rnNupzJjgwGnmFwcBr8zThi8Cdb68on9EopAPBHTtxIY8jnTT0hp4AM=
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
Subject: [QEMU PATCH v3 0/1] virtgpu: do not destroy resources when guest suspend
Date: Wed, 19 Jul 2023 15:47:26 +0800
Message-ID: <20230719074726.1613088-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719074726.1613088-1-Jiqian.Chen@amd.com>
References: <20230719074726.1613088-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT046:EE_|CH3PR12MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: dab1eb42-cdf9-4986-5856-08db882c856b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BYvKPXjubJdYafnWoJlwidxb+ajMt0MwQBK3RYdJM/rakCcRcZyEfY4P2t1yhzQabiRbiBeFhMS2xgQqqy77wla73EIsjQR2JSsLGI5fSRK08/gf54pYVptzT+tTIO9/B9QPM0VLhBngssujFiIBq60QE7NFAIyQgg4pSiptC7dOXzWjRY8sMtfu/1T1hVcdd2dDoUBRXYoV8oufmYkDQqAh4mffzfQrWjV6LiJrqMkfiiSuN7waesAK2XKjXkND4ipsN1hMvNS6wMOpHzd46OuyPj+0ZCw8R3ralqclsuGGEUBHwigRO8eR5uFUGH1VeHsopfr2QHpVyiVGM5Vn3KDJPRLmH/qh5B9W5znbSSBjzTBr1aR80ql3EPXVf/AhM6wDQ+nDY4X25itdv9q3JugXxcihzVMMevkimLZ77ih5LiKPcyu4jiwD0tu2TsmVnLp39wJ3fPxugUczQpwd/Jy6v+Qus8pYSBgW24SGxYlJO46CANJGOyMvhil23fu15LCF5EQFjwl2VQ/Oq3yrB9WwzSphybtNiCHKL70HCJJW25WgGnnfIuvhToenLdo0hHi3YQD4By+D2KGzsy8C/D8cNI8BnI+2ngkQnb0LTisC62pGdsD3N3puyGiM4QPh4AfQj0uxd5Z7bgvSxu3Pp4SuDfrvMnMkqZD3nD87K+Te7JNoT1J/B4OxpW8H3es8oJ3nVABe5kjnE+FMLSxoOPG5ZeYbaJFNggLljfT1BApdFFhqpU9Rtaimk6jFcA2y06RpENseeUnkzqwZ1Y2p5g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(2906002)(356005)(81166007)(26005)(336012)(426003)(47076005)(83380400001)(36860700001)(16526019)(186003)(1076003)(40480700001)(5660300002)(2616005)(86362001)(40460700003)(82740400003)(8676002)(8936002)(36756003)(15650500001)(7416002)(478600001)(7696005)(6666004)(54906003)(4326008)(316002)(70586007)(41300700001)(70206006)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 07:48:19.9838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dab1eb42-cdf9-4986-5856-08db882c856b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7545

After suspending and resuming guest VM, you will get
a black screen, and the display can't come back.

This is because when guest did suspending, it called
into qemu to call virtio_gpu_gl_reset. In function
virtio_gpu_gl_reset, it destroyed resources and reset
renderer, which were used for display. As a result,
guest's screen can't come back to the time when it was
suspended and only showed black.

So, this patch adds a new ctrl message
VIRTIO_GPU_CMD_STATUS_FREEZING to get notification from
guest. If guest is during suspending, it sets freezing
status of virtgpu to true, this will prevent destroying
resources and resetting renderer when guest calls into
virtio_gpu_gl_reset. If guest is during resuming, it sets
freezing to false, and then virtio_gpu_gl_reset will keep
its origin actions and has no other impaction.

Due to this implemention needs cooperation with guest, so
it added a new feature flag VIRTIO_GPU_F_FREEZING, so
that guest and host can negotiate whenever freezing is
supported or not.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 hw/display/virtio-gpu-base.c   |  3 ++
 hw/display/virtio-gpu-gl.c     |  9 +++++-
 hw/display/virtio-gpu-virgl.c  |  7 +++++
 hw/display/virtio-gpu.c        | 52 ++++++++++++++++++++++++++++++++--
 hw/virtio/virtio.c             |  3 ++
 include/hw/virtio/virtio-gpu.h |  6 ++++
 6 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index a29f191aa8..d55dc8fdfc 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -215,6 +215,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
     if (virtio_gpu_blob_enabled(g->conf)) {
         features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
     }
+    if (virtio_gpu_freezing_enabled(g->conf)) {
+        features |= (1 << VIRTIO_GPU_F_FREEZING);
+    }
 
     return features;
 }
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index e06be60dfb..de108f1502 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -100,7 +100,14 @@ static void virtio_gpu_gl_reset(VirtIODevice *vdev)
      */
     if (gl->renderer_inited && !gl->renderer_reset) {
         virtio_gpu_virgl_reset_scanout(g);
-        gl->renderer_reset = true;
+        /*
+         * If guest is suspending, we shouldn't reset renderer,
+         * otherwise, the display can't come back to the time when
+         * it was suspended after guest resumed.
+         */
+        if (!virtio_gpu_freezing_enabled(g->parent_obj.conf) || !g->freezing) {
+            gl->renderer_reset = true;
+        }
     }
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 73cb92c8d5..547c4d98ad 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -464,6 +464,13 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_GET_EDID:
         virtio_gpu_get_edid(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_STATUS_FREEZING:
+        if (virtio_gpu_freezing_enabled(g->parent_obj.conf)) {
+            virtio_gpu_cmd_status_freezing(g, cmd);
+        } else {
+            cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        }
+        break;
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 5e15c79b94..54a5e2e57c 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -373,6 +373,16 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
     QTAILQ_INSERT_HEAD(&g->reslist, res, next);
 }
 
+void virtio_gpu_cmd_status_freezing(VirtIOGPU *g,
+                         struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_status_freezing sf;
+
+    VIRTIO_GPU_FILL_CMD(sf);
+    virtio_gpu_bswap_32(&sf, sizeof(sf));
+    g->freezing = sf.freezing;
+}
+
 static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
 {
     struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
@@ -986,6 +996,13 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
         virtio_gpu_resource_detach_backing(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_STATUS_FREEZING:
+        if (virtio_gpu_freezing_enabled(g->parent_obj.conf)) {
+            virtio_gpu_cmd_status_freezing(g, cmd);
+        } else {
+            cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        }
+        break;
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
@@ -1344,6 +1361,27 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     QTAILQ_INIT(&g->reslist);
     QTAILQ_INIT(&g->cmdq);
     QTAILQ_INIT(&g->fenceq);
+
+    g->freezing = false;
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
+    if (virtio_gpu_freezing_enabled(g->parent_obj.conf) && g->freezing) {
+        QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
+            virtio_gpu_resource_destroy(g, res);
+        }
+        virtio_gpu_virgl_reset(g);
+    }
+
 }
 
 void virtio_gpu_reset(VirtIODevice *vdev)
@@ -1352,8 +1390,15 @@ void virtio_gpu_reset(VirtIODevice *vdev)
     struct virtio_gpu_simple_resource *res, *tmp;
     struct virtio_gpu_ctrl_command *cmd;
 
-    QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
-        virtio_gpu_resource_destroy(g, res);
+    /*
+     * If guest is suspending, we shouldn't destroy resources,
+     * otherwise, the display can't come back to the time when
+     * it was suspended after guest resumed.
+     */
+    if (!virtio_gpu_freezing_enabled(g->parent_obj.conf) || !g->freezing) {
+        QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
+            virtio_gpu_resource_destroy(g, res);
+        }
     }
 
     while (!QTAILQ_EMPTY(&g->cmdq)) {
@@ -1425,6 +1470,8 @@ static Property virtio_gpu_properties[] = {
                      256 * MiB),
     DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
+    DEFINE_PROP_BIT("freezing", VirtIOGPU, parent_obj.conf.flags,
+                    VIRTIO_GPU_FLAG_FREEZING_ENABLED, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1441,6 +1488,7 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
     vgbc->gl_flushed = virtio_gpu_handle_gl_flushed;
 
     vdc->realize = virtio_gpu_device_realize;
+    vdc->unrealize = virtio_gpu_device_unrealize;
     vdc->reset = virtio_gpu_reset;
     vdc->get_config = virtio_gpu_get_config;
     vdc->set_config = virtio_gpu_set_config;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index eb6347ab5d..e2ccf50a9e 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -240,6 +240,9 @@ qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_GPU_F_CONTEXT_INIT, \
             "VIRTIO_GPU_F_CONTEXT_INIT: Context types and synchronization "
             "timelines supported"),
+    FEATURE_ENTRY(VIRTIO_GPU_F_FREEZING, \
+            "VIRTIO_GPU_F_FREEZING: Freezing virtio-gpu and keeping resources"
+            "alive is supported."),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 2e28507efe..53e06e47cb 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -90,6 +90,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_EDID_ENABLED,
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
     VIRTIO_GPU_FLAG_BLOB_ENABLED,
+    VIRTIO_GPU_FLAG_FREEZING_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -102,6 +103,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
 #define virtio_gpu_blob_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
+#define virtio_gpu_freezing_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_FREEZING_ENABLED))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
@@ -173,6 +176,7 @@ struct VirtIOGPU {
 
     uint64_t hostmem;
 
+    bool freezing;
     bool processing_cmdq;
     QEMUTimer *fence_poll;
     QEMUTimer *print_stats;
@@ -284,5 +288,7 @@ void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
 void virtio_gpu_virgl_reset(VirtIOGPU *g);
 int virtio_gpu_virgl_init(VirtIOGPU *g);
 int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);
+void virtio_gpu_cmd_status_freezing(VirtIOGPU *g,
+                         struct virtio_gpu_ctrl_command *cmd);
 
 #endif
-- 
2.34.1


