Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B153C7A1D48
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 13:18:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603063.939995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6q7-0003VQ-CQ; Fri, 15 Sep 2023 11:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603063.939995; Fri, 15 Sep 2023 11:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6q7-0003SK-9M; Fri, 15 Sep 2023 11:18:23 +0000
Received: by outflank-mailman (input) for mailman id 603063;
 Fri, 15 Sep 2023 11:18:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGil=E7=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qh6lS-0002xb-KP
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 11:13:34 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e857c569-53b8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 13:13:34 +0200 (CEST)
Received: from DM6PR10CA0001.namprd10.prod.outlook.com (2603:10b6:5:60::14) by
 DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.34; Fri, 15 Sep 2023 11:13:30 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:60:cafe::c8) by DM6PR10CA0001.outlook.office365.com
 (2603:10b6:5:60::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 11:13:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Fri, 15 Sep 2023 11:13:30 +0000
Received: from hr-test6.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 06:13:23 -0500
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
X-Inumbo-ID: e857c569-53b8-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pigl4i3gyS+HEMvXRXxFqo1H8pQQJ6XH2ugszUc1Vi2mzt2KBhADo4DrAO1oUL8YroDZjSXy0gXPHFVj8Dz8kDAZGRjsiOVrBwVC2KmgeBK1dh8TOJDe/PW/M9s0EalwhnS1lrYoNSGToOWU81CXJG4qRbdlgomtsBsxLDNZ9CY9SONXyBxtiafB+KJSpdEg5b+fZE1nCYOATXY1ZZ1N8OtIPHUUlsogmW2mIyEVYRDoAerl+rikOQNkF4MVlNMUQA78TfTlQyh84r7f7pCbIlKq+G2r7Qcaq/yn8I/PUpAwUhgn/Th9Rjp90S6BXaa+H3mOfeGdtiOH8W/jhcuuMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSkyHF6vxVVhxr6BksCITEGigkoq1JtKA4LzqMq3d1Q=;
 b=mEo4B7VbkO5F6mJ27RxZ75yHyXlbUATmQujL+GV03gsN3YS5SfNcIXBO00i+Uzs9JCTP2/lg+5DbOJz9PUYhZqEpRql+XW1AhcNQ8gRpUATQutqDN9Q19aZ41ndwyd57eB/Khm3+9ujnColeR7yIYsOXeDDle7OZ9Lz/Ukz6IimKTc4olGuN8A/JYgftbEfBzHQ8I4NFogmpYhSeYXK4U1b+UAFWDk4PqMRkK/z9+pr3SzwRsG1CBAXlViAKllo2kqeYm81PyRddueJ0csjAekvja/sFgyYaS0QBS6UFCwXcEXwJcuZQg4LxXj7DvZNy855SFy6PQbityeUxiQc2YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSkyHF6vxVVhxr6BksCITEGigkoq1JtKA4LzqMq3d1Q=;
 b=Mv/l/Lq5sV4kJmLGddBoaRzGDC6o6S4ClRy7qLLCki2XkZrCrGRXEgLBwlLqoM5GMT7SMe83po0MqT0Yby15RqWjtjxEWHTXI60ZeKmLL6WbsNSNV4cL0lZ3TVn4g3E0Ani+LA+eV6nJ8/eWpl3Dc+8CnsQMKoElhIxhGLMeo/M=
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
Subject: [QEMU PATCH v5 11/13] virtio-gpu: Support Venus capset
Date: Fri, 15 Sep 2023 19:11:28 +0800
Message-ID: <20230915111130.24064-12-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 5039c86c-aa90-42dc-6932-08dbb5dccad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Np+ABieQKRZO+JP9XsbX9lGtb0zKljyWnPn2FzRMyuJdfXU0eBaiukM5QolIazTrD84oTld5MzeUpPkFz/XU0/zNKkqsh4CzFK4f5Im1pD0qzM2PBJM5WfXZ0svTga/1cyLfvPuk3HfwUTdvw8JZ6lq5MyQorp9CCcHyvtPMhzadgKOkEGHtBEouX+wLNJrfiiMpQ+5Y1qevxJ3Yvsfmzrjh1kLmYf/Q3Nd9VnLFfKUhOF5n1pZi6AKTaAvgOkMuDoqdEmxaRVkhHq84FbB+OyWxXGN7x3zQ3F2ArsNlkTtXBNyumsOceQyPRO/YBiycULgm4xTkJerHFlJ8wKWmj2L5K3x/PZOJryI8SNwAIDCAnHJBHdUY99lNRkQ/kxrQvpysJOvvOAv2M8UvzueEsaTSGgGGQWbu78+Fm2w40vjTm7djDHLIdkLl2pp2cQKNhaj+9WeVi8eF3Wdj8x7CJkXY/4hoC5pzegRZUciB3nGz7ZWVTREHr6ysewCGLCTLnjawl3GtgFtgnWq2t7Ek3k8unlfa/dket8kJQK8iATy4QVNqM+z+wFwwSB/p+RHDxyId/6N0abEKdfncadFB+8V4MWn7iQfUtq0nEVgUSqF3GhmE94qZ/Q5JDeUKLUoxfWvIijGZXd3iddVr+m7pvOiCR/c+yYxsJ4Yr+gU8xNZBCftqrGvIZ5TG58qYRmmeHfvQpFEVTM9J5v6HdNPhBEV4RNmMGWC4YmyQ3qq6V+vXnbzRG2kb3U12B4zqcVlTE3Dlq5gJxP935sLWTFJKkg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199024)(1800799009)(186009)(82310400011)(46966006)(40470700004)(36840700001)(40460700003)(36756003)(86362001)(40480700001)(5660300002)(316002)(7696005)(26005)(966005)(70206006)(8676002)(426003)(70586007)(336012)(110136005)(2616005)(8936002)(54906003)(921005)(41300700001)(4326008)(2906002)(16526019)(47076005)(81166007)(36860700001)(478600001)(356005)(1076003)(82740400003)(83380400001)(7416002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 11:13:30.2495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5039c86c-aa90-42dc-6932-08dbb5dccad2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Add support for the Venus capset, which enables Vulkan support through
the Venus Vulkan driver for virtio-gpu.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

V4 -> V5:
    - Send kernel patch to define VIRTIO_GPU_CAPSET_VENUS and will use
      another patch to sync up linux headers. (Akihiko)
    - https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/

 hw/display/virtio-gpu-virgl.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 8a017dbeb4..7f95490e90 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -437,6 +437,11 @@ static void virgl_cmd_get_capset_info(VirtIOGPU *g,
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
@@ -901,10 +906,18 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
 
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
2.34.1


