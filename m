Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3450E78E9B9
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593667.926714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeE7-0007Vv-BV; Thu, 31 Aug 2023 09:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593667.926714; Thu, 31 Aug 2023 09:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeE7-0007TE-7s; Thu, 31 Aug 2023 09:44:35 +0000
Received: by outflank-mailman (input) for mailman id 593667;
 Thu, 31 Aug 2023 09:44:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YD1y=EQ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qbe4M-0005pR-0u
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:34:30 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93f1b051-47e1-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 11:34:28 +0200 (CEST)
Received: from MW4PR03CA0307.namprd03.prod.outlook.com (2603:10b6:303:dd::12)
 by PH8PR12MB6794.namprd12.prod.outlook.com (2603:10b6:510:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 09:34:24 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:303:dd:cafe::c2) by MW4PR03CA0307.outlook.office365.com
 (2603:10b6:303:dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21 via Frontend
 Transport; Thu, 31 Aug 2023 09:34:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Thu, 31 Aug 2023 09:34:23 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 04:34:15 -0500
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
X-Inumbo-ID: 93f1b051-47e1-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/ZQUTplMbdK/Qnzhj+Mwaluv/s+ph7M6AUw8GWvKECepIIUR+/z9xH//0dCnek7i8pcddxB9X5IWre2hffTGaCa+CFI2IJAf1LtSpwx9RrEYNFozV8t5Vl+k5tiMpJozIFx82kPZoPagtTrzLNcdxJoR5GP39gYnJm7V5gAcKhr8bQtYWX66VtxcHW98Hpt4jpbgRmLbOxLF9rkioicgdJnQV/roGYdMGlIERCZb91QUKvRenV/arXqlcHJ1/6rByfGwYZLu9gThbAVRqIYynZmZJbYWyT5lD7drYpNGlNWRt1aLPeazictYUTaq6EyDIK1mrLN8cLUeC4O4mBnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlX5KH0Nob6MtW1WHMcMYsv6Nyb/7dx++kxZ3zavhUc=;
 b=euoUT/HAEqlxERXXqYWXivccnuuDdLUzRw0T/ZiTLZCbUvgexsPnuiEB88bpZyVJ0CZ5FIRDr3Lacv1M6KecJlw1PVi3EhQcZGBVA6jdfSw7j+P5BD433Opx3oshkucSRNVe1IrJRmgluY64EXmIoxGfLGoeZWN3EaRvosg2xzWDubAqIsS2zdiuUXCAhKNBFZvhkQXJengNX++Wk6f3u8qH5rk9CdEhcsJdQaoDPTJgHTl+jQoTzXi8dWCIZtECafdLUMv4ygokBiyYnRN6RVJj6ffXN1Q6euorVb7a6EDM/YKlCpZFWQk3ttMb5yFws9lLMIIghUIGHn66xKiDsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlX5KH0Nob6MtW1WHMcMYsv6Nyb/7dx++kxZ3zavhUc=;
 b=nQYr6GokErfb+r1vdRCSnagBVGyI81Dsv0upDnCfF4RilPTKx2yv+Hx88K8rqXXQUP/+1ryc8r6VOOdbaCJLcMiwi8n2yPOEQCXj44Dl7yZD71eDWl4HAzs4Qm0JpD6tNbmGOJLOyAwky9IAtHYZqq7vS2Kx9L52Suai0DKq7VA=
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
Subject: [QEMU PATCH v4 09/13] virtio-gpu: Handle resource blob commands
Date: Thu, 31 Aug 2023 17:32:48 +0800
Message-ID: <20230831093252.2461282-10-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|PH8PR12MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e55a5e7-c5ba-4dc3-5c73-08dbaa057646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RM15CUw7CIpAD8sdpRNmA0lqtZbVQVqbpXCnrS0A5tSJB1DhU9CFVeiFjeIa0K1b/MAgJeZtB2awow4wfSIAuY3Ajyi4E1/PgRiothED75z9LVx2PJ2En4EWqg5QeAlZ0bYoZCBilIBVm/4+m/9ewwBMsYqOe7maiKzMuv6eD3L9xRMeAxp5OMtPkdJpeffDdlmNMZBh9gu7WruepIM0cs+gJFIvKt3okp2VdthmCCrivctknv3jzB9oRCVYU1toXdizYIBg0Wm9N3qCDukDwS/p2lwZzYuaRngeS8J5ChE7yVImHwAdit2Vzhe5LFOj/9fTKarx8Cb1v6g1uio90ybcdlXMmySO0lvpRgy7ab/GuQyJrxP5jkPMCDcA5r6R92IA2z5wL6jRwZ35a0KVvmmtqJ4K0Eld4sdZifmf+77L94vjbO9W4v1i031VEITf2BZ+CLgiaJIT4o715DHnGiQRUuiQK+nTWE4/EN9rm+v6zk+IpPtCfYDm8g7HEvYO2dgUp7jZ4M60c3lpwxKB3JfmSXVPSPg1F+BgmLnVKLhcMKpPzjqfjoZCoLqiJ45yxpx200eM45Aq1ZrhP+B/xDg9nJ2oCVHOu5m3McoagWwckaAM/Z9Y80+zNA/asPEIMqul9asIiNg0PyauiOvpLedZdVt626YIwbb37g4nR98nLxlZqIkid4bPNWpKVyqbAzrUBf/rw89bFzhdObl5VNc903kH87Ge28nk8n+Dh4DCxNCN5tUMdQrbk2LVC/lokQ7me2Q2Mu1uNaMiXe7M3XKinAEuVJRUEr9WYnxPNVg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199024)(1800799009)(186009)(82310400011)(46966006)(36840700001)(40470700004)(4326008)(7696005)(6666004)(41300700001)(478600001)(110136005)(83380400001)(1076003)(26005)(336012)(8676002)(30864003)(54906003)(16526019)(7416002)(2616005)(70206006)(316002)(70586007)(5660300002)(40460700003)(36756003)(40480700001)(47076005)(356005)(2906002)(36860700001)(426003)(81166007)(86362001)(921005)(8936002)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:34:23.7531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e55a5e7-c5ba-4dc3-5c73-08dbaa057646
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6794

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Support BLOB resources creation, mapping and unmapping by calling the
new stable virglrenderer 0.10 interface. Only enabled when available and
via the blob config. E.g. -device virtio-vga-gl,blob=true

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

v1->v2:
    - Remove unused #include "hw/virtio/virtio-iommu.h"

    - Add a local function, called virgl_resource_destroy(), that is used
      to release a vgpu resource on error paths and in resource_unref.

    - Remove virtio_gpu_virgl_resource_unmap from virtio_gpu_cleanup_mapping(),
      since this function won't be called on blob resources and also because
      blob resources are unmapped via virgl_cmd_resource_unmap_blob().

    - In virgl_cmd_resource_create_blob(), do proper cleanup in error paths
      and move QTAILQ_INSERT_HEAD(&g->reslist, res, next) after the resource
      has been fully initialized.

    - Memory region has a different life-cycle from virtio gpu resources
      i.e. cannot be released synchronously along with the vgpu resource.
      So, here the field "region" was changed to a pointer that will be
      released automatically once the memory region is unparented and all
      of its references have been released.
      Also, since the pointer can be used to indicate whether the blob
      is mapped, the explicit field "mapped" was removed.

    - In virgl_cmd_resource_map_blob(), add check on the value of
      res->region, to prevent beeing called twice on the same resource.

    - Remove direct references to parent_obj.

    - Separate declarations from code.

 hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
 hw/display/virtio-gpu.c        |   4 +-
 include/hw/virtio/virtio-gpu.h |   5 +
 meson.build                    |   4 +
 4 files changed, 225 insertions(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 312953ec16..17b634d4ee 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -17,6 +17,7 @@
 #include "trace.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-gpu.h"
+#include "hw/virtio/virtio-gpu-bswap.h"
 
 #include "ui/egl-helpers.h"
 
@@ -78,9 +79,24 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
     virgl_renderer_resource_create(&args, NULL, 0);
 }
 
+static void virgl_resource_destroy(VirtIOGPU *g,
+                                   struct virtio_gpu_simple_resource *res)
+{
+    if (!res)
+        return;
+
+    QTAILQ_REMOVE(&g->reslist, res, next);
+
+    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
+    g_free(res->addrs);
+
+    g_free(res);
+}
+
 static void virgl_cmd_resource_unref(VirtIOGPU *g,
                                      struct virtio_gpu_ctrl_command *cmd)
 {
+    struct virtio_gpu_simple_resource *res;
     struct virtio_gpu_resource_unref unref;
     struct iovec *res_iovs = NULL;
     int num_iovs = 0;
@@ -88,13 +104,22 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
     VIRTIO_GPU_FILL_CMD(unref);
     trace_virtio_gpu_cmd_res_unref(unref.resource_id);
 
+    res = virtio_gpu_find_resource(g, unref.resource_id);
+
     virgl_renderer_resource_detach_iov(unref.resource_id,
                                        &res_iovs,
                                        &num_iovs);
     if (res_iovs != NULL && num_iovs != 0) {
         virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
+        if (res) {
+            res->iov = NULL;
+            res->iov_cnt = 0;
+        }
     }
+
     virgl_renderer_resource_unref(unref.resource_id);
+
+    virgl_resource_destroy(g, res);
 }
 
 static void virgl_cmd_context_create(VirtIOGPU *g,
@@ -426,6 +451,183 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
     g_free(resp);
 }
 
+#ifdef HAVE_VIRGL_RESOURCE_BLOB
+
+static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
+                                           struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
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
+    res = virtio_gpu_find_resource(g, cblob.resource_id);
+    if (res) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
+                      __func__, cblob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    res = g_new0(struct virtio_gpu_simple_resource, 1);
+    if (!res) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
+        return;
+    }
+
+    res->resource_id = cblob.resource_id;
+    res->blob_size = cblob.size;
+
+    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
+        ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
+                                            cmd, &res->addrs, &res->iov,
+                                            &res->iov_cnt);
+        if (!ret) {
+            g_free(res);
+            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+            return;
+        }
+    }
+
+    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
+
+    virgl_args.res_handle = cblob.resource_id;
+    virgl_args.ctx_id = cblob.hdr.ctx_id;
+    virgl_args.blob_mem = cblob.blob_mem;
+    virgl_args.blob_id = cblob.blob_id;
+    virgl_args.blob_flags = cblob.blob_flags;
+    virgl_args.size = cblob.size;
+    virgl_args.iovecs = res->iov;
+    virgl_args.num_iovs = res->iov_cnt;
+
+    ret = virgl_renderer_resource_create_blob(&virgl_args);
+    if (ret) {
+        virgl_resource_destroy(g, res);
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
+    res = virtio_gpu_find_resource(g, mblob.resource_id);
+    if (!res) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
+                      __func__, mblob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+    if (res->region) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already mapped %d\n",
+		      __func__, mblob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    ret = virgl_renderer_resource_map(res->resource_id, &data, &size);
+    if (ret) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
+                      __func__, strerror(-ret));
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    res->region = g_new0(MemoryRegion, 1);
+    if (!res->region) {
+        virgl_renderer_resource_unmap(res->resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
+        return;
+    }
+    memory_region_init_ram_device_ptr(res->region, OBJECT(g), NULL, size, data);
+    OBJECT(res->region)->free = g_free;
+    memory_region_add_subregion(&b->hostmem, mblob.offset, res->region);
+    memory_region_set_enabled(res->region, true);
+
+    memset(&resp, 0, sizeof(resp));
+    resp.hdr.type = VIRTIO_GPU_RESP_OK_MAP_INFO;
+    virgl_renderer_resource_get_map_info(mblob.resource_id, &resp.map_info);
+    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
+}
+
+static int virtio_gpu_virgl_resource_unmap(VirtIOGPU *g,
+                                           struct virtio_gpu_simple_resource
+                                           *res)
+{
+    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
+
+    if (!res) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped %d\n",
+                      __func__, res->resource_id);
+        return VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+    }
+
+    memory_region_set_enabled(res->region, false);
+    memory_region_del_subregion(&b->hostmem, res->region);
+    object_unparent(OBJECT(res->region));
+    res->region = NULL;
+
+    return virgl_renderer_resource_unmap(res->resource_id);
+}
+
+static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
+                                          struct virtio_gpu_ctrl_command *cmd)
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
@@ -492,6 +694,17 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
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
index 5b7a7eab4f..cc4c1f81bb 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1367,10 +1367,12 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
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
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 55973e112f..b9adc28071 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -58,6 +58,11 @@ struct virtio_gpu_simple_resource {
     int dmabuf_fd;
     uint8_t *remapped;
 
+#ifdef HAVE_VIRGL_RESOURCE_BLOB
+    /* only blob resource needs this region to be mapped as guest mmio */
+    MemoryRegion *region;
+#endif
+
     QTAILQ_ENTRY(virtio_gpu_simple_resource) next;
 };
 
diff --git a/meson.build b/meson.build
index ff20d3c249..f7b744ab82 100644
--- a/meson.build
+++ b/meson.build
@@ -1072,6 +1072,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
                        cc.has_function('virgl_renderer_context_create_with_flags',
                                        prefix: '#include <virglrenderer.h>',
                                        dependencies: virgl))
+  config_host_data.set('HAVE_VIRGL_RESOURCE_BLOB',
+                       cc.has_function('virgl_renderer_resource_create_blob',
+                                       prefix: '#include <virglrenderer.h>',
+                                       dependencies: virgl))
 endif
 blkio = not_found
 if not get_option('blkio').auto() or have_block
-- 
2.34.1


