Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A47A1D42
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 13:18:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603058.939965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6pl-0002Hs-G2; Fri, 15 Sep 2023 11:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603058.939965; Fri, 15 Sep 2023 11:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6pl-0002FO-Cb; Fri, 15 Sep 2023 11:18:01 +0000
Received: by outflank-mailman (input) for mailman id 603058;
 Fri, 15 Sep 2023 11:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGil=E7=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qh6lI-0003Cy-RT
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 11:13:24 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e89::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e130b61b-53b8-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 13:13:22 +0200 (CEST)
Received: from DM6PR05CA0048.namprd05.prod.outlook.com (2603:10b6:5:335::17)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Fri, 15 Sep
 2023 11:13:18 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:335:cafe::3) by DM6PR05CA0048.outlook.office365.com
 (2603:10b6:5:335::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 11:13:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 15 Sep 2023 11:13:17 +0000
Received: from hr-test6.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 06:13:11 -0500
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
X-Inumbo-ID: e130b61b-53b8-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZNfr4BVueIh4PHR7NbCStSYi9aAXrPneTc/MdrAuxVhJj6MYxtFJ/VZZ62UyqaZJGMMd7ZHvoU6TDZlbOqXbL8k1p9NZ0UjpSc08x2EJdSY4QMT0P1hJSJRqRYFv18/sOuD8gGse+39hYhYQPwNvgxq3o5hzBATl6IzU0B8bBg4amEEfoOkz2yUEGe0sM8GlDrJLXgAiZQRWBg4owzNFeJ928jZYsF4OflXl1K/+6br0vqnmWit2F1b0n5I8AXRV0Oc+l+kTejl3sajQH5sIP3QMUDfPyGUB1/TKT+gfJHr/wl9VXqUuTCpIx5C7oH+BQfFjmkiHJSnFaR1uRHLBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5A+n0tg9lfupiYAG7f+bqV/V6wXcZMOvvXZrjYMgY6c=;
 b=HgxDr1aL1wes3t9S1u4UEAwgEnhXlLXm/A69ir6mzOD0+AiGljph6I/hXw6CuPb9OW1GMgpYx3lbqLYMud/UkQ+HnGDsuKFZNcchVznP9HdDGFMdq6Dus64KJdk+CLu3GvBByVXDkVLm5VxBOZhR6yU0VII5Vmf+g/1eQ1CXs0apvoSJxcP3i1mn+4ukqm2qPeJonqSCWubfykwzW/khd043sAcxG161oJ7lCYmNrgklUT3QkluO8GmVmlAaHAb5abmPiXPmPkqGonGKqpoSpCig/Mb/mpWgWq37rzHtap5jVX8NKcVu0DkQKUwrJFe0l9bVxj6JayLOGHFDzy5aMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5A+n0tg9lfupiYAG7f+bqV/V6wXcZMOvvXZrjYMgY6c=;
 b=UZJbDQRUgvoT3Y1XPYFD1AZyFeCIFZqBdMCAqTxP/MkP+iPutaGUGccIVwm29laJtBAqn5WI7EZXSARTdNQtH2q2MrkcVMwxohsVxjMTdXuEBzDHrAXccUfVlfqtC1fn1ULwztm9RgSOYVHOj0zCckPAA4uF3n7wxHa//HhZokA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Antonio Caggiano" <quic_acaggian@quicinc.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>, "Dmitry
 Osipenko" <dmitry.osipenko@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, Albert Esteve <aesteve@redhat.com>,
	<ernunes@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
	<philmd@linaro.org>, Alyssa Ross <hi@alyssa.is>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, Huang Rui <ray.huang@amd.com>
Subject: [QEMU PATCH v5 09/13] virtio-gpu: Handle resource blob commands
Date: Fri, 15 Sep 2023 19:11:26 +0800
Message-ID: <20230915111130.24064-10-ray.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915111130.24064-1-ray.huang@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: 0300cffa-5fff-4d28-2bae-08dbb5dcc359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v7qdDHk5L27yREFo/7Dk/agbSv41FuHTXBO4Bc0YctxexUJ6DL/lUo8Mom9czBoQDOIBORzUXAnNDmETHqepZsMRwtiFu3/fJwwGOoPW/kgkO7NsUPi2D9iuelRtDhFjCfnx70AZ0zVPGYZRoPEFcKtXONXQ1/MWHIRFDQQSpzon4fiiDiiyZzUEq9cwaXFbd6u1tX9UpEiB323WMmltADNm/dH8w2peeanCLdVNl1NTjN5ccopmkyY71u9dBbtrDMVcvjtcpoHAmdPuSWxxgHmZVMHo21YhzsOwyZTONRvqSSZK8GGkhEsXSDlCvs+rQjjqCanMu8abefM7JPLGkTKMpXKiaAJV7vc9BjyVnfc0mPxSkegIH0NRUeNd5qEYzuOsxsBD4GdimcHMkFAvbrqP0avjvFmiFMbYPoD46wG34qsJjjSALOkR2W4tgohqEi8R3pufzzZ3elMDT/z+khqQ3lJZWcvFRE/BmCoK+3TuqRALYOTI231HzutUJBNWqglLguCCp74dliRBzJzpb4aa0kfAtSXFC5eQyoizSlZj/nZK4RRYI1V8SaWGKaoVqbj8hXVhNeyCiD+c5dvUaVLVV4dI/HgINDI7PlVwpe4FsdfbsC5biVdI8jk9w/fsoA2XUjjqcuGX/DvG4uTjfQrnStYbtgVNwAc3wtb4vPu4u878OLonoCWytBlS/s+dyl1BqZH9U9v6DMY77m1eMh/EVSFEg9nU+ljd6yLQQzxAiwk2Xjnbm6rIepCz+YL5qchf2DCdvi3h6y70CZriSYMS8Zp3gxgrpruJ2tlTFIo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199024)(186009)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(40480700001)(83380400001)(2906002)(5660300002)(36756003)(7416002)(8936002)(86362001)(82740400003)(356005)(4326008)(40460700003)(921005)(8676002)(81166007)(316002)(6666004)(54906003)(47076005)(41300700001)(36860700001)(1076003)(70586007)(110136005)(16526019)(7696005)(26005)(70206006)(478600001)(426003)(2616005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 11:13:17.7109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0300cffa-5fff-4d28-2bae-08dbb5dcc359
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Support BLOB resources creation, mapping and unmapping by calling the
new stable virglrenderer 0.10 interface. Only enabled when available and
via the blob config. E.g. -device virtio-vga-gl,blob=true

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

V4 -> V5:
    - Use memory_region_init_ram_ptr() instead of
      memory_region_init_ram_device_ptr() (Akihiko)

 hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
 hw/display/virtio-gpu.c        |   4 +-
 include/hw/virtio/virtio-gpu.h |   5 +
 meson.build                    |   4 +
 4 files changed, 225 insertions(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 312953ec16..563a6f2f58 100644
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
+    memory_region_init_ram_ptr(res->region, OBJECT(g), NULL, size, data);
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


