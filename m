Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A5A8182CD
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 08:59:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656557.1024851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFV0o-0005rW-Vf; Tue, 19 Dec 2023 07:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656557.1024851; Tue, 19 Dec 2023 07:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFV0o-0005pd-S8; Tue, 19 Dec 2023 07:59:34 +0000
Received: by outflank-mailman (input) for mailman id 656557;
 Tue, 19 Dec 2023 07:59:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oURO=H6=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rFUwq-0008Dp-IU
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 07:55:28 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f86c8e70-9e43-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 08:55:27 +0100 (CET)
Received: from MW4PR04CA0289.namprd04.prod.outlook.com (2603:10b6:303:89::24)
 by CH2PR12MB4970.namprd12.prod.outlook.com (2603:10b6:610:67::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 07:55:17 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:303:89:cafe::91) by MW4PR04CA0289.outlook.office365.com
 (2603:10b6:303:89::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Tue, 19 Dec 2023 07:55:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.7 via Frontend Transport; Tue, 19 Dec 2023 07:55:17 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 01:54:53 -0600
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
X-Inumbo-ID: f86c8e70-9e43-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iS4S9wtvL36H86vZCnZXd7S2c0lyWt0TmPi2VaBBbi5+F6xv4up57642NZbbSL0sdo9LdQ+HqX1q4OtzBn4ZOISSlwS+IbpfrBbbDTvbtjWmGymmNT7ma/VGodvEjQxrlJfaiM/97E6NqwU/3DfruQedGZjGn6GfsomIt77LcLdLjDWMrThAKTAK8WX2kcFu1hAk2BvOYOwNEx+jWGczFyVt2PXVwzZml9k1+/nv/A7zbbDQ2iSuF2QaCxBnC/89WAdSUip9onZxYFwa1TwjYRpvqJCJ86OsyQEkcFC0WiwM8wPxprFxN42yQQTM1o3McZVxdoDK4pStEssS8hNkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vt3tmGHLqM9+7n0/5+P62gCua8Pm5kQUTyV4m0KDXS4=;
 b=ZX/qGxA4ed5TNIvLK0N3qHsYF7l2EbuqqgotqPpDwVKSbRXau8dvXV8PWTLvnoJHYAJSPwC50uGtiG0dqfP+EfOK2P9qKAXpdNwj3L9Nh+wgpxrjtWDzIgPQ7seIcQV8fj6Z2nH+Iij3egkiSbgNfKki2icwM/vEaRx54VdHWaszKAgSUoUtg8vnr+N94sWGRqtCAw5oPbqzWYvwbHX/3Dxeldeo9iN0/H8mio+lZWCwP6tAFEuXuAFFZIEYoqt8Ex85/wJPisCv48h1LoVnT1jOhw34ckUYeqFKeHrdqXuL8DMFb4SAd7PpCICnvjae53y3izwYk9Xfvyx94IzvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vt3tmGHLqM9+7n0/5+P62gCua8Pm5kQUTyV4m0KDXS4=;
 b=oDjL93dgjASP5ycrNb21J5ykX9i5CioglHti533n/DHdiCyc2DFxh8Mt2law6cZA56Y+yqPjAQHu17GdKCwQA2MV7StzWZpY3kpGK+YkQ2lw43udBfaUhHlVQSg3LsGfvvPQfuTZ8Dq3C6BFHIvU/ncSD+2tjbG0DFVT1dRIIJQ=
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
Subject: [PATCH v6 07/11] virtio-gpu: Handle resource blob commands
Date: Tue, 19 Dec 2023 15:53:16 +0800
Message-ID: <20231219075320.165227-8-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|CH2PR12MB4970:EE_
X-MS-Office365-Filtering-Correlation-Id: e62565d8-1199-4361-53ca-08dc0067d749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S7nIgxtub/IUXQ9SHuEq3QXmj+SF/FEwnP9Ov1Qhz2bXljfpmKJIbYesXimedsgG1l0DP6AAhHZ4yCt9Whwnyh1vMa3CIw4TxeGybefyZ1RPBhLu08QLqHG4gR+Jm2+lG5KaN5RDJa2BdGoucHHJDtukpGE+gZwFcPXQbs+BUHDB67lOMZ5oYU1DYs03PP7ZgwPFX7DQO3iTC4ZfJJr4WTMmZVsM3iTD7u77IjNR7L45jn2URBjRutoUSO054RRNMsS5pZTfnBl+7Y5l68sZ2Veel8B3mm0KFvNcqXertK1owSjESObgQ4Gy4HhVwMXSpcw8g7HtV3xvBx6ofsJLeh6fy5yn9hUYQP1vkfc78cjlpG40JObWaL85IeuQyc8X4dMyWxNz/0muaYhQ+v/FfMvzxq32cN1vr4m9we4oOtcNRnZetghfK467gqqnl4fxOn9BOcWlU2joscZux4LNL2+PJHMiWt1ImydfovKp7DaBC9tWAVKB5Sm2wuv2WMYa+O5yhJB2dYN1ZNhWfhZvAKbOjgkq0aUFVlX8qOaE9/dJ/6hScqdmxi4esJK4uksOqSg2V66lQaQgNbCLxXOuWtzxNsCidhU+4qKzaUZ1txeSxD+9V2uu/4hWcqk08eyooy0Ld7/b0Me0VBI/S4vFi4jIJv08NFbSQc/hLsMCyu0q6wxA9V50x0ZUUWxKxgsSu+3dWgKdxy0/xUN/EJnuLyfAG9QU6yLpvgkjD2y7bd9HxC9Kx3Vrm0VjuT5sgjLa0T5suigm/8okILM/icJ4fEuz/uF1B1M46wHUDNm69w4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(82310400011)(1800799012)(451199024)(186009)(64100799003)(46966006)(36840700001)(40470700004)(7696005)(36756003)(921008)(83380400001)(316002)(7416002)(426003)(336012)(110136005)(70206006)(40480700001)(30864003)(54906003)(70586007)(8676002)(4326008)(47076005)(8936002)(5660300002)(36860700001)(2906002)(6666004)(26005)(86362001)(16526019)(1076003)(478600001)(2616005)(41300700001)(82740400003)(40460700003)(81166007)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 07:55:17.1431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e62565d8-1199-4361-53ca-08dc0067d749
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4970

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Support BLOB resources creation, mapping and unmapping by calling the
new stable virglrenderer 0.10 interface. Only enabled when available and
via the blob config. E.g. -device virtio-vga-gl,blob=true

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

Changes in v6:
- Use new struct virgl_gpu_resource.
- Unmap, unref and destroy the resource only after the memory region
  has been completely removed.
- In unref check whether the resource is still mapped.
- In unmap_blob check whether the resource has been already unmapped.
- Fix coding style

 hw/display/virtio-gpu-virgl.c | 274 +++++++++++++++++++++++++++++++++-
 hw/display/virtio-gpu.c       |   4 +-
 meson.build                   |   4 +
 3 files changed, 276 insertions(+), 6 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index faab374336..5a3a292f79 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -17,6 +17,7 @@
 #include "trace.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-gpu.h"
+#include "hw/virtio/virtio-gpu-bswap.h"
 
 #include "ui/egl-helpers.h"
 
@@ -24,8 +25,62 @@
 
 struct virgl_gpu_resource {
     struct virtio_gpu_simple_resource res;
+    uint32_t ref;
+    VirtIOGPU *g;
+
+#ifdef HAVE_VIRGL_RESOURCE_BLOB
+    /* only blob resource needs this region to be mapped as guest mmio */
+    MemoryRegion *region;
+#endif
 };
 
+static void vres_get_ref(struct virgl_gpu_resource *vres)
+{
+    uint32_t ref;
+
+    ref = qatomic_fetch_inc(&vres->ref);
+    g_assert(ref < INT_MAX);
+}
+
+static void virgl_resource_destroy(struct virgl_gpu_resource *vres)
+{
+    struct virtio_gpu_simple_resource *res;
+    VirtIOGPU *g;
+
+    if (!vres) {
+        return;
+    }
+
+    g = vres->g;
+    res = &vres->res;
+    QTAILQ_REMOVE(&g->reslist, res, next);
+    virtio_gpu_cleanup_mapping(g, res);
+    g_free(vres);
+}
+
+static void virgl_resource_unref(struct virgl_gpu_resource *vres)
+{
+    struct virtio_gpu_simple_resource *res;
+
+    if (!vres) {
+        return;
+    }
+
+    res = &vres->res;
+    virgl_renderer_resource_detach_iov(res->resource_id, NULL, NULL);
+    virgl_renderer_resource_unref(res->resource_id);
+}
+
+static void vres_put_ref(struct virgl_gpu_resource *vres)
+{
+    g_assert(vres->ref > 0);
+
+    if (qatomic_fetch_dec(&vres->ref) == 1) {
+        virgl_resource_unref(vres);
+        virgl_resource_destroy(vres);
+    }
+}
+
 static struct virgl_gpu_resource *
 virgl_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
 {
@@ -59,6 +114,8 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
                                        c2d.width, c2d.height);
 
     vres = g_new0(struct virgl_gpu_resource, 1);
+    vres_get_ref(vres);
+    vres->g = g;
     vres->res.width = c2d.width;
     vres->res.height = c2d.height;
     vres->res.format = c2d.format;
@@ -91,6 +148,8 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
                                        c3d.width, c3d.height, c3d.depth);
 
     vres = g_new0(struct virgl_gpu_resource, 1);
+    vres_get_ref(vres);
+    vres->g = g;
     vres->res.width = c3d.width;
     vres->res.height = c3d.height;
     vres->res.format = c3d.format;
@@ -126,12 +185,21 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
         return;
     }
 
-    virgl_renderer_resource_detach_iov(unref.resource_id, NULL, NULL);
-    virgl_renderer_resource_unref(unref.resource_id);
+#ifdef HAVE_VIRGL_RESOURCE_BLOB
+    if (vres->region) {
+        VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
+        MemoryRegion *mr = vres->region;
+
+        warn_report("%s: blob resource %d not unmapped",
+                    __func__, unref.resource_id);
+        vres->region = NULL;
+        memory_region_set_enabled(mr, false);
+        memory_region_del_subregion(&b->hostmem, mr);
+        object_unparent(OBJECT(mr));
+    }
+#endif /* HAVE_VIRGL_RESOURCE_BLOB */
 
-    QTAILQ_REMOVE(&g->reslist, &vres->res, next);
-    virtio_gpu_cleanup_mapping(g, &vres->res);
-    g_free(vres);
+    vres_put_ref(vres);
 }
 
 static void virgl_cmd_context_create(VirtIOGPU *g,
@@ -470,6 +538,191 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
     g_free(resp);
 }
 
+#ifdef HAVE_VIRGL_RESOURCE_BLOB
+
+static void virgl_resource_unmap(struct virgl_gpu_resource *vres)
+{
+    if (!vres) {
+        return;
+    }
+
+    virgl_renderer_resource_unmap(vres->res.resource_id);
+
+    vres_put_ref(vres);
+}
+
+static void virgl_resource_blob_async_unmap(void *obj)
+{
+    MemoryRegion *mr = MEMORY_REGION(obj);
+    struct virgl_gpu_resource *vres = mr->opaque;
+
+    virgl_resource_unmap(vres);
+
+    g_free(obj);
+}
+
+static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
+                                           struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virgl_gpu_resource *vres;
+    struct virtio_gpu_resource_create_blob cblob;
+    struct virgl_renderer_resource_create_blob_args virgl_args = { 0 };
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
+    vres = virgl_gpu_find_resource(g, cblob.resource_id);
+    if (vres) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
+                      __func__, cblob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    vres = g_new0(struct virgl_gpu_resource, 1);
+    vres_get_ref(vres);
+    vres->g = g;
+    vres->res.resource_id = cblob.resource_id;
+    vres->res.blob_size = cblob.size;
+
+    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
+        ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
+                                            cmd, &vres->res.addrs,
+                                            &vres->res.iov, &vres->res.iov_cnt);
+        if (!ret) {
+            g_free(vres);
+            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+            return;
+        }
+    }
+
+    QTAILQ_INSERT_HEAD(&g->reslist, &vres->res, next);
+
+    virgl_args.res_handle = cblob.resource_id;
+    virgl_args.ctx_id = cblob.hdr.ctx_id;
+    virgl_args.blob_mem = cblob.blob_mem;
+    virgl_args.blob_id = cblob.blob_id;
+    virgl_args.blob_flags = cblob.blob_flags;
+    virgl_args.size = cblob.size;
+    virgl_args.iovecs = vres->res.iov;
+    virgl_args.num_iovs = vres->res.iov_cnt;
+
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
+    struct virgl_gpu_resource *vres;
+    struct virtio_gpu_resource_map_blob mblob;
+    int ret;
+    void *data;
+    uint64_t size;
+    struct virtio_gpu_resp_map_info resp;
+    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
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
+    vres = virgl_gpu_find_resource(g, mblob.resource_id);
+    if (!vres) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
+                      __func__, mblob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+    if (vres->region) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already mapped %d\n",
+                      __func__, mblob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    ret = virgl_renderer_resource_map(vres->res.resource_id, &data, &size);
+    if (ret) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
+                      __func__, strerror(-ret));
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    vres_get_ref(vres);
+    vres->region = g_new0(MemoryRegion, 1);
+    memory_region_init_ram_ptr(vres->region, OBJECT(g), NULL, size, data);
+    vres->region->opaque = vres;
+    OBJECT(vres->region)->free = virgl_resource_blob_async_unmap;
+    memory_region_add_subregion(&b->hostmem, mblob.offset, vres->region);
+    memory_region_set_enabled(vres->region, true);
+
+    memset(&resp, 0, sizeof(resp));
+    resp.hdr.type = VIRTIO_GPU_RESP_OK_MAP_INFO;
+    virgl_renderer_resource_get_map_info(mblob.resource_id, &resp.map_info);
+    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
+}
+
+static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
+                                          struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virgl_gpu_resource *vres;
+    struct virtio_gpu_resource_unmap_blob ublob;
+    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
+    MemoryRegion *mr;
+
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
+    vres = virgl_gpu_find_resource(g, ublob.resource_id);
+    if (!vres) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
+                      __func__, ublob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    if (!vres->region) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped %d\n",
+                      __func__, ublob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    mr = vres->region;
+    vres->region = NULL;
+    memory_region_set_enabled(mr, false);
+    memory_region_del_subregion(&b->hostmem, mr);
+    object_unparent(OBJECT(mr));
+}
+
+#endif /* HAVE_VIRGL_RESOURCE_BLOB */
+
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
                                       struct virtio_gpu_ctrl_command *cmd)
 {
@@ -536,6 +789,17 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
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
index 4c3ec9d0ea..8189c392dc 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1449,10 +1449,12 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
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
diff --git a/meson.build b/meson.build
index ea52ef1b9c..629407128e 100644
--- a/meson.build
+++ b/meson.build
@@ -1054,6 +1054,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
                          cc.has_function('virgl_renderer_context_create_with_flags',
                                          prefix: '#include <virglrenderer.h>',
                                          dependencies: virgl))
+    config_host_data.set('HAVE_VIRGL_RESOURCE_BLOB',
+                         cc.has_function('virgl_renderer_resource_create_blob',
+                                         prefix: '#include <virglrenderer.h>',
+                                         dependencies: virgl))
   endif
 endif
 rutabaga = not_found
-- 
2.25.1


