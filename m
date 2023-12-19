Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFED8182A9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 08:55:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656541.1024831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUx0-0003tj-2s; Tue, 19 Dec 2023 07:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656541.1024831; Tue, 19 Dec 2023 07:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUx0-0003rb-05; Tue, 19 Dec 2023 07:55:38 +0000
Received: by outflank-mailman (input) for mailman id 656541;
 Tue, 19 Dec 2023 07:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oURO=H6=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rFUwy-0000yA-57
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 07:55:36 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fca6294c-9e43-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 08:55:34 +0100 (CET)
Received: from MW4PR03CA0098.namprd03.prod.outlook.com (2603:10b6:303:b7::13)
 by SA1PR12MB5616.namprd12.prod.outlook.com (2603:10b6:806:22a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 07:55:31 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:303:b7:cafe::fc) by MW4PR03CA0098.outlook.office365.com
 (2603:10b6:303:b7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37 via Frontend
 Transport; Tue, 19 Dec 2023 07:55:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.7 via Frontend Transport; Tue, 19 Dec 2023 07:55:30 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 01:55:22 -0600
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
X-Inumbo-ID: fca6294c-9e43-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGpXb9WNKnyy32pg34uiRsoHJWBvV3QAY7Rr/9iZDbvy663viLBzA1vmc2KhCfBBC36mkYz0b7T/XLbDyB1M8H+f492dRQ1WVzd2cSGO6RofeuVAcVwEUuedHjtZOUIcfgy0sK+R23g5qRvtiOlZHvViwdvOJGXSzy5Kjmc+YlR32bmXqnqrDuRYoC4MtqM7Yv/F+AvkJWzcRGvHMp5kSQ5dWBcLk7tYLOoSEqhDloqqkI43WYZzGlCwnJ/tQLNzJSUQmuG1ecJpXqlE5lCQIJecJ96Vv9ypQacM/M3bAnb6mNWmXV/jRZra4kV71+/tQQDjzq0tWs5CPg2XaCZQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6N6SmqJS+VsWTRghGUSLDTGZ0Y9NcE2iDhrRgcr16I=;
 b=J9zaYIWr4/fawB1kXUxWtcYzg4cKVY7NDe3Rl3fAu2moXNTf+ziLrv98d7OW42bYoTkXAiN+/aUeih7QU8i81tMNjURrIkgpVpRwUPpn00zbOm3BZf9Q5ZC+nvjVT7+3tPKPxZyx1dJWQw3sFyIzzwHJcIKrm1UVQ+LX8djQC3zOzoot/GzqB525YpronzJIwj/2QUf3PSWlnMjp/1ke2AeTHqAtCxpB+oq22js0tAC1Rr9ZOtwJRp89z9ledMyDO7p1Z9iVJGoJ+bnA2a7imUxvp8HREMhr15b1pF0rnBzFlWPtXbpJ/EoFNL7gLcijnOCpdZnv+h695G5CXLRSrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6N6SmqJS+VsWTRghGUSLDTGZ0Y9NcE2iDhrRgcr16I=;
 b=FG6kzGosQA11GdpP7BNY/6NRTmaJG6yWmGC8JRHmc4HHaFUftnzzspUz8lRolNwwX6tnPvwKYqzjSVGh7vP6fiemn/51ZNcdbKdakFRAnNcm1CuiMMI3AbdJyKvIwAJTubOk3BH+t7HKOSpfBhr6iWJnzmkAyqbJU4kq4FoQXzY=
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
Subject: [PATCH v6 09/11] virtio-gpu: Support Venus capset
Date: Tue, 19 Dec 2023 15:53:18 +0800
Message-ID: <20231219075320.165227-10-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|SA1PR12MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f96fe8b-e27a-486e-071e-08dc0067df5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wiXeoCvFzXOBNreRPBZnE+Uoo6BSfyiR7/rR8Cx0T4kw3fGduISpoV6LiNLpxMDMf4Vj7CkTl6wjT72VSKw9+pKIvKguxL9Q690S6rLJGe1Jyp27q6cKk4qb97Q8d2f8qy8ijjT6GmQdif0IzcrMsmlk+ruAKPSMox47lJHqZqV720SuUV7w5i3LP+OlFz9GGLXVz8ECa7/Up6l2hAlU48jl0roEXLYpHN7KQrVee9mwF1UbWTz6T6ra87jucPS8AdhRGSzRaZ2KGzKF7sDOBtT8jsivxA47xPpcSLs7FXr2FB5L6azA6pLXWfd84ah8E6TySMYt5H/HZHBmJwpmz+g1QuUDStQDKoauPYRqakuAwUiADL2tjM7vqeZiuyuLU8AmiruemuyOuy/F+3LFm0X6mzaO5YUYBifHSeG/G2puI8Nob9aUtjiAo2DacJ/31445r81X+bOL9dNFs2gDw8YDQEstwY47uiziXuMo8/jQDuXyCq5g8USMg+BAmbIaSmJnf1UDgEc5Cny8qVFpEL0b6d+G8LmZXBlGAPD53bPGbbr2XTDWEcG8BVeAUy4gM2bXtr7gWCscQcsdCe75zrbOLTUBWP8ia3AQfWX7V0cp5oz1ZVE3Ano7GKL9VkOFAkKMa86JMsim/VC411Evv9oCEJC0C8SHdmcauENMi5ou6+I++wH1BfHLFjdt4983fBay3/ZqlutuGqmh+p99nt3xV4fEoUl+2DxcXfRvuwQDQyGynGbzaCx6VtZas0kQwjpavieTFM5AJLFG2XJx/56mqUqZqSYUS8IXcXyQdpI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(346002)(136003)(230922051799003)(451199024)(82310400011)(186009)(1800799012)(64100799003)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(426003)(16526019)(336012)(2616005)(1076003)(6666004)(7696005)(26005)(82740400003)(921008)(356005)(81166007)(36756003)(86362001)(8936002)(8676002)(4326008)(478600001)(110136005)(36860700001)(5660300002)(7416002)(2906002)(47076005)(83380400001)(41300700001)(70206006)(70586007)(54906003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 07:55:30.7212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f96fe8b-e27a-486e-071e-08dc0067df5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5616

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Add support for the Venus capset, which enables Vulkan support through
the Venus Vulkan driver for virtio-gpu.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

No change in v6.

 hw/display/virtio-gpu-virgl.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index be9da6e780..f35a751824 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -506,6 +506,11 @@ static void virgl_cmd_get_capset_info(VirtIOGPU *g,
         virgl_renderer_get_cap_set(resp.capset_id,
                                    &resp.capset_max_version,
                                    &resp.capset_max_size);
+    } else if (info.capset_index == 2) {
+        resp.capset_id = VIRTIO_GPU_CAPSET_VENUS;
+        virgl_renderer_get_cap_set(resp.capset_id,
+                                   &resp.capset_max_version,
+                                   &resp.capset_max_size);
     } else {
         resp.capset_max_version = 0;
         resp.capset_max_size = 0;
@@ -978,10 +983,18 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
 
 int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
 {
-    uint32_t capset2_max_ver, capset2_max_size;
+    uint32_t capset2_max_ver, capset2_max_size, num_capsets;
+    num_capsets = 1;
+
     virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VIRGL2,
-                              &capset2_max_ver,
-                              &capset2_max_size);
+                               &capset2_max_ver,
+                               &capset2_max_size);
+    num_capsets += capset2_max_ver ? 1 : 0;
+
+    virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VENUS,
+                               &capset2_max_ver,
+                               &capset2_max_size);
+    num_capsets += capset2_max_size ? 1 : 0;
 
-    return capset2_max_ver ? 2 : 1;
+    return num_capsets;
 }
-- 
2.25.1


