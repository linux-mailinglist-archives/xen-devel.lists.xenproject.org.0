Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E066B6415
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 10:29:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508941.783992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbI0n-0007tI-JN; Sun, 12 Mar 2023 09:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508941.783992; Sun, 12 Mar 2023 09:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbI0n-0007l7-AH; Sun, 12 Mar 2023 09:29:05 +0000
Received: by outflank-mailman (input) for mailman id 508941;
 Sun, 12 Mar 2023 09:29:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbHwS-0000RV-IS
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 09:24:36 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2d8fbca-c0b7-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 10:24:34 +0100 (CET)
Received: from MW4PR04CA0068.namprd04.prod.outlook.com (2603:10b6:303:6b::13)
 by MN0PR12MB6318.namprd12.prod.outlook.com (2603:10b6:208:3c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23; Sun, 12 Mar
 2023 09:24:30 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::7d) by MW4PR04CA0068.outlook.office365.com
 (2603:10b6:303:6b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:24:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.23 via Frontend Transport; Sun, 12 Mar 2023 09:24:29 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:24:24 -0500
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
X-Inumbo-ID: b2d8fbca-c0b7-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsgOPke2+iIN2vc68QxbIUzbY5YCmWkFXURFVjG+fkiCDUJs4pDCDcpbz6fxSUvRREXI5Rg+QjmBPHtQd962mNKY2JhC6bmxs0W/isHMYGea0KnC2vPKfXNmfA03DrWVwNwT9sbitkPfWg6DWoCiIV7914cq4zA65kWEDz6O5lCoKGHiHLqYEFUQGQPSP42rYbjLovFsdY9WjE98KwEKKj9oXDNPXVQfUv6YOxpXk2wJjmExNE6O2U8/oX8/axy+qqZ+MxXK5tgtRA+af5jZsGyw6Yr09N4ZG94aiO3a2MpfAPirTeZgl06Gd4/LA/mcNka+fPpPOF7TeJhmRSIYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFVzCS9EKJ3JtWs5IAcFXDUrjN+wb62RYxssFqs2lUk=;
 b=WlR8KlVlCdsWoIdZQCF+7oVbsWwJjNyPPY25xpD8xMQlNuHfvBDaadj4bniYj0Cztdwyw7uDfzZoViaawSZTQrAemBKZK3VXrHveIIjQgilIWDKnchWb+MsUMQCn1WsVX2gKiHa7LPL3q9jV8LoZU6IYnBfP2yTM9un+5GAY1ZqFeQkvkoTBm8sYrU88BV75GQzhCgr6Ajw1xRe5sMl5lbzLueok6H8LDvGUaQPrAHEfY+SnwmdF3vdpbfO0BG+k6U254HeVZDov6u7R5+MCVRp0N2G09IRglDlJl88M3wS/L4jbXqwr9FcW37S6U4fBr8JS4lYN0x5qBlY5ixuQHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFVzCS9EKJ3JtWs5IAcFXDUrjN+wb62RYxssFqs2lUk=;
 b=pSzEPFUfrsuORfJm8T9BhaBfTT/5UeWDquHoe9FvwXhRw8ubqM/+0VcBcJ1illl4Aln01rnTAPx/yJjZqlTR+E7uV+q2wr3cggjhzUcNEwd1gQegppb5vU/NH0OMxFzzrPrv6+ZdO2EuGFeq0OluoO8Hp19Y9j5ppVY0KSdmQDI=
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
	<julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC QEMU PATCH 16/18] virtio-gpu: fix hw-display-virtio-gpu.so undefined symbol virtio_gpu_virgl_resource_unmap
Date: Sun, 12 Mar 2023 17:22:42 +0800
Message-ID: <20230312092244.451465-17-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT033:EE_|MN0PR12MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef8e9f1-b34b-43a0-de72-08db22db9506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m5irxfKVWigmgE9iY41O+l4aueGQo50/hQPNrZ6T9soMxGCuLxrhfl6twhcJtu5Q1HTZ34J/PHCqHmNUvje8GjQxxCnxA2KJoOKZKdrMIAzh/hlwmEkNMz4v7qdKvIBtz6oawERxU5ELYFzLtHc0zpA9kOYcvUAr40qqDm2q5HfZK/6ZcQyUdaEEh/C2Q8VpedlDshSe39aSOWgYHCyEs1OdVmuLWtcbVjoa45Opr0ogtdRmHSXP81lJg/n0jZTbuJzTdSf/vOEczQkkX/cN7Yy4q3yyohoH4hZppsxL8HpZPjkt3Zrlw56tIUODJ4aHQuKTbg4o7jT/K1CPNK7EiRjFeX2FoO8KPzTrx9kZlUVKwXYv80uhaLthBC6bp1n/4ofpEJvNElG/aEuLf1NIQW8Uq8+hE74gclnD06kyDa6oj3WPSwQifIWAGOjFnPYK8FBGaZtUNcJsrOjyEVTf4udtnTIaKb+3um3BJhbyiUZ7wX0e3EYXw0H5RPNe0ZbGd2nckOii02VktdpqEoVa/7PSY8DuLX9GMu8texJnsGL8C4g8KagXr94fr/6cHWzZruULo2nZKKf1QJhGyGcxI36ktSyQ96puMiUEaLmcwP5F6L3+dOjlHSQ2lp9bF0E5P+WYu158QMBaEPThUlcVBv3tm+JXZ9hj7cFEt6cii16enYxce+OLzP33tDc/KMYRhjwmyDCx1J81meCpX8uNpXSwcytBRXmKEzM699VJUUZEo1Q23wbhS0sB8weI4apa
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199018)(36840700001)(40470700004)(46966006)(2906002)(83380400001)(6666004)(7696005)(36756003)(40460700003)(26005)(1076003)(5660300002)(356005)(8936002)(40480700001)(186003)(16526019)(86362001)(41300700001)(2616005)(8676002)(4326008)(921005)(47076005)(7416002)(426003)(70206006)(70586007)(336012)(110136005)(82740400003)(478600001)(316002)(81166007)(54906003)(82310400005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:24:29.4932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef8e9f1-b34b-43a0-de72-08db22db9506
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6318

From: Honglei Huang <honglei1.huang@amd.com>

Move virtio_gpu_virgl_resource_unmap to virtio-gpu.c cause virtio-gpu.so
call this function but this function in virtio-gpu-gl.so before.

Add virgl dependency  into virtio-gpu-gl.so.

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Honglei Huang <honglei1.huang@amd.com>
Reviewed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 hw/display/meson.build        |  2 +-
 hw/display/virtio-gpu-virgl.c | 17 -----------------
 hw/display/virtio-gpu.c       | 19 +++++++++++++++++++
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/hw/display/meson.build b/hw/display/meson.build
index 7a725ed80e..21999dfbe0 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -67,7 +67,7 @@ softmmu_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d
 if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss = ss.source_set()
   virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
-                    if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman])
+                    if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman, virgl])
   virtio_gpu_ss.add(when: 'CONFIG_LINUX', if_true: files('virtio-gpu-udmabuf.c'),
                                           if_false: files('virtio-gpu-udmabuf-stubs.c'))
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 69083d15a9..d5214e0f43 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -636,23 +636,6 @@ static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
     virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
 }
 
-int virtio_gpu_virgl_resource_unmap(VirtIOGPU *g,
-                                    struct virtio_gpu_simple_resource *res)
-{
-    if (!res->mapped) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped %d\n",
-                      __func__, res->resource_id);
-        return VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
-    }
-
-    memory_region_set_enabled(&res->region, false);
-    memory_region_del_subregion(&g->parent_obj.hostmem, &res->region);
-    object_unparent(OBJECT(&res->region));
-
-    res->mapped = NULL;
-    return virgl_renderer_resource_unmap(res->resource_id);
-}
-
 static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
                                         struct virtio_gpu_ctrl_command *cmd)
 {
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 95e421a525..95eaed61b3 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -31,6 +31,8 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 
+#include <virglrenderer.h>
+
 #define VIRTIO_GPU_VM_VERSION 1
 
 static struct virtio_gpu_simple_resource *
@@ -873,6 +875,23 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
     g_free(iov);
 }
 
+int virtio_gpu_virgl_resource_unmap(VirtIOGPU *g,
+                                    struct virtio_gpu_simple_resource *res)
+{
+    if (!res->mapped) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped %d\n",
+                      __func__, res->resource_id);
+        return VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+    }
+
+    memory_region_set_enabled(&res->region, false);
+    memory_region_del_subregion(&g->parent_obj.hostmem, &res->region);
+    object_unparent(OBJECT(&res->region));
+
+    res->mapped = NULL;
+    return virgl_renderer_resource_unmap(res->resource_id);
+}
+
 static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
                                        struct virtio_gpu_simple_resource *res)
 {
-- 
2.25.1


