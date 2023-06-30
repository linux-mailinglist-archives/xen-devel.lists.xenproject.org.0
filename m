Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B3C743578
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 09:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557285.870508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF89Y-0007XD-Cz; Fri, 30 Jun 2023 07:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557285.870508; Fri, 30 Jun 2023 07:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF89Y-0007Tq-9l; Fri, 30 Jun 2023 07:02:48 +0000
Received: by outflank-mailman (input) for mailman id 557285;
 Fri, 30 Jun 2023 07:02:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DkL4=CS=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1qF89W-0007DY-64
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 07:02:46 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c04840c-1714-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 09:02:44 +0200 (CEST)
Received: from DM6PR10CA0023.namprd10.prod.outlook.com (2603:10b6:5:60::36) by
 PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Fri, 30 Jun
 2023 07:02:39 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::91) by DM6PR10CA0023.outlook.office365.com
 (2603:10b6:5:60::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 07:02:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Fri, 30 Jun 2023 07:02:39 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 02:02:15 -0500
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
X-Inumbo-ID: 1c04840c-1714-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frBpKD4EAQOlS0aXK8ifUhZUzbzRZrYIbPf0BzrEc1GsaHTh1uAUcDfX2TtxwiHi7p1oKGdCsuGWjr5Jvm9s08M//fDmRBm0UZxr8SAmwCs+rn0VDHawhlvXdJi5ft3ukEFZuJECCq92r0rnN8QGP3O7+2f4jKlbh8eplLRRTjJaLFdWw2CBc0nZe8NIABMpbH4irn+bUl2Mj3uQQKUEvV1aULG6kFUedlKWoXwfbBK7C0QDwOo9k0VTMF+Qx1PkP/sn2XqAKDOojBTyMSnPX49yIgCTRzUm2hoOqtPhhsjPi9v445dzHPd7hAkmXcwqeukJLexHaiNheqF7nmVAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9xtnTPzNg+1sjBtnZIyS3R8k/6IZY1YdO4CzpygVqM=;
 b=J/8KnlMYSS81W5e8u+kYQMNiGMVeGC6vg1vkejkDV+XNZGKoJ8uR0YIm2lQR1GABKodd3sniaP+RCPSyOSDK1VjB3Mh4RH1d/jkB2SXbkjJWcuAC6LKMCgr9ZWQ3QKhtI/xEA69ex8ixsU07PYsEfZp370d+QxLM5Y50bYULZGR817fcER7KTTbSg2KYYT1cg10rXNcU07iUPU2WjSbQ9Xb+jCMqRkAxFYf8ML8z/vl+J1LmLdnYmq8vxVoDWmudjgNK2Cw9MKpfXdsiVwOFVWuD7FKwqSyCe+6mao5V8nlCZzjx5GBSMCBqAKzefM/SNM17CtDU++CXwFz3s4xAEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9xtnTPzNg+1sjBtnZIyS3R8k/6IZY1YdO4CzpygVqM=;
 b=CSk1ojbQivDMlAAesCqq1wFa0uY9Xlr+Q7tKWSfKSpb4T3zEe8/t3F95FTHGheMdTr9OAAIrqz2LbvAJd3jHxXF77wOiNCKkKswhQWKGD6s8Ts89BCDpohMNZDyegU2nXMD284pVpUq1zCcHAmDpf7qnMm2C8gP4+LN0WePxD1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
	<qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <Alexander.Deucher@amd.com>, Christian Koenig
	<Christian.Koenig@amd.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>, Honglei Huang
	<Honglei1.Huang@amd.com>, Julia Zhang <Julia.Zhang@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [QEMU PATCH v2 1/1] virtgpu: do not destroy resources when guest suspend
Date: Fri, 30 Jun 2023 15:00:16 +0800
Message-ID: <20230630070016.841459-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230630070016.841459-1-Jiqian.Chen@amd.com>
References: <20230630070016.841459-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT009:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e14652-c0c0-40fc-f16b-08db7937fe30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mV7GwA/X1h2GY/65cPnxkFpuJri9JTuUJeeL28SGnr6uYXRsm+mRsf3aHwfZTFlNHZYi0zN7wsYGJL3Lka2t9UFiJOQ2Bu91ezF1MxjVL+TCq8mO3sth646iJrz7JlYdHP7Aj9hQWNq55F8JyQyY/YNA34Von6PQKyBAqFugEBTbUB3gBfeDr3opRWqQkkpkMa75J0xzS23QiZuvzRQEUS8KRMNpEYiqqtV1gpGHccVc09yhNITJothrvV6Us0wZCjY9BHNz1+7OTQpkKZ6WjuhdD19yXzw5Ty38p2wAnR/G59/JgT8IWzlkbOCSmwS+Qi5BXRDNlv3+uBhPoCmzrYnvEXlKjgSQgQeZRbLRPzq0qPL0N7Esqvg5g83gOUnVMkPXLtnvXsFPYO2MoT7V4oRyY8ncW7X3GF1biG3+BdbwQvdbeG9p9v9e9/qTmfPfQRVhXUsh71Bw1HxjzwSaEWQXoKtjE137aBBRNKDDH29CtA6DVzVKpzAqp1T7V5C8oBzEJQzHN8Nb5teYSLQiy3T3rpCY5/SoRMj/5WO9BIMytmIYg2buWqi+iIq+W304rQ0NF1t4PYnjssRfbm/ljyRQi+MCPBjN8IjfpKI5Y1ZGwTVk6t9WVLGrwx103u03V1/lpJL9G2qVg4tSydaB7Jq5ddTTn1hGn7NcMzVOsbydCpMeJHCSgAnMP34RCyO/ntA9TYj2GyAIj1xdTKOd1o+r3vmKG9FCees8bSLzt2EegaNQ/zMg0GHOW51x9RhpHHSUDDR/MNhFbULNzn6L+Y5yQoSr7b+0fEcgOY0ubVQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199021)(36840700001)(40470700004)(46966006)(86362001)(82310400005)(36860700001)(40460700003)(36756003)(40480700001)(5660300002)(7416002)(356005)(41300700001)(921005)(8676002)(70206006)(316002)(81166007)(8936002)(70586007)(4326008)(82740400003)(47076005)(2906002)(478600001)(26005)(15650500001)(16526019)(2616005)(7696005)(186003)(1076003)(54906003)(83380400001)(110136005)(426003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 07:02:39.7058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e14652-c0c0-40fc-f16b-08db7937fe30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634

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
 hw/display/virtio-gpu-base.c                |  3 ++
 hw/display/virtio-gpu-gl.c                  |  9 +++-
 hw/display/virtio-gpu-virgl.c               |  7 +++
 hw/display/virtio-gpu.c                     | 52 ++++++++++++++++++++-
 hw/virtio/virtio.c                          |  3 ++
 include/hw/virtio/virtio-gpu.h              |  6 +++
 include/standard-headers/linux/virtio_gpu.h | 15 ++++++
 7 files changed, 92 insertions(+), 3 deletions(-)

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
diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
index 2da48d3d4c..cc9286b30e 100644
--- a/include/standard-headers/linux/virtio_gpu.h
+++ b/include/standard-headers/linux/virtio_gpu.h
@@ -65,6 +65,11 @@
  */
 #define VIRTIO_GPU_F_CONTEXT_INIT        4
 
+/*
+ * VIRTIO_GPU_CMD_STATUS_FREEZING
+ */
+#define VIRTIO_GPU_F_FREEZING            5
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
@@ -100,6 +105,9 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
 	VIRTIO_GPU_CMD_MOVE_CURSOR,
 
+	/* status */
+	VIRTIO_GPU_CMD_STATUS_FREEZING = 0x0400,
+
 	/* success responses */
 	VIRTIO_GPU_RESP_OK_NODATA = 0x1100,
 	VIRTIO_GPU_RESP_OK_DISPLAY_INFO,
@@ -116,6 +124,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID,
 	VIRTIO_GPU_RESP_ERR_INVALID_CONTEXT_ID,
 	VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER,
+
 };
 
 enum virtio_gpu_shm_id {
@@ -453,4 +462,10 @@ struct virtio_gpu_resource_unmap_blob {
 	uint32_t padding;
 };
 
+/* VIRTIO_GPU_CMD_STATUS_FREEZING */
+struct virtio_gpu_status_freezing {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__u32 freezing;
+};
+
 #endif
-- 
2.34.1


