Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F33B7A1D22
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 13:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603002.939884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6kX-0003av-Qb; Fri, 15 Sep 2023 11:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603002.939884; Fri, 15 Sep 2023 11:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6kX-0003Yq-NT; Fri, 15 Sep 2023 11:12:37 +0000
Received: by outflank-mailman (input) for mailman id 603002;
 Fri, 15 Sep 2023 11:12:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGil=E7=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qh6kW-0003Cy-I6
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 11:12:36 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20629.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4d61815-53b8-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 13:12:34 +0200 (CEST)
Received: from DS0PR17CA0020.namprd17.prod.outlook.com (2603:10b6:8:191::27)
 by PH7PR12MB6468.namprd12.prod.outlook.com (2603:10b6:510:1f4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.33; Fri, 15 Sep
 2023 11:12:28 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::54) by DS0PR17CA0020.outlook.office365.com
 (2603:10b6:8:191::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 11:12:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Fri, 15 Sep 2023 11:12:28 +0000
Received: from hr-test6.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 06:12:21 -0500
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
X-Inumbo-ID: c4d61815-53b8-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV2xAtSQONNzk5CMqBCCnrxu8k7fdOnMiZRRuAm9AY4cB8A+MbbKzRBGlMduZ50IrIUDiEzzG3qP/Ds7vAxBAYqLGV8ZBbx+pNYo2WYHV3OeWTPCcKHnGGoJ6hX6H56ewEW26IAGeTlJaND/4mPW7q8rf3ZPK1iFlNOTLDPA+L5nloNYSN4yCYVCZShcBpV5Gl/sNF5ko4ydy2TG9OsspOPklhTvaoxzK99p3rA6aaag5xvLqfH8q58m6uCJF+5iYmD0i1s4moDYJmYRo3J8fJhKc+IZL82FOAlFBVt42vlVzI1Jvv/hzOnCHQVrUW8Qr5+4bQM1oKHVXBDtNpFwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoU819C3EvFSCxJXSmgKzjiOaCAsYDwvlFmZ/iIX7+s=;
 b=ch8ADWiQbQn9Tam47pwjihxrKb8Zw3j3pGDib7OIFyc+2QSVJO53s4DsC5jz0CQMc5I7GBb8RYGlv8wrQSgxYre8BsX9glgxfL5eYHxWmyPHgsvicrjIb9npCUiEykRuYwbA211BsBfO8+TL5h0Lb4VS8Zb5VN6N4UCOD7GtmKnVaC4yeT+6+OzB0IJjBbBKuwU423wPcN8r4350FsKbzrBdLD0CmvnLnO72ZmCE88HkdrsC6TKCr4AAqXz4XMo5qhsqyeJQT8x3knffPOxHeMUFz67CjUw7x5nouq7b7O4lsKf+JryssddYdVGFnpq8MlX3vY8eq7YoGWHEZvonwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoU819C3EvFSCxJXSmgKzjiOaCAsYDwvlFmZ/iIX7+s=;
 b=aVz68SBNUqB3hLflEIkhI2/8PPospZJr6RZ9S1aWuliYt/AzUTFoNZdNBuDp6WFbLJPNSAbMnmtklol1DpOFUL5q+hUq1WP7OwSdW2wGe8fkFyX5pGgu/4eVjT+FPMZBBFWGTeWDpXmlfnE+g4gmnAnA0XXCSqWBALZTMPSITVw=
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
	<antonio.caggiano@collabora.com>, Huang Rui <ray.huang@amd.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [QEMU PATCH v5 02/13] virtio-gpu: CONTEXT_INIT feature
Date: Fri, 15 Sep 2023 19:11:19 +0800
Message-ID: <20230915111130.24064-3-ray.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915111130.24064-1-ray.huang@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|PH7PR12MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6a94c9-4ec8-446c-fcd5-08dbb5dca5b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BNhb3Yb5fru9dUEURHmM4V70UEy7QC3JPfsvQSwv4Zc5olfd2kD84Th6v2l059mQwHlOyZm/gNtJ2keULlc1jna/6UDPqhy62BgjApCgkP49uTzjuaJLywrn2wSLVTNr3ve2OrPbyqD5AaiISp9ckyOc8vIfMFRUyDMG+vIojcVwXsRhcei/h7v2mCdxir4lHlEL+IcXtvWUeBLxvgiwmo83umSw5ChLtNJK+ImLVUF+EvQInnnClSOoD8IXx00vdxZhHd9iiBQdeelRS7xnK4E1ffbGSMfZo2A/TucQ1qByAeiPNtqQHZscsheOQZ7g8ybAL4GENSbJlMVO5Ms95f9cv7LhzOKcj/QmJJq2aF+Jb7NMntJ8vn6Kb0QmBaXGwBhJ9HD+UgJBCAVeoTeBOTUxwhH/woqaPyBAK+jLeFYgGwDOLbiYXk1S3lOFIZpyu+JXcr62LUPK2j/N0x/z0boUM/YeTVhE92nJGsap+WlV607ilF51MvwhPiL18WuAeZi6yMPm6GnlSQFjQBOuDenMD79LG35LVBXtTWJHH3JaXihfW3yPWXk0ImM8GiNVwzW5eyhI/i83U4kATHiCdNj+QyJnfZNjIeY24VTeZ4FEZslYad4zSio56ANT5L2ENpdC3W9FidoV5k/5TusO257D7uJUSrqkd13e6X78+0QRl4aaNgoFHUskfFAa4R42JRzM4uPg2dyYqKySq18RwYDAxcnVfT4WBZI7dnQYPsfU1VAI91QbJ9Gh2nlggT/gM+pSGTNMO7Sx/7phGd5Ab9osTbWwDP4D6eJJifcQCHs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(82310400011)(186009)(451199024)(1800799009)(36840700001)(46966006)(40470700004)(336012)(8676002)(356005)(8936002)(110136005)(4326008)(2906002)(921005)(40480700001)(316002)(16526019)(47076005)(36860700001)(54906003)(1076003)(70206006)(7696005)(426003)(26005)(70586007)(2616005)(41300700001)(40460700003)(82740400003)(5660300002)(81166007)(7416002)(86362001)(36756003)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 11:12:28.0138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6a94c9-4ec8-446c-fcd5-08dbb5dca5b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6468

From: Antonio Caggiano <antonio.caggiano@collabora.com>

The feature can be enabled when a backend wants it.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Tested-by: Alyssa Ross <hi@alyssa.is>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Huang Rui <ray.huang@amd.com>
Acked-by: Huang Rui <ray.huang@amd.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

This patch is already under review as part of the "rutabaga_gfx + gfxstream"
series (already in v13) and has been included here because of dependency.

 hw/display/virtio-gpu-base.c   | 3 +++
 include/hw/virtio/virtio-gpu.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index ca1fb7b16f..4f2b0ba1f3 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -232,6 +232,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
     if (virtio_gpu_blob_enabled(g->conf)) {
         features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
     }
+    if (virtio_gpu_context_init_enabled(g->conf)) {
+        features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
+    }
 
     return features;
 }
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 390c4642b8..8377c365ef 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -93,6 +93,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_EDID_ENABLED,
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
     VIRTIO_GPU_FLAG_BLOB_ENABLED,
+    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -105,6 +106,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
 #define virtio_gpu_blob_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
+#define virtio_gpu_context_init_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
-- 
2.34.1


