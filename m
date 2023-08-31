Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D5C78E97E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:34:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593576.926613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe3m-0007KX-O9; Thu, 31 Aug 2023 09:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593576.926613; Thu, 31 Aug 2023 09:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe3m-0007I4-JX; Thu, 31 Aug 2023 09:33:54 +0000
Received: by outflank-mailman (input) for mailman id 593576;
 Thu, 31 Aug 2023 09:33:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YD1y=EQ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qbe3k-0006tw-SX
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:33:52 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7db0374d-47e1-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 11:33:51 +0200 (CEST)
Received: from MW4PR04CA0300.namprd04.prod.outlook.com (2603:10b6:303:89::35)
 by MW3PR12MB4362.namprd12.prod.outlook.com (2603:10b6:303:5d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 09:33:46 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:303:89:cafe::1a) by MW4PR04CA0300.outlook.office365.com
 (2603:10b6:303:89::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23 via Frontend
 Transport; Thu, 31 Aug 2023 09:33:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Thu, 31 Aug 2023 09:33:46 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 04:33:39 -0500
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
X-Inumbo-ID: 7db0374d-47e1-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwdBHpikxg+u6vtMqlUrgQsxp7wZqkQYDGekSDzmr78zxQk/+QJt/dI+jcGuGIz6ubdvy3KaktWHUUGDJUvAQ/zFiEtzCj+uZXzSaRBIDNtIkQheWJWyjPXUJ6+BPPsLR722zthgbx4S899YW6Rue1fi9ackUt1gzZugLUoYsdjQuojF1sxGGl0UgY9uRw85Jq/gbB+Lqxg2t0lfJA+A3DKGmqTt+VtshlwI2qKuE+Bu3wk7vMjvdOv13I5Wk9TbspwkxIoUDXDZA7mmUUT8b8JVl6zM6LdW6+T8urtkeWjomnKQDabz6PoU6l+19MoMjibPPe9VWtGCh2L/pka9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHy1UnKuYteMitn9Vk2LwqyNhuJGyfSsajh1mjfyeBw=;
 b=Tgy+UduxNkkARnYG6rDOZ+gEVXVpWfjqMZmE83Xi2KEhRiloZDaxv9yZ/8bWymQM92Uz3fb8sEQUD/ah7e+an4htlwCW/ySCUfJvK/frq0OSXTJ5aEJV2yheVQpy961wWQtDcohZHgakK9jr9ofbNgsBYKEJgUv+EZXHvqqxjaRyhrp05GdtwEH9VS31qXILq6r3lge+YcMcm4Jgzi6M/8T7aROhrFXOJYfFk3qeSNlBLm5fgoQZ8gy0YN8thHrnFeOggiETGW3ZxKm7i0h4s9V85GMhUfvkufHNhVjEWW4oBcKtTptFAZ6nxlOYhzrMhRaLsOfbIXeeUjLpuSPAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHy1UnKuYteMitn9Vk2LwqyNhuJGyfSsajh1mjfyeBw=;
 b=39yVksiDQviA5sHuwbueLZmZYBQMvgRcUxrCQkbjcA17QmOdpFDY+bdiWTQtuph7RjAMvRyovAHCr5NRKEzwypA8LKjiULqS6gLZuDv6d3dPkSlKs5Ny5zGoPzX18c2FsEOnszJxWg5QQ/0ZAmUJrEMvYgfBesJ87gtglgXO+L4=
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
 Jiqian" <Jiqian.Chen@amd.com>, Emmanouil Pitsidianakis
	<manos.pitsidianakis@linaro.org>, Huang Rui <ray.huang@amd.com>
Subject: [QEMU PATCH v4 04/13] virtio-gpu: blob prep
Date: Thu, 31 Aug 2023 17:32:43 +0800
Message-ID: <20230831093252.2461282-5-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|MW3PR12MB4362:EE_
X-MS-Office365-Filtering-Correlation-Id: 37def332-56e8-4a92-8515-08dbaa056037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ypX+zPPIP7BDXemVD5Igaq8W6nOq03cx/+RqbqaF8EtCLjlqHZFmsA/VC5RJWNSlBFZh9fY6Lki+8ZcJ7Q3741BH7FW5Wrcq26SlO7Ttd8fAYtdgxwVr+O+9Jx0pS9qp1vAWuNYGtknsiLoPT+rLxzzJOQ8cX6SSq6kaLVQ2cb8fiRx0gj8YV7m83b1QZwG43Y2eiwBwjMzvBOGXKfdLUwGwDAkNyxOhi8523YuGqd0zLCCDRDwab+He7WsRGfy+tJPn++cpxIT/CS1N9nWnBxt7y0REmy9XXkB84J/MGQZ/F2NDOxbgEd1nN8P7x9JM1+oEk/hs/PSw8IkBqHLYoEW0HFeAm+dPSYiPN4ks/e+qpP4bGlI/7VmzhBGFIHdYoAQFXgCSQEEKiPOqH1v+RKvD4oFJhJjQUs2sYTfRY2pXzm/6g+ec+3b8WMw2NZAdSfsgq9VGeinH1fPcvrFhzUdBLqqHu1zE80UElPu2ZCQjzkdxTFkcccdH//ksVmdbidIprodVByFsNyiYACPpm4tI2imolXLggRj+uo/mirSu7OxVQzSJ3RgCjo0XfSYeIjJg95PpTC7MTUSxd9OzY2yYwmgoMjbRl/2P1seobBkO+8DqBUbv0GkTV6molg74WQBK/NX875ZeIiiKXNQkrmwtntCtRvSHUebg8grvge3+pjNhMVX/CSyXq+aHKrwGd9v7q5YlmJITGmrJKE4lGtGsUVSZMGg7iM2tMSJRWzuQBUkGfSMr7qEVZVUK9xw5AxWDFB0fRfpyADoktiky7O3v/DW/8L/2Ua3coSr3ABE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(1800799009)(82310400011)(451199024)(186009)(36840700001)(40470700004)(46966006)(356005)(921005)(81166007)(7696005)(82740400003)(6666004)(40460700003)(36756003)(86362001)(36860700001)(40480700001)(47076005)(1076003)(2616005)(2906002)(336012)(426003)(26005)(16526019)(83380400001)(478600001)(41300700001)(110136005)(70586007)(70206006)(4326008)(8936002)(5660300002)(8676002)(7416002)(54906003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:33:46.7304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37def332-56e8-4a92-8515-08dbaa056037
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4362

From: Antonio Caggiano <antonio.caggiano@collabora.com>

This adds preparatory functions needed to:

     - decode blob cmds
     - tracking iovecs

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Tested-by: Alyssa Ross <hi@alyssa.is>
Tested-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

This patch is already under review as part of the "rutabaga_gfx + gfxstream"
series (already in v13) and has been included here because of dependency.

 hw/display/virtio-gpu.c              | 10 +++-------
 include/hw/virtio/virtio-gpu-bswap.h | 15 +++++++++++++++
 include/hw/virtio/virtio-gpu.h       |  5 +++++
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 48ef0d9fad..3e658f1fef 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -33,15 +33,11 @@
 
 #define VIRTIO_GPU_VM_VERSION 1
 
-static struct virtio_gpu_simple_resource*
-virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
 static struct virtio_gpu_simple_resource *
 virtio_gpu_find_check_resource(VirtIOGPU *g, uint32_t resource_id,
                                bool require_backing,
                                const char *caller, uint32_t *error);
 
-static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
-                                       struct virtio_gpu_simple_resource *res);
 static void virtio_gpu_reset_bh(void *opaque);
 
 void virtio_gpu_update_cursor_data(VirtIOGPU *g,
@@ -116,7 +112,7 @@ static void update_cursor(VirtIOGPU *g, struct virtio_gpu_update_cursor *cursor)
                   cursor->resource_id ? 1 : 0);
 }
 
-static struct virtio_gpu_simple_resource *
+struct virtio_gpu_simple_resource *
 virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
 {
     struct virtio_gpu_simple_resource *res;
@@ -904,8 +900,8 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
     g_free(iov);
 }
 
-static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
-                                       struct virtio_gpu_simple_resource *res)
+void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
+                                struct virtio_gpu_simple_resource *res)
 {
     virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
     res->iov = NULL;
diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/virtio-gpu-bswap.h
index 637a0585d0..dd1975e2d4 100644
--- a/include/hw/virtio/virtio-gpu-bswap.h
+++ b/include/hw/virtio/virtio-gpu-bswap.h
@@ -70,6 +70,21 @@ virtio_gpu_create_blob_bswap(struct virtio_gpu_resource_create_blob *cblob)
     le64_to_cpus(&cblob->size);
 }
 
+static inline void
+virtio_gpu_map_blob_bswap(struct virtio_gpu_resource_map_blob *mblob)
+{
+    virtio_gpu_ctrl_hdr_bswap(&mblob->hdr);
+    le32_to_cpus(&mblob->resource_id);
+    le64_to_cpus(&mblob->offset);
+}
+
+static inline void
+virtio_gpu_unmap_blob_bswap(struct virtio_gpu_resource_unmap_blob *ublob)
+{
+    virtio_gpu_ctrl_hdr_bswap(&ublob->hdr);
+    le32_to_cpus(&ublob->resource_id);
+}
+
 static inline void
 virtio_gpu_scanout_blob_bswap(struct virtio_gpu_set_scanout_blob *ssb)
 {
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index de4f624e94..55973e112f 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -257,6 +257,9 @@ void virtio_gpu_base_fill_display_info(VirtIOGPUBase *g,
 void virtio_gpu_base_generate_edid(VirtIOGPUBase *g, int scanout,
                                    struct virtio_gpu_resp_edid *edid);
 /* virtio-gpu.c */
+struct virtio_gpu_simple_resource *
+virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
+
 void virtio_gpu_ctrl_response(VirtIOGPU *g,
                               struct virtio_gpu_ctrl_command *cmd,
                               struct virtio_gpu_ctrl_hdr *resp,
@@ -275,6 +278,8 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
                                   uint32_t *niov);
 void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
                                     struct iovec *iov, uint32_t count);
+void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
+                                struct virtio_gpu_simple_resource *res);
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
 void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
 void virtio_gpu_reset(VirtIODevice *vdev);
-- 
2.34.1


