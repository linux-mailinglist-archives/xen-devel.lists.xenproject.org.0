Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B77E79D1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 08:42:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629928.982510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1M9z-000635-4c; Fri, 10 Nov 2023 07:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629928.982510; Fri, 10 Nov 2023 07:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1M9y-0005r7-Sy; Fri, 10 Nov 2023 07:42:34 +0000
Received: by outflank-mailman (input) for mailman id 629928;
 Fri, 10 Nov 2023 07:41:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9sgQ=GX=amd.com=Julia.Zhang@srs-se1.protection.inumbo.net>)
 id 1r1M8X-0005A6-1T
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 07:41:05 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f88122b-7f9c-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 08:41:03 +0100 (CET)
Received: from DM5PR07CA0104.namprd07.prod.outlook.com (2603:10b6:4:ae::33) by
 LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 07:41:00 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:4:ae:cafe::6d) by DM5PR07CA0104.outlook.office365.com
 (2603:10b6:4:ae::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Fri, 10 Nov 2023 07:41:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 07:40:59 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 10 Nov
 2023 01:40:54 -0600
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
X-Inumbo-ID: 7f88122b-7f9c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+yTwAW6x8fv/FurfWs5mTjkrLYLn+eV28rQNK8TWXvLtYCvNsjDmV9DNpVipFVOomnTjQ8TkWPvskgM3FJSYL3PPb2NSYNoyYcktpEYa5jG1Qgb1dxOy8is2+fTDqggctE5VU14YBquLRMUY7woiKBGnPE0F276u3YEuQoaEIWX1sXtU5XKLrp6bYof2JOlRh42CosggOKD1iBKbsT0ardjlz5db/uAteP/NXmUH85V/KT2MDqY3iXZw+aP8ms5Gpnmk/BgGfZSsgev9UGSxAJN2Hiy6qmB9tAJ2iQYvNNLMml5vt7aVmnqb+hdUNEihW3WciX+8ZPJ55qET0w2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aX1RsF3gCTbk9wZR0KoZwRve7pKpevRbJ1zXxYsX70=;
 b=cGczpLNV1Qcqa90qgqg977zcfxwfZGUHblRpkJzDDUYjVG94D/vgP8RkmopzCCkrSjo41wjsgdIdqS/de3BnKskJU4gXscrd1HZPtyVQd2wPrnXx3zUh/P3EdEB8zo+kd2s+BU0sW9PEkbTH+wZF9ZTsagFos7lLwqXr0KLxxCE6OP8UdU7aUTyKNfWlKMJ8TLTmNfYBZkU5Hfhy+M7jRcwryuS00p/RfG52qohWxf7PrYmCiamf8E1iBlfXkSy8jGjFd2ED/V0goRX0lh62DfbQiG+xl5hoeacdMokn5vT4qzc2YOjFxTr+9+XsqsyWZOe2wCGkoN06KImCJLZX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aX1RsF3gCTbk9wZR0KoZwRve7pKpevRbJ1zXxYsX70=;
 b=AxHfEca15FwTniv8WI6CIQJqd6/yGnb6jvGoilN47eEHMjDkMnWTVY9MLTEHC7P10Yv9IrR5PFNXztnNM1kA4TGOUpXJeLOI/9tIzCSdaPSaQxY4/ZTh2tnDjPCSI47GcL8l6sls9QRMo2T92+q/K5bD3Uqddn8rHT/F3l8MX54=
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
	"Chen Jiqian" <Jiqian.Chen@amd.com>
Subject: [PATCH 2/2] virgl: Modify resource_query_layout
Date: Fri, 10 Nov 2023 15:40:27 +0800
Message-ID: <20231110074027.24862-3-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110074027.24862-1-julia.zhang@amd.com>
References: <20231110074027.24862-1-julia.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: ee1a2fd1-d145-4e37-56e1-08dbe1c06219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OK9GVynjpOXS6kkR9zIx3ddSOkORtmiesPl70lm1HhnqgTeqdRPZeyvHz6rYtFw1DOdhjtdkLlWcKO5uAkyz5eeqseBnWgM2eymWaixC/8xqmcYhoODntG8/yyeSQSvqvD/dC17XP4JyKGJRZ/I2XKqu9xiwZ1Hqy2m+ZAoMGfP40Frz4Qhr2xUm+3ES37lZOpA7oBY49OlK2itRNUqLwTb5dF+CFrbAAC0Z4Jrz5AiGG8J/78SjzGt9d07T6TzU9s81t5z+JtjOHiJnR7KcnGCsaj55d4g+jyeLSzoGfDytXwlQ0s4jBztxwQXIIm+v9At8iRN9hpQaZikgu0FGJBUDVKKc1hx1+UCy4aQ68TWy5nZMDeGJi/mtlvY9c/bOYuoo7ybs4yy5GZacFLIvsHb0X4iZxNFsFW9YodKLuQM6as1LOEyEFdVcA9But55MLLGkdXnzlyLcBzTECh0hVh596Idhn2gM1BtvqMJS3AvFqGgflU/y2XInSRHt4Y1eim3GOaoKEzMw+plTGDDoUjPj0gqzlLyHv/dD8mmkxGH/jX1PwDw8ALg9PAKZOZjhwpN3cbbk/4pwnvcb+4jzoSZJWK3foTPTvg0nBx2ndCBlxtJADtkU4iyAGKoxoLuBStLxaoz6K+AUzvTJFXydq0l7mA/c4selESuuqFUre9mf0gHB+i8UiH1qhDedd8URgjzIjEN2fFbYaZXDzQZr5sz7IqAhyZDDDN0WI336X+0/lhaasoSj2vMKTEQTTZiOVmbcqUeUYrMUCIdnWcmFlF7REAnZ4Zn8xjGzwS6h9ycFhAcmA2z/avrwntl/3vFP
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230173577357003)(230273577357003)(230922051799003)(1800799009)(186009)(82310400011)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(40480700001)(356005)(81166007)(40460700003)(82740400003)(70206006)(6666004)(110136005)(478600001)(7696005)(36756003)(86362001)(70586007)(26005)(1076003)(16526019)(2616005)(426003)(7416002)(336012)(8936002)(2906002)(41300700001)(47076005)(54906003)(4326008)(5660300002)(8676002)(316002)(36860700001)(44832011)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 07:40:59.8074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1a2fd1-d145-4e37-56e1-08dbe1c06219
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236

Modify resource_query_layout to handle the use case that need to query
correct stride for guest linear resource before it is created.

Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
 hw/display/virtio-gpu-virgl.c               | 20 +++-----------------
 include/standard-headers/linux/virtio_gpu.h |  8 ++++----
 2 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 9c5a07cef1..ae146a68cb 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -728,22 +728,9 @@ static void virgl_cmd_resource_query_layout(VirtIOGPU *g,
     VIRTIO_GPU_FILL_CMD(qlayout);
     virtio_gpu_resource_query_layout_bswap(&qlayout);
 
-    if (qlayout.resource_id == 0) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
-                      __func__);
-        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
-        return;
-    }
-
-    res = virtio_gpu_find_resource(g, qlayout.resource_id);
-    if (!res) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
-                      __func__, qlayout.resource_id);
-        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
-        return;
-    }
-
-    ret = virgl_renderer_resource_query_layout(qlayout.resource_id, &rlayout);
+    ret = virgl_renderer_resource_query_layout(qlayout.resource_id, &rlayout,
+					       qlayout.width, qlayout.height,
+					       qlayout.format, qlayout.bind);
     if (ret != 0) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: resource %d is not externally-allocated\n",
                       __func__, qlayout.resource_id);
@@ -758,7 +745,6 @@ static void virgl_cmd_resource_query_layout(VirtIOGPU *g,
     for (i = 0; i < resp.num_planes; i++) {
         resp.planes[i].offset = rlayout.planes[i].offset;
         resp.planes[i].stride = rlayout.planes[i].stride;
-	resp.planes[i].size = rlayout.planes[i].size;
     }
     virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
 }
diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
index 734fdb6beb..6fb0f711c8 100644
--- a/include/standard-headers/linux/virtio_gpu.h
+++ b/include/standard-headers/linux/virtio_gpu.h
@@ -506,7 +506,10 @@ struct virtio_gpu_status_freezing {
 struct virtio_gpu_resource_query_layout {
 	struct virtio_gpu_ctrl_hdr hdr;
 	uint32_t resource_id;
-	uint32_t padding;
+	uint32_t width;
+	uint32_t height;
+	uint32_t format;
+	uint32_t bind;
 };
 
 /* VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT */
@@ -515,12 +518,9 @@ struct virtio_gpu_resp_resource_layout {
 	struct virtio_gpu_ctrl_hdr hdr;
 	uint64_t modifier;
 	uint32_t num_planes;
-	uint32_t padding;
 	struct virtio_gpu_resource_plane {
 		uint64_t offset;
-		uint64_t size;
 		uint32_t stride;
-		uint32_t padding;
 	} planes[VIRTIO_GPU_RES_MAX_PLANES];
 };
 
-- 
2.34.1


