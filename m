Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009F57A1D23
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 13:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603004.939904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6kh-0004FJ-B2; Fri, 15 Sep 2023 11:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603004.939904; Fri, 15 Sep 2023 11:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6kh-0004DW-7B; Fri, 15 Sep 2023 11:12:47 +0000
Received: by outflank-mailman (input) for mailman id 603004;
 Fri, 15 Sep 2023 11:12:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGil=E7=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qh6kf-0003Cy-Ry
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 11:12:45 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca622fe6-53b8-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 13:12:44 +0200 (CEST)
Received: from DM6PR04CA0010.namprd04.prod.outlook.com (2603:10b6:5:334::15)
 by SN7PR12MB8601.namprd12.prod.outlook.com (2603:10b6:806:26e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Fri, 15 Sep
 2023 11:12:40 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::50) by DM6PR04CA0010.outlook.office365.com
 (2603:10b6:5:334::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 11:12:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Fri, 15 Sep 2023 11:12:40 +0000
Received: from hr-test6.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 06:12:33 -0500
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
X-Inumbo-ID: ca622fe6-53b8-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFNu9SZdx8Kvyz/3mgNNkkY5Cwydb5AvrZdC1q9+Lk4lerAEhI1lKuU/8LzoFt7TVsNqDTqljIZEE/LaH8K3C7h0QMvnyjTQBIZt+al47GPFmU/GsJDJ9NdkEc7/7EXOE4dasvtTjY5nA07S58Ud7rCsBC0WABe0bEA8CLeD8GAx0Mmy1NTJYByhdW45LHo0EJHTh3H+UtyZFE84WoJgCFGu802Nh9YbaXfZsMabMO8h/+sW/juQairkXl0C3CmGpuXCAgAZXGa4PK1yFLpPt7uOGryS1UQPsqCkzhgBFeaWa8tP1QlsLCxt3WW0xD0S75yD/bt7US4LgH1wmwcivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PRb9JumY0H3A+ggxeC4QKp/ezd1/0dFt3HVkyEWsIU=;
 b=M+daDup49UMHEBySiCHQslPZ38Unb4/4aiJnPhl3HCgQW2RxNEX/ELt/L+Z77oA4El45Td5So7CJQLc928H4T+lXHHQDv+Y7ALHMXCCbtyZ+zYMEwif86fKX8ca2Y6MSrJBecdm3nFBdhFx9Ky9PqabMnxQCqrWEVjYgIvzyqXILGnkqhTONEm2snZ5TfoiNZQqH/E+KJJAzF/CFHBoKpNnl0qA6gHY9DbiskNuNiYXsXpNNP4zzW3foZRGfcSaqSlrph+0Zf1foi6nrooW9pBBFAyiuDr2ex+rcYdchBK29JCqTukwU3O7xaveMO73VZzFQo8Lt9Ii7mQK16bIe2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PRb9JumY0H3A+ggxeC4QKp/ezd1/0dFt3HVkyEWsIU=;
 b=XmpK6771AwHuStJs/EUxOnxynsKbivNAtj27Rmbk7MWFKYutdTavfLHFP2/T5MrAlXmNbn0UDX5l7S4Ec70WKtmuHs/lrRfnonwkolMFVtKSCgEcq1KabIKbzF5RbIjw2MAnAwsjA/8NmzjVGeYCtfvBSr1QzjtJWsNl0oSheJQ=
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
	<antonio.caggiano@collabora.com>, Emmanouil Pitsidianakis
	<manos.pitsidianakis@linaro.org>, Huang Rui <ray.huang@amd.com>
Subject: [QEMU PATCH v5 04/13] virtio-gpu: blob prep
Date: Fri, 15 Sep 2023 19:11:21 +0800
Message-ID: <20230915111130.24064-5-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|SN7PR12MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: 01b82a7a-26d3-457d-5f72-08dbb5dcad12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EwmIelxdkyQ9eQhxOqf668A+CVw+I2DHHvO8BN19fbLSlNhL7ns67oWdoS64TbVuvPTjX21Hh4GzCAZfuTaxpfW7xdNnDI8Tzh5ikl22kIpuxEH28vkgoFLCuamqdudbCAJTPRQg4Hvk56xs2I8mUTLyrmu0tcTe/p5kUkIVtkMMWCNK8rYcLGg1nR130HFIQCpoVtfvMw3kffcxHSEEbMZiH+/Mc6jQSVSOnSLTIKWnXyVgnDvRF+1brdE8KnYQBCmEnu1gVsu/qbDGMoRIRah+riP2u9xFaOGBMEUvP/2EtTnY3RsaesV4eHPBeGK76OXgJpRHw0aKQmG2X+/enDwlKCd/n8cJoC00KrCm5beulhnclvMobPlbab5KMPO09NsMXL/nHC5AtafHEuV4CZfg8Z1Sp2b6V6qlZt8Znb41VvR9OwkhImi38RcLBiJK4fNiLNUk6l1oDyAXIbrw/omJhN+DCzd78gDJ5l82CSUB/nE8SRouNiptySrNP/1aic4HBz7e7rGrR4A8HUxTLZlLUXc66PA/6/rIFN2pvvIYCuYpjjq3kXa9v4fBhFkgk0pS0i1sW9Sxv1coDCQJO8D8FHGBnc1xeZHUAjxs8Lo+nL02ivx/1zS2Rml2K7psJDxvbtjSZkSDI+zc/GYV4YANwUwUAmRYshtXY8MAFFAJYASLXSyeDHoeIHnv69qZmxbYZiY0Ke4X6jLd3t2Famh9PGvlmW4hEgbpA1z3Ij1SXsxXs/8yPK4BaEbdp9H4PeokMztD1L5NP2OFg5ynw9IEvriy8er7Q24Sl8fLbzA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(82310400011)(451199024)(1800799009)(186009)(46966006)(40470700004)(36840700001)(5660300002)(7696005)(478600001)(8936002)(26005)(426003)(83380400001)(70206006)(70586007)(336012)(16526019)(36860700001)(1076003)(2616005)(54906003)(316002)(8676002)(110136005)(7416002)(47076005)(4326008)(6666004)(2906002)(86362001)(921005)(36756003)(81166007)(82740400003)(356005)(40460700003)(40480700001)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 11:12:40.3370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b82a7a-26d3-457d-5f72-08dbb5dcad12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8601

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
Tested-by: Huang Rui <ray.huang@amd.com>
Acked-by: Huang Rui <ray.huang@amd.com>
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


