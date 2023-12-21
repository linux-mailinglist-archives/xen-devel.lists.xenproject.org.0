Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A70181B377
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 11:25:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658766.1028132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGEh-0005Mj-J7; Thu, 21 Dec 2023 10:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658766.1028132; Thu, 21 Dec 2023 10:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGEh-0005Kv-Fe; Thu, 21 Dec 2023 10:25:03 +0000
Received: by outflank-mailman (input) for mailman id 658766;
 Thu, 21 Dec 2023 10:25:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HEgZ=IA=amd.com=Julia.Zhang@srs-se1.protection.inumbo.net>)
 id 1rGGEg-0004Xj-DZ
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 10:25:02 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31bb4a60-9feb-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 11:25:00 +0100 (CET)
Received: from CH2PR12CA0018.namprd12.prod.outlook.com (2603:10b6:610:57::28)
 by CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Thu, 21 Dec
 2023 10:24:50 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::33) by CH2PR12CA0018.outlook.office365.com
 (2603:10b6:610:57::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20 via Frontend
 Transport; Thu, 21 Dec 2023 10:24:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 10:24:50 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 04:24:45 -0600
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
X-Inumbo-ID: 31bb4a60-9feb-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ozzyb76d7Olx9tTD/MJ9EDfscgYrnyoX/Kneyzc0W12ewAt+2hvrEPBGtcPJCP8MAoPwnqE99VTKdn7eOHuWWT9VHbYx7PerrA3QctmxTwzjW2vGhl6tFdvbK6BnUh5JpJ2sA47dF4kWGi5k9/CzMg2FDAVIjDBpbaXkP6uLZ4WZHxGWvjeGygy20T8MovIbn5aYwngjyJqtwn+WK84Rar4T8rn0+8mWd81O3bj4KAyb/V36AZkNSXx3PXl6AbvDeCQBGtJ+Y1fAp4pv8Og706T9BNRDieDTXzEeyFOLVMIC7/pT52cICZRWR7s2TLX5cn1mKxl2iM1whZ8gOav+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77o8ldi+jx+mBAHecSVRnPQQFtbIEjMetY1JJxzTl1Q=;
 b=XEhIxNJBn+DvGXdOp5aG6OL1kPvF3dBpwGt6qAJUO17RcRIEh8D+bYDgryRi0sBnhvmK6aaXzyV7+7unWAn2RYU/z5YsnU2+Zb7X5lMUk0KwuL4wyoZ5eALIsPtzw7RfXln83TmjOBhIE3Dx/joW44xBE4PQXXesxPQimNYQbgPlEpGAldwdwi3t1k8qzniII/KS+1VvtPUh/uVgquoHJCSQeJB0+IQjL0P8XCExw3co1EI+7dmKDajk4ZbGbBW5y5JuRxWlVVP1SWAUClULCOEs+dI11FW6QNa2kFMeTviINgjBl7xT7waccAVP++Z2gdT8G6Ei8bZFm3X0aYKnNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77o8ldi+jx+mBAHecSVRnPQQFtbIEjMetY1JJxzTl1Q=;
 b=MXhIBzLE7RExaFWsK59fvs9r4KvRHyMyXpi6dJf3Nz8RLx9PlVtD511HrJu7taFdz1iyc52CqMtWQbRd4acKcMfV/iGQs2IPtyAT7PQhFwlSv8qB3b5Oad0LHo6Dpjk21HDNRkC3XU0KDHNJnc0/4KjSGJoffnFr1SLnwo2XjRo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Julia Zhang <julia.zhang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
	<qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Honglei Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
	"Chen Jiqian" <Jiqian.Chen@amd.com>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH v2 1/1] virgl: Implement resource_query_layout
Date: Thu, 21 Dec 2023 18:23:43 +0800
Message-ID: <20231221102342.4022630-2-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221102342.4022630-1-julia.zhang@amd.com>
References: <20231221102342.4022630-1-julia.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|CH2PR12MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: 859bac35-eab6-418c-8df9-08dc020f107d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MS3I23z1Bs+jwHzXutZppi4ndAYCUIX+upYyEDUZT/6JlwcotuLDdl6G82ARiwvNnJv8gvmUUGxjEbtSQN/0K0R7RqXLkTTk6qhpK/mjCX0Qci9Yq0UzaSYpnhET7Je6CU6MHncakbarR6MSSdy6CtTnB/O+T7bVgTL7rMJRkveoizPR/zaHHIgXV5+tZMLRuFJoWqWyW9b7HXaQLqPR81kfNPna8LQCV3Z/yV0UDpJKCasb7+G+Xqzio8PQJNO6DoSujWGKgRNKRoCeCksVRMFDwGN0Be1B/0iWiuskk5UiahoL4omAO5FNzUAyviupwWQ+5J/gn/PIiHSAjcXWcZ6yvLDkw1AZZw/ZbwxzmvI9cMT/xA0m68iVlpYaCQEzvPC/OBAf8MeYaBgmE7uEmaLI46MtqANNijU0GPaP3JHaZc2gK3qH0m+vNmUHRNYq9zTAwRZff6Q6DsW6JNCHiq1ucCj8uzaQ3lHTgkmUdLlpORFVgvPGL/PI2PJ8q2RzZleGWxSa2cVJval7WDmix+QEeDXNQlaj3BCa+oFSRgIAJEK1rvIsVEHmSpspl2ObheZZkIQqcKRbmKZfvOS7tGDQAsR2+x9h/NUhglzNZoEO/8G76IVqh3JYu9jHIjTt7fxFb6NWYfzupBCebfSoJHQh86bWP5NromJuMSnfSYD72yd5igHd/S8DTKWCNKZ7+n7dlPjiUjLQBpqK5+m2sKpnpCIgvcjmpfycrQcjnpXZOmWNNDAGb9P5YQUkKqNFOVwyS5QCNZbrURcwOXvymbT97YT8yonwGW1m4Wbp/0tHQ9wEJ1oRU8O+CMCTwJbG
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230173577357003)(230922051799003)(230273577357003)(186009)(82310400011)(451199024)(1800799012)(64100799003)(36840700001)(40470700004)(46966006)(110136005)(70206006)(70586007)(40480700001)(54906003)(316002)(8936002)(8676002)(4326008)(40460700003)(44832011)(41300700001)(81166007)(336012)(426003)(83380400001)(47076005)(26005)(1076003)(2616005)(82740400003)(16526019)(5660300002)(86362001)(36756003)(356005)(7696005)(2906002)(36860700001)(7416002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 10:24:50.3415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 859bac35-eab6-418c-8df9-08dc020f107d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150

From: Daniel Stone <daniels@collabora.com>

A new ioctl to shuttle information between host and guest about the
actual buffer allocation, which can be used for interop between GL and
Vulkan when supporting standard window systems.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Co-developed-by: Julia Zhang <julia.zhang@amd.com>
Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
 hw/display/virtio-gpu-base.c                |  4 +++
 hw/display/virtio-gpu-virgl.c               | 40 +++++++++++++++++++++
 include/hw/virtio/virtio-gpu-bswap.h        |  7 ++++
 include/standard-headers/linux/virtio_gpu.h | 30 ++++++++++++++++
 meson.build                                 |  4 +++
 5 files changed, 85 insertions(+)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 6bcee3882f..09b37f015d 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -240,6 +240,10 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
         features |= (1 << VIRTIO_GPU_F_RESOURCE_UUID);
     }
 
+#ifdef HAVE_VIRGL_RESOURCE_QUERY_LAYOUT
+    features |= (1 << VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT);
+#endif /* HAVE_VIRGL_RESOURCE_QUERY_LAYOUT */
+
     return features;
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index c1e7c6d0c6..b331232fee 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -813,6 +813,40 @@ static void virgl_cmd_set_scanout_blob(VirtIOGPU *g,
 
 #endif /* HAVE_VIRGL_RESOURCE_BLOB */
 
+#ifdef HAVE_VIRGL_RESOURCE_QUERY_LAYOUT
+static void virgl_cmd_resource_query_layout(VirtIOGPU *g,
+					    struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_resource_query_layout qlayout;
+    struct virtio_gpu_resp_resource_layout resp;
+    struct virgl_renderer_resource_layout rlayout;
+    int ret;
+    int i;
+    VIRTIO_GPU_FILL_CMD(qlayout);
+    virtio_gpu_resource_query_layout_bswap(&qlayout);
+
+    ret = virgl_renderer_resource_query_layout(qlayout.resource_id, &rlayout,
+					       qlayout.width, qlayout.height,
+					       qlayout.format, qlayout.bind);
+    if (ret != 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource %d is not externally-allocated\n",
+                      __func__, qlayout.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    memset(&resp, 0, sizeof(resp));
+    resp.hdr.type = VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT;
+    resp.num_planes = rlayout.num_planes;
+    resp.modifier = rlayout.modifier;
+    for (i = 0; i < resp.num_planes; i++) {
+        resp.planes[i].offset = rlayout.planes[i].offset;
+        resp.planes[i].stride = rlayout.planes[i].stride;
+    }
+    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
+}
+#endif /* HAVE_VIRGL_RESOURCE_QUERY_LAYOUT */
+
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
                                       struct virtio_gpu_ctrl_command *cmd)
 {
@@ -896,6 +930,12 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
         virgl_cmd_set_scanout_blob(g, cmd);
         break;
 #endif /* HAVE_VIRGL_RESOURCE_BLOB */
+
+#ifdef HAVE_VIRGL_RESOURCE_QUERY_LAYOUT
+    case VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT:
+	virgl_cmd_resource_query_layout(g, cmd);
+	break;
+#endif /* HAVE_VIRGL_RESOURCE_QUERY_LAYOUT*/
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/virtio-gpu-bswap.h
index dd1975e2d4..dea8cf6fd3 100644
--- a/include/hw/virtio/virtio-gpu-bswap.h
+++ b/include/hw/virtio/virtio-gpu-bswap.h
@@ -92,4 +92,11 @@ virtio_gpu_scanout_blob_bswap(struct virtio_gpu_set_scanout_blob *ssb)
     le32_to_cpus(&ssb->offsets[3]);
 }
 
+static inline void
+virtio_gpu_resource_query_layout_bswap(struct virtio_gpu_resource_query_layout *rql)
+{
+    virtio_gpu_ctrl_hdr_bswap(&rql->hdr);
+    le32_to_cpus(&rql->resource_id);
+}
+
 #endif
diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
index c621389f3d..c9a2f58237 100644
--- a/include/standard-headers/linux/virtio_gpu.h
+++ b/include/standard-headers/linux/virtio_gpu.h
@@ -65,6 +65,11 @@
  */
 #define VIRTIO_GPU_F_CONTEXT_INIT        4
 
+/*
+ * VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT
+ */
+#define VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT 5
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
@@ -95,6 +100,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_SUBMIT_3D,
 	VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
 	VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
+	VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT,
 
 	/* cursor commands */
 	VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
@@ -108,6 +114,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_OK_EDID,
 	VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
 	VIRTIO_GPU_RESP_OK_MAP_INFO,
+	VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT,
 
 	/* error responses */
 	VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -455,4 +462,27 @@ struct virtio_gpu_resource_unmap_blob {
 	uint32_t padding;
 };
 
+
+/* VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT */
+struct virtio_gpu_resource_query_layout {
+	struct virtio_gpu_ctrl_hdr hdr;
+	uint32_t resource_id;
+	uint32_t width;
+	uint32_t height;
+	uint32_t format;
+	uint32_t bind;
+};
+
+/* VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT */
+#define VIRTIO_GPU_RES_MAX_PLANES 4
+struct virtio_gpu_resp_resource_layout {
+	struct virtio_gpu_ctrl_hdr hdr;
+	uint64_t modifier;
+	uint32_t num_planes;
+	struct virtio_gpu_resource_plane {
+		uint64_t offset;
+		uint32_t stride;
+	} planes[VIRTIO_GPU_RES_MAX_PLANES];
+};
+
 #endif
diff --git a/meson.build b/meson.build
index a739a62f2c..72024f5f01 100644
--- a/meson.build
+++ b/meson.build
@@ -1058,6 +1058,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
                          cc.has_function('virgl_renderer_resource_create_blob',
                                          prefix: '#include <virglrenderer.h>',
                                          dependencies: virgl))
+    config_host_data.set('HAVE_VIRGL_RESOURCE_QUERY_LAYOUT',
+                         cc.has_function('virgl_renderer_resource_query_layout',
+                                         prefix: '#include <virglrenderer.h>',
+                                         dependencies: virgl))
   endif
 endif
 rutabaga = not_found
-- 
2.34.1


